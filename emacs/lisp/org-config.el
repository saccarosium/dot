;;; org-config.el --- org-mode setup-*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;;;; Aestetic
    (setq org-ellipsis " ▾")
    (setq org-hide-emphasis-markers t)
    (setq org-src-fontify-natively t)
    (setq org-fontify-quote-and-verse-blocks t)
    (setq org-src-tab-acts-natively t)
    (setq org-edit-src-content-indentation 2)
    (setq org-src-preserve-indentation nil)
    (setq org-cycle-separator-lines 2)

;;;; Todolist
    (setq org-use-fast-todo-selection 'expert)
    (setq org-read-date-prefer-future 'time)
    (setq org-startup-folded 'content)
    (setq org-todo-keywords
            '((sequence "TODO(t)" "WAIT(w)" "PROJECT(p)" "|" "DONE(d)")))
    (setq org-agenda-files
        '("~/Documents/nextcloud/todolist/todolist.org"))
    (setq org-capture-templates
        `(("t" "Task" entry (file+olp "~/Documents/nextcloud/todolist/todolist.org" "Inbox")
                "* TODO %?\n")))
    (setq org-refile-targets
        '(("archive.org" :maxlevel . 1)))

;;;; Utility 
  (advice-add 'org-refile :after 'org-save-all-org-buffers)

(provide 'org-config)
;;; org-config.el ends here
