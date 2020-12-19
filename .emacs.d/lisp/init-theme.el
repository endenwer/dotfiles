;;; init-theme.el --- -*- lexical-binding: t -*-

(use-package zenburn-theme
  :config
  (load-theme 'zenburn t)

  ;; make vertical border invisible
  (set-face-foreground 'vertical-border (face-background 'default)))

(provide 'init-theme)
