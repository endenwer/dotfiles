;;; init-keybindings.el --- -*- lexical-binding: t -*-

(defconst leader-key "<SPC>")

(defvar minibuffer-maps
  '(minibuffer-local-map
    minibuffer-local-ns-map
    minibuffer-local-completion-map
    minibuffer-local-must-match-map
    minibuffer-local-isearch-map
    read-expression-map))

(general-create-definer leader-def
  :prefix leader-key)

(general-define-key
 :states 'normal
 "Y" '(lambda () "yank to eol" (interactive) (kill-ring-save (point) (line-end-position))))

(general-define-key
 "C-h" 'evil-window-left
 "C-j" 'evil-window-down
 "C-k" 'evil-window-up
 "C-l" 'evil-window-right)

(general-define-key
 :keymaps minibuffer-maps
 "<ESC>" 'abort-recursive-edit
 "C-j"   'next-line
 "C-k"   'previous-line)

(general-define-key
 :states '(normal motion insert emacs)
 "C-e" 'evil-end-of-line
 "C-a" 'crux-move-beginning-of-line)

(general-define-key
 :states 'normal
 :prefix leader-key
 "w" '(:ignore t :wk "windows")
 "wv" 'evil-window-vsplit
 "ws" 'evil-window-split
 "wd" 'delete-window
 "f" '(:ignore t :wk "files")
 "ff" 'find-file
 "fR" 'crux-rename-file-and-buffer
 "fD" 'crux-delete-file-and-buffer
 "fy" '(lambda () (interactive) (kill-new (file-relative-name (buffer-file-name) (project-root (project-current)))))
 "fs" 'save-buffer
 "b" '(:ignore t :wk "buffers")
 "bk" 'crux-kill-other-buffers
 "TAB" '(lambda () (interactive) (switch-to-buffer nil)))

(provide 'init-keybindings)
