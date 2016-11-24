;;; packages.el --- redshift layer packages file for Spacemacs.
;;
;; Author: Chadwick Dahlquist <chadwick@2bugeats.net>
;; URL: https://github.com/bugeats

(defconst redshift-packages
  '(paren-face hiwin)
  )

(defun redshift/init-paren-face ()
  (use-package paren-face
    :demand t
    :commands (global-paren-face-mode)
    :config
    (progn
      (add-to-list 'paren-face-modes 'emacs-lisp-mode)
      (add-to-list 'paren-face-modes 'javascript-mode)
      (add-to-list 'paren-face-modes 'j2-mode)
      (setq paren-face-regexp (rx (any "{}();<>,'=\".")))

      (font-lock-add-keywords 'j2-mode
                      `(;; Type assertions
                        (,(rx (any ":")) 0 'parenthesis)
                        ;; Generic type parameters
                        (,(rx (group "(") symbol-start) 1 'parenthesis)
                        (,(rx symbol-end (group (+ ")"))) 1 'parenthesis)))

      (global-paren-face-mode t)

      ;; (custom-set-faces
      ;;  ;; TODO how to use variables?
      ;;  '(parenthesis ((t (:foreground "#a57b55")))))

      )))

;; (defun redshift/post-init-paren-face ()
;;   (custom-set-variables '(spacemacs-theme-custom-colors
;;                           '((base       . p-d1) ; Base text color
;;                             (act1       . p-a3) ; One of mode-line's active colors.
;;                             (act2       . p-a4) ; The other active color of mode-line.
;;                             (base-dim   . p-d2) ; A dimmer version of the normal text color.
;;                             (bg1        . p-a6) ; The background color.
;;                             (bg2        . p-a5) ; A darker background color. Used to highlight current line.
;;                             (bg3        . p-a5) ; Yet another darker shade of the background color.
;;                             (bg4        . p-a5) ; The darkest background color.
;;                             (border     . p-a4) ; A border line color. Used in mode-line borders.
;;                             (cblk       . p-a2) ; A code block color. Used in org's code blocks.
;;                             (cblk-bg    . p-a6) ; The background color of a code block.
;;                             (cblk-ln    . p-a2) ; A code block header line.
;;                             (cblk-ln-bg . p-a6) ; The background of a code block header line.
;;                             (comment    . p-d2) ; A comment.
;;                             (comment-bg . p-a6) ; The background color of a comment. To disable this, customize spacemacs-theme-comment-bg.
;;                             (comp       . p-b1) ; A complementary color.
;;                             (const      . p-b1) ; A constant.
;;                             (cursor     . p-k1) ; The cursor/point color.
;;                             (err        . p-k1) ; errors.
;;                             (func       . p-d1) ; functions.
;;                             (head1      . p-d1) ; Level 1 of a heading. Used in org's headings.
;;                             (head1-bg   . p-a6) ; The background of level 2 headings. To disable this, customize spacemacs-theme-org-highlight.
;;                             (head2      . p-d1) ; Level 2 headings.
;;                             (head2-bg   . p-a6) ; Level 2 headings background.
;;                             (head3      . p-d1) ; Level 3 headings.
;;                             (head3-bg   . p-a6) ; Level 3 headings background.
;;                             (head4      . p-d1) ; Level 4 headings.
;;                             (head4-bg   . p-a6) ; Level 4 headings background.
;;                             (highlight  . p-a3) ; A highlighted area.
;;                             (keyword    . p-b1) ; A keyword or a builtin color.
;;                             (lnum       . p-a3) ; Line numbers.
;;                             (mat        . p-k1) ; A matched color. Used in matching parens, brackets and tags.
;;                             (meta       . p-a3) ; A meta line. Used in org's meta line.
;;                             (str        . p-g1) ; A string.
;;                             (suc        . p-b1) ; To indicate success. Opposite of error.
;;                             (ttip       . p-a3) ; Tooltip color.
;;                             (ttip-bg    . p-a5) ; Tooltip background color.
;;                             (ttip-sl    . p-a4) ; Tooltip selection color.
;;                             (type       . p-b2) ; A type color.
;;                             (var        . p-b1) ; A variable color.
;;                             (war        . p-k1)))) ; A warning color.

;;   (setq theming-modifications '((spacemacs-dark '(default :background p-a6 :foreground p-d1)
;;                                                 '(js2-function-param :foreground p-d1)
;;                                                 '(term :background p-a5)
;;                                                 '(font-lock-constant-face :foreground nil :underline nil))))
;;   )

(defun redshift/init-hiwin ()
  (use-package hiwin
    :config

    (hiwin-activate)

    ;; Yay this works
    (custom-set-faces
     ;; hiwin-face is windows that don't have focus
     '(hiwin-face ((t (:background "#3B4048"))) t)
     )
  )
)
