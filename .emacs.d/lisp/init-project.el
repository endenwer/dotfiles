;;; init-project.el --- -*- lexical-binding: t -*-

(use-package project
  :diminish
  :general
  (:states 'normal
   :prefix leader-key
   "p" '(:keymap project-prefix-map :wk "Project prefix"))
  :custom
  (project-switch-commands 'project-find-file))

(provide 'init-project)
