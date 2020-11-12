;;; init-company.el --- -*- lexical-binding: t -*-

(use-package company
  :diminish
  :hook
  (prog-mode . global-company-mode)
  :general
  (:keymaps 'company-active-map
   "C-j" 'company-select-next
   "C-k" 'company-select-previous
   "C-l" 'company-complete-selection))

(provide 'init-company)
