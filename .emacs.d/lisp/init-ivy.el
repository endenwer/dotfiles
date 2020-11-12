;;; init-ivy.el --- -*- lexical-binding: t -*-

(use-package ivy
  :demand t
  :diminish
  :general
  ("C-c C-r" 'ivy-resume)
  (:keymaps 'ivy-minibuffer-map
   "ESC" 'minibuffer-keyboard-quit
   "C-l" 'ivy-alt-done
   "C-j" 'ivy-next-line
   "C-k" 'ivy-previous-line
   "C-h" 'ivy-backward-kill-word)
  :config
  (ivy-mode 1))

(use-package counsel
  :general
  ("M-x" 'counsel-M-x)
  (:states 'normal
   :prefix leader-key
   "/" 'counsel-rg
   "bb" 'counsel-ibuffer
   "ff" 'counsel-find-file))

(use-package swiper
  :general
  (:keymaps 'swiper-map
   "ESC" 'minibuffer-keyboard-quit)
  (:states 'normal
   :prefix leader-key
    "ss" 'swiper))

(provide 'init-ivy)
