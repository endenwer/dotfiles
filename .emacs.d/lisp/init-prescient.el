;;; init-prescient.el --- -*- lexical-binding: t -*-

(use-package prescient
  :diminish
  :after ivy)

(use-package ivy-prescient
  :diminish
  :after prescient
  :config
  (ivy-prescient-mode))

(provide 'init-prescient)
