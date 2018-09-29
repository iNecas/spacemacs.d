;; -*- nameless-current-name: "inec-links" -*-

(defun inec-links/at-point (format-string)
    (format format-string (thing-at-point 'word)))

(spacemacs/declare-prefix "." "links")

(defmacro inec-links/-define-type (prefix type-name format-string)
  `(progn
     (defun ,(intern (concat "inec-links/" type-name "-follow")) ()
       (interactive)
       (browse-url (inec-links/at-point ,format-string)))
     (defun ,(intern (concat "inec-links/" type-name "-copy")) ()
       (interactive)
       (kill-new (inec-links/at-point ,format-string)))
     (spacemacs/declare-prefix ,(concat "." prefix) ,type-name)
     (spacemacs/set-leader-keys ,(concat "." prefix ".") ',(intern (concat "inec-links/" type-name "-follow")))
     (spacemacs/set-leader-keys ,(concat "." prefix "c") ',(intern (concat "inec-links/" type-name "-copy")))
     (add-to-list 'which-key-replacement-alist '((nil . ,(concat "inec-links/" type-name "-")) . (nil . "")))
     ))

(inec-links/-define-type "b" "bugzilla" "https://bugzilla.redhat.com/show_bug.cgi?id=%s")
(inec-links/-define-type "r" "redmine" "http://projects.theforeman.org/issues/%s")
(inec-links/-define-type "a" "rh-access" "https://access.redhat.com/support/cases/#/case/%s")

(provide 'inec-links)
