;;; early-init.el --- -*- lexical-binding: t -*-

(setq comp-speed 2)
(setq package-enable-at-startup nil)
(setq frame-inhibit-implied-resize t)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(horizontal-scroll-bar-mode -1)
(fringe-mode 4) ;; make both fringes 4 pixels wide

;; - Finally we can try to avoid garbage collection at startup. The garbage collector can
;;   easily double startup time, so we suppress it at startup by turning up ~gc-cons-threshold~
;;   (and perhaps ~gc-cons-percentage~) temporarily.
(setq gc-cons-threshold 402653184
      gc-cons-percentage 0.6)

;; - Another small optimization concerns on =file-name-handler-alist= : on every .el and .elc
;;   file loaded during start up, it has to runs those regexps against the filename ; setting
;;   it to ~nil~ and after initialization finished put the value back make the initialization
;;   process quicker.
;;   However, it is important to reset it eventually. Not doing so will cause garbage
;;   collection freezes during long-term interactive use. Conversely, a ~gc-cons-threshold~
;;   that is too small will cause stuttering. This will be done at the end.
(defvar file-name-handler-alist-original file-name-handler-alist)
(setq file-name-handler-alist nil)

(when (boundp 'comp-eln-load-path)
  (let ((eln-cache-dir (expand-file-name "cache/eln-cache/"
                                         user-emacs-directory))
        (find-exec (executable-find "find")))
    (setcar comp-eln-load-path eln-cache-dir)
    ;; Quitting emacs while native compilation in progress can leave zero byte
    ;; sized *.eln files behind. Hence delete such files during startup.
    (when find-exec
      (call-process find-exec nil nil nil eln-cache-dir
                    "-name" "*.eln" "-size" "0" "-delete" "-or"
                    "-name" "*.eln.tmp" "-size" "0" "-delete"))))

;; - Reseting garbage collection and file-name-handler values.
(add-hook 'after-init-hook
          `(lambda ()
             (setq gc-cons-threshold 67108864 ; 64mb
                   gc-cons-percentage 0.1
                   file-name-handler-alist file-name-handler-alist-original)
             (garbage-collect)) t)
