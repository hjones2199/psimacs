;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; This file is not a part of GNU Emacs ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; Behavior Customization ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Directory for file backups
;(setq backup-directory-alist
;      '(("." . (expand-file-name (locate-user-emacs-file "backups")))))

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;;;;; Global Modes ;;;;;;
(add-hook 'after-init-hook 'electric-pair-mode)
(add-hook 'after-init-hook 'show-paren-mode)

;;;;; Line Numbers ;;;;;
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'text-mode-hook 'display-line-numbers-mode)
(add-hook 'org-mode-hook 'display-line-numbers-mode)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 3)

(provide 'invictabehavior)
