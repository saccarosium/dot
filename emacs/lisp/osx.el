;;; osx.el --- Make OSX feels more at home-*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;;;; TITLEBAR

  ;; (setq frame-resize-pixelwise t)
  ;; (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  ;; (add-to-list 'default-frame-alist '(selected-frame) 'name nil)
  ;; (add-to-list 'default-frame-alist '(ns-appearance . dark)) ;; assuming you are using a dark theme
  ;; (setq ns-use-proxy-icon nil)
  ;; (setq frame-title-format nil)

;;;; LEADER-KEY

  (setq mac-option-key-is-meta nil)
  (setq mac-option-modifier nil)
  (setq mac-command-key-is-meta t)
  (setq mac-command-modifier 'meta)

;;;; KEYBINDS

  (global-set-key (kbd "M-c") 'kill-ring-save) ; ⌘-c = Copy
  (global-set-key (kbd "M-v") 'yank) ; ⌘-v = Paste
  (global-set-key (kbd "M-a") 'mark-whole-buffer) ; ⌘-a = Select all
  (global-set-key (kbd "M-z") 'undo) ; ⌘-z = Undo

  ;; (when (featurep 'ns)
  ;;   (defun ns-raise-emacs ()
  ;;     "Raise Emacs."
  ;;     (ns-do-applescript "tell application \"Emacs\" to activate"))

  ;;   (defun ns-raise-emacs-with-frame (frame)
  ;;     "Raise Emacs and select the provided frame."
  ;;     (with-selected-frame frame
  ;;       (when (display-graphic-p)
  ;;         (ns-raise-emacs))))

  ;;   (add-hook 'after-make-frame-functions 'ns-raise-emacs-with-frame)

  ;;   (when (display-graphic-p)
  ;;     (ns-raise-emacs)))

(provide 'osx)
;;; osx.el ends here
