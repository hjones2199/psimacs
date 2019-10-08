;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; This file is not a part of GNU Emacs;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; Package Management ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Fixes ELPA handshake bug in Emacs 26
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(package-initialize)
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/"))

(unless (require 'use-package nil 'noerror)
  (package-refresh-contents)
  (package-initialize)
  (package-install 'use-package)
  (require 'use-package))

;;;;; Global packages for nearly any task ;;;;;

;; Visual/Theme packages
(use-package all-the-icons :ensure t)
(use-package doom-themes :ensure t
  :config (load-theme 'doom-vibrant t))
(use-package doom-modeline :ensure t
  :hook (after-init . doom-modeline-mode))
(use-package dashboard :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-set-footer nil)
  (setq dashboard-startup-banner 'logo)
  (setq dashboard-banner-logo-title "Welcome to GNU Emacs"))
(use-package centaur-tabs :ensure t
  :config
    (centaur-tabs-headline-match)
  (setq centaur-tabs-set-icons t)
  :bind
  ("C-<tab>" . centaur-tabs-forward)
  ("C-c <tab>" . centaur-tabs-mode))
(use-package treemacs :ensure t
  :defer t
  :config (treemacs-git-mode 'deferred))
(use-package treemacs-magit :ensure t
  :after treemacs magit)
(use-package treemacs-projectile :ensure t
  :after treemacs projectile)

;; Behavior packages
(use-package ivy :ensure t :diminish
  :config (ivy-mode t))
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

;; Projects and global tools
(use-package magit :ensure t)
(use-package projectile :ensure t)

;;;;; Development packages that load on demand ;;;;;

;; Python
(use-package anaconda-mode :ensure t
  :hook python-mode)
(use-package company-anaconda :ensure t
  :after (anaconda-mode company)
  :config (add-to-list 'company-backends 'company-anaconda))

;; Go
(use-package go-mode :ensure t)

;; General code completion engines
(use-package yasnippet :ensure t)
(use-package lsp-mode :ensure t
  :hook (go-mode . lsp) (c-mode . lsp) (c++-mode . lsp)
  :commands lsp
  :config (setq lsp-clients-clangd-executable "/usr/bin/clangd-7"))
(use-package company-lsp :ensure t
  :commands company-lsp)

;; General debug engines
(use-package dap-mode :ensure t
  :config (tooltip-mode 1) (dap-mode 1)
  (dap-ui-mode 1) (dap-tooltip-mode 1)
  (require 'dap-go) (require 'dap-gdb-lldb)
  :bind ("<f5>" . dap-debug)
  ("C-c b" . dap-breakpoint-toggle)
  ("C-c n" . dap-continue))

(provide 'invictapkg)
