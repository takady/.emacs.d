(menu-bar-mode 0)
(tool-bar-mode 0)
(setq make-backup-files nil)
(setq auto-save-default nil)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-z") 'advertised-undo)
(global-set-key (kbd "M-?") 'help-for-help)
(global-set-key (kbd "M-s") 'replace-string)
(setq scroll-step 1)
(show-paren-mode t)
(put 'set-goal-column 'disabled nil)
(put 'downcase-region 'disabled nil)

;; pacage repos: MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

;; blank highlight
(defface my-face-b-1 '((t (:background "red"))) nil)
(defface my-face-u-1 '((t (:background "red" :underline t))) nil)
(defvar my-face-b-1 'my-face-b-1)
(defvar my-face-u-1 'my-face-u-1)

(defadvice font-lock-mode (before my-font-lock-mode ())
 (font-lock-add-keywords
 major-mode
 '(("[　\t]" 0 my-face-b-1 append)
 ("[ \t]+$" 0 my-face-u-1 append)
 )))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)

;; current line highlight
(defface hlline-face
  '((((class color)
      (background dark))
     (:background "dark slate gray"))
    (((class color)
      (background light))
     (:background  "#1a1a1a"))
    (t
     ()))
  "*Face used by hl-line.")
(setq hl-line-face 'hlline-face)
(global-hl-line-mode)

;; ruby
(setq ruby-insert-encoding-magic-comment nil)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(require 'ruby-end)
(require 'ruby-block)
(setq ruby-block-highlight-toggle t)
(defun ruby-mode-hooks ()
  (ruby-block-mode t)
  (abbrev-mode 1)
  (electric-pair-mode t)
  (electric-indent-mode t)
  (electric-layout-mode t))
(add-hook 'ruby-mode-hook 'ruby-mode-hooks)

;; php
(require 'php-mode)

;; haml
(require 'haml-mode)

;; yaml
(require 'yaml-mode)

;; anything
(require 'anything-startup)
(global-set-key (kbd "C-x C-x") 'anything-for-files)
(global-set-key (kbd "C-x C-y") 'anything-show-kill-ring)
(global-set-key (kbd "C-x M-x") 'anything-M-x)

;; auto-complete
(require 'auto-complete-config)
(ac-config-default)
(setq ac-use-menu-map t)
(define-key ac-menu-map "C-n" 'ac-next)
(define-key ac-menu-map "C-p" 'ac-previous)

;; reload
(defun revert-buffer-no-confirm (&optional force-reverting)
  (interactive "P")
  (if (or force-reverting (not (buffer-modified-p)))
      (revert-buffer :ignore-auto :noconfirm)
    (error "The buffer has been modified")))
(global-set-key (kbd "C-r") 'revert-buffer-no-confirm)

;; cua
(cua-mode t)
(setq cua-enable-cua-keys nil)
(global-set-key (kbd "C-\\") 'cua-set-rectangle-mark)

;; redo
(require 'redo+)
(global-set-key (kbd "M-z") 'redo)
