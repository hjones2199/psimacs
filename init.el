;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Init file that calls the actual
;;; configuration/theming from the
;;; psimacs directory.
;;; This file is not a part of GNU Emacs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Adds psimacs config to the loadpath
(push (expand-file-name (locate-user-emacs-file "psimacs")) load-path)
(require 'psi-init)

;; Loads the psimacs configuration, tangling and compiling the
;; file if it does not exist.
(let ((psimacs-file (expand-file-name (concat user-emacs-directory "psimacs.elc"))))
  (if (file-exists-p psimacs-file)
      (load psimacs-file)
    (org-babel-load-file (expand-file-name (concat user-emacs-directory "psimacs.org")) t)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(centaur-tabs-unselected ((t (:background "#2a2e38" :foreground "dim gray"))))
 '(menu ((t (:foreground "brightblack" :inverse-video t))))
 '(swiper-line-face ((t (:background "dim gray" :foreground "#1c1f24"))))
 '(tty-menu-selected-face ((t (:background "color-208")))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (lsp-ui use-package treemacs-projectile treemacs-magit slime-company pyvenv org-plus-contrib org-bullets lsp-origami lsp-java god-mode go-snippets go-mode eshell-toggle doom-themes doom-modeline dashboard dap-mode counsel company-lsp company-box centaur-tabs bar-cursor auto-package-update anaconda-mode))))
