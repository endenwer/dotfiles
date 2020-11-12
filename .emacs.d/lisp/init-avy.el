;;; init-avy.el --- -*- lexical-binding: t -*-

(use-package avy
  :diminish
  :demand t
  :general
  (:states 'normal
   "s" 'avy-goto-char-2))

(provide 'init-avy)
