(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))
(global-set-key (kbd "C-;") 'toggle-comment-on-line)

(fset 'next-line-x9
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("9" 0 "%d")) arg)))
(fset 'prev-line-x9
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("9" 0 "%d")) arg)))

(global-set-key (kbd "M-N") 'next-line-x9)
(global-set-key (kbd "M-P") 'prev-line-x9)

(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(global-set-key (kbd "C-c C-r") 'ivy-resume)

;; Behave like vi's o command
(defun open-next-line (arg)
          "Move to the next line and then opens a line.                                                                                                                                          
    See also `newline-and-indent'."
	  (interactive "p")
	  (end-of-line)
	  (open-line arg)
	  (next-line 1)
	  (when newline-and-indent
	    (indent-according-to-mode)))

(global-set-key (kbd "C-o") 'open-next-line)

;; Behave like vi's O command
(defun open-previous-line (arg)
          "Open a new line before the current one.                                                                                                                                               
     See also `newline-and-indent'."
	  (interactive "p")
	  (beginning-of-line)
	  (open-line arg)
	  (when newline-and-indent
	    (indent-according-to-mode)))
(global-set-key (kbd "M-o") 'open-previous-line)
