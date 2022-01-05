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

;;; BOOTSTRAP FOR STRAIGHT.let
    (defvar bootstrap-version)
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
    (setq svg-lib-icons-dir (no-littering-expand-etc-file-name "svg-lib"))

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
        (evil-define-key 'normal 'global (kbd "<leader>oc") #'ls/open-config)
        (evil-define-key 'normal 'global (kbd "<leader>ob") #'ls/open-budget)
        (evil-define-key 'normal 'global (kbd "<leader>fn") #'deft-find-file))

    ;; Global evil keybinds
    (use-package evil-collection 
        :after evil
        :init
        (evil-collection-init))

    (use-package evil-lion
        :after evil
        :config
        (evil-lion-mode))

    (use-package evil-commentary
        :after evil
        :config
        (evil-commentary-mode 1))

;;;; General keybinds
    (global-set-key (kbd "C-x C-b") 'ibuffer)
    ;; set universal argument to a different key
    (global-set-key (kbd "C-M-u") 'universal-argument)   

;;; UI

    ;; Make Tabs behave sanely
    (setq-default tab-width 4)
    (setq-default tab-always-indent nil)
    (setq-default evil-shift-width tab-width)
    (setq-default indent-tabs-mode nil)
    (setq-default electric-indent-inhibit t)
    (setq-default c-basic-offset 4)
    (setq-default tabify-regexp "^\t* [ \t]+")
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

;;;; Configuring Font
    (dolist (face '(default fixed-pitch variable-pitch))
        (set-face-attribute `,face nil :font "JetBrainsMono Nerd Font 12"))
    (set-face-attribute 'bold nil :font "JetBrainsMonoExtraBold Nerd Font 12")

;;;; Themes
    (use-package doom-themes
        :config
        (load-theme 'doom-dracula t)
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
        (set-background-color bg))

;;;; Modeline config
    (use-package doom-modeline
        :init (doom-modeline-mode 1)
        :config
        (setq doom-modeline-height 10)
        (setq doom-modeline-buffer-file-name-style 'truncate-all)
        (setq doom-modeline-persp-icon nil)
        (setq doom-modeline-enable-word-count t)
        (setq doom-modeline-buffer-encoding nil))

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
                "\\*Ledger\\ Report\\*"
                xref--xref-buffer-mode))
        (popper-mode +1)
        (popper-echo-mode +1))                ; For echo area hints

;;;; Tabs
    (use-package tab-bar
        :straight (:type built-in)
        :custom-face
        (tab-bar-tab ((t (:bold t :foreground ,bg :background ,purple))))
        (tab-bar ((t (:foreground nil :background nil))))
        (tab-bar ((t (:height 120 :box nil))))
        (tab-bar-tab ((t (:bold t))))
        (tab-bar-tab-inactive ((t (:background nil))))
        :config
        (setq tab-bar-close-button nil)
        (setq tab-bar-new-tab-choice "*scratch*")
        (setq tab-bar-show 1)
        (evil-define-key 'normal 'global (kbd "C-w t") 'tab-bar-new-tab)
        (evil-define-key 'normal 'global (kbd "C-w C") 'tab-bar-close-tab))

;;; UTILITY

;;;; Restart emacs
    (use-package restart-emacs
      :defer t)

;;;; Budgeting with ledger
    (use-package ledger-mode
        :mode "\\.dat\\'"
        :init
        (setq ledger-clear-whole-transactions 1))

;;; BUILTINGS PACKAGES

    (use-package vc
        :straight (:type built-in)
        :bind ("C-x v d" . vc-dir-root)
        :config
        (setq auto-revert-check-vc-info t)
        (setq vc-follow-symlinks t))

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
        :custom-face
        (dired-directory ((t (:foreground ,purple))))
        (dired-header ((t (:underline t :bold t :foreground ,purple))))
        (dired-symlink ((t (:foreground ,green))))
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

;;; COMPLETION FRAMWORK

;;;; Vertico for the vertical UI
    (use-package vertico
        :straight (:host github :repo "minad/vertico" :branch "main")
        :bind (:map vertico-map
              ("M-c" . vertico-save))
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

;;;; Cape for enhance the complete at point function
    (use-package cape
        :init
        ;; Add `completion-at-point-functions', used by `completion-at-point'.
        (add-to-list 'completion-at-point-functions #'cape-file)
        (add-to-list 'completion-at-point-functions #'cape-tex)
        (add-to-list 'completion-at-point-functions #'cape-dabbrev)
        (add-to-list 'completion-at-point-functions #'cape-keyword))


;;;; Corfu as a company mode replacement
    (use-package corfu
        :init
        (evil-define-key 'insert 'global (kbd "C-n") nil)
        (evil-define-key 'insert 'global (kbd "C-p") nil)
        :custom
        (corfu-cycle t)              ;; Enable cycling for `corfu-next/previous'
        (corfu-auto t)               ;; Enable auto completion
        (corfu-commit-predicate nil) ;; Do not commit selected candidates on next input
        (corfu-quit-no-match t)    ;; Automatically quit if there is no match
        (corfu-preview-current t)    ;; Disable current candidate preview
        (corfu-preselect-first t)    ;; Disable candidate preselection
        (corfu-auto-delay 0.0)
        :bind (:map corfu-map
                ("C-n" . corfu-next)
                ("C-p" . corfu-previous))
        :init
        (corfu-global-mode))

    (use-package kind-icon
        :ensure t
        :after corfu
        :custom
        (kind-icon-default-face 'corfu-default) ; to compute blended backgrounds correctly
        :config
        (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

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
        (markdown-code-face ((t (:foreground ,yellow  :background nil :box nil))))
        (markdown-header-face ((t (:bold t :foreground ,green :background nil :box nil :font "JetBrainsMonoExtraBold Nerd Font 13"))))
        (markdown-header-delimiter-face ((t (:bold t :foreground ,pink :background nil :box nil))))
        (markdown-list-face ((t (:bold t :foreground ,cyan :background nil :box nil))))
        (markdown-language-keyword-face ((t (:foreground ,comment :background nil :box nil))))
        (markdown-bold-face ((t (:foreground ,fg :background nil :box nil :font "JetBrainsMonoExtraBold Nerd Font"))))
        (markdown-italic-face ((t (:foreground ,fg :background nil   :box nil))))
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

;;;; LaTex
    (use-package auctex
        :mode ("\\.tex\\'" . latex-mode))

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
        (tree-sitter-hl-face:attribute ((t (:foreground ,green))))
        (tree-sitter-hl-face:constant ((t (:foreground ,purple))))
        (tree-sitter-hl-face:constant.builtin ((t (:foreground ,purple))))
        (tree-sitter-hl-face:escape ((t (:foreground ,pink))))
        (tree-sitter-hl-face:variable ((t (:foreground ,fg))))
        (tree-sitter-hl-face:function ((t (:foreground ,green))))
        (tree-sitter-hl-face:function.builtin ((t (:foreground ,purple))))
        (tree-sitter-hl-face:function.call ((t (:foreground ,green))))
        (tree-sitter-hl-face:method ((t (:foreground ,green))))
        (tree-sitter-hl-face:method.call ((t (:foreground ,green))))
        (tree-sitter-hl-face:type ((t (:italic t :foreground ,cyan))))
        (tree-sitter-hl-face:type.builtin ((t (:italic t :foreground ,cyan))))
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
        :defer t)
