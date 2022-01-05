;;; custom-functions.el --- Random functions that don't belong in any specific file -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;;;###autoload
(defun ls/open-config ()
  (interactive)
  (find-file "~/.config/emacs/init.el"))

;;;###autoload
(defun ls/open-budget ()
  (interactive)
  (find-file "~/Documents/finaces/2021-2022.dat"))

(provide 'custom-functions)
;;; custom-functions.el ends here

