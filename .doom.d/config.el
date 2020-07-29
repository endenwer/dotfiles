;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Stepan Lusnikov"
      user-mail-address "endenwer@gmail.com"
      doom-theme 'doom-one
      org-directory "~/org/"
      display-line-numbers-type t

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

(map!
 :n "C-h" 'evil-window-left
 :n "C-j" 'evil-window-down
 :n "C-k" 'evil-window-up
 :n "C-l" 'evil-window-right
 :n "C-e" 'evil-end-of-line

 (:map ivy-minibuffer-map
  "C-h" "DEL"))
