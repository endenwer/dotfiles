;;; init-git.el --- -*- lexical-binding: t -*-

(use-package magit
  :general
  (:states 'normal
   :prefix leader-key
   "gg" 'magit-status
   "gb" 'magit-blame-addition)
  :custom
  (split-width-threshold 200)
  (split-height-threshold 120))

(provide 'init-git)
