;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; This file is not a part of GNU Emacs ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; Package Management ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Fixes ELPA handshake bug in Emacs 26
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(package-initialize)
(require 'package)

(setq package-archives
      '(("elpa" . "http://elpa.gnu.org/packages/")
        ("melpa-stable" . "http://stable.melpa.org/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ("org" . "http://orgmode.org/elpa/"))
      package-archive-priorities
      '(("melpa-stable" . 5)
        ("elpa"     . 0)
        ("melpa"        . 10)
        ("org" . 8)))

(unless (require 'use-package nil 'noerror)
  (package-refresh-contents)
  (package-initialize)
  (package-install 'use-package)
  (require 'use-package))

;; Keeps packages up to date, prompts user to update weekly
(use-package auto-package-update :ensure t
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-prompt-before-update t)
  (setq auto-package-update-last-update-day-path
        (expand-file-name
         (locate-user-emacs-file ".cache/last-package-update-day")))
  (auto-package-update-maybe))

;; Org-Mode
(use-package org :ensure org-plus-contrib
  :config (setq org-hide-emphasis-markers t))

;; Projects and global tools

(provide 'invictapkg)
