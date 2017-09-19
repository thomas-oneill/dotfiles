(setq backup-directory-alist `(("." . ,(concat user-emacs-directory
                                               "backups"))))
(setq auto-save-default nil)

(desktop-save-mode 1)
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (concat user-emacs-directory "places"))

(tool-bar-mode -1)
(menu-bar-mode -1)

(setq-default frame-title-format "%b (%f)")

(blink-cursor-mode 0)

(setq ring-bell-function 'ignore)

(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'wombat t)

(require 'evil)
(evil-mode 1)
(setq evil-default-state 'emacs)

(require 'powerline)
(require 'powerline-evil)
(powerline-evil-center-color-theme)

(require 'nlinum-relative)
(nlinum-relative-setup-evil)
(add-hook 'prog-mode-hook 'nlinum-relative-mode)
(setq nlinum-relative-redisplay-delay 0)
(setq nlinum-relative-current-symbol "")
(setq nlinum-relative-offset 1)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")

(prefer-coding-system 'utf-8-unix)
