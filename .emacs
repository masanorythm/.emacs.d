(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(scroll-bar-mode nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(add-to-list 'load-path "~administrator/emacs-lisp/php-mode-1.5.0")
(require 'php-mode)
(add-hook 'php-mode-user-hook 'turn-on-font-lock)
(set-foreground-color "white")
(set-background-color "black")

 ;; tab ����
(setq c-basic-offset 4)
(setq indent-tabs-mode nil)
(setq default-tab-width 4)
(setq tab-width 4)
(setq tab-stop-list())
(loop for x downfrom 40 to 1 do
      (setq tab-stop-list (cons (* x 4) tab-stop-list)))

 ;; �򿪺��Զ��л�����һ�ιر�ʱ���ļ�
(desktop-save-mode 1)
 ;; ��ͼƬ��ʾ����
(auto-image-file-mode t)
 ;; ��ʾ����ƥ��
(show-paren-mode t)
(setq show-paren-style 'parentheses)

 ;; �س�����
(setq standard-indent 4)
(global-set-key "\C-m" 'newline-and-indent)
(global-set-key (kbd "C-<return>") 'newline)
(put 'upcase-region 'disabled nil)
