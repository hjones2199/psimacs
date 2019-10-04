;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; Theme Customization ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Disable emacs startup screen
(custom-set-variables
 '(inhibit-startup-screen t))

;; Loads themes from DOOM emacs
(load-theme 'doom-vibrant t)
;; Doom modeline
(doom-modeline-mode 1)

;; Disable annoying graphical modes
(blink-cursor-mode 0)
(tool-bar-mode 0)
(menu-bar-mode 0)

(if (display-graphic-p)
    (scroll-bar-mode 0))

;; Set default font for graphical mode
(add-to-list 'default-frame-alist '(font . "Fira Code-13" ))

(provide 'invictatheme)
