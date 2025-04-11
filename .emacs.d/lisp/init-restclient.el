;;; init-restclient.el --- -*- lexical-binding: t -*-

(use-package restclient
  :diminish
  :mode
  ("\\.http\\'")
  :config
  (use-package jq-mode)
  (restclient-mode))

(provide 'init-restclient)
