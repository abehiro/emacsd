;;;
;;; Utility
;;;

;;;
;;; Xyzzy->emacs library
;;;
(fset 'get-universal-time #'current-time)
(fset 'format-date-string #'format-time-string)

;;;
;;; 日付／時刻挿入
;;;
;;;   Refer format-date-string:
;;;   http://xyzzy.s53.xrea.com/reference/wiki.cgi?p=format-date-string
(defun time-insert ()
	" Time insert "
	(interactive)
	(insert (format-date-string "%H:%M" (get-universal-time))))

(defun date-insert ()
	" Date insert "
	(interactive)
	(insert (format-date-string "%Y/%m/%d" (get-universal-time))))

(defun date2-insert ()
	" Date2 insert "
	(interactive)
	(insert (format-date-string "%Y-%m-%d_" (get-universal-time))))

;;;
;;; AppleScript実行
;;;

(setq ascriptpath "/usr/local/share/script")

;;; For test
(defun astest ()
  (interactive)
  (shell-command (concat "osascript " ascriptpath "/test.scpt")))

;;; For Safari to dual
(defun dualsafari ()
  (interactive)
  (shell-command (concat "osascript " ascriptpath "/dualsafari.scpt")))

;;; For Safari and Emacs
(defun safariemacs ()
  (interactive)
  (progn
    (shell-command (concat "osascript " ascriptpath "/safari.scpt"))
    ;(set-frame-position (selected-frame) 719 20)
    (set-frame-position (selected-frame) 800 20)
    (set-frame-size     (selected-frame) 85 30)))

;;; For maximize height of Emacs
(defun maxheight ()
  (interactive)
  (progn
    (shell-command (concat "osascript " ascriptpath "/safari.scpt"))
    (set-frame-position (selected-frame) 720 20)
    (set-frame-size     (selected-frame) 100 80)))

;;; For toggle Fn key
(defun fn ()
  (interactive)
  (progn
    (shell-command (concat "osascript " ascriptpath "/toggleFn.scpt"))))

;;; For toggle Dock autohide
(defun toggleDock ()
  (interactive)
  (progn
    (shell-command (concat "osascript " ascriptpath "/toggleDock.scpt"))))

;;; 日記作成
(defun open-diary () (interactive)
  (let ((dname "~/Dropbox/memo/diary") (fname) (fullpath))
       (progn
	 (setq fname (concat "diary_" (format-date-string "%Y-%m-%d.txt" (get-universal-time))))
	 (setq fullpath (concat dname "/" fname))
	 (if (or (get-buffer fname) (file-exists-p fullpath))
	     (find-file fullpath)
	   (progn
	     (find-file fullpath)
	     (insert (format-date-string "%Y/%m/%d %H:%m-" (get-universal-time))))))))

; Dictionary
;;; sdic-mode
(setq load-path (cons "/usr/local/share/emacs/site-lisp" load-path))
(autoload 'sdic-describe-word "sdic" "英単語の意味を調べる" t nil)
(global-set-key "\C-cw" 'sdic-describe-word)
(autoload 'sdic-describe-word-at-point "sdic" "カーソルの位置の英単語の意味を調べる" t nil)
(global-set-key "\C-cW" 'sdic-describe-word-at-point)

