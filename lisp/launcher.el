; Launcher

;;;
;;; リンク実行用
;;;
(defun open-path (path)
  (interactive)
  (open-path-mac path))

(defun get-path (line)
  (interactive)
  (let ((path nil) (p-list nil) (p nil)
	(path-list (list "/[^?:*<>|]*"
		         "~/[^?:*<>|]*"
			 "[CcDdPp]:\\\\[^/?:*<>|]*"
			 "\\\\\\\\[A-z0-9_ \\(\\)\\.\\-]+"
			 "\\(http\\|https\\)://[A-z0-9_/#?&;=\\.\\-]+"
			 "(*)$"
        )))
    (progn
      (setq p-list path-list)
      (while (not (null p-list))
	(setq p (car p-list))
	(if (string-match p line)
	    (setq path (match-string 0 line)))
	(setq p-list (cdr p-list)))
      path)))
  
(defun get-line ()
  (interactive)
  (let ((curpos (point)) (headpos nil) (tailpos nil))
    (progn
      (setq headpos (point-at-bol))
      (setq tailpos (point-at-eol))
      (copy-region-as-kill headpos tailpos)
      (pop-kill-ring))))

(defun app-discrimination (path)
  (interactive)
  (let ((appinfo nil) (appkind nil) (apppath nil)
	(head-list (list
		    (cons "text" "~")
		    (cons "file" "/.*¥¥.txt")
		    (cons "file" "~.*¥¥.txt")
		    (cons "file" "[CcDdPp]:\\\\")
		    (cons "file" "\\\\\\\\")
		    (cons "http" "\\(http\\|https\\)://")
		    (cons "lisp" "(")))
;	(ext  (list
;	       (cons "pdf" "file" "pdf"))))
	)
    (progn
      (setq hlist head-list)
      (while (and (null appinfo) (not (null hlist)) )
	(progn
	  (setq head (car hlist))
	  (setq appkind (car head))
	  (setq apppath (cdr head))
	  (if (string-match apppath path)
	      (setq appinfo (cons appkind path)))
	  (setq hlist (cdr hlist))))
      appinfo)))

;;; Mac用
(defun pop-kill-ring ()
  (interactive)
  (let ((str (substring-no-properties (car kill-ring))))
    (setq kill-ring (cdr kill-ring))
    str))

(defun open-path-mac (path)
  (interactive)
  (let ((appinfo nil) (appkind nil) (apppath nil))
    (progn
      (setq appinfo (app-discrimination path))
      (setq appkind (car appinfo))
      (setq apppath (cdr appinfo))
      (princ apppath)
      (cond ((equal appkind "http") 
          (call-process "/usr/bin/open" nil t  "-a" "/Applications/Safari.app" apppath))
	  ;(call-process "/usr/bin/open" nil t  "-a" "/Applications/Firefox.app" "--args" "-private" "-url" apppath))
	  ((equal appkind "pdf") 
	   (call-process "/usr/bin/open" nil t "-a" apppath))
	   ;(call-process "/usr/bin/open" nil t "-a" 
           ;              "/Applications/Adobe Acrobat X Pro/Adobe Acrobat Pro.app" path)
	  ((equal appkind "view")
	   (call-process "/usr/bin/open" nil t "-a" apppath))
	  ((equal appkind "lisp")
	   (eval-expression apppath))
	  ((equal appkind "text")
	   (find-file apppath))))))

