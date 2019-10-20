;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Init file that calls the actual
;;; configuration/theming from the
;;; invicta directory.
;;; This file is not a part of GNU Emacs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Adds invicta config to the loadpath
(push "~/.emacs.d/invicta" load-path)
(require 'invictainit)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(menu ((t (:foreground "brightblack" :inverse-video t))))
 '(swiper-line-face ((t (:background "dim gray" :foreground "#1c1f24"))))
 '(tty-menu-selected-face ((t (:background "color-208")))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-minimum-prefix-length 2)
 '(company-tooltip-align-annotations t)
 '(custom-safe-themes
   (quote
    ("423435c7b0e6c0942f16519fa9e17793da940184a50201a4d932eafe4c94c92d" default)))
 '(global-company-mode t)
 '(inhibit-startup-screen t)
 '(package-selected-packages (quote (ivy))))
