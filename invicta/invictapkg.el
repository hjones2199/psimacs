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

;; Custom eshell config
(use-package psishell)

;;;;; Global packages for nearly any task ;;;;;

;; Visual/Theme packages
(use-package all-the-icons :ensure t)
(use-package doom-themes :ensure t
  :config (load-theme 'doom-vibrant t)
  (doom-themes-org-config))
(use-package doom-modeline :ensure t
  :hook (after-init . doom-modeline-mode)
  :config (setq doom-modeline-icon (display-graphic-p))
  (setq find-file-visit-truename t))
(use-package dashboard :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-banner-logo-title "Welcome to GNU Emacs")
  (setq recentf-save-file
        (expand-file-name (locate-user-emacs-file ".cache/recentf")))
  (setq dashboard-set-footer nil)
  (setq dashboard-startup-banner 'logo)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-center-content t)
  (setq dashboard-items '((projects . 5)
                        (recents  . 5)
                        (bookmarks . 5)
                        (agenda . 5))))
(use-package centaur-tabs :ensure t
  :config
    (centaur-tabs-headline-match)
  (setq centaur-tabs-set-icons t)
  :bind
  ("C-<tab>" . centaur-tabs-forward)
  ("C-c <tab>" . centaur-tabs-mode))
(use-package treemacs :ensure t
  :defer t
  :config (treemacs-git-mode 'deferred)
  (progn (setq treemacs-width 30)))
(use-package treemacs-magit :ensure t
  :after treemacs magit)
(use-package treemacs-projectile :ensure t
  :after treemacs projectile)
(use-package bar-cursor :ensure t
  :config (bar-cursor-mode t))
(use-package eshell-toggle :ensure t :defer t
  :custom
  (eshell-toggle-size-fraction 3)
  (eshell-toggle-use-projectile-root t)
  (eshell-toggle-run-command nil)
  (eshell-toggle-init-function #'eshell-toggle-init-eshell)
  :bind
  ("<f12>" . eshell-toggle))


;; Behavior packages
(use-package ivy :ensure t :diminish
  :config (ivy-mode t))
(use-package counsel :ensure t :diminish
  :config (counsel-mode t))
(use-package swiper :ensure t :diminish
  :bind ("C-s" . swiper-isearch) ("C-r" . swiper-isearch-backward))
(use-package company :ensure t :diminish
  :defer 2
  :custom
  (company-minimum-prefix-length 2)
  (company-tooltip-align-annotations 't)
  (global-company-mode t))
(use-package company-box :ensure t
  :after company
  :diminish
  :hook (company-mode . company-box-mode))
(use-package god-mode :ensure t
  :bind ("<escape>" . god-mode-all)
  :config (setq god-exempt-major-modes nil)
  (setq god-exempt-predicates nil))
(use-package tramp
  :config  (setq tramp-default-method "ssh")
  (setq tramp-persistency-file-name
        (expand-file-name
         (locate-user-emacs-file ".cache/tramp"))))

;; Org-Mode
(use-package org :ensure org-plus-contrib
  :config (setq org-hide-emphasis-markers t))

;; Projects and global tools
(use-package magit :ensure t
  :config
  (setq transient-values-file
        (expand-file-name
         (locate-user-emacs-file ".cache/projectile-cache")))
  (setq transient-history-file
        (expand-file-name
         (locate-user-emacs-file ".cache/projectile-cache"))))
(use-package projectile :ensure t
  :config
  (setq projectile-cache-file
        (expand-file-name
         (locate-user-emacs-file ".cache/projectile-cache")))
  (setq projectile-known-projects-file
        (expand-file-name
         (locate-user-emacs-file ".cache/projectile-bookmarks.eld"))))

;;;;; Development packages that load on demand ;;;;;

;; Python
(use-package anaconda-mode :ensure t
  :hook python-mode)
(use-package pyvenv :ensure t)

;; Go
(use-package go-mode :ensure t)
(use-package go-snippets :ensure t
  :after yasnippet)

;; Common Lisp
(use-package slime :ensure t :defer
  :config
  (setq inferior-lisp-program "/usr/bin/sbcl")
  (add-to-list 'slime-contribs 'slime-fancy))
(use-package slime-company :ensure t :after slime company)

;; General code completion engines
(use-package yasnippet :ensure t)
(use-package lsp-mode :ensure t
  :pin melpa-stable
  :hook (go-mode . lsp) (c-mode . lsp) (c++-mode . lsp) (java-mode . lsp)
  :commands lsp
  :config (setq lsp-clients-clangd-executable "/usr/bin/clangd-7")
  (setq lsp-session-file (expand-file-name
                          (locate-user-emacs-file ".cache/lsp-session"))))
(use-package lsp-java :ensure t :pin melpa-stable)
(use-package company-lsp :ensure t
  :commands company-lsp)
(use-package origami :ensure t
  :config (global-origami-mode)
  :bind ("C-c f" . origami-forward-toggle-node))
(use-package lsp-origami :ensure t)

;; General debug engines
(use-package dap-mode :ensure t
  :config (tooltip-mode 1) (dap-mode 1)
  (dap-ui-mode 1) (dap-tooltip-mode 1)
  (require 'dap-go) (require 'dap-gdb-lldb) (require 'dap-python)
  (setq dap-breakpoints-file
        (expand-file-name (locate-user-emacs-file ".cache/dap-breakpoints")))
  :bind ("<f5>" . dap-debug)
  ("C-c b" . dap-breakpoint-toggle)
  ("C-c n" . dap-continue))

(provide 'invictapkg)
