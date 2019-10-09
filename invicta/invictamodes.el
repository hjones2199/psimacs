;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; This file is not a part of GNU Emacs;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;; Defines custom modes ;;;;;

;(define-minor-mode inv-ide-mode
;  "A minor mode that turns on various IDE UI features."
;  :lighter " InvictaIDE"
;  (dap-ui-mode) (treemacs))

(defun invicta-ui ()
  "Toggles various UI features for an IDE-like experience"
  (interactive)
  (dap-ui-mode) (dap-ui-locals) (treemacs))

(provide 'invictamodes)
