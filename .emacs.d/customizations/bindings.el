(fset 'next-line-x9
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("9" 0 "%d")) arg)))
(fset 'prev-line-x9
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("9" 0 "%d")) arg)))

(global-set-key (kbd "M-N") 'next-line-x9)
(global-set-key (kbd "M-P") 'prev-line-x9)
(global-set-key (kbd "C-k") 'kill-whole-line)
(global-set-key (kbd "C-c C-n") 'linum-mode)
(global-set-key (kbd "M-n") 'next-line)
(global-set-key (kbd "M-p") 'previous-line)

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

;; Interactive search key bindings. By default, C-s runs
;; isearch-forward, so this swaps the bindings.
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)
