;;; init-vterm.el --- -*- lexical-binding: t -*-

(defun project-run-vterm (&optional arg)
  "Invoke `vterm' in the project's root.
Switch to the project specific term buffer if it already exists.
Use a prefix argument ARG to indicate creation of a new process instead."
  (interactive "P")
  (let* ((project-dir (cdr (project-current)))
         (buffer (format "*vterm %s*" project-dir))
         (default-directory project-dir))
    (unless (buffer-live-p (get-buffer buffer))
      (vterm buffer))
    (switch-to-buffer buffer)))

(use-package vterm
  :after project
  :general
  (:keymaps 'vterm-mode-map
   "C-l" nil
   "C-k" nil
   "C-j" nil)
  (:keymaps 'project-prefix-map
   "t" 'project-run-vterm))

(provide 'init-vterm)
