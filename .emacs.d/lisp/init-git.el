;;; init-git.el --- -*- lexical-binding: t -*-

(use-package magit
  :general
  (:states 'normal
   :prefix leader-key
   "gg" 'magit-status
   "gb" 'magit-blame-addition))


(provide 'init-git)
