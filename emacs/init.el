;;; -*- lexical-binding: t -*-
(setq gc-cons-threshold 100000000)
(setq file-name-handler-alist nil)

(add-hook 'emacs-startup-hook
          (lambda ()
            (message "*** Emacs loaded in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))

(setq package-user-dir (expand-file-name "elpa" user-emacs-directory)
      package-archives
      '(("gnu"   . "https://elpa.gnu.org/packages/")
        ("elpa" . "https://elpa.gnu.org/packages/")
        ("melpa-stable" . "https://stable.melpa.org/packages/")
        ("org" . "https://orgmode.org/elpa/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")))

;; Bootstrap for Straight.el
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
  (setq package-enable-at-startup nil) ; To prevent initializing twice.
  (package-initialize))

;; Use Straight with use-package syntax
(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

;; Make Tabs behave normaly
(setq-default tab-width 4)
(setq-default tab-always-indent nil)
(setq-default evil-shift-width tab-width)
(setq-default indent-tabs-mode nil)
(setq c-basic-offset 4)
(setq tabify-regexp "^\t* [ \t]+")

;;(setq-default word-wrap t)
;;(setq-default truncate-lines t)
(setq sentence-end-double-space nil)
(setq require-final-newline t)
(setq backward-delete-char-untabify-method 'nil)
(setq-default electric-indent-inhibit t)

;; OSX specific life improvments
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

;; Keep more clean
(setq create-lockfiles nil)
(setq make-backup-file nil)

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
      case-fold-search          nil)

(setq-default cursor-type 'box)

;; Configuring Font 
(dolist (face '(default fixed-pitch))
	(set-face-attribute `,face nil :font "JetBrainsMono Nerd Font 12"))

;; Colorscheme
(straight-use-package 'dracula-theme)
(load-theme 'dracula t)
(set-background-color "#191622")
(set-face-attribute 'line-number nil :italic nil :background "#191622")
(set-face-attribute 'fringe nil :background "#191622")
(set-face-attribute 'mode-line nil :background "#191622" :box nil);"#21222b" #191622


(show-paren-mode t)         ;; Show matching parenthesis.
(global-so-long-mode)       ;; Handle long lines better.
(global-font-lock-mode 1)   ;; Always highlight code.
(global-auto-revert-mode 1) ;; Refresh a buffer if changed on disk.
(setq frame-resize-pixelwise t)

(defalias 'yes-or-no-p 'y-or-n-p) ;; Accept 'y' in lieu of 'yes'.

(use-package linum-relative
	:hook (prog-mode . linum-relative-mode)
	:custom
	(linum-relative-backend 'display-line-numbers-mode)
	(linum-relative-current-symbol ""))

(use-package tree-sitter-langs)
(use-package tree-sitter
	:defer 3
	:config
	(require 'tree-sitter-langs)
	(global-tree-sitter-mode)
	(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))


(use-package evil
	:demand t
	:bind (("<escape>" . keyboard-escape-quit)
			("M-c" . evil-yank)
			("M-v" . evil-paste-after))
	:init
	;; allows for using cgn
	(setq evil-search-module 'evil-search)
	(setq evil-want-keybinding nil)
	:config
	(evil-mode 1))

;;; Vim Bindings Everywhere else
(use-package evil-collection
	:after evil
	:config
	(setq evil-want-integration t)
	(evil-collection-init))

(use-package vertico
	:straight '(vertico :host github
						:repo "minad/vertico"
						:branch "main")
	:bind (:map vertico-map
			("C-j" . vertico-next)
			("C-k" . vertico-previous)
			("C-f" . vertico-exit))
	:custom
	(vertico-cycle t)
	:custom-face
	(vertico-current ((t (:background "#3a3f5a"))))
	:init
	(vertico-mode))

(use-package orderless
    :init
	(setq completion-styles '(orderless)
			completion-category-defaults nil
			completion-category-overrides '((file (styles . (partial-completion))))))

(use-package deft
	:bind ("C-u" . deft-find-file)
	:commands (deft)
	:config (setq deft-directory "~/Documents/nextcloud/notes/"
					deft-extensions '("md" "org")))
    (setq deft-recursive t)

(straight-use-package 'markdown-mode)
(setq markdown-command "Pandoc")

(straight-use-package 'exec-path-from-shell)
(exec-path-from-shell-initialize)

(straight-use-package 'vterm)

(use-package popper
  :bind (("C-,"   . popper-toggle-latest)
         ("M-`"   . popper-cycle)
         ("C-M-`" . popper-toggle-type))
  :init
  (setq popper-reference-buffers
        '("Output\\*$"
          "\\*Async Shell Command\\*"
          "^\\*vterm.*\\*$"  vterm-mode
          compilation-mode))
  (popper-mode +1)
  (popper-echo-mode +1))          

(straight-use-package 'pdf-tools)
(straight-use-package 'olivetti)

(evil-define-key 'normal dired-mode-map "h" 'dired-up-directory)
(evil-define-key 'normal dired-mode-map "l" 'dired-find-alternate-file)
(evil-define-key 'normal dired-mode-map " " 'dired-mark)
(evil-define-key 'normal dired-mode-map "q" 'kill-this-buffer)
(put 'dired-find-alternate-file 'disabled nil)

(straight-use-package 'which-key)
    (which-key-mode)
    (setq which-key-idle-delay 0.9)

(use-package mini-modeline
    :straight '(mini-modeline :host github
    					      :repo "kiennq/emacs-mini-modeline"
    					      :branch "main")
    :config
    (mini-modeline-mode t)
    (set-face-attribute 'mode-line nil :box nil)
    (set-face-attribute 'mini-modeline-mode-line nil :background "#ee82c3" :height 0.2)
    (set-face-attribute 'mini-modeline-mode-line-inactive nil :background "#191622" :height 0.2)
    (setq mini-modeline-l-format "")
    (setq mini-modeline-r-format "%f")
    (setq mini-modeline-display-gui-line 1))
