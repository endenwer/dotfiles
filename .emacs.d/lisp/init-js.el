;;; init-js.el --- -*- lexical-binding: t -*-

(setq js-indent-level 2)

(use-package typescript-mode
  :mode
  ("\\.ts\\'")
  :custom
  (typescript-indent-level 2))

(provide 'init-js)
