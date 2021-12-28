;;; -*- lexical-binding: t -*-

;;; STARTUP PERFORMANCE

    (setq file-name-handler-alist nil)
    (add-hook 'emacs-startup-hook
            (lambda ()
                (message "*** Emacs loaded in %s with %d garbage collections."
                        (format "%.2f seconds"
                                (float-time
                                (time-subtract after-init-time before-init-time)))
                        gcs-done)))

;;; NATIVE COMP

    ;; Silence compiler warnings as they can be pretty disruptive
    ;;(setq comp-async-report-warnings-errors nil)
    ;;(setq package-native-compile nil)

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

    (setq straight-use-package-by-default t)
    (straight-use-package 'use-package)
    (setq use-package-verbose t)

;;; BETTER GARBAGE COLLECTION

    (use-package gcmh
        :config
        (gcmh-mode 1))

;;; DEFINING XDG DIRECTORIES

    (defun ls/osx ()
        ;; Make PATH on OSX work correctly 
        (use-package exec-path-from-shell
            :config
            ;;; Pull in other enviroment variables
            (exec-path-from-shell-initialize)
            (exec-path-from-shell-copy-envs '("XDG_CONFIG_HOME" "XDG_DATA_HOME" "XDG_CACHE_HOME")))
        (message "Loading osx specific bindings")
        (require 'osx))

    (when (equal system-type 'darwin)
        (funcall #'ls/osx))

    (defvar xdg-data-home-directory
        (getenv "XDG_DATA_HOME"))
    (defvar xdg-cache-home-directory
        (getenv "XDG_CACHE_HOME"))

;;; KEEP EMACS FOLDER CLEAN

    (use-package no-littering
        :init
        ;;; Defining XDG_DATA_HOME $XDG_CACHE_HOME
        (setq no-littering-etc-directory
            (expand-file-name (convert-standard-filename "emacs/") xdg-cache-home-directory))
        (setq no-littering-var-directory
            (expand-file-name (convert-standard-filename "emacs/") xdg-data-home-directory)))

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

;;; KEYBINDS

;;;; Evil Mode

    (use-package evil
        :init
        (setq evil-want-integration t)
        (setq evil-search-module 'evil-search)
        (setq evil-undo-system 'undo-redo)
        (setq evil-want-keybinding nil)
        (setq evil-want-C-u-scroll t)
        (setq evil-want-C-i-jump t)
        (setq evil-want-Y-yank-to-eol t)
        (setq evil-want-C-w-delete nil)
        (setq evil-want-C-w-in-emacs-state t)
        :config
        (evil-mode 1)
        (define-key evil-normal-state-map (kbd "C-w f") 'find-file-other-window)
        ;; Leader Key
        (evil-set-leader 'normal (kbd "SPC"))
        (evil-define-key 'normal 'global (kbd "<leader>fe") #'ls/open-config)
        (evil-define-key 'normal 'global (kbd "<leader>fn") #'deft-find-file)
        (evil-define-key 'normal 'global (kbd "gc") #'comment-or-uncomment-region))

    ;; Global evil keybinds
    (use-package evil-collection 
        :after evil
        :init
        (evil-collection-init))

;;;; Which Key
    ;; (use-package which-key
    ;;     :defer t
    ;;     :init (which-key-mode)
    ;;     :config
    ;;     (setq which-key-idle-delay 1.0))

;;;; General keybinds
    (global-set-key (kbd "C-x C-b") 'ibuffer)
    ;; set universal argument to a different key
    (global-set-key (kbd "C-M-u") 'universal-argument)   

;;; UI

    (defvar fg        "#f8f8f2")
    (defvar bg        "#191622")
    (defvar comment   "#6272a4")
    (defvar black     "#1E2029")
    (defvar purple    "#bd93f9")
    (defvar cyan      "#8be9fd")
    (defvar green     "#50fa7b")
    (defvar orange    "#ffb86c")
    (defvar pink      "#ff79c6")
    (defvar red       "#ff5555")
    (defvar yellow    "#f1fa8c")
    (defvar selection "#44475A")
    (defvar blue      "#61bfff")
    (defvar dark-blue "#0189cc")


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


    (use-package autothemer
        :defer t)

    ;; Configuring Font
    (dolist (face '(default fixed-pitch))
        (set-face-attribute `,face nil :background bg :font "JetBrainsMono Nerd Font 12"))
    (set-face-attribute 'bold nil :font "JetBrainsMonoExtraBold Nerd Font 12")
    ;; Set the variable pitch face
    (set-face-attribute 'variable-pitch nil :font "SF Pro Text 12")

    ;; More integrated themes
    (use-package doom-themes)
        :config
        (load-theme 'doom-dracula t)

;;;; Mod-line
    ;; (use-package doom-modeline
    ;;     :hook (after-init . doom-modeline-init)
    ;;     :custom
    ;;     (doom-modeline-major-mode-color-icon nil)
    ;;     (doom-modeline-minor-modes nil)
    ;;     (doom-modeline-lsp nil)
    ;;     (doom-modeline-buffer-file-name-style 'buffer-name)
    ;;     (doom-modeline-buffer-encoding nil))

    (set-face-attribute 'mode-line nil :background bg)

    (use-package mini-modeline
        :custom-face
        :config
        (mini-modeline-mode t)
        (setq mini-modeline-echo-duration 4) 
        (setq mini-modeline-r-format nil)
        (setq mini-modeline-l-format nil))
        (set-face-attribute 'mini-modeline-mode-line nil :background purple :height 0.2)
        (set-face-attribute 'mini-modeline-mode-line-inactive nil :background "#24252f" :height 0.1)


;;;; Relative number like in Vim
    (use-package linum-relative
        :hook (prog-mode . linum-relative-mode)
        :config
        (setq linum-relative-backend 'display-line-numbers-mode))

;;;; Make some windows a popup
    (use-package popper
        :bind (("C-,"   . popper-toggle-latest)
               ("C-;"   . popper-cycle))
        :init
        (setq popper-reference-buffers
                '(xref-mode
                "\\*Occur\\*"
                ".*.png"
                "\\*Flymake\\ diagnostics.*"
                xref--xref-buffer-mode))
        (popper-mode +1)
        (popper-echo-mode +1))                ; For echo area hints

;;; UTILITY

    (use-package restart-emacs
      :defer t)

;;; BUILTINGS PACKAGES

    (use-package eww
        :straight (:type built-in)
        :defer t
        :bind ("C-x ?" . eww)
        :config
        (setq eww-desktop-remove-duplicates t)
        (setq eww-header-line-format nil)
        (setq eww-search-prefix "https://duckduckgo.com/html/?q=")
        (setq url-cookie-delete-cookies nil)
        ;; eww url history
        (setq url-history-file (no-littering-expand-etc-file-name "eww/history"))
        (setq url-cookie-confirmation nil))

    (use-package dired
        :straight (:type built-in)
        :commands (dired dired-jump)
        :config
        (put 'dired-find-alternate-file 'disabled nil)
        (evil-define-key 'normal dired-mode-map
          "h" 'dired-up-directory
          "l" 'dired-find-alternate-file
          "nf" 'dired-create-empty-file
          "nd" 'dired-create-directory
          " " 'dired-mark)
          ;; always delete and copy recursively
        (setq dired-recursive-deletes 'always)
        (setq dired-recursive-copies 'always))


    (use-package dired+
        :after dired
        :custom-face
        ;; (diredp-dir-name       ((t (:foreground purple))))
        ;; (diredp-dir-heading    ((t (:underline t :bold t :foreground purple))))
        (diredp-file-name      ((t (:foreground ,fg))))
        ;; (diredp-symlink        ((t (:foreground green))))
        (diredp-number         ((t (:foreground ,fg))))
        (diredp-executable-tag ((t (:foreground ,fg))))
        (diredp-no-priv        ((t (:background nil))))
        (diredp-date-time      ((t (:foreground ,fg))))
        (diredp-dir-priv       ((t (:foreground ,fg))))
        (diredp-rare-priv      ((t (:foreground ,fg))))
        (diredp-read-priv      ((t (:foreground ,fg))))
        (diredp-link-priv      ((t (:foreground ,fg))))
        (diredp-exec-priv      ((t (:foreground ,fg))))
        (diredp-write-priv     ((t (:foreground ,fg))))
        (diredp-file-suffix    ((t (:foreground ,fg))))
        ;; (diredp-omit-file-name ((t (:strike-through nil :foreground comment))))
        :config
        (setq diredp-hide-details-initially-flag nil)
        (setq diredp-hide-details-propagate-flag nil)
        (diredp-toggle-find-file-reuse-dir 1))

    (use-package project
        :straight (:type built-in)
        :bind ("C-x p s" . project-switch-project))

    ;;;; Extend project.el
    (use-package project-x
        :straight (:host github :repo "karthink/project-x" :branch "master")
        :after project
        :config
        (setq project-x-save-interval 600)    ;Save project state every 10 min
        (project-x-mode 1))

    (use-package outline
        :straight (:type built-in)
        :hook (prog-mode . outline-minor-mode)
        :config
        (evil-define-key 'normal 'global (kbd "TAB") 'outline-cycle))

    ;; (use-package icomplete
    ;;     :config
    ;;     (setq read-file-name-completion-ignore-case t)
    ;;     (setq read-buffer-completion-ignore-case t)
    ;;     (setq completion-ignore-case t)
    ;;     (setq icomplete-show-matches-on-no-input t)
    ;;     (icomplete-vertical-mode))

;;;; VC Mode
    (use-package vc
        :straight (:type built-in)
        :bind ("C-x v d" . vc-dir-root)
        :config
        (setq auto-revert-check-vc-info t)
        (setq vc-follow-symlinks t))

;;; COMPLETION FRAMWORK

;;;; Vertico for the vertical UI
    (use-package vertico
        :straight (:host github :repo "minad/vertico" :branch "main")
        :custom
        (vertico-cycle t)
        :init
        (vertico-mode))

;;;; Orderless for the sweat fuzzy-like maching
    (use-package orderless
        :init (setq completion-styles '(orderless)))

;;;; Marginalia for extra info on the margins
    (use-package marginalia
        :after vertico
        :config
        (marginalia-mode))

;;;; Embark for minibuffer actions
    (use-package embark
        :bind ("C-." . embark-act)) ;; pick some comfortable binding

;;;; Consult
    (use-package consult
      :bind ("C-s" . consult-line))

;;; WRITING/NOTES

;;;; Notational Velocity for emacs
    (use-package deft
        :commands deft-find-file
        :config
        (setq deft-directory "~/Documents/nextcloud/notes/"
              deft-extensions '("md" "org")
              deft-recursive t))

;;;; Markdown support in emacs
    (use-package markdown-mode
        :mode "\\.md\\'"
        :custom-face
        (markdown-code-face             ((t (:foreground ,yellow :background nil :box nil))))
        (markdown-header-face           ((t (:bold t :foreground ,green :background nil :box nil :font "JetBrainsMonoExtraBold Nerd Font 13"))))
        (markdown-header-delimiter-face ((t (:bold t :foreground ,pink :background nil :box nil))))
        (markdown-list-face             ((t (:bold t :foreground ,cyan :background nil :box nil))))
        (markdown-language-keyword-face ((t (:foreground ,comment :background nil :box nil))))
        (markdown-bold-face             ((t (:foreground ,fg :background nil :box nil :font "JetBrainsMonoExtraBold Nerd Font"))))
        (markdown-italic-face           ((t (:foreground ,fg :background nil :box nil))))
        :config
        (setq markdown-hide-urls t)
        (setq markdown-command "Pandoc"))

;;;; Org Mode
    (use-package org
        :straight (:type built-in)
        :defer t
        :config
        (setq org-ellipsis " ▾")
        (setq org-src-fontify-natively t)
        (setq org-fontify-quote-and-verse-blocks t)
        (setq org-src-tab-acts-natively t)
        (setq org-edit-src-content-indentation 2)
        (setq org-src-preserve-indentation nil)
        (setq org-cycle-separator-lines 2))

;;;; Center the writing area
    (use-package olivetti
        :hook ((markdown-mode . olivetti-mode)
               (org-mode . olivetti-mode)
               (eww-mode . olivetti-mode)))

;;; PROGRAMMING

;;;; Sweat Tree sitter
    (use-package tree-sitter-langs
        :after tree-sitter)
    (use-package tree-sitter
        :custom-face
        (tree-sitter-hl-face:attribute        ((t (:foreground ,green))))
        (tree-sitter-hl-face:constant         ((t (:foreground ,purple))))
        (tree-sitter-hl-face:constant.builtin ((t (:foreground ,purple))))
        (tree-sitter-hl-face:escape           ((t (:foreground ,pink))))
        (tree-sitter-hl-face:variable         ((t (:foreground ,fg))))
        (tree-sitter-hl-face:function         ((t (:foreground ,green))))
        (tree-sitter-hl-face:function.builtin ((t (:foreground ,purple))))
        (tree-sitter-hl-face:function.call    ((t (:foreground ,green))))
        (tree-sitter-hl-face:method           ((t (:foreground ,green))))
        (tree-sitter-hl-face:method.call      ((t (:foreground ,green))))
        (tree-sitter-hl-face:type             ((t (:italic t :foreground ,cyan))))
        (tree-sitter-hl-face:type.builtin     ((t (:italic t :foreground ,cyan))))
        :config
        (global-tree-sitter-mode)
        (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

;;;; Eglot for lsp support
    (use-package eglot
        :hook ((c-mode . eglot-ensure)
               (c++-mode . eglot-ensure))
        :init
        (setq eglot-server-programs '((c-mode . ("clangd"))))
        (setq eglot-ignored-server-capabilities '(:hoverProvider :documentRangeFormattingProvider :documentOnTypeFormattingProvider)))
        (evil-define-key 'normal eglot-mode-map (kbd "g R") 'eglot-rename)
        (evil-define-key 'normal eglot-mode-map (kbd "g d") 'eglot-find-declaration)
        (evil-define-key 'normal eglot-mode-map (kbd "g D") 'flymake-show-buffer-diagnostics)
        (evil-define-key 'normal eglot-mode-map (kbd "g r") 'xref-find-references)
        (evil-define-key 'normal eglot-mode-map (kbd "g h") 'eldoc)

;;;; Completion w/company
    (use-package company
        :config
        (setq company-backends '(company-files company-capf))
        (setq company-auto-commit-chars nil)
        (setq company-minimum-prefix-length 1)
        (setq company-idle-delay 0.0)
        (setq company-auto-commit t)
        (setq company-icon-size '(auto-scale . 15))
        (global-company-mode))

;;;; Companion for company
    (use-package company-box
        :hook (company-mode . company-box-mode))

;;;; The best git interface
    (use-package magit
        :commands (magit-status magit-get-current-branch))

;;;; Support for yaml
    (use-package yaml-mode
        :ensure t
        ;; .yaml or .yml
        :mode "\\(?:\\(?:\\.y\\(?:a?ml\\)\\)\\)\\'")

;;;; Autosave
    (use-package super-save
        :defer 1
        :config
        (super-save-mode +1)
        (setq super-save-auto-save-when-idle t))

;;;; Preview HEX color
    (use-package rainbow-mode
        :hook (prog-mode . rainbow-mode))

;;;; Autoaling
    (use-package evil-lion
        :commands (evil-lion-left)
        :config
        (evil-lion-mode))
