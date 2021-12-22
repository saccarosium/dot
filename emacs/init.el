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

    ;; Make PATH on OSX work correctly
    (use-package exec-path-from-shell
        :config
        ;;; Pull in other enviroment variables
        (exec-path-from-shell-initialize)
        (exec-path-from-shell-copy-envs '("XDG_CONFIG_HOME" "XDG_DATA_HOME" "XDG_CACHE_HOME")))

        (require 'osx)
        (defvar xdg-data-home-directory (getenv "XDG_DATA_HOME"))
        (defvar xdg-cache-home-directory (getenv "XDG_CACHE_HOME"))

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
        :config
        (evil-mode 1)
        (define-key evil-normal-state-map (kbd "C-w f") 'find-file-other-window)
        ;; Leader Key
        (evil-set-leader 'normal (kbd "SPC"))
        (evil-define-key 'normal 'global (kbd "<leader>fe") #'ls/open-config)
        (evil-define-key 'normal 'global (kbd "<leader>fn") #'deft-find-file))

    ;; Global evil keybinds
    (use-package evil-collection 
        :after evil
        :init
        (evil-collection-init))

;;;; Which Key
    (use-package which-key
        :defer t
        :init (which-key-mode)
        :diminish which-key-mode
        :config
        (setq which-key-idle-delay 1.0))

;;;; General keybinds
    (global-set-key (kbd "C-x C-b") 'ibuffer)

;;; UI

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
        (set-face-attribute 'bold nil :font "JetBrainsMonoExtraBold Nerd Font 12")
    ;; Set the variable pitch face
    (set-face-attribute 'variable-pitch nil :font "SF Pro Text 12")

    ;; More integrated themes
    (use-package doom-themes
        :config
        (load-theme 'doom-dracula t)
        (setq doom-dracula-colorful-headers t))

    (defun ls/colors ()
        (set-background-color "#191622")
        (set-face-attribute 'line-number nil :italic nil :background nil)
        (set-face-attribute 'fringe nil :background nil);;"#191622")
        (set-face-attribute 'mode-line nil :background nil :box nil)
        (set-face-attribute 'mode-line nil :background nil :box nil)
        );"#21222b" #191622

;;;; Set color and icons if in daemon mode
    (if (daemonp)
        (add-hook 'after-make-frame-functions
                (lambda (frame)
                    (setq doom-modeline-icon t)
                    (with-selected-frame frame
                    (ls/colors))))
        (ls/colors))

;;;; Mod-line
    (use-package doom-modeline
        :hook (after-init . doom-modeline-init)
        :custom
        (doom-modeline-major-mode-color-icon nil)
        (doom-modeline-minor-modes nil)
        (doom-modeline-lsp nil)
        (doom-modeline-buffer-file-name-style 'buffer-name)
        (doom-modeline-buffer-encoding nil))

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

    (use-package restart-emacs)

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
        :config
        (put 'dired-find-alternate-file 'disabled nil)
        (evil-define-key 'normal dired-mode-map "h" 'dired-up-directory)
        (evil-define-key 'normal dired-mode-map "l" 'dired-find-alternate-file)
        (evil-define-key 'normal dired-mode-map " " 'dired-mark)
        (evil-define-key 'normal dired-mode-map "q" 'kill-this-buffer)
        (set-face-attribute 'dired-directory nil :foreground "#bd93f9")
        (set-face-attribute 'dired-symlink nil :foreground "#50fa7b"))

    (use-package project
        :straight (:type built-in)
        :bind ("C-x p s" . project-switch-project))

    (use-package outline
        :straight (:type built-in)
        :hook (prog-mode . outline-minor-mode)
        :config
        (evil-define-key 'normal 'global (kbd "TAB") 'outline-cycle))


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
        :config
        (set-face-attribute 'markdown-code-face nil :foreground "#f1fa8c" :background nil :box nil)
        (set-face-attribute 'markdown-header-face nil :bold t :foreground "#50fa7b" :background nil :box nil :font "JetBrainsMonoExtraBold Nerd Font 13")
        (set-face-attribute 'markdown-header-delimiter-face nil :bold t :foreground "#ff79c6" :background nil :box nil)
        (set-face-attribute 'markdown-list-face nil :bold t :foreground "#a0e7fa" :background nil :box nil)
        (set-face-attribute 'markdown-language-keyword-face nil :foreground "#6572a0" :background nil :box nil)
        (set-face-attribute 'markdown-bold-face nil :foreground "#f8f8f3" :background nil :box nil :font "JetBrainsMonoExtraBold Nerd Font")
        (set-face-attribute 'markdown-italic-face nil :foreground "#f8f8f3" :background nil :box nil)

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
        :config
        (global-tree-sitter-mode)
        (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

;;;; Eglot for lsp support
    (use-package eglot
        :hook ((c-mode . eglot-ensure)
               (c++-mode . eglot-ensure))
        :init
        (setq eglot-server-programs '((c-mode . ("clangd"))))
        (setq eglot-ignored-server-capabilities '(:hoverProvider :documentRangeFormattingProvider :documentOnTypeFormattingProvider))
        :config
        (evil-define-key 'normal eglot-mode-map (kbd "g R") 'eglot-rename)
        (evil-define-key 'normal eglot-mode-map (kbd "g d") 'eglot-find-declaration)
        (evil-define-key 'normal eglot-mode-map (kbd "g D") 'flymake-show-buffer-diagnostics)
        (evil-define-key 'normal eglot-mode-map (kbd "g r") 'xref-find-references)
        (evil-define-key 'normal eglot-mode-map (kbd "g h") 'eldoc))

;;;; Completion w/company
    (use-package company
        :hook (after-init-hook . global-company-mode)
        :config
        (setq company-backends '(company-files company-capf))
        (setq company-auto-commit-chars nil)
        (setq company-minimum-prefix-length 1)
        (setq company-idle-delay 0.0)
        (setq company-auto-commit t)
        (setq company-icon-size '(auto-scale . 15)))

;;;; Companion for company
    (use-package company-box
        :hook (company-mode . company-box-mode))

;;;; VC Mode
    (use-package vc
        :straight (:type built-in)
        :bind ("C-x v d" . vc-dir-root)
        :config
        (setq auto-revert-check-vc-info t)
        (setq vc-follow-symlinks t))

;;;; The best git interface
    (use-package magit
        :commands (magit-status magit-get-current-branch))

;;;; Autosave
    (use-package super-save
        :defer 1
        :config
        (super-save-mode +1)
        (setq super-save-auto-save-when-idle t))

