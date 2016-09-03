(setq inferior-lisp-program "/usr/bin/sbcl")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/slime/")
(add-to-list 'auto-mode-alist '("\\.cl\\'" . lisp-mode))
(setq slime-contribs '(slime-fancy)) ; almost everything
(require 'slime)
(slime-setup)
