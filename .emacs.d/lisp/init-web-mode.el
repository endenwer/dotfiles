;;; init-web-mode.el --- -*- lexical-binding: t -*-

(use-package web-mode
  :mode
  ("\\.tsx\\'")
  :custom
  (web-mode-markup-indent-offset 2)
  (web-mode-css-indent-offset 2)
  (web-mode-code-indent-offset 2))

(provide 'init-web-mode)
