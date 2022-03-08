;;; early-init.el --- Emacs 27+ pre-initialisation config

;;; Commentary:

;; Emacs 27+ loads this file before (normally) calling
;; `package-initialize'.  We use this file to suppress that automatic
;; behaviour so that startup is consistent across Emacs versions.

;;; Code:

;;; ADDING CUSTOM LISP LIBRARIES

  (add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
  (require 'custom-functions)

  (defalias 'yes-or-no-p 'y-or-n-p) ;; Accept 'y' in lieu of 'yes'.

  (setq warning-suppress-log-types '((use-package)))

  ;; So we can detect this having been loaded
  (provide 'early-init)

;;; early-init.el ends here
