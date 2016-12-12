;;;
;;; Key bindings
;;;
;(provide 'key) ; "require"で読み込む時には必要
(global-set-key (kbd "C-h") 'delete-backward-char) ;C-h をBSに設定
(define-key global-map (kbd "C-M-k") 'windmove-up)     ; 分割Window間を移動 上（※うまくうごかん）
(define-key global-map (kbd "C-M-j") 'windmove-down)   ; 分割Window間を移動 下
(define-key global-map (kbd "C-M-l") 'windmove-right)  ; 分割Window間を移動 右
(define-key global-map (kbd "C-M-h") 'windmove-left)   ; 分割Window間を移動 左
(global-set-key [f1]  (lambda () (interactive) (switch-to-buffer "*scratch*")))
(global-set-key [f2]  (lambda () (interactive) (find-file "~/Dropbox/memo/memo.txt"))) ;(global-set-key [f2]  'open-diary)
(global-set-key [f3]  (lambda () (interactive) (switch-to-buffer (bury-buffer)))) ;(global-set-key [f3]  (lambda () (interactive) (switch-to-buffer (other-buffer))))
(global-set-key [f9]  '(lambda () (interactive) (open-path (get-path (get-line)))))
(global-set-key [f10] (lambda () (interactive) (open-path (get-path (get-line)))))
;(global-set-key [f10] '(lambda () (interactive) (open-path (get-path (get-line))))) ;(global-set-key [f10] (lambda () (interactive) (find-file "~/Dropbox/memo/link.txt")))
;(global-set-key (kbd "C-<f2>") (lambda () (interactive) (find-file "~/Dropbox/memo/memo.txt")))
(global-set-key (kbd "C-<f10>") (lambda () (interactive) (find-file "~/.emacs.d/init.el")))
(global-set-key (kbd "C-x C-t")   'time-insert)
(global-set-key (kbd "C-x C-d")   'date-insert)
(global-set-key (kbd "C-x C-M-d") 'date2-insert)
(global-set-key (kbd "C-M-k")     'kill-rectangle)
(global-set-key (kbd "C-M-y")     'yank-rectangle)
(global-set-key (kbd "C-x w m")   'maxheight)
(global-set-key (kbd "C-x w s")   'safariemacs)
(global-set-key (kbd "C-x t d")   'toggleDock)
(global-set-key (kbd "C-x t t")   'astest)
