;;; init-core.el --- -*- lexical-binding: t -*-

;; init straight.el
;; Do not check for package modifications,
;; to rebuild packages run `straight-rebuild-package`
(setq straight-check-for-modifications nil)
(setq straight-use-package-by-default t)
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

(use-package diminish) ;; add ablity to hide modes from modeline
(use-package general) ;; more convenient key definitions
(use-package crux) ;; collection of useful functions

;; show keymaps
(use-package which-key
  :diminish
  :config
  (which-key-mode))

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin:/Users/endenwer/.rbenv/bin:/Users/endenwer/.rbenv/shims"))
(setq exec-path (append exec-path '("/usr/local/bin" "/Users/endenwer/.rbenv/bin" "/Users/endenwer/.rbenv/shims")))

(setq column-number-mode t)         ;; show column number in modline
(setq tab-always-indent 'complete)  ;; smart tab behavior - indent or complete
(setq-default indent-tabs-mode nil) ;; don't use tabs to indent
(setq-default tab-width 4)          ;; but maintain correct appearance
(setq ns-use-native-fullscreen nil) ;; native fullscreen adds new descktop, I don't need it
(setq inhibit-startup-screen t)     ;; open scratch buffer on startup

;; change cmd and alt keys
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)

(setq-default show-trailing-whitespace t)

;; revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)

(setq ring-bell-function 'ignore) ;; disable sounds

(setq create-lockfiles nil
      make-backup-files nil)

(setq auto-save-default t
      auto-save-include-big-deletions t
      auto-save-list-file-prefix (concat user-emacs-directory ".local/cache/autosave/")
      auto-save-file-name-transforms (list (list ".*" auto-save-list-file-prefix t)))

(set-face-attribute 'default nil :family "JetBrains Mono" :height 120 :weight 'normal)

(global-display-line-numbers-mode)

(provide 'init-core)
