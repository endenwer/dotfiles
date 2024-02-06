;;; init-lsp.el --- -*- lexical-binding: t -*-

(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024))

(use-package markdown-mode)

(use-package lsp-bridge
  :straight '(lsp-bridge :type git :host github :repo "manateelazycat/lsp-bridge"
            :files (:defaults "*.el" "*.py" "acm" "core" "langserver" "multiserver" "resources")
            :build (:not compile))
  :init
  (global-lsp-bridge-mode)
  :config
  (evil-define-key 'insert acm-mode-map (kbd "C-j") #'acm-select-next)
  (evil-define-key 'insert acm-mode-map (kbd "C-k") #'acm-select-prev)
  (evil-define-key 'insert acm-mode-map (kbd "C-k") #'acm-complete)
  (add-hook 'acm-mode-hook #'evil-normalize-keymaps))

(provide 'init-lsp)
