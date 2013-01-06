;; 启动emacs 不显示提示信息
(setq inhibit-startup-message t)
;; 去掉菜单栏
(tool-bar-mode 0)
(scroll-bar-mode 0)
;; set tab
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
;; 上一次打开
(require 'session)
(add-hook 'after-init-hook 'session-initialize)
(load "desktop")
(desktop-load-default)
(desktop-read)
(add-hook 'kill-emacs-hook
          '(lambda()(desktop-save "~/")))

;; 显示行号
(global-linum-mode 1)
(setq linum-format "%d")

;; git-emacs
(add-to-list 'load-path "~/.emacs.d/git-emacs/")
(require 'git-emacs)

;; auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)
(setq ac-quick-help-delay 0.01)

(require 'go-mode-load)
(require 'php-mode)
(add-hook 'php-mode-pear-hook 'turn-on-font-lock)

(defun copy-line (&optional arg)
 "Save current line into Kill-Ring without mark the line"
 (interactive "P")
 (let ((beg (line-beginning-position)) 
	(end (line-end-position arg)))
 (copy-region-as-kill beg end)))


(defun copy-word (&optional arg)
 "Copy words at point"
 (interactive "P")
 (let ((beg (progn (if (looking-back "[a-zA-Z0-9]" 1) (backward-word 1)) (point))) 
	(end (progn (forward-word arg) (point))))
 (copy-region-as-kill beg end)))


(defun copy-paragraph (&optional arg)
 "Copy paragraphes at point"
 (interactive "P")
 (let ((beg (progn (backward-paragraph 1) (point))) 
	(end (progn (forward-paragraph arg) (point))))
 (copy-region-as-kill beg end)))

(global-set-key (kbd "C-c w") 'copy-word)
(global-set-key (kbd "C-c l") 'copy-line)
(global-set-key (kbd "C-c p") 'copy-paragraph)
