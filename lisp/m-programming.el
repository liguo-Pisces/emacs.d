;;; -*- coding: utf-8; lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; YASnippet
(use-package yasnippet
  :config
  (yas-global-mode 1))

;; Smartparens
(use-package smartparens)

;; Completion
;; Company
(require 'p-company)

;; Error Checking
;; Flycheck
(use-package flycheck
  :init
  (global-flycheck-mode))


(provide 'm-programming)
