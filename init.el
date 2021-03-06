;; 启动emacs 不显示提示信息
(setq inhibit-startup-message t)

;; 背景色，前景色，光标颜色
(set-background-color "black")
(set-foreground-color "white")
(set-cursor-color "green")

;; 去掉菜单栏
(tool-bar-mode 0)
(scroll-bar-mode 0)

(require 'cc-mode)

;; set tab
(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)
(setq indent-line-function 'insert-tab)
(setq c-basic-offset 4)

;; set font
(set-default-font "Ubuntumono-12")
(set-fontset-font "fontset-default"  
                  'gb18030' ("Microsoft YaHei" . "unicode-bmp"))

;; 鼠标自动移开
(mouse-avoidance-mode 'animate)
(blink-cursor-mode nil)

;; 代码折叠
(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'c++-mode-hook 'hs-minor-mode)

;; 显示行号
(global-linum-mode 1)
(setq linum-format "%3d")


;; 拷贝
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

(add-to-list 'load-path "~/.emacs.d/")

;; ibus
;; sudo apt-get install ibus-el
(require 'ibus)
(add-hook 'after-init-hook 'ibus-mode-on)
(ibus-define-common-key ?\C-\s nil)
(ibus-define-common-key ?\C-/ nil)
(setq ibus-cursor-color '("DarkOrange" "green" "limegreen"))
(global-set-key (kbd "C-x e") 'ibus-disable)
(global-set-key (kbd "C-x z") 'ibus-enable)

;; git-emacs


;; auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)
(setq ac-quick-help-delay 0.01)

;; 上一次打开
(require 'session)
(load "desktop")
(add-hook 'after-init-hook 'session-initialize)
                                        ;(require 'desktop)
(desktop-save-mode 1)
(defun my-mydesktop-save ()
  (if (eq (desktop-owner) (emacs-pid))
      (desktop-save desktop-dirname)))
                                        ;(add-hook 'auto-save-hook 'my-desktop-save)
(desktop-load-default)
(add-hook 'kill-emacs-hook
          '(lambda()(desktop-save "~/")))

;;格式化整个文件函数
(defun indent-whole ()
  (interactive)
  (indent-region (point-min) (point-max))
  (message "format successfully"))
(load "~/.emacs.d/key-bind.el")
                                        ;(load "~/.emacs.d/xcscope.el")
                                        ;(load "~/.emacs.d/auto-insert.el")
(load "~/.emacs.d/c-style.el")

                                        ;(load "~/.emacs.d/zencoding/zencoding-mode.el")
;;(add-to-list "~/emacs.d/zencoding")
;;(require 'zencoding-mode)
;;(add-hook 'sgml-mode-hook 'zencoding-mode)
;;(load "~/.emacs.d/paredit.el")
(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp Mode.")
(require 'parenface)
(set-face-foreground 'paren-face "DimGray")


(load "~/.emacs.d/gtags.el")
;;(setq load-path (cons "/home/orange/global" load-path))
(autoload 'gtags-mode "gtags" "" t)
(setq c-mode-hook
      '(lambda ()
         (gtags-mode 1)))

