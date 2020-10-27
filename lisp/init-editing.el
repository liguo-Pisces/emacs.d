(define-key global-map (kbd "RET") 'newline-and-indent)

(setq-default buffers-menu-max-size 30
	      case-fold-search t
	      compilation-scroll-output t
	      ediff-split-window-function 'split-window-horizontally
	      ediff-window-setup-function 'ediff-setup-windows-plain
	      grep-highlight-matches t
	      grep-scroll-output t
	      indent-tabs-mode nil
	      line-spacing 0
	      mouse-yank-at-point t
	      set-mark-command-repeat-pop t
	      tooltip-delay 1.5
	      ;; void problems with crontabs, etc.
	      ;; require-final-newline t ; bad idea, could accidentally edit others' code
	      truncate-lines nil
	      truncate-partial-width-windows nil
	      ;; visible-bell has some issue
	      ;; @see https://github.com/redguardtoo/mastering-emacs-in-one-year-guide/issues/9#issuecomment-97848938
	                    visible-bell nil)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

(electric-pair-mode 1)

(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)

(setq inhibit-startup-message t)

(global-hl-line-mode 1)

(defvar my-linum-inhibit-modes
  '(eshell-mode
    shell-mode
    js-comint-mode
    profiler-report-mode
    ffip-diff-mode
    dictionary-mode
    erc-mode
    dired-mode
    help-mode
    text-mode
    fundamental-mode
    jabber-roster-mode
    jabber-chat-mode
    inferior-js-mode
    inferior-python-mode
    ivy-occur-grep-mode ; better performance
    ivy-occur-mode ; better performance
    twittering-mode
    compilation-mode
    weibo-timeline-mode
    woman-mode
    Info-mode
    calc-mode
    calc-trail-mode
    comint-mode
    gnus-group-mode
    gud-mode
    org-mode
    vc-git-log-edit-mode
    log-edit-mode
    term-mode
    w3m-mode
    speedbar-mode
    gnus-summary-mode
    gnus-article-mode
    calendar-mode)
  "Major modes without line number.")

(when (fboundp 'global-display-line-numbers-mode)
  (defun display-line-numbers-mode-hook-setup ()
    (setq display-line-numbers (not (or (memq major-mode my-linum-inhibit-modes)
                                        ;; don't show line number for certain file extensions
                                        (should-use-minimum-resource)))))
  (add-hook 'display-line-numbers-mode-hook 'display-line-numbers-mode-hook-setup)
  (run-with-idle-timer 2 nil #'global-display-line-numbers-mode))

(provide 'init-editing)
