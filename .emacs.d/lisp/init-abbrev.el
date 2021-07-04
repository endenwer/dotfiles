;;; init-abbrev.el --- -*- lexical-binding: t -*-

(setq abbrev-file-name "~/.emacs.d/abbrev_defs")
(add-hook 'prog-mode-hook #'abbrev-mode)

(provide 'init-abbrev)
