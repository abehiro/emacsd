;;;
;;; Overall structures
;;;

(setq load-path (append (list "~/.emacs.d/lisp") load-path)) ;
;(setq load-path (cons "/usr/local/share/emacs/site-lisp" load-path))
(load-library "basic")    ; Basic        ~/.emacs.d/lisp/basic.el
(load-library "key")      ; Key bindings ~/.emacs.d/lisp/key.el
(load-library "utility")  ; Utility      ~/.emacs.d/lisp/utility.el
(load-library "launcher") ; Launcher     ~/.emacs.d/lisp/launcher.el

;; Dictionary
;  Charactor code
;  Font

;;; TRR22
;(add-to-list 'load-path "/usr/local/Cellar/emacs-mac/emacs-24.5-z-mac-5.18/share/emacs/site-lisp")
;(autoload 'trr "/usr/local/Cellar/emacs-mac/emacs-24.5-z-mac-5.18/share/emacs/site-lisp/trr" nil t)
