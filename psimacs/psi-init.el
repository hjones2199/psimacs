;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; This file is not a part of GNU Emacs ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Calls the Psimacs setup files ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Fixes ELPA handshake bug in Emacs 26
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;; Straight package manager initialization
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

;; Keeps packages up to date, prompts user to update weekly
(use-package auto-package-update :straight t
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-prompt-before-update t)
  (setq auto-package-update-last-update-day-path
        (expand-file-name
         (locate-user-emacs-file ".cache/last-package-update-day")))
  (auto-package-update-maybe))

;; Org-Mode
(use-package org
  :config (setq org-hide-emphasis-markers t))

;; Projects and global tools

(require 'psi-modes)

(provide 'psi-init)
