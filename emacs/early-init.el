;;; early-init.el --- Emacs 27+ pre-initialisation config

;;; Commentary:

;; Emacs 27+ loads this file before (normally) calling
;; `package-initialize'.  We use this file to suppress that automatic
;; behaviour so that startup is consistent across Emacs versions.

;;; Code:

;;; ADDING CUSTOM LISP LIBRARIES

  (add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
  (require 'custom-functions)

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

  (setq warning-suppress-log-types '((use-package)))

  ;; So we can detect this having been loaded
  (provide 'early-init)

;;; early-init.el ends here
