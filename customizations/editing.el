;; Remove white spaces on save

(add-hook 'before-save-hook 'whitespace-cleanup)

;; Customizations relating to editing a buffer.
;; C-a conflicts with tmux (screen)
;; (global-set-key (kbd "C-x a") 'move-beginning-of-line)


;;;; Key binding to use "hippie expand" for text autocompletion
;;;; http://www.emacswiki.org/emacs/HippieExpand
;;(global-set-key (kbd "M-/") 'hippie-expand)
;;
;;;; Lisp-friendly hippie expand
;;(setq hippie-expand-try-functions-list
;;      '(try-expand-dabbrev
;;        try-expand-dabbrev-all-buffers
;;        try-expand-dabbrev-from-kill
;;        try-complete-lisp-symbol-partially
;;        try-complete-lisp-symbol))
;;
;;;; Highlights matching parenthesis
;;(show-paren-mode 1)
;;
;;;; Highlight current line
;;(global-hl-line-mode 1)
;;
;;;; Interactive search key bindings. By default, C-s runs
;;;; isearch-forward, so this swaps the bindings.
;;(global-set-key (kbd "C-s") 'isearch-forward-regexp)
;;(global-set-key (kbd "C-r") 'isearch-backward-regexp)
;;(global-set-key (kbd "C-M-s") 'isearch-forward)
;;(global-set-key (kbd "C-M-r") 'isearch-backward)
;;
;; Don't use hard tabs
(setq-default indent-tabs-mode nil)
;;
;;;; When you visit a file, point goes to the last place where it
;;;; was when you previously visited the same file.
;;;; http://www.emacswiki.org/emacs/SavePlace
;;(require 'saveplace)
;;(setq-default save-place t)
;;;; keep track of saved places in ~/.emacs.d/places
;;(setq save-place-file (concat user-emacs-directory "places"))
;;
;;;; Emacs can automatically create backup files. This tells Emacs to
;;;; put all backups in ~/.emacs.d/backups. More info:
;;;; http://www.gnu.org/software/emacs/manual/html_node/elisp/Backup-Files.html
;;(setq backup-directory-alist `(("." . ,(concat user-emacs-directory
;;                                               "backups"))))

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(setq auto-save-default nil)

;;
;;
;; comments
(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))
(global-set-key (kbd "C-;") 'toggle-comment-on-line)
;;
;;;; yay rainbows!
;;(global-rainbow-delimiters-mode t)
;;
;;;; use 2 spaces for tabs
;;(defun die-tabs ()
;;  (interactive)
;;  (set-variable 'tab-width 2)
;;  (mark-whole-buffer)
;;  (untabify (region-beginning) (region-end))
;;  (keyboard-quit))
;;
;;;; fix weird os x kill error
;;(defun ns-get-pasteboard ()
;;  "Returns the value of the pasteboard, or nil for unsupported formats."
;;  (condition-case nil
;;      (ns-get-selection-internal 'CLIPBOARD)
;;    (quit nil)))
;;
;;(setq electric-indent-mode nil)


(add-hook 'text-mode-hook
          (lambda () (auto-fill-mode)
            ;; (set-fill-column 80)
            ))

;; Inspired by
;; https://github.com/nicferrier/creole-mode/blob/e3a2b15b228c9c1df7560ec390424040d69b8bb7/creole-mode.el#L70
(defun fill-break-p ()
  "Basically just does not fill within links."
  (memq 'face (text-properties-at (point))))

(setq fill-nobreak-predicate
      (list 'fill-break-p))



;; Please no crlf from windows
; (prefer-coding-system 'utf-8)
; (set-default-coding-systems 'utf-8)
; (set-terminal-coding-system 'utf-8)
; (set-keyboard-coding-system 'utf-8)

; (setq-default buffer-file-coding-system 'utf-8)
(setq-default buffer-file-coding-system 'utf-8-unix)
(setq buffer-file-coding-system 'utf-8-unix)
(setq-default default-buffer-file-coding-system 'utf-8-unix)
(setq default-buffer-file-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)

; (defun no-junk-please-were-unixish ()
;   (let ((coding-str (symbol-name buffer-file-coding-system)))
;     (when (string-match "-\\(?:dos\\|mac\\)$" coding-str)
;       (set-buffer-file-coding-system 'unix))))

; (add-hook 'find-file-hooks 'no-junk-please-were-unixish)


(add-hook 'prog-mode-hook 'company-mode)
