;;;;; Package Management ;;;;;

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/")) ; Stable channel
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (atom-one-dark)))
 '(custom-safe-themes
   (quote
    ("59171e7f5270c0f8c28721bb96ae56d35f38a0d86da35eab4001aebbd99271a8" default)))
 '(inhibit-startup-screen t)
 '(minimap-width-fraction 0.05)
 '(package-selected-packages
   (quote
    (minimap elpy yasnippet company magit markdown-mode atom-one-dark-theme spaceline))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(menu ((t (:foreground "brightblack" :inverse-video t))))
 '(tty-menu-selected-face ((t (:background "color-208")))))


;;;;; UI Customizations ;;;;;

;; powerline modebar
(require 'spaceline-config)
(spaceline-emacs-theme)

;; Different background colors in terminal and graphical
(if (display-graphic-p)
    ()
  (add-to-list 'default-frame-alist '(background-color . "black"))
  )

(blink-cursor-mode 0) ; Disable blinking cursor
(scroll-bar-mode 0) ; Disable scrollbar in graphical mode

;;;;; Behavior customizations ;;;;;

;; Directory for file backups
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))

;; Python customizations
(setq py-python-command "python3")
(elpy-enable)
(add-hook 'elpy-mode-hook (lambda () (pyvenv-activate "~/.local/share/venvs/dev")))
(add-hook 'elpy-mode-hook (lambda () (highlight-indentation-mode -1)))

;;; Global Modes
(add-hook 'after-init-hook 'electric-pair-mode)
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'after-init-hook 'yas-global-mode)
(add-hook 'after-init-hook 'show-paren-mode)
