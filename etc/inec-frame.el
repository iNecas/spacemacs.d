;; -*- nameless-current-name: "inec-frame" -*-
;; Using frames throught key-bindings

(defun inec-frame/find-subproject ()
  (interactive)
  (ido-find-file-in-dir "~/Projects/ws/foreman-tasks"))

(defun inec-frame/new-custom (name)
  (interactive "sProject name: ")
  (if (inec-frame-open-my-project name)
     (helm-projectile-switch-project)))

(defun inec-frame/open-my-project (project-name)
  (interactive)
  (condition-case nil
      (progn
        (select-frame-by-name project-name)
        nil)
    (error
     (let ((new-frame (make-frame)))
       (modify-frame-parameters new-frame (list (cons 'name project-name)))
       (select-frame-set-input-focus new-frame)
       t))))

(defmacro inec-frame/-define-project (char name dir)
  "map char to project name with dir"
  (let ((project-fun (intern (concat "inec-frame/project-" name))))
   `(progn
      (defun ,project-fun ()
        (interactive)
        (if (inec-frame/open-my-project ,name)
            (projectile-switch-project-by-name ,dir t)
          ))
      (spacemacs/set-leader-keys (concat "P" ,char) ',project-fun)
      )))

(spacemacs/declare-prefix "P" "inec-project")
(inec-frame/-define-project "d" "dynflow" "~/Projects/ws/foreman-rex/dynflow")
(inec-frame/-define-project "f" "foreman" "~/Projects/ws/foreman-rex/foreman-rails5")


(provide 'inec-frame)
