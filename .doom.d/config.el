;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Stepan Lusnikov"
      user-mail-address "endenwer@gmail.com"
      doom-theme 'doom-zenburn
      org-directory "~/org/"
      display-line-numbers-type t
      doom-font (font-spec :family "JetBrains Mono 1.05" :size 12)

      js-indent-level 2
      typescript-indent-level 2)

(add-hook! 'web-mode-hook
  (defun web-mode-config ()
    (setq
     web-mode-markup-indent-offset 2
     web-mode-css-indent-offset 2
     web-mode-code-indent-offset 2
     web-mode-attr-indent-offset 2
     web-mode-style-padding 2
     web-mode-script-padding 2
     web-mode-block-padding 2)))

;; support ligatures on emacs-mac
(if (fboundp 'mac-auto-operator-composition-mode) (mac-auto-operator-composition-mode))

;; open emacs in fullscreen
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; don't use childframe for M-x list
(after! ivy-posframe
  (setf (alist-get 'counsel-M-x ivy-posframe-display-functions-alist)
        #'ivy-display-function-fallback))

;; speed up completion
(setq company-idle-delay 0)

(map!
 :n "C-h" 'evil-window-left
 :n "C-j" 'evil-window-down
 :n "C-k" 'evil-window-up
 :n "C-l" 'evil-window-right
 :n "C-e" 'evil-end-of-line

 (:map ivy-minibuffer-map
  "C-h" "DEL")

 (:after smartparens
  :map smartparens-mode-map
  "C-s-a" #'sp-beginning-of-sexp
  "C-s-e" #'sp-end-of-sexp
  "C-s-f" #'sp-forward-sexp
  "C-s-b" #'sp-backward-sexp
  "C-s-u" #'sp-backward-up-sexp
  "C-s-d" #'sp-splice-sexp
  "C-s-k" #'sp-kill-sexp
  "C-s-t" #'sp-transpose-sexp
  "C-s-r" #'sp-raise-sexp
  "C-)"   #'sp-forward-slurp-sexp
  "C-}"   #'sp-forward-barf-sexp
  "C-("   #'sp-backward-slurp-sexp
  "C-{"   #'sp-backward-barf-sexp))
