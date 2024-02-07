;;; init-treesitter.el --- -*- lexical-binding: t -*-

(setq treesit-extra-load-path '("/usr/local/lib"))

(require 'treesit)

(setq major-mode-remap-alist
 '((yaml-mode . yaml-ts-mode)
   (bash-mode . bash-ts-mode)
   (js2-mode . js-ts-mode)
   (typescript-mode . typescript-ts-mode)
   (json-mode . json-ts-mode)
   (css-mode . css-ts-mode)
   (python-mode . python-ts-mode)
   (ruby-mode . ruby-ts-mode)))

(provide 'init-treesitter)
