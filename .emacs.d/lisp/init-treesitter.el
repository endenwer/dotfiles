;;; init-treesitter.el --- -*- lexical-binding: t -*-

(use-package tree-sitter
  :diminish
  :config
  (use-package tree-sitter-langs)
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

(provide 'init-treesitter)
