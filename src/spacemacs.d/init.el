;; -*- mode: emacs-lisp -*-

(defun dotspacemacs/layers ()
  "
  Configuration Layers declaration. You should not put any user code in this function besides modifying the variable values.
  "
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(
     markdown
     javascript
     auto-completion
     better-defaults
     clojure
     emacs-lisp
     git
     helm
     javascript
     markdown
     react
     syntax-checking
     theming
     version-control
     vimscript
     (shell :variables
            shell-default-shell 'ansi-term
            shell-default-position 'right)
     )
   dotspacemacs-additional-packages
   '(
     paren-face
     )
   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages
   '(
     vi-tilde-fringe
     vim-powerline
     rainbow-delimiters
     )
   )
   dotspacemacs-install-packages 'used-only)

(defun dotspacemacs/init ()
  "
  Initialization function. This function is called at the very startup of Spacemacs initialization before layers configuration. You should not put any user code in there besides modifying the variable values.
  "
  (setq-default

   dotspacemacs-default-font '("Droid Sans Mono" :size 13 :weight normal :width normal :powerline-scale 1)
   dotspacemacs-startup-banner 'nil
   dotspacemacs-display-default-layout t
   dotspacemacs-fullscreen-at-startup t

   ;; ---- generated defaults below ----

   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-check-for-update nil
   dotspacemacs-elpa-subdirectory nil
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-lists '((recents . 5) (projects . 7))
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-themes '(spacemacs-dark spacemacs-light)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-ex-command-key ":"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-remap-Y-to-y$ nil
   dotspacemacs-retain-visual-state-on-shift t
   dotspacemacs-visual-line-move-text nil
   dotspacemacs-ex-substitute-global nil
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-large-file-size 1
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-helm-resize nil
   dotspacemacs-helm-no-header nil
   dotspacemacs-helm-position 'bottom
   dotspacemacs-helm-use-fuzzy 'always
   dotspacemacs-enable-paste-transient-state nil
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-show-transient-state-title t
   dotspacemacs-show-transient-state-color-guide t
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers nil
   dotspacemacs-folding-method 'evil
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-smart-closing-parenthesis nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "
  Initialization function for user code.
  It is called immediately after `dotspacemacs/init', before layer configuration executes.
  This function is mostly useful for variables that need to be set before packages are loaded.
  If you are unsure, you should try in setting them in `dotspacemacs/user-config' first.
  "
  )

(defun dotspacemacs/user-config ()
  "
  Configuration function for user code.
  This function is called at the very end of Spacemacs initialization after layers configuration.
  This is the place where most of your configurations should be done.
  Unless it is explicitly specified that a variable should be set before a package is loaded, you should place your code here.
  "
  (setq git-gutter-fr+-side 'left-fringe) ; git gutter marks near the line numbers
  (setq powerline-default-separator 'nil)
  (setq neo-theme 'nerd)

  (add-hook 'hack-local-variables-hook (lambda () (setq truncate-lines t))) ; disable text folding everwhere

  ;; TODO These don't actuall work?!
  ;; (spacemacs/toggle-line-numbers-on)
  ;; (spacemacs/toggle-truncate-lines-on)
  ;; (spacemacs/toggle-golden-ratio-on)
  )

;; -----------------------------------------------------------------------------

;; Do not write anything past this comment. This is where Emacs will auto-generate custom variable definitions.

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (org haml-mode gitignore-mode fringe-helper git-gutter+ git-gutter pos-tip flycheck magit magit-popup git-commit with-editor web-completion-data dash-functional company inflections edn paredit peg cider queue clojure-mode auto-complete tern skewer-mode simple-httpd json-snatcher json-reformat yasnippet multiple-cursors js2-mode markdown-mode vi-tilde-fringe rainbow-delimiters xterm-color ws-butler window-numbering which-key web-mode web-beautify volatile-highlights vimrc-mode uuidgen use-package toc-org tagedit spacemacs-theme spaceline smeargle slim-mode shell-pop scss-mode sass-mode restart-emacs quelpa pug-mode popwin persp-mode pcre2el paren-face paradox orgit org-plus-contrib org-bullets open-junk-file neotree mwim multi-term move-text mmm-mode markdown-toc magit-gitflow macrostep lorem-ipsum livid-mode linum-relative link-hint less-css-mode json-mode js2-refactor js-doc info+ indent-guide ido-vertical-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md flycheck-pos-tip flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav dumb-jump diff-hl define-word dactyl-mode company-web company-tern company-statistics column-enforce-mode coffee-mode clojure-snippets clj-refactor clean-aindent-mode cider-eval-sexp-fu auto-yasnippet auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
