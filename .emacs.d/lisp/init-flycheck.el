;;; init-flycheck.el --- -*- lexical-binding: t -*-

(use-package flycheck
  :diminish
  :hook
  (prog-mode . global-flycheck-mode))


(provide 'init-flycheck)
