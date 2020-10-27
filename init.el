;;; -*- coding: utf-8; lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(setq gc-cons-threshold 100000000
      gc-cons-percentage 0.5)

(push (expand-file-name "lisp" user-emacs-directory) load-path)

;; 包配置
(require 'm-package-management)

;; 外观配置
(require 'm-appearance)
;; 主题配置
(require 'm-theme)
;; 接口增强配置
(require 'm-interface-enhancement)
;; 文件管理配置
(require 'm-file-manager)
(require 'm-navigation)
(require 'm-visual)
(require 'm-editing)

(require 'm-project-management)

(require 'm-programming)

(use-package go-mode
  :init
  (autoload 'go-mode "go-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode)))

;; (require 'cl)
(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook (go-mode . lsp-deferred))

(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

(use-package lsp-ui
  :commands lsp-ui-mode)

;; (require 'init-editing)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(doom-modeline pinyinlib counsel-tramp counsel-world-clock gnu-elpa-keyring-update diminish use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ivy-minibuffer-match-face-1 ((t (:inherit font-lock-doc-face :foreground nil)))))
