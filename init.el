(menu-bar-mode 0)
(tool-bar-mode 0)
(setq make-backup-files nil)
(setq auto-save-default nil)
(define-key global-map "\C-h" 'delete-backward-char)
(define-key global-map "\M-?" 'help-for-help)
(define-key global-map "\C-z" 'advertised-undo)
(define-key global-map "\M-s" 'replace-string)
(setq scroll-step 1)
(show-paren-mode t)

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
(autoload 'ruby-mode "ruby-mode" "Mode for editing ruby source files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))

;; php
(require 'php-mode)

;; haml
(require 'haml-mode)

;; yaml
(require 'yaml-mode)

;; anything
(require 'anything-startup)
(global-set-key (kbd "C-x b") 'anything-for-files)
(global-set-key (kbd "C-x C-y") 'anything-show-kill-ring)
(global-set-key (kbd "C-x M-x") 'anything-M-x)

;; auto-complete
(require 'auto-complete-config)
(ac-config-default)
(setq ac-use-menu-map t)
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)

;; reload
(defun revert-buffer-no-confirm (&optional force-reverting)
  (interactive "P")
  ;;(message "force-reverting value is %s" force-reverting)
  (if (or force-reverting (not (buffer-modified-p)))
      (revert-buffer :ignore-auto :noconfirm)
    (error "The buffer has been modified")))

(global-set-key (kbd "\C-r") 'revert-buffer-no-confirm)
