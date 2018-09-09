;; -*- nameless-current-name: "inecas-links" -*-

(defun inecas-links/at-point (format-string)
    (format format-string (thing-at-point 'word)))

(spacemacs/declare-prefix "." "links")

(defmacro inecas-links/-define-type (prefix type-name format-string)
  `(progn
     (defun ,(intern (concat "inecas-links/" type-name "-follow")) ()
       (interactive)
       (browse-url (inecas-links/at-point ,format-string)))
     (defun ,(intern (concat "inecas-links/" type-name "-copy")) ()
       (interactive)
       (kill-new (inecas-links/at-point ,format-string)))
     (spacemacs/declare-prefix ,(concat "." prefix) ,type-name)
     (spacemacs/set-leader-keys ,(concat "." prefix ".") ',(intern (concat "inecas-links/" type-name "-follow")))
     (spacemacs/set-leader-keys ,(concat "." prefix "c") ',(intern (concat "inecas-links/" type-name "-copy")))
     (add-to-list 'which-key-replacement-alist '((nil . ,(concat "inecas-links/" type-name "-")) . (nil . "")))
     ))

(inecas-links/-define-type "b" "bugzilla" "https://bugzilla.redhat.com/show_bug.cgi?id=%s")
(inecas-links/-define-type "r" "redmine" "http://projects.theforeman.org/issues/%s")
(inecas-links/-define-type "a" "rh-access" "https://access.redhat.com/support/cases/#/case/%s")

(provide 'inecas-links)
