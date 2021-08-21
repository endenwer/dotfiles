;;; init-restclient.el --- -*- lexical-binding: t -*-

(use-package restclient
  :diminish
  :mode
  ("\\.http\\'")
  :config
  (restclient-mode))

(provide 'init-restclient)
