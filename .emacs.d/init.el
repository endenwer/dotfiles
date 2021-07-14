;;; init.el --- -*- lexical-binding: t -*-

(add-to-list 'load-path (expand-file-name "lisp" (file-name-directory load-file-name)))

(require 'init-core)
(require 'init-abbrev)
(require 'init-theme)
(require 'init-evil)
(require 'init-smartparens)
(require 'init-keybindings)
(require 'init-avy)
(require 'init-ivy)
(require 'init-prescient)
(require 'init-git)
(require 'init-projectile)
(require 'init-flycheck)
(require 'init-company)
(require 'init-lsp)
(require 'init-yasnippet)
(require 'init-treesitter)
(require 'init-vterm)

;; langs
(require 'init-js)
(require 'init-css)
(require 'init-web-mode)
(require 'init-yaml)

(message "Emacs initialized in %s" (emacs-init-time))
