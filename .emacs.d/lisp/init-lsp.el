;;; init-lsp.el --- -*- lexical-binding: t -*-

(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024))

(use-package lsp-mode
  :hook
  ((web-mode . lsp-deferred)
   (typescript-ts-mode . lsp-deferred)
   (js-ts-mode . lsp-deferred)
   (ruby-ts-mode . lsp-deferred)
   (lsp-mode . lsp-enable-which-key-integration))
  :custom
  (lsp-headerline-breadcrumb-enable nil)
  :commands
  (lsp lsp-deferred)
  :config
  (add-to-list 'lsp-language-id-configuration '(".*\\.svelte$" . "svelte")))

(provide 'init-lsp)
