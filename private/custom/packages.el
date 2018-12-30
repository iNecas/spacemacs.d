;;; packages.el --- custom layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author: Ivan Necas <necasik@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Code:

;; Layer for overriding some packages with local copies
;;
;; This layer allows using a local copy of some package instead of an ELPA
;; package. It's useful when hacking some changes on an existing package that
;; one wants to use before the changes are accepted upstream.
;;

(defconst custom-packages
  '(
    ;; (package-to-override :location local)
    )
  )

 ;; (defun custom/package-to-override ()
 ;;   "Use the initialization of the original layer"
 ;;   (original-layer/package-to-override)
 ;;  )

;;; packages.el ends here
