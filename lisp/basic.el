;;; Basic for Mac/emacs
; Disable bootup screen
(setq inhibit-startup-message t)
(set-language-environment 'Japanese)  ; 言語を日本語にする。
(prefer-coding-system 'utf-8)         ; 言語はUTF-8
(setq make-backup-files nil)          ; バックアップ無効化
(tool-bar-mode 0)                     ; Hide tool bar
(setq visible-bell t)                 ; エラー音消去
;(setq truncate-lines nil)            ; 長い行を改行表示しない（バッファ単位）
(set-default 'truncate-lines t)       ; 長い行を改行表示しない（全バッファデフォルト設定）

(set-face-attribute 'default nil      ; 英語フォント
             :family "Menlo"             ;; font
             :height 150)                ;; font size
(set-fontset-font                     ; 日本語フォント
 nil 'japanese-jisx0208
; (font-spec :family "Hiragino Mincho Pro"))       ;; font
  (font-spec :family "Hiragino Kaku Gothic ProN")) ;; font

;; 半角と全角の比を1:2にしたければ
(setq face-font-rescale-alist
;     '((".*Hiragino_Mincho_pro.*" . 1.2)))
      '((".*Hiragino_Kaku_Gothic_ProN.*" . 1.2)));; Mac用フォント設定

;; 丸文字にしてみる
;; ref: http://oldtype.sumibi.org/show-page/Emacs.Emacs23のノウハウ
(when (eq window-system 'ns)
  (let ((my-font-height 120)
        (my-font (cond
                  (t   "Monaco")  ;; XCode 3.1 で使っているフォント
                  (nil "Menlo")   ;; XCode 3.2 で使ってるフォント
                  ))
        (my-font-ja "Hiragino Maru Gothic Pro"))
    (setq mac-allow-anti-aliasing t)

    ;; フォントサイズの微調節 (12ptで合うように)
    (setq face-font-rescale-alist
          '(("^-apple-hiragino.*" . 1.2)
            (".*osaka-bold.*" . 1.2)
            (".*osaka-medium.*" . 1.2)
            (".*courier-bold-.*-mac-roman" . 1.0)
            (".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
            (".*monaco-bold-.*-mac-roman" . 0.9)
            ("-cdac$" . 1.3)))

    ;; デフォルトフォント設定
    (when my-font
      (set-face-attribute 'default nil :family my-font :height my-font-height)
      ;;(set-frame-font (format "%s-%d" my-font (/ my-font-height 10)))
      )

    ;; 日本語文字に別のフォントを指定
    (when my-font-ja
      (let ((fn (frame-parameter nil 'font))
            (rg "iso10646-1"))
        (set-fontset-font fn 'katakana-jisx0201 `(,my-font-ja . ,rg))
        (set-fontset-font fn 'japanese-jisx0208 `(,my-font-ja . ,rg))
        (set-fontset-font fn 'japanese-jisx0212 `(,my-font-ja . ,rg))))))

; キー入れ替え command->option, option->command
(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))

; 行数表示
(global-linum-mode t)

