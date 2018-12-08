;; -*- nameless-current-name: "inec-frame" -*-
;; Using frames throught key-bindings

(defun inec-frame/find-subproject ()
  (interactive)
  (ido-find-file-in-dir "~/Projects/ws/foreman-tasks"))

(defun inec-frame/new-custom (name)
  (interactive "sProject name: ")
  (if (inec-frame/-open-my-project name)
      (progn
        (helm-projectile-switch-project)
        (delete-other-windows))))


(defun inec-frame/-open-my-project (project-name)
  (condition-case nil
      (progn
        (select-frame-by-name project-name)
        nil)
    (error
     (let ((new-frame (make-frame)))
       (modify-frame-parameters new-frame (list (cons 'name project-name)))
       (select-frame-set-input-focus new-frame)
       t))))

(defmacro inec-frame/-define-project (char name dir-or-file &optional file)
  "map char to project name with dir-or-file"
  (let ((project-fun (intern (concat "inec-frame/project-" name))))
   `(progn
      (defun ,project-fun ()
        (interactive)
        (if (inec-frame/-open-my-project ,name)
            (progn
              (if ,file
                  (find-file ,dir-or-file)
                (magit-status ,dir-or-file))
              (delete-other-windows)
              )
          ;  (projectile-switch-project-by-name ,dir-or-file t)
          ))
      (spacemacs/set-leader-keys (concat "P" ,char) ',project-fun)
      )))

(spacemacs/declare-prefix "P" "inec-project")
(spacemacs/set-leader-keys "P'" 'inec-frame/new-custom)
(inec-frame/-define-project "a" "apipie" "~/Projects/ws/apipie/apipie-rails")
(inec-frame/-define-project "d" "dynflow" "~/Projects/ws/foreman-rex/dynflow")
(inec-frame/-define-project "f" "foreman" "~/Projects/ws/foreman-rex/foreman-rails5")
(inec-frame/-define-project "t" "foreman-tasks" "~/Projects/ws/foreman-rex/foreman-tasks")
(inec-frame/-define-project "k" "katello" "~/Projects/ws/devel/katello")
(inec-frame/-define-project "F" "forklift" "~/Projects/ws/infra/forklift")
(inec-frame/-define-project "e" "emacs" "~/.spacemacs.d")
(inec-frame/-define-project "s" "school" "~/Projects/ws/school/2018")
(inec-frame/-define-project "o" "org" "~/Documents/org/todo_work.org" t)
(inec-frame/-define-project "g" "go" "~/Projects/ws/go" t)
(inec-frame/-define-project "m" "foreman-maintain" "~/Projects/ws/foreman-maintain/foreman_maintain" t)


(provide 'inec-frame)
