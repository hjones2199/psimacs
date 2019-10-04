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

;; Disable annoying graphical modes
(blink-cursor-mode 0)
(scroll-bar-mode 0)
(tool-bar-mode 0)
(menu-bar-mode 0)

;; Set default font for graphical mode
(add-to-list 'default-frame-alist '(font . "Fira Code-13" ))

(provide 'invictatheme)
