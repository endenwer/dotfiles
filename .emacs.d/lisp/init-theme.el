;;; init-theme.el --- -*- lexical-binding: t -*-

(use-package zenburn-theme
  :config
  ;; (load-theme 'zenburn t)

  ;; make vertical border invisible
  ;; (set-face-foreground 'vertical-border (face-background 'default))
  )

(use-package modus-themes
  :ensure                         ; omit this to use the built-in themes
  :init
  ;; Add all your customizations prior to loading the themes
  (setq modus-themes-italic-constructs t
        modus-themes-bold-constructs t
        modus-themes-region '(bg-only no-extend)
        modus-themes-subtle-line-numbers t)

  ;; Load the theme files before enabling a theme (else you get an error).
  (modus-themes-load-themes)
  :config
  ;; Load the theme of your choice:
  (modus-themes-load-vivendi) ;; OR (modus-themes-load-vivendi)
  :bind ("<f5>" . modus-themes-toggle))

(provide 'init-theme)
