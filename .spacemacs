;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(shell-scripts
     go
     nginx
     octave
     ansible
     typescript
     org
     ivy
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     gtags
     auto-completion
     (better-defaults :variables
                      better-defaults-move-to-end-of-code-first t
                      better-defaults-move-to-beginning-of-code-first t)
     ruby-on-rails
     react
     git

     (shell :variables
            shell-default-shell 'ansi-term
            shell-default-height 30
            shell-default-position 'bottom)
     ;; spell-checking
     ;; syntax-checking
     ;; version-control

     ;; langs
     csv
     sql
     yaml
     markdown
     php
     rust
     python
     (clojure :variables
              clojure-enable-clj-refactor t)
     emacs-lisp
     html
     javascript
     (ruby :variables
           ruby-enable-enh-ruby-mode t
           ruby-test-runner 'rspec)

     ;; tools
     restclient
     (ranger :variables
             range-show-preview t)
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(evil-snipe
                                      coffee-mode
                                      graphql-mode
                                      flycheck
                                      adjust-parens
                                      (vue-mode :location (recipe
                                                           :fetcher github
                                                           :repo "codefalling/vue-mode")))
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner nil
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(zenburn gruvbox)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Fira Code"
                               :size 12
                               :weight normal
                               :width normal)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup t
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers 'relative
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ;; modline theme
   dotspacemacs-mode-line-theme '(spacemacs)))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

  (defun dotspacemacs/init-vue-mode ()
    (use-package vue-mode)))

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (setq-default line-spacing 6)
  (setq-default dotspacemacs-use-spacelpa t)
  (setq powerline-default-separator 'slant)
  (setq ruby-insert-encoding-magic-comment nil)
  (setq enh-ruby-add-encoding-comment-on-save nil)
  (setq js2-strict-missing-semi-warning nil)

  ;; Ligatures support
  (mac-auto-operator-composition-mode)

  ;; web mode settings
  (defun my-web-mode-hook ()
    "Hooks for Web mode."
    (setq web-mode-markup-indent-offset 2)
    (setq web-mode-css-indent-offset 2)
    (setq web-mode-code-indent-offset 2)
    (setq web-mode-attr-indent-offset 2))
  (add-hook 'web-mode-hook  'my-web-mode-hook)

  ;; scss hook
  (defun scss-custom ()
    "scss-mode-hook"
    (and
     (set (make-local-variable 'css-indent-offset) 2)
     (set (make-local-variable 'scss-compile-at-save) nil)))
  (add-hook 'scss-mode-hook
            '(lambda() (scss-custom)))


  ;; clojure auto indent and deindent
  (require 'adjust-parens)
  (add-hook 'clojure-mode-hook #'adjust-parens-mode)

  ;; smartparens config
  (require 'smartparens-config)
  (setq sp-base-key-bindings 'sp-smartparens-bindings)
  (bind-keys
   :map smartparens-mode-map
   ("C-M-a" . sp-beginning-of-sexp)
   ("C-M-e" . sp-end-of-sexp)

   ("M-j"   . sp-down-sexp)
   ("M-u"   . sp-up-sexp)
   ("C-M-j" . sp-backward-down-sexp)
   ("C-M-u" . sp-backward-up-sexp)

   ("C-M-f" . sp-forward-sexp)
   ("C-M-b" . sp-backward-sexp)

   ("C-M-n" . sp-next-sexp)
   ("C-M-p" . sp-previous-sexp)

   ("C-S-f" . sp-forward-symbol)
   ("C-S-b" . sp-backward-symbol)

   ("C-)" . sp-forward-slurp-sexp)
   ("C-}" . sp-forward-barf-sexp)
   ("C-(" . sp-backward-slurp-sexp)
   ("C-{" . sp-backward-barf-sexp)

   ("C-M-t" . sp-transpose-sexp)
   ("C-M-r" . sp-raise-sexp)
   ("C-M-k" . sp-kill-sexp)
   ("C-M-y" . sp-copy-sexp)
   ("C-k"   . sp-kill-hybrid-sexp)
   ("M-k"   . sp-backward-kill-sexp)

   ("M-<backspace>" . backward-kill-word)
   ("C-<backspace>" . sp-backward-kill-word)
   ([remap sp-backward-kill-word] . backward-kill-word)

   ("M-{" . sp-backward-unwrap-sexp)
   ("M-}" . sp-unwrap-sexp)

   ("C-x C-t" . sp-transpose-hybrid-sexp))

  ;; js indent
  (setq js-indent-level 2)
  (setq js2-basic-offset 2)

  ;; always open shell in project root
  (spacemacs/set-leader-keys "'" 'spacemacs/projectile-shell-pop)

  (add-hook 'projectile-mode-hook 'projectile-rails-on)

  ;; helm settings
  (setq helm-split-window-in-side-p t)

  ;; add syntax checking for clojure
  (require 'flycheck)

  (flycheck-define-checker clojure-joker
    "A Clojure syntax checker using Joker.
  See URL `https://github.com/candid82/joker'."
    :command ("joker" "--lint" "-")
    :standard-input t
    :error-patterns
    ((error line-start "<stdin>:" line ":" column ": " (0+ not-newline) (or "error: " "Exception: ") (message) line-end)
     (warning line-start "<stdin>:" line ":" column ": " (0+ not-newline) "warning: " (message) line-end))
    :modes (clojure-mode clojurec-mode)
    :predicate (lambda () (not (string= "edn" (file-name-extension (buffer-file-name))))))

  (flycheck-define-checker clojurescript-joker
    "A ClojureScript syntax checker using Joker.
  See URL `https://github.com/candid82/joker'."
    :command ("joker" "--lintcljs" "-")
    :standard-input t
    :error-patterns
    ((error line-start "<stdin>:" line ":" column ": " (0+ not-newline) (or "error: " "Exception: ") (message) line-end)
     (warning line-start "<stdin>:" line ":" column ": " (0+ not-newline) "warning: " (message) line-end))
    :modes (clojurescript-mode))

  (add-to-list 'flycheck-checkers 'clojure-joker)
  (add-to-list 'flycheck-checkers 'clojurescript-joker)

  (add-hook 'clojure-mode-hook 'flycheck-mode)
  (add-hook 'clojurescript-mode-hook 'flycheck-mode)

  (setq avy-timeout-seconds 0.2)
  (define-key evil-normal-state-map (kbd "C-k") 'evil-avy-goto-char-timer)
  (define-key evil-normal-state-map (kbd "M-v") 'evil-paste-after)

  (define-key evil-normal-state-map (kbd "C-e") 'mwim-end-of-code-or-line)
  (define-key evil-visual-state-map (kbd "C-e") 'mwim-end-of-code-or-line)
  (define-key evil-insert-state-map (kbd "C-e") 'mwim-end-of-code-or-line)

  (define-key evil-normal-state-map (kbd "C-f") 'forward-char)
  (define-key evil-visual-state-map (kbd "C-f") 'forward-char)
  (define-key evil-insert-state-map (kbd "C-f") 'forward-char)

  (evil-snipe-mode +1)
  (evil-snipe-override-mode +1)
  (add-hook 'magit-mode-hook 'turn-off-evil-snipe-override-mode)

  (spaceline-compile))


(defun gitlab--shell-to-string (cmd)
  "Execute CMD in a shell.
Returns stdout if command succeeds,otherwise returns nil"
  (interactive)
  (with-temp-buffer
    (let ((glob-buf-stdout (buffer-name)))
      (if (eq 0 (call-process-shell-command cmd nil glob-buf-stdout))
          (buffer-string)
        (signal 'error (list (format "command \"%s\" failed with non-zero exit code" cmd)))))))

(defun gitlab--get-git-exec ()
  "This duplicates functionality inside magit."
  (executable-find "git"))

(defun gitlab--get-branch ()
  "Find the current branch."
  (let
      ((cmd (format "%s rev-parse --abbrev-ref HEAD" (gitlab--get-git-exec))))
    (s-trim (gitlab--shell-to-string cmd))))

(defun get-country-from-branch (branch-name)
  (first (split-string branch-name "/")))

(defun cashwagon-crm-create-mr ()
  "Open browser to view current selection, if applicable, in gitlab.
If a Dired buffer is open, browse to the directory listing in gitlab.
If the current buffer is neither a file or Dired buffer, open the current
project in gitlab"
  (interactive)
  (let* ((branch-name (gitlab--get-branch))
         (country (get-country-from-branch branch-name))
         (url (format "https://git.cashwagon.com/general/webcrm/merge_requests/new?utf8=✓&merge_request[source_project_id]=10&merge_request[source_branch]=%s&merge_request[target_project_id]=10&merge_request[target_branch]=%s/production" branch-name country)))
    (browse-url url)))


(defun cashwagon-site-create-mr ()
  "Open browser to view current selection, if applicable, in gitlab.
If a Dired buffer is open, browse to the directory listing in gitlab.
If the current buffer is neither a file or Dired buffer, open the current
project in gitlab"
  (interactive)
  (let* ((branch-name (gitlab--get-branch))
         (country (get-country-from-branch branch-name))
         (url (format "https://git.cashwagon.com/general/site/merge_requests/new?utf8=✓&merge_request[source_project_id]=11&merge_request[source_branch]=%s&merge_request[target_project_id]=11&merge_request[target_branch]=%s/production" branch-name country)))
    (browse-url url)))



;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("bbb4a4d39ed6551f887b7a3b4b84d41a3377535ccccf901a3c08c7317fad7008" "723e48296d0fc6e030c7306c740c42685d672fd22337bc84392a1cf92064788a" "5715d3b4b071d33af95e9ded99a450aad674e308abb06442a094652a33507cd2" "c5d320f0b5b354b2be511882fc90def1d32ac5d38cccc8c68eab60a62d1621f2" "bbea3143fe920d2738e73a042d1edcc0e0c1e9726a757dc0b51ca8d5ee825255" "0598de4cc260b7201120b02d580b8e03bd46e5d5350ed4523b297596a25f7403" "aa0a998c0aa672156f19a1e1a3fb212cdc10338fb50063332a0df1646eb5dfea" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "891debfe489c769383717cc7d0020244a8d62ce6f076b2c42dd1465b7c94204d" "1e469285a9eee5bb7099711440ab27b571d02aa860c009086ef2d341b4c5d535" default)))
 '(evil-want-Y-yank-to-eol t)
 '(package-selected-packages
   (quote
    (wgrep smex ivy-hydra edit-indirect ssass-mode vue-html-mode powerline pos-tip rake pcre2el org-plus-contrib mmm-mode skewer-mode simple-httpd json-snatcher json-reformat js2-mode parent-mode request haml-mode gitignore-mode flx magit magit-popup git-commit ghub let-alist with-editor smartparens iedit anzu evil goto-chg undo-tree php-mode projectile counsel swiper ivy web-completion-data dash-functional tern restclient know-your-http-well company hydra inflections edn multiple-cursors paredit peg eval-sexp-fu highlight cider sesman seq spinner queue pkg-info clojure-mode epl markdown-mode rust-mode inf-ruby bind-map bind-key yasnippet packed anaconda-mode pythonic f dash s helm avy helm-core async auto-complete popup powershell doom-themes all-the-icons memoize gradle-mode magithub ghub+ apiwrap yasnippet-snippets yapfify yaml-mode xterm-color ws-butler winum which-key web-mode web-beautify vue-mode volatile-highlights vi-tilde-fringe uuidgen use-package toml-mode toc-org tagedit sql-indent spaceline smeargle slim-mode shell-pop scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe restclient-helm restart-emacs rbenv ranger rainbow-delimiters racer pyvenv pytest pyenv-mode py-isort pug-mode projectile-rails popwin pip-requirements phpunit phpcbf php-extras php-auto-yasnippets persp-mode paradox orgit org-bullets open-junk-file ob-restclient ob-http neotree multi-term move-text minitest markdown-toc magit-gitflow macrostep lorem-ipsum livid-mode live-py-mode linum-relative link-hint less-css-mode json-mode js2-refactor js-doc indent-guide hy-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gtags helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md ggtags fuzzy flx-ido fill-column-indicator feature-mode fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eshell-z eshell-prompt-extras esh-help enh-ruby-mode emmet-mode elisp-slime-nav dumb-jump drupal-mode diminish define-word cython-mode csv-mode counsel-projectile company-web company-tern company-statistics company-restclient company-anaconda column-enforce-mode coffee-mode clojure-snippets clj-refactor clean-aindent-mode cider-eval-sexp-fu chruby cargo bundler auto-yasnippet auto-highlight-symbol auto-compile aggressive-indent adjust-parens adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(safe-local-variable-values
   (quote
    ((eval cider-register-cljs-repl-type "status-nrepl-android" "(do (require 'figwheel-api)
                                (figwheel-api/start [:android])
                                (figwheel-api/start-cljs-repl))" nil)
     (eval cider-register-cljs-repl-type "status-nrepl-ios" "(do (require 'figwheel-api)
                                (figwheel-api/start [:ios])
                                (figwheel-api/start-cljs-repl))" nil)
     (eval cider-register-cljs-repl-type "status-nrepl" "(do (require 'figwheel-api)
                                (figwheel-api/start [:android])
                                (figwheel-api/start-cljs-repl))" nil)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(custom-safe-themes
   (quote
    ("bbb4a4d39ed6551f887b7a3b4b84d41a3377535ccccf901a3c08c7317fad7008" "723e48296d0fc6e030c7306c740c42685d672fd22337bc84392a1cf92064788a" "5715d3b4b071d33af95e9ded99a450aad674e308abb06442a094652a33507cd2" "c5d320f0b5b354b2be511882fc90def1d32ac5d38cccc8c68eab60a62d1621f2" "bbea3143fe920d2738e73a042d1edcc0e0c1e9726a757dc0b51ca8d5ee825255" "0598de4cc260b7201120b02d580b8e03bd46e5d5350ed4523b297596a25f7403" "aa0a998c0aa672156f19a1e1a3fb212cdc10338fb50063332a0df1646eb5dfea" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "891debfe489c769383717cc7d0020244a8d62ce6f076b2c42dd1465b7c94204d" "1e469285a9eee5bb7099711440ab27b571d02aa860c009086ef2d341b4c5d535" default)))
 '(evil-want-Y-yank-to-eol t)
 '(fci-rule-color "#383838")
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (insert-shebang flycheck-bashate fish-mode company-shell wgrep smex ivy-hydra edit-indirect ssass-mode vue-html-mode powerline pos-tip rake pcre2el org-plus-contrib mmm-mode skewer-mode simple-httpd json-snatcher json-reformat js2-mode parent-mode request haml-mode gitignore-mode flx magit magit-popup git-commit ghub let-alist with-editor smartparens iedit anzu evil goto-chg undo-tree php-mode projectile counsel swiper ivy web-completion-data dash-functional tern restclient know-your-http-well company hydra inflections edn multiple-cursors paredit peg eval-sexp-fu highlight cider sesman seq spinner queue pkg-info clojure-mode epl markdown-mode rust-mode inf-ruby bind-map bind-key yasnippet packed anaconda-mode pythonic f dash s helm avy helm-core async auto-complete popup powershell doom-themes all-the-icons memoize gradle-mode magithub ghub+ apiwrap yasnippet-snippets yapfify yaml-mode xterm-color ws-butler winum which-key web-mode web-beautify vue-mode volatile-highlights vi-tilde-fringe uuidgen use-package toml-mode toc-org tagedit sql-indent spaceline smeargle slim-mode shell-pop scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe restclient-helm restart-emacs rbenv ranger rainbow-delimiters racer pyvenv pytest pyenv-mode py-isort pug-mode projectile-rails popwin pip-requirements phpunit phpcbf php-extras php-auto-yasnippets persp-mode paradox orgit org-bullets open-junk-file ob-restclient ob-http neotree multi-term move-text minitest markdown-toc magit-gitflow macrostep lorem-ipsum livid-mode live-py-mode linum-relative link-hint less-css-mode json-mode js2-refactor js-doc indent-guide hy-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gtags helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md ggtags fuzzy flx-ido fill-column-indicator feature-mode fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eshell-z eshell-prompt-extras esh-help enh-ruby-mode emmet-mode elisp-slime-nav dumb-jump drupal-mode diminish define-word cython-mode csv-mode counsel-projectile company-web company-tern company-statistics company-restclient company-anaconda column-enforce-mode coffee-mode clojure-snippets clj-refactor clean-aindent-mode cider-eval-sexp-fu chruby cargo bundler auto-yasnippet auto-highlight-symbol auto-compile aggressive-indent adjust-parens adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(safe-local-variable-values
   (quote
    ((eval cider-register-cljs-repl-type "status-nrepl-android" "(do (require 'figwheel-api)
                                (figwheel-api/start [:android])
                                (figwheel-api/start-cljs-repl))" nil)
     (eval cider-register-cljs-repl-type "status-nrepl-ios" "(do (require 'figwheel-api)
                                (figwheel-api/start [:ios])
                                (figwheel-api/start-cljs-repl))" nil)
     (eval cider-register-cljs-repl-type "status-nrepl" "(do (require 'figwheel-api)
                                (figwheel-api/start [:android])
                                (figwheel-api/start-cljs-repl))" nil))))
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
