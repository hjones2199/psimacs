;;; Init --- Initialization file that loads psimacs
;;; Commentary:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Init file that calls the actual configuration/theming from the
;;; psimacs directory.  Conditionally either loads psimacs.elc or
;;; retangles psimacs.org and byte compiles it into psimacs.elc.
;;; This file is not a part of GNU Emacs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;; Loads user-specific elisp that is not tracked in psimacs' git repo
(let ((custom-elisp-file (expand-file-name (concat user-emacs-directory "custom-elisp.el"))))
  (if (file-exists-p custom-elisp-file)
      (load custom-elisp-file)
    nil))

(provide 'init)
;;; init.el ends here
