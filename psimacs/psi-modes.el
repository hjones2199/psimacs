;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; This file is not a part of GNU Emacs ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;; Defines custom modes ;;;;;

(defun psi-ui ()
  "Toggles various UI features for an IDE-like experience"
  (interactive)
  (dap-ui-mode) (dap-ui-locals) (treemacs))

;;;;; Oz integration from within emacs itself ;;;;;
(defun mozart-activate ()
  "Turns on the Oz programming engine"
  (interactive)
  (setenv "OZHOME" "/usr")
  (push "/usr/share/mozart/elisp/" load-path)
  (require 'oz)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((oz . t))))


(provide 'psi-modes)
