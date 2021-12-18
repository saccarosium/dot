;;; -*- lexical-binding: t -*-

;;; STARTUP PERFORMANCE

    (setq gc-cons-threshold 100000000)
    (setq file-name-handler-alist nil)
    (add-hook 'emacs-startup-hook
            (lambda ()
                (message "*** Emacs loaded in %s with %d garbage collections."
                        (format "%.2f seconds"
                                (float-time
                                (time-subtract after-init-time before-init-time)))
                        gcs-done)))

;;; ADDING CUSTOM LISP LIBRARIES

    (add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
    (require 'custom-functions)

;;; BOOTSTRAP FOR STRAIGHT.EL

    (let ((bootstrap-file (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
        (bootstrap-version 5))
    (unless (file-exists-p bootstrap-file)
        (with-current-buffer
            (url-retrieve-synchronously
            "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
            'silent 'inhibit-cookies)
        (goto-char (point-max))
        (eval-print-last-sexp)))
    (load bootstrap-file nil 'nomessage))
    (unless (bound-and-true-p package--initialized)
    (setq package-enable-at-startup nil)) ; To prevent initializing twice.

;;; DEFINING XDG DIRECTORIES

    ;; Make PATH on OSX work correctly
    (straight-use-package 'exec-path-from-shell)
    (exec-path-from-shell-initialize)
    ;;; Pull in other enviroment variables
    (exec-path-from-shell-copy-envs '("XDG_CONFIG_HOME" "XDG_DATA_HOME" "XDG_CACHE_HOME"))
    (require 'osx)
    (defvar xdg-data-home-directory (getenv "XDG_DATA_HOME"))
    (defvar xdg-cache-home-directory (getenv "XDG_CACHE_HOME"))

;;; KEEP EMACS FOLDER CLEAN

    (straight-use-package 'no-littering)
        ;;; Defining XDG_DATA_HOME $XDG_CACHE_HOME
        (setq no-littering-etc-directory
            (expand-file-name (convert-standard-filename "emacs/") xdg-cache-home-directory))
        (setq no-littering-var-directory
            (expand-file-name (convert-standard-filename "emacs/") xdg-data-home-directory))

    ;; eww url history
    (setq url-history-file (no-littering-expand-etc-file-name "eww/history"))
    ;; eshell history and lastdir
    (setq eshell-directory-name (no-littering-expand-etc-file-name "eshell/"))
    ;; Emacs autosave files ( #init.el# )
    ;; The autosave feature doesn't create the directory
    (make-directory (no-littering-expand-etc-file-name "auto-save/") t)
    (setq auto-save-file-name-transforms
        `((".*" ,(no-littering-expand-etc-file-name "auto-save/") t)))
    ;; Lockfile ( .#init.el )
    (setq create-lockfiles nil)
    ;; Backup file ( init.el~ )
    (setq make-backup-file nil)
    ;; Use file for insering custom varables other that init.el
    (setq custom-file (locate-user-emacs-file "custom.el"))

;;; UI
    
    (menu-bar-mode 0)           ;; Hide the menubar
    (tool-bar-mode 0)           ;; Hide tool bar
    (tooltip-mode 0)            ;; Hide tooltip
    (scroll-bar-mode 0)         ;; Hide scrollbar
    (blink-cursor-mode 0)       ;; Prevent cursor to blink
    (show-paren-mode t)         ;; Show matching parenthesis.
    (global-so-long-mode)       ;; Handle long lines better.
    (global-font-lock-mode 1)   ;; Always highlight code.
    (global-auto-revert-mode 1) ;; Refresh a buffer if changed on disk.
    (savehist-mode 1)           ;; Save history

    (defalias 'yes-or-no-p 'y-or-n-p) ;; Accept 'y' in lieu of 'yes'.

    ;; Make Tabs behave sanely
    (setq-default tab-width 4)
    (setq-default tab-always-indent nil)
    (setq-default evil-shift-width tab-width)
    (setq-default indent-tabs-mode nil)
    (setq-default electric-indent-inhibit t)
    (setq-default c-basic-offset 4)
    ;;(setq-default tabify-regexp "^\t* [ \t]+")
    (setq-default sentence-end-double-space nil)
    (setq-default require-final-newline t)
    (setq-default backward-delete-char-untabify-method 'hungry)

    (setq inhibit-startup-screen    t)
    (setq initial-scratch-message   nil)
    (setq sentence-end-double-space nil)
    (setq use-dialog-box            nil)
    (setq mark-even-if-inactive     nil)
    (setq kill-whole-line           t)
    (setq frame-resize-pixelwise    t)
    (setq case-fold-search          nil)

    ;; Configuring Font
    (dolist (face '(default fixed-pitch))
        (set-face-attribute `,face nil :font "JetBrainsMono Nerd Font 12"))
    ;; Set the variable pitch face
    (set-face-attribute 'variable-pitch nil
                        ;; :font "Cantarell"
                        :font "SF Pro Text"
                        :height 160
                        :weight 'regular)


    ;; More integrated themes
    (straight-use-package 'doom-themes)
        (load-theme 'doom-dracula t)
        (setq doom-dracula-colorful-headers t)

    (defun ls/colors ()
        (set-background-color "#191622")
        (set-face-attribute 'line-number nil :italic nil :background nil)
        (set-face-attribute 'fringe nil :background nil);;"#191622")
        (set-face-attribute 'mode-line nil :background nil :box nil));"#21222b" #191622

;;;; Set color and icons if in daemon mode
    (if (daemonp)
        (add-hook 'after-make-frame-functions
                (lambda (frame)
                    (setq doom-modeline-icon t)
                    (with-selected-frame frame
                    (ls/colors))))
        (ls/colors))

;;;; Mod-line
    (straight-use-package 'doom-modeline)
        (doom-modeline-mode 1)
        (setq doom-modeline-buffer-file-name-style 'buffer-name)
        (setq doom-modeline-major-mode-color-icon nil)
        (setq doom-modeline-minor-modes nil)
        (setq doom-modeline-lsp nil)
        (setq doom-modeline-buffer-encoding nil)

;;;; Relative number like in Vim
    (straight-use-package 'linum-relative)
        (add-hook 'prog-mode-hook 'linum-relative-mode)
        (setq linum-relative-backend 'display-line-numbers-mode)

;;;; Make some windows a popup
    (straight-use-package 'popper)
    (setq popper-reference-buffers
            '(xref-mode
            "\\*Occur\\*"
            ".*.png"
            "\\*Flymake\\ diagnostics.*"
            xref--xref-buffer-mode))
    (global-set-key (kbd "C-,") 'popper-toggle-latest)
    (global-set-key (kbd "C-S-;") 'popper-cycle)
    (popper-mode +1)
    (popper-echo-mode +1)

;;; KEYBINDS

;;;; Evil Mode
    (straight-use-package 'evil)
        (setq evil-search-module 'evil-search)
        (setq evil-undo-system 'undo-redo)
        (setq evil-want-keybinding nil)
        (evil-mode 1)
        (global-set-key (kbd "<escape>") 'keyboard-escape-quit)
        (define-key evil-normal-state-map (kbd "C-w f") 'find-file-other-window)
        ;; Leader Key
        (evil-set-leader 'normal (kbd "SPC"))
        (evil-define-key 'normal 'global (kbd "<leader>fe") #'ls/open-config)
        (evil-define-key 'normal 'global (kbd "<leader>fn") #'deft-find-file)
        (evil-define-key 'normal 'global (kbd "TAB") 'outline-cycle)

    ;; Global evil keybinds
    (straight-use-package 'evil-collection)
        (setq evil-want-integration t)
        (evil-collection-init)

;;;; Which Key
    (straight-use-package 'which-key)
        (setq which-key-idle-delay 1.0)
        (which-key-mode)

;;;; General keybinds
    (global-set-key (kbd "C-x C-b") 'ibuffer)

;;; UTILITY

    (straight-use-package 'restart-emacs)

;;; BUILTINGS PACKAGES

    (straight-use-package '(eww :type built-in))
        (global-set-key (kbd "C-x ?") 'eww)
        (setq eww-desktop-remove-duplicates t)
        (setq eww-header-line-format nil)
        (setq eww-search-prefix "https://duckduckgo.com/html/?q=")
        (setq url-cookie-delete-cookies nil)
        (setq url-cookie-confirmation nil)

    (straight-use-package '(dired :type built-in))
        (put 'dired-find-alternate-file 'disabled nil)
        (evil-define-key 'normal dired-mode-map "h" 'dired-up-directory)
        (evil-define-key 'normal dired-mode-map "l" 'dired-find-alternate-file)
        (evil-define-key 'normal dired-mode-map " " 'dired-mark)
        (evil-define-key 'normal dired-mode-map "q" 'kill-this-buffer)
        (set-face-attribute 'dired-directory nil :foreground "#bd93f9")
        (set-face-attribute 'dired-symlink nil :foreground "#50fa7b")

    (straight-use-package '(project :type built-in))
        (global-set-key (kbd "C-x p s") 'project-switch-project)

    (straight-use-package '(outline :type built-in))
        (add-hook 'prog-mode-hook 'outline-minor-mode)

;;; COMPLETION FRAMWORK

;;;; Vertico for the vertical UI
    (straight-use-package
    '(vertico :host github :repo "minad/vertico" :branch "main"))
        (setq vertico-cycle t)
        (vertico-mode)

;;;; Orderless for the sweat fuzzy-like maching
    (straight-use-package 'orderless)
        (setq completion-styles '(orderless))

;;;; Marginalia for extra info on the margins
    (straight-use-package 'marginalia)
        (marginalia-mode)

;;; WRITING/NOTES

;;;; Notational Velocity for emacs
    (straight-use-package 'deft)
        (setq deft-directory "~/Documents/nextcloud/notes/"
            deft-extensions '("md" "org")
            deft-recursive t)

;;;; Markdown support in emacs
    (straight-use-package 'markdown-mode)
        (setq markdown-command "Pandoc")

;;;; Org Mode
    (straight-use-package '(org :type built-in))
        (setq org-ellipsis " ▾")
        (setq org-src-fontify-natively t)
        (setq org-fontify-quote-and-verse-blocks t)
        (setq org-src-tab-acts-natively t)
        (setq org-edit-src-content-indentation 2)
        (setq org-src-preserve-indentation nil)
        (setq org-cycle-separator-lines 2)

;;;; Center the writing area
    (straight-use-package 'olivetti)
        (add-hook 'markdown-mode-hook 'olivetti-mode)
        (add-hook 'org-mode-hook 'olivetti-mode)
        (add-hook 'eww-mode-hook 'olivetti-mode)

;;; PROGRAMMING

;;;; Sweat Tree sitter
    (straight-use-package 'tree-sitter-langs)
    (straight-use-package 'tree-sitter)
        (add-hook 'tree-sitter-after-on-hook 'tree-sitter-hl-mode)
        (global-tree-sitter-mode)

;;;; Eglot for lsp support
    (straight-use-package 'eglot)
        (setq eglot-server-programs '((c-mode . ("clangd"))))
        (setq eglot-ignored-server-capabilities '(:hoverProvider :documentRangeFormattingProvider :documentOnTypeFormattingProvider))
        (add-hook 'c-mode-hook 'eglot-ensure)
        (add-hook 'c++-mode-hook 'eglot-ensure)
        (evil-define-key 'normal eglot-mode-map (kbd "g R") 'eglot-rename)
        (evil-define-key 'normal eglot-mode-map (kbd "g d") 'eglot-find-declaration)
        (evil-define-key 'normal eglot-mode-map (kbd "g D") 'flymake-show-buffer-diagnostics)
        (evil-define-key 'normal eglot-mode-map (kbd "g r") 'xref-find-references)
        (evil-define-key 'normal eglot-mode-map (kbd "g h") 'eldoc)

;;;; Completion w/company
    (straight-use-package 'company)
        (add-hook 'after-init-hook 'global-company-mode)
        (setq company-backends '(company-files company-capf))
        (setq company-auto-commit-chars nil)
        (setq company-minimum-prefix-length 1)
        (setq company-idle-delay 0.0)
        (setq company-auto-commit t)
        (setq company-icon-size '(auto-scale . 15))

;;;; Companion for company
    (straight-use-package 'company-box)
        (add-hook 'company-mode 'company-box-mode)

;;;; VC Mode
    (straight-use-package '(vc :type built-in))
        (setq auto-revert-check-vc-info t)
        (setq vc-follow-symlinks t)
        (global-set-key (kbd "C-x v d") 'vc-dir-root)

;;;; The best git interface
    (straight-use-package 'magit)

;;;; Autosave
    (straight-use-package 'super-save)
        (super-save-mode +1)
        (setq super-save-auto-save-when-idle t)
