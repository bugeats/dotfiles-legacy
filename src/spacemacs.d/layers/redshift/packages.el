;;; packages.el --- redshift layer packages file for Spacemacs.
;;
;; Author: Chadwick Dahlquist <chadwick@2bugeats.net>
;; URL: https://github.com/bugeats

(defconst redshift-packages
  '(paren-face)
  )

(defun redshift/init-paren-face ()
  (use-package paren-face
    :init
    (progn
      (setq redshift-did-init-paren-face t)

      (custom-set-faces
       ;; TODO how to use variables?
       '(parenthesis ((t (:foreground "#a57b55")))))

      )))

(defun redshift/post-init-paren-face ()
  ;; TODO make this work
  (setq paren-face-regexp (rx (any "{}();<>,'=\".")))
  (add-to-list 'paren-face-modes 'emacs-lisp-mode)
  (add-to-list 'paren-face-modes 'javascript-mode)
  (add-to-list 'paren-face-modes 'j2-mode)

  (global-paren-face-mode t)
  )
