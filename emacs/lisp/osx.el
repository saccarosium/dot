;;; osx.el --- Make OSX feels more at home-*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


;; Make PATH on OSX work correctly
(straight-use-package 'exec-path-from-shell)
(exec-path-from-shell-initialize)
;;; Pull in other enviroment variables
(exec-path-from-shell-copy-envs '("XDG_CONFIG_HOME" "XDG_DATA_HOME" "XDG_CACHE_HOME"))

(setq mac-option-key-is-meta nil)
(setq mac-option-modifier nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)

(provide 'osx)
;;; osx.el ends here
