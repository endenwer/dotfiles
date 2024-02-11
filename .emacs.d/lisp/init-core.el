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

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(use-package diminish) ;; add ablity to hide modes from modeline
(use-package general) ;; more convenient key definitions
(use-package crux) ;; collection of useful functions

;; show keymaps
(use-package which-key
  :diminish
  :config
  (which-key-mode))

(setenv "PATH" "/Users/endenwer/.pyenv/shims:/Users/endenwer/.asdf/shims:/opt/homebrew/opt/asdf/libexec/bin:/opt/homebrew/opt/texinfo/bin:/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin")
(setq exec-path '("/Users/endenwer/.pyenv/shims" "/Users/endenwer/.asdf/shims" "/opt/homebrew/opt/asdf/libexec/bin" "/opt/homebrew/opt/texinfo/bin" "/opt/homebrew/bin" "/usr/local/bin" "/usr/bin" "/bin" "/usr/sbin" "/sbin"))

(setq column-number-mode t)         ;; show column number in modline
(setq tab-always-indent 'complete)  ;; smart tab behavior - indent or complete
(setq-default indent-tabs-mode nil) ;; don't use tabs to indent
(setq-default tab-width 4)          ;; but maintain correct appearance
(setq ns-use-native-fullscreen nil) ;; native fullscreen adds new descktop, I don't need it
(setq inhibit-startup-screen t)     ;; open scratch buffer on startup

;; highlight current line
(global-hl-line-mode +1)

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

(set-face-attribute 'default nil :family "JetBrains Mono NL" :height 120 :weight 'normal)

(global-display-line-numbers-mode)

;; hide modes from modline
(diminish 'abbrev-mode)
(diminish 'eldoc-mode)

;; Disabling the BPA makes redisplay faster, but might produce incorrect display
;; reordering of bidirectional text with embedded parentheses and other bracket
;; characters whose 'paired-bracket' Unicode property is non-nil.
(setq bidi-inhibit-bpa t)  ; Emacs 27 only

(recentf-mode t)

(defun my/apply-theme (appearance)
  "Load theme, taking current system APPEARANCE into consideration."
  (mapc #'disable-theme custom-enabled-themes)
  (pcase appearance
    ('light (load-theme 'modus-operandi t))
    ('dark (load-theme 'modus-vivendi t))))

(add-hook 'ns-system-appearance-change-functions #'my/apply-theme)

;; customize modeline

(setq-default mode-line-format
`("%e" mode-line-front-space
  mode-line-modified "  "
  mode-line-buffer-identification "  " mode-line-position
 mode-line-modes mode-line-misc-info))

(provide 'init-core)
