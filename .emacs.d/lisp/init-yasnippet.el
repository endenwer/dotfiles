;;; init-yasnippet.el --- -*- lexical-binding: t -*-

(use-package yasnippet
  :diminish
  :after company
  :hook
  (prog-mode . yas-minor-mode)
  :general
  (:keymaps 'yas-minor-mode-map
   "C-;" 'yas-expand)
  :config
  (yas-reload-all))

(use-package yasnippet-snippets
  :diminish
  :after yasnippet)

(provide 'init-yasnippet)
