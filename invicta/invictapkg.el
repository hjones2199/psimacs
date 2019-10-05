;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; Package Management ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(package-initialize)
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/"))

(unless (require 'use-package nil 'noerror)
  (package-refresh-contents)
  (package-initialize)
  (package-install 'use-package)
  (require 'use-package))

(use-package magit :ensure t)
(use-package diminish :ensure t)
(use-package ivy :ensure t :diminish ivy-mode)
(use-package company :ensure t :diminish company-mode)
(use-package all-the-icons :ensure t)
(use-package doom-themes :ensure t)
(use-package doom-modeline :ensure t)
(use-package projectile :ensure t)
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

(provide 'invictapkg)
