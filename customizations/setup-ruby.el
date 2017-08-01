;; Ruby config
(add-hook 'compilation-finish-functions
	  (lambda (buf strg)
	    (switch-to-buffer-other-window "*compilation*")
	    (read-only-mode)
	    (goto-char (point-max))
	    (local-set-key (kbd "C-q")
	      (lambda () (interactive) (quit-restore-window)))))

(add-hook 'ruby-mode-hook
	  (lambda () (local-set-key (kbd "C-c t") #'ruby-test-run)))

