;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Init file that calls the actual
;;; configuration/theming from the
;;; invicta directory.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Adds invicta config to the loadpath
(push "~/.emacs.d/invicta" load-path)
(require 'invictapkg)
(require 'invictatheme)
(require 'invictabehavior)
