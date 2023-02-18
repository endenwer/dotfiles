;;; init-vterm.el --- -*- lexical-binding: t -*-

(use-package vterm
  :after project
  :general
  (:keymaps 'vterm-mode-map
   "C-l" nil
   "C-k" nil
   "C-j" nil)
  (:keymaps 'project-prefix-map
   "t" 'project-vterm)
  :preface
  (defun project-vterm ()
    (interactive)
    (defvar vterm-buffer-name)
    (let* ((default-directory (project-root     (project-current t)))
           (vterm-buffer-name (project-prefixed-buffer-name "vterm"))
           (vterm-buffer (get-buffer vterm-buffer-name)))
      (if (and vterm-buffer (not current-prefix-arg))
          (pop-to-buffer vterm-buffer  (bound-and-true-p display-comint-buffer-action))
        (vterm))))
  :config
  (setq vterm-copy-exclude-prompt t)
  (setq vterm-max-scrollback 100000))

(provide 'init-vterm)
