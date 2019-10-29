;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; This file is not a part of GNU Emacs ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; Theme Customization ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Disable emacs startup screen
(custom-set-variables
 '(inhibit-startup-screen t))

;; Custom Eshell theme
(setq eshell-prompt-regexp "^[^#$λ\n]*[#$λ] " eshell-prompt-function
      (lambda nil
        (concat
         (propertize (eshell/pwd) 'face `(:foreground "#51afef"))
         (propertize " λ" 'face `(:foreground "#c065db"))
         (propertize " " 'face `(:foreground "white")))))

;; Disable annoying graphical modes
(blink-cursor-mode 0)
(tool-bar-mode 0)
(menu-bar-mode 0)

(if (display-graphic-p)
    (scroll-bar-mode 0))

(global-set-key (kbd "C-c <f12>") 'display-battery-mode)

;; Set default font for graphical mode
(add-to-list 'default-frame-alist '(font . "Fira Code-13" ))

(provide 'invictatheme)
