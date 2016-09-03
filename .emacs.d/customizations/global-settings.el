(global-linum-mode 1)
(setq linum-format "%4d \u2502 ")

;; (setq
;; backup-by-copying t                    ; don't clobber symlinks
;; backup-directory-alist
;;  '(("." . "~/.saves"))                ; don't litter my fs tree
;;  delete-old-versions t
;;  kept-new-versions 6
;;  kept-old-versions 2
;; version-control t)                     ; use versioned backups

;; (setq auto-save-file-name-transforms
      ;; `((".*" "~/.saves" t)))

;; Autoindent open-*-lines
;; (defvar newline-and-indent t
;; "Modify the behavior of the open-*-line functions to cause them to autoindent.")

(require 'evil)
(evil-mode 1)
(setq-default tab-width 4)
(setq evil-default-state 'emacs)
