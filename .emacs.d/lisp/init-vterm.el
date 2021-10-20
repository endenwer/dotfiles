;;; init-vterm.el --- -*- lexical-binding: t -*-

(use-package vterm
  :after projectile
  :general
  (:keymaps 'vterm-mode-map
   "C-l" nil
   "C-k" nil
   "C-j" nil))

(provide 'init-vterm)
