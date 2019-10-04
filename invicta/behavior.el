;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; Behavior Customization ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Directory for file backups
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;;;;; Global Modes ;;;;;;
(add-hook 'after-init-hook 'electric-pair-mode)
(add-hook 'after-init-hook 'show-paren-mode)
(add-hook 'after-init-hook 'global-company-mode)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 3)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(package-selected-packages (quote (ivy))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(menu ((t (:foreground "brightblack" :inverse-video t))))
 '(tty-menu-selected-face ((t (:background "color-208")))))

(provide 'invictabehavior)
