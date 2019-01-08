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
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   inc-private-layers-dir "~/.spacemacs.d/private/"
   dotspacemacs-configuration-layer-path (list inc-private-layers-dir)
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(rust
     csv
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ansible
     (auto-completion :variables
                      auto-completion-enable-help-tooltip 'manual
                      auto-completion-private-snippets-directory "~/.spacemacs.d/snippets"
                      auto-completion-enable-snippets-in-popup nil)
     better-defaults
     (emacs-lisp :variables emacs-lisp-hide-namespace-prefix t)
     (lsp :variables lsp-ui-doc-enable nil)
     git
     github
     go
     helm
     html
     javascript
     markdown
     (org :variables
          org-enable-org-journal-support t
          org-journal-dir "~/Documents/org/journal/"
          org-journal-date-format "%A, %Y-%m-%d"
          )
     plantuml
     react
     python
     (ruby :variables ruby-version-manager "rbenv")
     ruby-on-rails
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     shell-scripts
     spell-checking
     syntax-checking
     version-control
     xkcd
     yaml
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(keychain-environment
                            string-edit
                            vlf
                            seeing-is-believing
                            pocket-reader
                            )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(yasnippet-snippets)
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only)

  ;; enable all private layers by default
  (setq dotspacemacs-configuration-layers (append dotspacemacs-configuration-layers
                                        (mapcar 'intern (directory-files inc-private-layers-dir nil "[^.]"))))
  )

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
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   ;; dotspacemacs-editing-style '(hybrid :variables  hybrid-mode-default-state 'emacs)
   dotspacemacs-editing-style 'hybrid
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
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
   dotspacemacs-fullscreen-at-startup nil
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
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
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

   dotspacemacs-mode-line-theme 'spacemacs
   )
  )

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun cfg-jump () (global-set-key "\C-i" 'evil-jump-forward)) ;; otherwise, there is something else mapping to it

(defun cfg-smartparams ()
  (global-set-key (kbd "C-)") 'sp-forward-slurp-sexp)
  (global-set-key (kbd "C-(") 'sp-forward-barf-sexp)
  (global-set-key (kbd "C-}") 'sp-unwrap-sexp)
  (global-set-key (kbd "C-{") 'sp-wrap-round)
  )

(defun cfg-projectile ()
  (with-eval-after-load 'projectile
    (spacemacs/set-leader-keys "\\" 'projectile-grep)
    (setq projectile-require-project-root nil)
    (add-to-list 'projectile-globally-ignored-directories "node_modules")
    (global-set-key (kbd "C-x b") 'helm-mini)
    (global-set-key (kbd "C-x C-b") 'helm-projectile-switch-to-buffer)
    ))

(defun inec-inf-ruby-set-history ()
  "Set inf ruby history to ~/.pry_history"
  (setq comint-input-ring-file-name "~/.pry_history")
  (comint-read-input-ring)
  )

(defun cfg-ruby ()
  (with-eval-after-load 'inf-ruby
    (defun ruby-send-region (start end &optional print)
      "I'm overriding the original definition of the inf-ruby mode in order to print evaluated string before the evaluation itself"
      (interactive "r\nP")
      (let (term (file (or buffer-file-name (buffer-name))) line (text (buffer-substring start end)))
        (save-excursion
          (save-restriction
            (widen)
            (goto-char start)
            (setq line (+ start (forward-line (- start)) 1))
            (goto-char start)
            (while (progn
                     (setq term (apply 'format ruby-send-terminator (random) (current-time)))
                     (re-search-forward (concat "^" (regexp-quote term) "$") end t)))))
        ;; compilation-parse-errors parses from second line.
        (save-excursion
          (let ((m (process-mark (inf-ruby-proc))))
            (set-buffer (marker-buffer m))
            (goto-char m)
            (insert text) ;; this is where the magic happens
            (insert ruby-eval-separator "\n")
            (set-marker m (point))))
        (comint-send-string (inf-ruby-proc) (format "eval <<'%s', %s, %S, %d\n"
                                                    term inf-ruby-eval-binding
                                                    file line))
        (comint-send-region (inf-ruby-proc) start end)
        (comint-send-string (inf-ruby-proc) (concat "\n" term "\n"))
        (when print (ruby-print-result))))

    (add-hook 'inf-ruby-mode #'inec-inf-ruby-set-history)
    )
  (with-eval-after-load 'ruby-tools (add-hook 'ruby-mode-hook (lambda () (hs-minor-mode))))
  (with-eval-after-load 'ruby-mode
    (require 'seeing-is-believing)
    (defun seeing-is-believing-clear-mark-run ()
      (interactive)
      (seeing-is-believing-mark-current-line-for-xmpfilter)
      (seeing-is-believing-run-as-xmpfilter))
    (define-key ruby-mode-map (kbd "C-c C-m") 'seeing-is-believing-run)
    (define-key ruby-mode-map (kbd "C-c C-c") 'seeing-is-believing-clear)
    (define-key ruby-mode-map (kbd "C-c C-v") 'seeing-is-believing-clear-mark-run)
    (add-hook 'ruby-mode-hook 'seeing-is-believing))
  (with-eval-after-load 'hideshow
    (add-to-list 'hs-special-modes-alist
                 `(ruby-mode
                   ,(rx (or "def" "do" "{" "[")) ; Block start
                   ,(rx (or "}" "]" "end"))      ; Block end
                   ,(rx (or "#" "=begin"))       ; Comment start
                   ruby-forward-sexp nil)))
  )

(defun cfg-windows ()
  (global-set-key (kbd "C-M-l") 'evil-window-right)
  (global-set-key (kbd "C-M-h") 'evil-window-left)
  (global-set-key (kbd "C-M-k") 'evil-window-up)
  (global-set-key (kbd "C-M-j") 'evil-window-down)
  )

(defun cfg-term ()
  (with-eval-after-load 'term
    (define-key term-raw-map (kbd "C-M-l") 'evil-window-right)
    (define-key term-raw-map (kbd "C-M-h") 'evil-window-left)
    (define-key term-raw-map (kbd "C-M-k") 'evil-window-up)
    (define-key term-raw-map (kbd "C-M-j") 'evil-window-down)
    ))

(defun cfg-evil-mc ()
  (with-eval-after-load 'evil-mc-mode
    (global-evil-mc-mode 1)
    (global-set-key "\C-d" 'delete-forward-char) ; To fix deleting chars in mc mode
    ))

(defun cfg-expand-region ()
  (with-eval-after-load 'ruby-tools
    (define-key ruby-tools-mode-map (kbd "C-'") nil )
    (add-hook 'ruby-mode-hook (lambda () (hs-minor-mode)))
    (define-key ruby-tools-mode-map (kbd "C-\"") nil)
    (define-key ruby-mode-map (kbd "C-\"") 'er/mark-ruby-block-up)
    )
  (global-set-key (kbd "C-'") 'er/expand-region)
  )

(defun cfg-flycheck ()
  (with-eval-after-load 'flycheck
    (setq-default flycheck-disabled-checkers '(ruby-rubocop))
    (setq flycheck-display-errors-function #'flycheck-display-error-messages)
    (add-hook 'flycheck-after-syntax-check-hook
              (lambda  ()
                (when (not flycheck-current-errors)
                  (flycheck-list-errors))))
    )
  )

(defun cfg-git()
  (require 'git-link)
  (defun git-link-github (hostname dirname filename branch commit start end)
    "Override the git-link-github handler to always use commits instead of branched"
    (format "https://%s/%s/blob/%s/%s"
	          hostname
	          dirname
            commit ; <- this changed was "(or branch commit)"
            (concat filename
                    (when start
                      (concat "#"
                              (if end
                                  (format "L%s-L%s" start end)
                                (format "L%s" start)))))))

  (with-eval-after-load 'magit
    ;; The Foreman's preferences for the commit message format.
    (setq git-commit-summary-max-length 65
          git-commit-fill-column 73)
    )
  )

(defun cfg-dired ()
  (with-eval-after-load 'dired
    (defun dired-open-file-in-eww ()
      "Opens file at browser in eww"
      (interactive)
      (eww-open-file (dired-get-file-for-visit)))
    (define-key dired-mode-map (kbd "V") 'dired-open-file-in-eww)
    )
  )

(defun cfg-search ()
  "Tweak behavior of search"
  (defun inec-search-next-and-top ()
    (interactive)
    (evil-search-next)
    (evil-scroll-line-to-top nil))
  (define-key evil-motion-state-map "n" 'inec-search-next-and-top)
  )

(defun cfg-yasnippet ()
  (with-eval-after-load 'yasnippet
    (require 'auto-yasnippet)
    (defun inc-yas-create ()
      "Create a snippet from current selection"
      (interactive)
      (unless (region-active-p)
        (error "No selection"))
      (setq aya-current (buffer-substring-no-properties (region-beginning) (region-end)))
      (call-interactively #'aya-persist-snippet))

    (spacemacs/set-leader-keys "iSS" #'inc-yas-create)

    (let ((yasnippet-snippets-custom-dir (concat dotspacemacs-directory
                                                 "yasnippet-snippets/"
                                                 "snippets/")))
      (add-to-list 'yas-snippet-dirs yasnippet-snippets-custom-dir)
      )))

(defun cfg-auto-complete ()
  (with-eval-after-load 'company
    (global-set-key (kbd "M-C-/") 'company-filter-candidates)
    (global-set-key (kbd "M-\\") 'dabbrev-completion)
    (setq company-frontends '(company-pseudo-tooltip-frontend company-quickhelp-frontend))
    )
  )

(defun cfg-spelling ()
  (with-eval-after-load 'flyspell
  (defun flyspell-add-current-word ()
    "Add current word to ispell dictionary"
    (interactive)
    (let ((word (thing-at-point 'word)))
      (ispell-send-string (concat "*" word "\n"))
      (ispell-send-string "#\n")
      (flyspell-unhighlight-at (point))
      (setq ispell-pdict-modified-p '(t)))
    )
  (spacemacs/set-leader-keys "Sa" 'flyspell-add-current-word)

  ; I have not found a better way to add more commands to existing transient state
  (spacemacs|define-transient-state spell-checking2
    :title "Spell Checking Transient State"
    :doc "
Spell Commands^^             Other
--------------^^             -----
[_b_]  check whole buffer    [_t_]  toggle spell check
[_d_]  change dictionary     [_q_]  exit
[_n_]  next spell error      [_Q_]  exit and disable spell check
[_c_]  correct word
[_a_]  add word to custom dictionary
"
    :on-enter (flyspell-mode)
    :bindings
    ("a" flyspell-add-current-word)
    ("b" flyspell-buffer)
    ("d" spell-checking/change-dictionary)
    ("n" flyspell-goto-next-error)
    ("c" flyspell-correct-previous-word-generic)
    ("Q" flyspell-mode :exit t)
    ("q" nil :exit t)
    ("t" spacemacs/toggle-spelling-checking))
  )
  (spacemacs/set-leader-keys "S." 'spacemacs/spell-checking2-transient-state/body)
  )

(defun inc-eval-defun-and-run ()
  (interactive)
  (let ((fun (eval-defun nil)))
    (apply (list fun))
    (message "%s finished" fun)
    )
  )

;; inspired by https://orgmode.org/worg/org-hacks.html
(require 'mm-url) ; to include mm-url-decode-entities-string

(defun inc-org-insert-from-link (&optional with-task)
  "Insert org link where default description is set to html title."
  (interactive)
  (let* ((url (current-kill 0))
         (title (inc-get-html-title-from-url url)))
    (when with-task
      (org-insert-heading-after-current)
      (insert (format "TODO %s\n\n" title)))
    (insert (format "[[%s][%s]]" url title))
    (when with-task (outline-hide-subtree))
    ))

(defun inc-org-insert-task-from-link ()
  (interactive)
  (inc-org-insert-from-link t))

(defun inc-get-html-title-from-url (&optional url)
  "Return content in <title> tag."
  (let* (x1 x2 title
           (url (or url (current-kill 0)))
           (download-buffer (url-retrieve-synchronously url))
           )
    (save-excursion
      (set-buffer download-buffer)
      (beginning-of-buffer)
      (setq x1 (search-forward "<title>"))
      (search-forward "</title>")
      (setq x2 (search-backward "<"))
      (setq title (-> (buffer-substring-no-properties x1 x2)
                      mm-url-decode-entities-string
                      s-trim))
      (inc-html-title-extracted url title))))

(defun inc-html-title-extracted (url title)
  "Format the title in a desired format, can be url specific"
  (cond ((string-match-p "github" url)
         (if (string-match "^\\([[:ascii:]]*\\) by [[:alnum:]]* " title)
             (setq title (message (match-string-no-properties 1 title))))
         (setq title (format "Github PR: %s" title))
         )
        ((string-match-p "gitlab" url)
         (if (string-match "^\\([[:ascii:]]*\\)" title)
             (setq title (message (match-string-no-properties 1 title))))
         (setq title (format "Gitlab MR: %s" title))
         )
        ((string-match-p "bugzilla" url)
         (setq title (format "BZ: %s" title))
         )
        )
  (decode-coding-string title 'utf-8)
  )

(defun inc-org-journal-show-current ()
  "Open current journal file"
  (interactive)
  (require 'org-journal)
  (let ((file (org-journal-get-entry-path)))
    (if (file-exists-p file)
        (switch-to-buffer (find-file-noselect file))
      (org-journal-new-entry t)
        )
    )
  )

(defun inc-org-journal-hook ()
  "Hook to run after journal mode is enabled"
  (ispell-change-dictionary "czech")
  (auto-fill-mode 1)
  )

(defun cfg-org-journal ()
  (with-eval-after-load 'org-journal
     (add-hook 'org-journal-mode-hook #'inc-org-journal-hook)
     (spacemacs/set-leader-keys "ij" 'inc-org-journal-show-current)
    )
  )

(defun cfg-inc ()
  "configure inc-prefixed functions and bindings"
  (spacemacs/set-leader-keys-for-major-mode 'emacs-lisp-mode "eF" 'inc-eval-defun-and-run)
  (spacemacs/set-leader-keys "it" 'inc-org-insert-task-from-link)
  (spacemacs/set-leader-keys "iu" 'inc-org-insert-from-link)
  )

(defun cfg-org ()
  (with-eval-after-load 'org
    (setq org-startup-indented t)
    (setq org-agenda-custom-commands
          '(("n" "Agenda, started and other" ((agenda "") (todo "STARTED|WAITING") (todo "TODO") (todo "DELEGATED|DEFERRED")))
            ("u" "Unscheduled TODO"
             ((todo ""
                    ((org-agenda-overriding-header "\nUnscheduled TODO")
                     (org-agenda-skip-function '(org-agenda-skip-entry-if 'timestamp)))))
             nil
             nil)))
    (setq org-agenda-log-mode-items '(closed clock state))
    (setq org-todo-keywords
          '((sequence "TODO(t)" "SCHEDULED" "STARTED" "WAITING(@/!)" "DELEGATED(@/!)" "DEFERRED(@/!)" "|" "DONE(d!)" "CANCELLED(@/!)" "NONE")))
    ))

(defvar-local inc-company-main-backend nil
  "The backend to be used in inc-quickhelp-show. It's meant to be used as buffer local variable")

(defun inc-quickhelp-show ()
  (interactive)
  (save-excursion
    (setq company-frontends '(company-pseudo-tooltip-frontend company-quickhelp-frontend))
    (if (not inc-company-main-backend)
        (error "inc-company-main-backend not set"))
    (forward-word)
    (setq company-backend inc-company-main-backend)
    (setq company-point (point))
    (company-update-candidates (apply inc-company-main-backend '(candidates))))
  (company-call-frontends 'update)
  )

(defun cfg-go ()
  (with-eval-after-load 'go-mode
    (setq go-format-before-save t)
    (setq godoc-at-point-function 'godoc-gogetdoc)
    (setq go-tab-width 4)
    (spacemacs/set-leader-keys-for-major-mode 'go-mode "hH" 'godoc)
    (add-hook 'go-mode-hook (lambda ()
                              (clean-aindent-mode 0)
                              (clean-aindent-mode 1) ;; re-enable the mode to fix some preliminary cleanup on RET
                              (set (make-local-variable 'company-backends) '(company-go))
                              (setq inc-company-main-backend 'company-go)
                              (company-mode)
                              (company-quickhelp-mode)))
    )
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (add-to-list 'load-path "~/.spacemacs.d/etc/")
  (require 'inec-links)
  (require 'inec-frame)
  (cfg-dired)
  (cfg-jump)
  (cfg-smartparams)
  (cfg-projectile)
  (setq truncate-lines t)
  (cfg-ruby)
  (cfg-windows)
  (cfg-expand-region)
  (cfg-evil-mc)
  (cfg-flycheck)
  (cfg-yasnippet)
  (cfg-auto-complete)
  (cfg-git)
  (cfg-org)
  (cfg-spelling)
  (cfg-go)
  (cfg-inc)
  (cfg-term)
  (require 'personal)
  (cfg-personal)
  (cfg-org-journal)
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (xterm-color unfill smeargle shell-pop orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download mwim multi-term mmm-mode markdown-toc markdown-mode magit-gitflow htmlize helm-gitignore helm-company helm-c-yasnippet gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md fuzzy flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck evil-magit magit magit-popup git-commit ghub with-editor eshell-z eshell-prompt-extras esh-help diff-hl company-statistics company auto-yasnippet yasnippet auto-dictionary ac-ispell auto-complete ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async))))
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
 '(package-selected-packages
   (quote
    (lsp-mode xterm-color unfill smeargle shell-pop orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download mwim multi-term mmm-mode markdown-toc markdown-mode magit-gitflow htmlize helm-gitignore helm-company helm-c-yasnippet gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md fuzzy flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck evil-magit magit magit-popup git-commit ghub with-editor eshell-z eshell-prompt-extras esh-help diff-hl company-statistics company auto-yasnippet yasnippet auto-dictionary ac-ispell auto-complete ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
