;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; Theme Customization ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Disable emacs startup screen
(custom-set-variables
 '(inhibit-startup-screen t))

;; Loads themes from DOOM emacs
;(require 'doom-themes)
(load-theme 'doom-vibrant t)

;; powerline modebar
;(spaceline-emacs-theme)

;; Custom menu bar theme for tty
(custom-set-faces
 '(menu ((t (:foreground "brightblack" :inverse-video t))))
 '(tty-menu-selected-face ((t (:background "color-208")))))

;; Disable annoying graphical modes
(blink-cursor-mode 0)
(scroll-bar-mode 0)
(tool-bar-mode 0)
(menu-bar-mode 0)

;; Set default font for graphical mode
(add-to-list 'default-frame-alist '(font . "Fira Code-13" ))

(provide 'invictatheme)
