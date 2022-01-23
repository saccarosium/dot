;;; -*- lexical-binding: t -*-

;;; STARTUP PERFORMANCE

  (setq gc-cons-threshold 20000000)

  (defun my-minibuffer-setup-hook ()
    (setq gc-cons-threshold most-positive-fixnum))

  (defun my-minibuffer-exit-hook ()
    (setq gc-cons-threshold 800000))

  (add-hook 'minibuffer-setup-hook #'my-minibuffer-setup-hook)
  (add-hook 'minibuffer-exit-hook #'my-minibuffer-exit-hook)

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
  (setq comp-async-report-warnings-errors nil)
  (setq byte-compile-warnings nil)
  (setq package-native-compile t)

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
    (setq gcmh-verbose 't)
    (gcmh-mode 1))

;;; DEFINING XDG DIRECTORIES

  (defun ls/osx ()
      ;; Make PATH on OSX work correctly 
      (use-package exec-path-from-shell
          :config
          ;;; Pull in other enviroment variables
          (exec-path-from-shell-initialize)
          (exec-path-from-shell-copy-envs '("XDG_CONFIG_HOME" "XDG_DATA_HOME" "XDG_CACHE_HOME")))
      (set-frame-parameter (selected-frame) 'name nil)
      (message "Loading osx compatability layer")
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
    (setq evil-want-fine-undo t)
    :config
    (evil-mode 1)
    (define-key evil-normal-state-map (kbd "C-w f") 'find-file-other-window)
    ;; Leader Key
    (evil-set-leader 'normal (kbd "SPC"))
    (evil-define-key 'normal 'global (kbd "<leader>oc") #'ls/open-config)
    (evil-define-key 'normal 'global (kbd "<leader>ob") #'ls/open-budget)
    (evil-define-key 'normal 'global (kbd "<leader>ot") #'ls/open-todolist)
    (evil-define-key 'normal 'global (kbd "<leader>SPC") 'find-file)
    (evil-define-key 'normal 'global (kbd "<leader>fn") #'deft-find-file))

  ;; Global evil keybinds
  (use-package evil-collection 
    :after evil
    :custom
    (evil-collection-org-setup t)
    (evil-collection-outline-bind-tab-p t)
    (evil-collection-calendar-want-org-bindings t)
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
  (global-set-key (kbd "<leader>e") 'display-local-help)   

;;; UI

  ;; Make Tabs behave sanely
  (setq-default tab-width 2)
  (setq-default c-basic-offset 2)
  (setq-default sh-basic-offset 2)
  (setq-default tab-always-indent nil)
  (setq-default evil-shift-width tab-width)
  (setq-default indent-tabs-mode nil)
  (setq-default electric-indent-inhibit t)
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
  (setq case-fold-search          nil)

;;;; Configuring Font

  (dolist (face '(default fixed-pitch variable-pitch))
      (set-face-attribute `,face nil :font "JetBrainsMono Nerd Font 12"))
  (set-face-attribute 'bold nil :font "JetBrainsMonoExtraBold Nerd Font 12")

;;;; Themes

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
  (defvar contrast  "#0c0a14")
  (defvar contrast1 "#252630")
  (defvar unfocus   "#b6b6b2")

  (use-package dracula-theme)
  (setq dracula-enlarge-headings nil)
  (load-theme 'dracula t)
  (set-background-color "#191622")
  (set-face-attribute 'fringe nil :background nil)

  (use-package doom-themes)

;;;; Hide Modeline
  (use-package hide-mode-line
      :defer t)

(set-face-attribute 'mode-line nil :background contrast :box nil)


;;;; Bespoke Modeline
  (use-package bespoke-modeline
    :straight (:type git :host github :repo "mclear-tools/bespoke-modeline") 
    :init
    ;; Set header line
    (setq bespoke-modeline-position 'bottom)
    ;; Set mode-line height
    (setq bespoke-modeline-size 3)
    ;; Show diff lines in mode-line
    (setq bespoke-modeline-git-diff-mode-line t)
    ;; Set mode-line cleaner
    (setq bespoke-modeline-cleaner t)
    ;; Use mode-line visual bell
    (setq bespoke-modeline-visual-bell t)
    ;; Set vc symbol
    (setq  bespoke-modeline-vc-symbol "  ")
    :custom-face
    (bespoke-modeline-inactive ((t (:foreground "#b6b6b2" :background nil))))
    (bespoke-modeline-inactive-name ((t (:foreground "#b6b6b2" :background nil))))
    (bespoke-modeline-inactive-primary ((t (:foreground "#b6b6b2" :background nil))))
    (bespoke-modeline-active-primary ((t (:foreground ,fg :background nil))))
    (bespoke-modeline-inactive-secondary ((t (:foreground "#b6b6b2" :background nil))))
    (bespoke-modeline-inactive-status-** ((t (:foreground "#b6b6b2" :background nil))))
    (bespoke-modeline-inactive-status-RO ((t (:foreground "#b6b6b2" :background nil))))
    (bespoke-modeline-inactive-status-RW ((t (:foreground "#b6b6b2" :background nil))))
    :config
    (bespoke-modeline-mode))

;;;; Relative number like in Vim
  (use-package linum-relative
      :hook ((prog-mode . linum-relative-mode)
             (conf-mode . linum-relative-mode))
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
              "\\*eldoc.*"
              "\\*Flymake\\ diagnostics.*"
              "\\*Ledger\\ Report\\*"
              xref--xref-buffer-mode))
      (popper-mode +1)
      (popper-echo-mode +1))                ; For echo area hints

  ;; (use-package nano-modeline
  ;;   :custom-face
  ;;   (nano-modeline-inactive ((t (:foreground "#b6b6b2" :background nil))))
  ;;   (nano-modeline-inactive-name ((t (:foreground "#b6b6b2" :background nil))))
  ;;   (nano-modeline-inactive-primary ((t (:background nil))))
  ;;   (nano-modeline-inactive-secondary ((t (:foreground "#b6b6b2" :background nil))))
  ;;   (nano-modeline-inactive-status-** ((t (:foreground "#b6b6b2" :background nil))))
  ;;   (nano-modeline-inactive-status-RO ((t (:foreground "#b6b6b2" :background nil))))
  ;;   (nano-modeline-inactive-status-RW ((t (:foreground "#b6b6b2" :background nil))))
  ;;   :config
  ;;   (setq nano-modeline-position 'bottom))
    ;; (nano-modeline-mode))

;;;; Tabs
  (use-package tab-bar
    :straight (:type built-in)
    :bind (("M-t" . tab-bar-new-tab)
           ("M-w" . tab-bar-close-tab))
    :custom-face
    (tab-bar ((t (:height 120 :background nil))))
    (tab-bar-tab ((t (:weight bold :foreground ,fg :background nil :box ,bg ))))
    (tab-bar-tab-inactive ((t (:foreground ,unfocus :background nil :box nil))))
    :config
    (setq tab-bar-close-button nil)
    (setq tab-bar-new-tab-choice "*scratch*")
    (setq tab-bar-show 1)
    (setq tab-bar-select-tab-modifiers "meta")
    (setq tab-bar-border "120")
    (global-set-key (kbd "M-1") 'tab-bar-select-tab)
    (global-set-key (kbd "M-2") 'tab-bar-select-tab)
    (global-set-key (kbd "M-3") 'tab-bar-select-tab)
    (global-set-key (kbd "M-4") 'tab-bar-select-tab)
    (global-set-key (kbd "M-5") 'tab-bar-select-tab)
    (global-set-key (kbd "M-6") 'tab-bar-select-tab)
    (global-set-key (kbd "M-7") 'tab-bar-select-tab)
    (global-set-key (kbd "M-8") 'tab-bar-select-tab)
    (global-set-key (kbd "M-9") 'tab-bar-select-tab)
    (setq tab-bar-position t))

;;; UTILITY

;;;; Restart emacs
  (use-package restart-emacs
    :defer t)

;;;; Budgeting with ledger
  (use-package ledger-mode
    :mode "\\.dat\\'"
    :init
    (setq ledger-clear-whole-transactions 1))

;;;; Pdf tools
  (use-package pdf-tools
    :defer t
    :config
    ;; initialise
    (pdf-tools-install)
    ;; open pdfs scaled to fit page
    (setq-default pdf-view-display-size 'fit-page)
    ;; automatically annotate highlights
    (setq pdf-annot-activate-created-annotations t))

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
    :hook (eww-mode . olivetti-mode)
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
    :bind (("C-x j" . dired-jump))
    :custom-face
    (dired-directory ((t (:foreground ,purple))))
    (dired-header ((t (:underline t :bold t :foreground ,purple))))
    (dired-symlink ((t (:foreground ,green))))
    :config
    (evil-define-key 'normal dired-mode-map "h" 'dired-up-directory)
    (evil-define-key 'normal dired-mode-map "H" 'dired-omit-mode)
    (evil-define-key 'normal dired-mode-map "l" 'dired-find-alternate-file)
    (evil-define-key 'normal dired-mode-map "q" 'kill-current-buffer)
    (evil-define-key 'normal dired-mode-map "nf" 'dired-create-empty-file)
    (evil-define-key 'normal dired-mode-map "nd" 'dired-create-directory)
    (evil-define-key 'normal dired-mode-map " " 'dired-mark)
    (setq dired-kill-when-opening-new-dired-buffer t)
    (put 'dired-find-alternate-file 'disabled nil)
    ;; always delete and copy recursively
    (setq dired-recursive-deletes 'always)
    (setq dired-recursive-copies 'always))

  (use-package project
    :straight (:type built-in)
    :custom
    (project-switch-commands 'project-find-file))

    (evil-define-key 'normal 'global (kbd "<leader>po") 'project-other-window-command)
    (evil-define-key 'normal 'global (kbd "<leader>ps") 'project-switch-project)
    (evil-define-key 'normal 'global (kbd "<leader>pb") 'project-switch-to-buffer)
    (evil-define-key 'normal 'global (kbd "<leader>pf") 'project-find-file)
    (evil-define-key 'normal 'global (kbd "<leader>pv") 'magit-project-status)
    (evil-define-key 'normal 'global (kbd "<leader>pd") 'project-dired)

  ;;;; Extend project.el
  (use-package project-x
    :straight (:host github :repo "karthink/project-x" :branch "master")
    :after project
    :config
    (setq project-x-local-identifier ".projectile")
    (setq project-x-save-interval 600)    ;Save project state every 10 min
    (project-x-mode 1))

  (use-package outline
    :straight (:type built-in)
    :hook (prog-mode . outline-minor-mode))

  (use-package bookmark
    :straight (:type built-in)
    :custom-face
    ;; (bookmark-face ((t (:background nil :box nil))))
    :config
    (evil-define-key 'normal 'global (kbd "<leader>RET") 'bookmark-jump)
    (setq bookmark-save-flag 1))

  (evil-define-key 'normal 'global (kbd "g r") 'xref-find-references)
  (evil-define-key 'normal 'global (kbd "g d") 'xref-find-definitions)
  (evil-define-key 'normal 'global (kbd "g a") 'xref-find-apropos)
  (evil-define-key 'normal 'global (kbd "g h") 'eldoc)

;;; COMPLETION FRAMWORK

;;;; Vertico for the vertical UI
  (use-package vertico
      :straight (:host github :repo "minad/vertico" :branch "main")
      :bind (:map vertico-map
            ("M-c" . vertico-save)
            ("M-RET" . vertico-exit-input))
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
    (add-to-list 'completion-at-point-functions #'cape-file)
    (add-to-list 'completion-at-point-functions #'cape-keyword)
    (add-to-list 'completion-at-point-functions #'cape-dabbrev))

;;; orfu as a company mode replacement
  (use-package corfu
    :init
    (evil-define-key 'insert 'global (kbd "C-n") nil)
    (evil-define-key 'insert 'global (kbd "C-p") nil)
    :custom
    (corfu-cycle t)              ;; Enable cycling for `corfu-next/previous'
    (corfu-auto t)               ;; Enable auto completion
    (corfu-commit-predicate nil) ;; Do not commit selected candidates on next input
    (corfu-quit-no-match t)      ;; Automatically quit if there is no match
    (corfu-preview-current t)    ;; Disable current candidate preview
    (corfu-preselect-first t)    ;; Disable candidate preselection
    (corfu-quit-at-boundary t)
    (corfu-auto-delay 0.0)
    :hook ((prog-mode . corfu-mode)
           (latex-mode . corfu-mode))
    :bind (:map corfu-map
          ("C-n" . corfu-next)
          ("C-p" . corfu-previous)
          ("TAB" . corfu-insert)))

  (use-package kind-icon
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
    (setq deft-directory "~/Documents/nextcloud/notes/")
    (setq deft-extensions '("md" "org"))
    (setq deft-recursive t))

;;;; Markdown support in emacs
  (use-package markdown-mode
    :mode "\\.md\\'"
    :hook ((markdown-mode . olivetti-mode)
           (markdown-mode . hide-mode-line-mode))
    :custom-face
    (markdown-bold-face ((t (:foreground ,fg :background nil :box nil :font "JetBrainsMonoExtraBold Nerd Font"))))
    (markdown-italic-face ((t (:slant italic :foreground ,fg :background nil :box nil))))
    :config
    (setq markdown-hide-urls t)
    (setq markdown-fontify-code-blocks-natively t)
    (setq markdown-command "Pandoc"))

;;;; Org Mode
  (use-package org
    :straight (:type built-in)
    :hook ((org-mode . org-indent-mode)
           (org-mode . hide-mode-line-mode)
           (org-mode . olivetti-mode))
    :defer t
    :bind (("C-c SPC" . org-capture)
           ("C-c o" . org-open-at-point)
           ("C-c w" . org-refile)
           ("C-c p" . org-priority)
           ("C-c t" . org-todo))
    :config
    (require 'org-config))

;;;; LaTex
  (use-package auctex
    :mode ("\\.tex\\'" . latex-mode))

;;;; Center the writing area
  (use-package olivetti
    :defer t)

;;; PROGRAMMING

;;; weat Tree sitter
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
    :bind (("C-c r" . eglot-rename)
           ("C-c f" . eglot-format))
    :init
    (setq eglot-server-programs '((c-mode . ("clangd"))))
    (setq eglot-extend-to-xref t)
    (setq eglot-ignored-server-capabilities '(:hoverProvider :documentRangeFormattingProvider :documentOnTypeFormattingProvider)))
    (evil-define-key 'normal eglot-mode-map (kbd "g d") 'eglot-find-declaration)
    (evil-define-key 'normal eglot-mode-map (kbd "g D") 'flymake-show-buffer-diagnostics)

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
