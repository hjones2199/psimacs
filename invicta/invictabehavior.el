;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; Behavior Customization ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Directory for file backups
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;;;;; Global Modes ;;;;;;
(add-hook 'after-init-hook 'electric-pair-mode)
(add-hook 'after-init-hook 'show-paren-mode)
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'after-init-hook 'ivy-mode)
(add-hook 'after-init-hook 'global-linum-mode)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 3)

(provide 'invictabehavior)
