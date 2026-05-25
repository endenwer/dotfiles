;;; init-rust.el --- -*- lexical-binding: t -*-

(use-package rust-ts-mode
  :mode ("\\.rs\\'" . rust-ts-mode)
  :custom
  (rust-ts-mode-indent-offset 4))

(use-package lsp-mode
  :custom
  (lsp-rust-analyzer-cargo-watch-command "clippy")
  (lsp-rust-analyzer-server-display-inlay-hints t))

(defun my/project-try-cargo (dir)
  "Locate the nearest Cargo.toml above DIR for Rust buffers."
  (when (derived-mode-p 'rust-ts-mode 'rust-mode)
    (when-let ((root (locate-dominating-file dir "Cargo.toml")))
      (cons 'cargo root))))

(cl-defmethod project-root ((project (head cargo)))
  (cdr project))

(with-eval-after-load 'project
  (add-hook 'project-find-functions #'my/project-try-cargo))

(provide 'init-rust)
