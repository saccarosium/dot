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
    (define-key evil-normal-state-map (kbd "C-l") 'evil-ex-nohighlight)
    ;; Leader Key
    (evil-set-leader 'normal (kbd "SPC"))
    (evil-define-key 'normal 'global (kbd "<leader>oc") #'ls/open-config)
    (evil-define-key 'normal 'global (kbd "<leader>ob") #'ls/open-budget)
    (evil-define-key 'normal 'global (kbd "<leader>ot") #'ls/open-todolist)
    (evil-define-key 'normal 'global (kbd "<leader>SPC") 'find-file)
    (evil-define-key 'normal 'global (kbd "<leader>fn") #'deft-find-file)
    (evil-define-key 'normal 'global (kbd "<leader>fl") #'consult-line)
    (evil-define-key 'normal 'global (kbd "ZZ") 'delete-frame))


  ;; Global evil keybinds
  (use-package evil-collection 
    :after evil
    :custom
    (evil-collection-org-setup t)
    (evil-collection-outline-bind-tab-p t)
    (evil-collection-calendar-want-org-bindings t)
    :init
    (evil-collection-init))

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

  (add-to-list 'default-frame-alist '(undecorated . t))
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

  (use-package nord-theme)
  (load-theme 'nord t)

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
              "\\*eshell\\*"
              "\\*Occur\\*"
              ".*.png"
              "\\*eldoc.*"
              "\\*Flymake\\ diagnostics.*"
              xref--xref-buffer-mode))
      (popper-mode +1)
      (popper-echo-mode +1))                ; For echo area hints

;;;; Tabs
  (use-package tab-bar
    :straight (:type built-in)
    :bind (("M-t" . tab-bar-new-tab)
           ("M-w" . tab-bar-close-tab))
    :config
    (setq tab-bar-close-button nil)
    (setq tab-bar-new-tab-choice "*scratch*")
    (setq bar-show-tab 2)
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

;;; BUILTINGS PACKAGES

  (use-package vc
    :straight (:type built-in)
    :bind (("<leader>gs" . vc-dir-root)
           ("<leader>gl" . vc-dir))
    :config
    (setq auto-revert-check-vc-info t)
    (setq vc-follow-symlinks t))

  (use-package dired
    :straight (:type built-in)
    :bind (("<leader>j" . dired-jump))
    :config
    (evil-define-key 'normal dired-mode-map "h" 'dired-up-directory)
    (evil-define-key 'normal dired-mode-map "H" 'dired-omit-mode)
    (evil-define-key 'normal dired-mode-map "l" 'dired-find-alternate-file)
    (evil-define-key 'normal dired-mode-map "q" 'kill-current-buffer)
    (evil-define-key 'normal dired-mode-map "nf" 'dired-create-empty-file)
    (evil-define-key 'normal dired-mode-map "nd" 'dired-create-directory)
    (evil-define-key 'normal dired-mode-map "M" 'dired-mark)
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

  (use-package bookmark
    :straight (:type built-in)
    :custom-face
    (bookmark-face ((t (:background nil :box nil))))
    :config
    (evil-define-key 'normal 'global (kbd "<leader>RET") 'bookmark-jump)
    (setq bookmark-save-flag 1))

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

;;; Marginalia for extra info on the margins
  (use-package marginalia
    :after vertico
    :config
    (marginalia-mode))

;;; Consult nice life's improvements
  (use-package consult)

;; Cape for enhance the complete at point function
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

;; ;;; WRITING/NOTES

;; ;;;; Notational Velocity for emacs
  (use-package deft
    :commands deft-find-file
    :config
    (setq deft-directory "~/Documents/nextcloud/notes/")
    (setq deft-extensions '("md"))
    (setq deft-recursive t))

;;;; Markdown support in emacs
  (use-package markdown-mode
    :mode "\\.md\\'"
    :hook ((markdown-mode . olivetti-mode))
    :custom-face
    (markdown-bold-face ((t (:foreground ,fg :background nil :box nil :font "JetBrainsMonoExtraBold Nerd Font"))))
    (markdown-italic-face ((t (:slant italic :foreground ,fg :background nil :box nil))))
    :config
    (setq markdown-hide-urls t)
    (setq markdown-fontify-code-blocks-natively t)
    (setq markdown-command "Pandoc"))

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
    :bind (("C-x r" . eglot-rename)
           ("C-x f" . eglot-format))
    :init
    (setq eglot-server-programs '((c-mode . ("clangd"))))
    (setq eglot-extend-to-xref t)
    (setq eglot-ignored-server-capabilities '(:hoverProvider :documentRangeFormattingProvider :documentOnTypeFormattingProvider)))
    (evil-define-key 'normal eglot-mode-map (kbd "g d") 'eglot-find-declaration)
    (evil-define-key 'normal eglot-mode-map (kbd "C-q") 'flymake-show-buffer-diagnostics)
    (evil-define-key 'normal 'global (kbd "g r") 'xref-find-references)
    (evil-define-key 'normal 'global (kbd "g d") 'xref-find-definitions)
    (evil-define-key 'normal 'global (kbd "K") 'eldoc)

;;;; Support for yaml
  (use-package yaml-mode
    :ensure t
    ;; .yaml or .yml
    :mode "\\(?:\\(?:\\.y\\(?:a?ml\\)\\)\\)\\'")

;;;; Preview HEX color
  (use-package rainbow-mode
    :defer t)
