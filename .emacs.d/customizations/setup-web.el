(add-to-list 'auto-mode-alist '("\\.html" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx" . web-mode))
(setq web-mode-content-types-alist
  '(("jsx" . "\\.js[x]?\\'")))
(setq web-mode-markup-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-enable-auto-quoting nil)
(require 'vue-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.1
(add-hook 'web-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
