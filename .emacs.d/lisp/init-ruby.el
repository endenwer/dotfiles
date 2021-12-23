;;; init-ruby.el --- -*- lexical-binding: t -*-

(use-package inf-ruby
  :hook
  (ruby-mode . inf-ruby-minor-mode))

(use-package robe
  :straight (robe :type git :host github :repo "dgutov/robe")
  :hook
  (ruby-mode . robe-mode)
  :config
  (push 'company-robe company-backends))

(provide 'init-ruby)
