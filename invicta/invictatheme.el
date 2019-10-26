;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; This file is not a part of GNU Emacs ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; Theme Customization ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Disable emacs startup screen
(custom-set-variables
 '(inhibit-startup-screen t))


;; Disable annoying graphical modes
(blink-cursor-mode 0)
(tool-bar-mode 0)
(menu-bar-mode 0)

;; Show battery information
;(display-battery-mode 1)

(if (display-graphic-p)
    (scroll-bar-mode 0))

;; Set default font for graphical mode
(add-to-list 'default-frame-alist '(font . "Fira Code-13" ))

(provide 'invictatheme)
