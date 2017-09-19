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
    ;; backward-forward
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
    ;; markdown-mode
    ;; org
    ;; paredit
    ;; projectile
    ;; rainbow-delimiters
    ;; smex
    ;; tagedit
    ;; terraform-mode
    ;; yaml-mode
    counsel
    evil
    ivy
    ivy-hydra
    nlinum-relative
    powerline
    powerline-evil
    swiper
    undo-tree
    vue-mode
    web-mode
))
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'load-path "~/.emacs.d/conf")

(load "global-settings.el")
(load "funcs-and-binds.el")
(load "setup-web.el")
