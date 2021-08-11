;;; init-projectile.el --- -*- lexical-binding: t -*-

(use-package projectile
  :diminish
  :requires ivy
  :general
  (:states 'normal
   :prefix leader-key
   "p" '(:keymap projectile-command-map :wk "projectile prefix"))
  :init
  (setq projectile-completion-system 'ivy)
  (setq projectile-project-search-path '("~/projects/"))
  :config
  (projectile-mode +1))

(provide 'init-projectile)
