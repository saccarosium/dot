;;; keymaps.el --- Defines keyboard keybinds -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Disabling defaults keybinds
(global-set-key (kbd "C-q") nil)
(global-set-key (kbd "C-j") nil)
(global-set-key (kbd "C-k") nil)
(global-set-key (kbd "C-x ESC") nil)
;;(global-set-key (kbd "C-x RET") nil)
(global-set-key (kbd "C-x TAB") nil)
(global-set-key (kbd "C-x C-<left>") nil)
(global-set-key (kbd "C-x C-<right>") nil)
(global-set-key (kbd "C-x <left>") nil)
(global-set-key (kbd "C-x <right>") nil)
(global-set-key (kbd "M-,") nil)
(global-set-key (kbd "M-h") nil)
(global-set-key (kbd "M-j") nil)
(global-set-key (kbd "M-k") nil)
(global-set-key (kbd "M-l") nil)
(global-set-key (kbd "M-;") nil)

;; Popper
(global-set-key (kbd "C-,") 'popper-toggle-latest)
(global-set-key (kbd "M-,") 'popper-cycle)
(global-set-key (kbd "C-M-,") 'popper-toggle-type)

(global-set-key (kbd "C-x b") 'consult-buffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(define-key evil-normal-state-map (kbd "C-w f") 'find-file-other-window)

;; Lsp
(define-key prog-mode-map (kbd "C-c r") 'eglot-rename)
(define-key evil-normal-state-map (kbd "g d") 'eglot-find-declaration)
(define-key evil-normal-state-map (kbd "g r") 'xref-find-references)

(define-key evil-normal-state-map (kbd "SPC f n") #'deft-find-file)
(define-key evil-normal-state-map (kbd "SPC f e") #'ls/open-config)

;; Project.el
(define-key evil-normal-state-map (kbd "SPC p f") #'project-find-file)
(define-key evil-normal-state-map (kbd "SPC p s") #'project-switch-project)
(define-key evil-normal-state-map (kbd "SPC p b") #'project-switch-to-buffer)

(evil-define-key 'insert vterm-mode-map (kbd "C-w k") #'evil-window-up)
(evil-define-key 'insert vterm-mode-map (kbd "C-w j") #'evil-window-down)
(evil-define-key 'insert vterm-mode-map (kbd "C-w h") #'evil-window-left)
(evil-define-key 'insert vterm-mode-map (kbd "C-w l") #'evil-window-right)

(global-set-key (kbd "M-c") 'kill-ring-save)
(global-set-key (kbd "M-v") 'yank)
(global-set-key (kbd "C-c t") 'vterm-other-window)
(define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
(define-key evil-insert-state-map (kbd "<escape>") 'evil-normal-state)

;;Dired
(evil-define-key 'normal dired-mode-map "h" 'dired-up-directory)
(evil-define-key 'normal dired-mode-map "l" 'dired-find-alternate-file)
(evil-define-key 'normal dired-mode-map " " 'dired-mark)
(evil-define-key 'normal dired-mode-map "q" 'kill-this-buffer)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "C-x ?") 'eww)

(provide 'keymaps)
;;; keymaps.el ends here
