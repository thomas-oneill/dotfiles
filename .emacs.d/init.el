(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(setq-default indent-tabs-mode nil)

(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)
(package-refresh-contents)
(defvar my-packages
  '(
    ;; alda-mode
    ;; auctex
    ;; cider
    ;; clojure-mode
    ;; clojure-mode-extra-font-locking
    ;; company
    ;; company-go
    ;; dockerfile-mode
    ;; elm-mode
    ;; elpy
    ;; exec-path-from-shell
    ;; geiser
    ;; go-mode
    ;; helm
    ;; ido-ubiquitous
    ;; ivy
    ;; jinja2-mode
    ;; magit
    ;; org
    ;; projectile
    ;; rainbow-delimiters
    ;; smex
    ;; tagedit
    ;; terraform-mode
    ;; yaml-mode
    backward-forward
    counsel
    dired-details
    emmet-mode
    evil
    flymd
    ivy
    ivy-hydra
    js2-mode
    markdown-mode
    nlinum-relative
    nodejs-repl
    paredit
    powerline
    powerline-evil
    rainbow-mode
    rust-mode
    scss-mode
    smex
    swiper
    undo-tree
    use-package
    vue-mode
    web-mode
    yasnippet))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'load-path "~/.emacs.d/conf")

(load "01-soft-globals.el")
(load "02-soft-funcs-and-binds.el")
(load "03-setup-web.el")
(load "03-setup-org.el")
(load "03-setup-sh.el")
(load "03-setup-rust.el")
(load "04-hard-globals.el")
(put 'downcase-region 'disabled nil)
