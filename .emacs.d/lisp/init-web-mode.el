;;; init-web-mode.el --- -*- lexical-binding: t -*-

(use-package web-mode
  :mode
  ("\\.tsx\\'" "\\.svelte\\'")
  :custom
  (web-mode-enable-auto-quoting nil)
  (web-mode-block-padding 2)
  (web-mode-style-padding 2)
  (web-mode-script-padding 2)
  (web-mode-markup-indent-offset 2)
  (web-mode-css-indent-offset 2)
  (web-mode-code-indent-offset 2))

(use-package emmet-mode
  :hook (web-mode)
  :general
  (:keymaps 'emmet-mode-keymap
   "C-j" nil)
  :custom
  (emmet-expand-jsx-className? t))

(provide 'init-web-mode)
