;;; init-evil.el --- -*- lexical-binding: t -*-

(use-package evil
  :custom
  (evil-symbol-word-search t)
  (evil-want-Y-yank-to-eol t)
  (evil-want-keybinding nil)
  :config
  (evil-mode 1)
  (evil-set-undo-system 'undo-redo))

(use-package evil-collection
  :custom
  (evil-collection-mode-l)
  (evil-collection-want-unimpaired-p nil)

  :config
  (evil-collection-init))

(use-package evil-surround
  :config
  (global-evil-surround-mode 1))

(use-package evil-org
  :after org
  :hook (org-mode . evil-org-mode)
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(provide 'init-evil)
