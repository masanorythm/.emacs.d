;;; auto-insert.el --- time

;; Copyright (C) 2013  orange

;; Author: orange(setq auto-insert t) <orange@NX-SH-PC010>
;; Keywords: 
(setq auto-insert-query t)
(add-hook 'find-file-hook 'auto-insert)
(setq auto-insert-directory "~/.emacs.d/insert/")
(define-auto-insert '("^build\\.txt\\'" . "Ant") "build.txt")
