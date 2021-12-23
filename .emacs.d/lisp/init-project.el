;;; init-project.el --- -*- lexical-binding: t -*-

(use-package projectile
  :diminish
  :general
  (:states 'normal
   :prefix leader-key
   "p" '(:keymap project-prefix-map :wk "Project prefix")))

(provide 'init-project)
