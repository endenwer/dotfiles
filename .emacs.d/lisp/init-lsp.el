;;; init-lsp.el --- -*- lexical-binding: t -*-

(use-package lsp-mode
  :hook
  ((web-mode . lsp-deferred)
   (typescript-mode . lsp-deferred)
   (js-mode . lsp-deferred)
   (lsp-mode . lsp-enable-which-key-integration))
  :custom
  (lsp-headerline-breadcrumb-enable nil)
  :commands
  (lsp lsp-deferred)
  :init
  (setq gc-cons-threshold 100000000)
  (setq read-process-output-max (* 1024 1024)))

(provide 'init-lsp)
