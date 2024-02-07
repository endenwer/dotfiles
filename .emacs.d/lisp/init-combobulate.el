;;; init-combobulate.el --- -*- lexical-binding: t -*-

(use-package combobulate
  :straight (:host github :repo "mickeynp/combobulate" :files ("build" "*.el"))

  :custom
  (combobulate-key-prefix "C-c o")

  :hook ((python-ts-mode . combobulate-mode)
         (js-ts-mode . combobulate-mode)
         (css-ts-mode . combobulate-mode)
         (yaml-ts-mode . combobulate-mode)
         (json-ts-mode . combobulate-mode)
         (typescript-ts-mode . combobulate-mode)
         (tsx-ts-mode . combobulate-mode)))

(provide 'init-combobulate)
