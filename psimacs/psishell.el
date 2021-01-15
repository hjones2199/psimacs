;; -*- lexical-binding:t -*-
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; This file is not a part of GNU Emacs ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; Eshell customization ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun pretty-path (path)
  "Converts $HOME to ~ in a pathname"
  (replace-regexp-in-string
   (concat "^" (getenv "HOME"))
   "~" path))

;; Custom command line prompt for eshell
(defun psiprompt-initialize ()
  "Configures the eshell prompt"
  (setq eshell-prompt-regexp "^[^#$ψλ\n]*[#$ψλ] " eshell-prompt-function
        (lambda nil
          (concat
           (propertize (or (concat (eshell/whoami)) "")
                       'face `(:foreground "#6da96a" :weight bold))
           (propertize " " `face `(:foreground "white"))
           (propertize (pretty-path (eshell/pwd))
                       'face `(:foreground "#51afef" :weight bold))
           (if (string= (eshell/whoami) "root")
               (propertize " Ψ" 'face `(:foreground "#e18419" :weight bold))
             (propertize " λ" 'face `(:foreground "#c065db" :weight bold)))
           (propertize " " 'face `(:foreground "white"))))))


(defun eshell/open (arg1 &optional arg2)
  "Opens a file in a new emacs buffer"
  (if (string= arg1 "-f") ; Opens in another frame
      (find-file-other-frame arg2)
    (if (string= arg1 "-h") ; Opens in place of the shell
        (find-file arg2)
      (if (string= arg1 "-d") ; Opens buffer in background
          (find-file-noselect arg2)
        (find-file-other-window arg1)))))


(defun eshell/rip (reg &rest files)
  (rg reg "all" (car files))
  (other-window 1))


(defun setup-eshell-ivy-completion ()
  (define-key eshell-mode-map [remap eshell-pcomplete] 'completion-at-point)
  ;; only if you want to use the minibuffer for completions instead of the
  ;; in-buffer interface
  (setq-local ivy-display-functions-alist
              (remq (assoc 'ivy-completion-in-region ivy-display-functions-alist)
                    ivy-display-functions-alist)))


(provide 'psishell)
