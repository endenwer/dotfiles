;;; init-evil.el --- -*- lexical-binding: t -*-

(use-package evil
  :custom
  (evil-want-Y-yank-to-eol t)
  :config
  (evil-mode 1)
  (evil-set-undo-system 'undo-redo))

(provide 'init-evil)
