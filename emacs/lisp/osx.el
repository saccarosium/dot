;;; osx.el --- Make OSX feels more at home-*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(setq mac-option-key-is-meta nil)
(setq mac-option-modifier nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)

(global-set-key (kbd "M-c") 'kill-ring-save)
(global-set-key (kbd "M-v") 'yank)

(provide 'osx)
;;; osx.el ends here
