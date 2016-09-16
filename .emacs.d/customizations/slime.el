(setq inferior-lisp-program "/usr/bin/sbcl")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/slime/")
(add-to-list 'auto-mode-alist '("\\.cl\\'" . lisp-mode))
(setq slime-contribs '(slime-fancy)) ; almost everything
(setq slime-compile-file-options '(:fasl-directory "/tmp/slime-fasls/"))
(require 'slime)
(slime-setup)
