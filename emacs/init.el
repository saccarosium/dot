;;; -*- lexical-binding: t -*-
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory)) (setq gc-cons-threshold 100000000)
(setq file-name-handler-alist nil)

(add-hook 'emacs-startup-hook
          (lambda ()
            (message "*** Emacs loaded in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))

(setq custom-file (locate-user-emacs-file "custom.el"))

;; Bootstrap for Straight.el (defvar bootstrap-version)
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

;; Make Tabs behave sanely
(setq-default tab-width 4
              tab-always-indent nil
              evil-shift-width tab-width
              indent-tabs-mode nil 
              electric-indent-inhibit t)

(setq c-basic-offset 4
      tabify-regexp "^\t* [ \t]+"
      sentence-end-double-space nil
      require-final-newline t
      backward-delete-char-untabify-method 'nil)

;; Keep more clean
(setq create-lockfiles nil)
(setq make-backup-file nil)
(require 'osx)

;; Try to respect XDG convention on OSX
(straight-use-package 'no-littering)

;; Defining XDG_DATA_CONFIG on OSX
(setq no-littering-etc-directory
      (expand-file-name "~/Library/Application Support/emacs"))
(setq no-littering-var-directory
      (expand-file-name "~/Library/Application Support/emacs"))
(setq url-history-file (no-littering-expand-etc-file-name "url/history"))
(setq eshell-directory-name (no-littering-expand-etc-file-name "eshell/"))

;; Make the UI more preatty
(dolist (mode
         '(menu-bar-mode
           tool-bar-mode
           tooltip-mode
           scroll-bar-mode
           blink-cursor-mode))
  (funcall mode 0))

(setq inhibit-startup-screen    t
      initial-scratch-message   nil
      sentence-end-double-space nil
      use-dialog-box            nil
      mark-even-if-inactive     nil
      kill-whole-line           t
      frame-resize-pixelwise    t
      case-fold-search          nil)

(setq-default cursor-type 'box)
(setq-default mode-line-format nil)
(setq-default vc-follow-symlinks t)

;; Configuring Font
(dolist (face '(default fixed-pitch))
	(set-face-attribute `,face nil :font "JetBrainsMono Nerd Font 12"))

;; More integrated themes
(straight-use-package 'dracula-theme)
(straight-use-package 'doom-themes)
    (load-theme 'doom-dracula t)
    (setq doom-dracula-colorful-headers t)

(defun ls/colors ()
    (set-background-color "#191622")
    (set-face-attribute 'line-number nil :italic nil :background nil)
    (set-face-attribute 'fringe nil :background nil));;"#191622")
    ;;(set-face-attribute 'mode-line nil :background "#191622" :box nil);"#21222b" #191622

(if (daemonp)
    (add-hook 'after-make-frame-functions
             (lambda (frame)
                (setq doom-modeline-icon nil)
                (with-selected-frame frame
                  (ls/colors))))
    (ls/colors))

;; Make UI more usefull
(show-paren-mode t)         ;; Show matching parenthesis.
(global-so-long-mode)       ;; Handle long lines better.
(global-font-lock-mode 1)   ;; Always highlight code.
(global-auto-revert-mode 1) ;; Refresh a buffer if changed on disk.
(savehist-mode 1)           ;; Save history

(defalias 'yes-or-no-p 'y-or-n-p) ;; Accept 'y' in lieu of 'yes'.

;; Make PATH on OSX work correctly
(straight-use-package 'exec-path-from-shell)
(exec-path-from-shell-initialize)

;; Relative number like in Vim
(straight-use-package 'linum-relative)
	(add-hook 'prog-mode-hook 'linum-relative-mode)
	(setq linum-relative-backend 'display-line-numbers-mode)


(straight-use-package 'hl-todo)
    (add-hook 'prog-mode-hook 'hl-todo-mode)
    (setq hl-todo-keyword-faces
        '(("TODO"   . "#FF0000")
          ("FIXME"  . "#FF0000")
          ("DEBUG"  . "#A020F0")
          ("GOTCHA" . "#FF4500")
          ("STUB"   . "#1E90FF")))

(straight-use-package 'popper)
  (setq popper-reference-buffers
        '(xref-mode
          xref--xref-buffer-mode))
  (popper-mode +1)
  (popper-echo-mode +1)

;; Sweat Tree sitter
(straight-use-package 'tree-sitter-langs)
(straight-use-package 'tree-sitter)
    (add-hook 'tree-sitter-after-on-hook 'tree-sitter-hl-mode)
    (global-tree-sitter-mode)

;; Key Bind
(straight-use-package 'evil)
    (setq evil-search-module 'evil-search)
    (setq evil-undo-system 'undo-redo)
    (setq evil-want-keybinding nil)
    (evil-mode 1)

(straight-use-package 'evil-collection)
	(setq evil-want-integration t)
	(evil-collection-init)

(require 'keymaps)

(put 'dired-find-alternate-file 'disabled nil)

(straight-use-package 'marginalia)
    (marginalia-mode)

(straight-use-package
   '(vertico :host github :repo "minad/vertico" :branch "main"))
    (setq vertico-cycle t)
    (vertico-mode)

(straight-use-package 'consult)

;; Writing/Notes
(straight-use-package 'deft)
    (setq deft-directory "~/Documents/nextcloud/notes/"
          deft-extensions '("md" "org")
          deft-recursive t)

(straight-use-package 'markdown-mode)
    (setq markdown-command "Pandoc")

(straight-use-package 'olivetti)
    (add-hook 'markdown-mode-hook 'olivetti-mode)
    (add-hook 'org-mode-hook 'olivetti-mode)
    (add-hook 'eww-mode-hook 'olivetti-mode)

(straight-use-package '(org :type built-in))
    (setq org-ellipsis " ▾"
          org-src-fontify-natively t
          org-fontify-quote-and-verse-blocks t
          org-src-tab-acts-natively t
          org-edit-src-content-indentation 2
          org-src-preserve-indentation nil
          org-cycle-separator-lines 2)

    (setq org-agenda-files
          '("~/inbox.org"))

    (require 'org-habit)
    (add-to-list 'org-modules 'org-habit)
    (setq org-habit-graph-column 60)

    (setq org-capture-templates
        `(("t" "Tasks / Projects")
         ("c" "Task" entry (file+olp "~/inbox.org" "Inbox")
              "* TODO %?\n " :empty-lines 1)))

    (setq org-refile-targets
        '(("Archive.org" :maxlevel . 1)
          ("Tasks.org" :maxlevel . 1)))

    ;; Save Org buffers after refiling!
    (advice-add 'org-refile :after 'org-save-all-org-buffers)

(straight-use-package 'eglot)
    (setq eglot-server-programs '((c-mode . ("clangd" "--clang-tidy" "--log=verbose"))))
    (setq eglot-ignored-server-capabilities '(:hoverProvider))
    (add-hook 'c-mode-hook 'eglot-ensure)
    (add-hook 'c++-mode-hook 'eglot-ensure)

(straight-use-package
    '(vterm :host github :repo "akermu/emacs-libvterm" :branch "master"))

;; Completion w/company
(straight-use-package 'company)
    (add-hook 'after-init-hook 'global-company-mode)
    (setq company-backends '(company-files company-capf)
          company-auto-commit-chars nil
          company-minimum-prefix-length 1
          company-idle-delay 0.0
          company-auto-commit t
          company-icon-size '(auto-scale . 15))

(straight-use-package 'magit)

(straight-use-package 'company-box)
    (add-hook 'company-mode 'company-box-mode)

(straight-use-package 'restart-emacs)

(straight-use-package '(eww :type built-in))
    (setq eww-desktop-remove-duplicates t
          eww-header-line-format nil
          eww-search-prefix "https://duckduckgo.com/html/?q="
          url-cookie-delete-cookies nil
          url-cookie-confirmation nil)

(straight-use-package 'doom-modeline)
    (doom-modeline-mode 1)
    (setq doom-modeline-buffer-file-name-style 'buffer-name
          doom-modeline-major-mode-color-icon nil
          doom-modeline-minor-modes nil
          doom-modeline-lsp nil
          doom-modeline-buffer-encoding nil)

(straight-use-package '(vc :type built-in))
    (setq auto-revert-check-vc-info t)

(straight-use-package 'orderless)
    (setq completion-styles '(orderless))

(require 'custom-functions)
