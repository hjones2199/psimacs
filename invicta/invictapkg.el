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
(use-package ivy :ensure t)
(use-package doom-themes :ensure t)
(use-package company :ensure t)
(use-package projectile :ensure t)


(provide 'invictapkg)
