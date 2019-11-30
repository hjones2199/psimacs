;;; package --- Summary
;;; Commentary:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Init file that calls the actual
;;; configuration/theming from the
;;; psimacs directory.
;;; This file is not a part of GNU Emacs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Code:
;; Adds psimacs config to the loadpath
(push (expand-file-name (locate-user-emacs-file "psimacs")) load-path)
(require 'psi-init)

;; Loads the psimacs configuration, tangling and compiling the
;; file if it does not exist.
(let ((psimacs-file (expand-file-name (concat user-emacs-directory "psimacs.elc"))))
  (if (file-exists-p psimacs-file)
      (load psimacs-file)
    (org-babel-load-file (expand-file-name (concat user-emacs-directory "psimacs.org")) t)))

(provide 'init)
;;; init.el ends here
