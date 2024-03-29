;;; init.el --- -*- lexical-binding: t -*-

(add-to-list 'load-path (expand-file-name "lisp" (file-name-directory load-file-name)))

(require 'init-core)
(require 'init-treesitter)
(require 'init-abbrev)
(require 'init-evil)
(require 'init-smartparens)
(require 'init-keybindings)
(require 'init-avy)
(require 'init-git)
(require 'init-project)
(require 'init-flycheck)
(require 'init-yasnippet)
(require 'init-vterm)
(require 'init-restclient)
(require 'init-lsp)
(require 'init-completion)
(require 'init-combobulate)

;; langs
(require 'init-js)
(require 'init-css)
(require 'init-web-mode)
(require 'init-yaml)

(message "Emacs initialized in %s" (emacs-init-time))
