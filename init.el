(require 'cask)
(cask-initialize)

(menu-bar-mode 0)
(tool-bar-mode 0)
(setq make-backup-files nil)
(setq auto-save-default nil)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-z") 'advertised-undo)
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "M-?") 'help-for-help)
(global-set-key (kbd "M-s") 'replace-string)
(global-set-key (kbd "C-c C-c") 'find-tag)
(global-set-key (kbd "C-c C-b") 'pop-tag-mark)
(global-hl-line-mode 1)
(setq scroll-step 1)
(show-paren-mode t)
(put 'set-goal-column 'disabled nil)
(put 'downcase-region 'disabled nil)
(electric-pair-mode 1)
(setq default-tab-width 2)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; popwin
(require 'popwin)
(popwin-mode 1)
(setq popwin:special-display-config
 '(("*Gofmt Errors*" :noselect t)
   ("*godoc*" :regexp t :height 30)
   ("helm" :regexp t :height 22)
   ("*Shell Command Output*" :noselect t)))

;; powerline
(require 'powerline)
(powerline-default-theme)

;; blank highlight
(defface my-face-u '((t (:foreground "color-235" :underline t))) nil)
(defvar my-face-u 'my-face-u)
(defadvice font-lock-mode (before my-font-lock-mode ())
  (font-lock-add-keywords
   major-mode
   '(("[　\t]" 0 my-face-u append)
     ("[\t]+$" 0 my-face-u append)
     )))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)

;; helm
(require 'helm-config)
(helm-mode 1)
(global-set-key (kbd "C-r") 'helm-for-files)
(global-set-key (kbd "C-x C-y") 'helm-show-kill-ring)

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
(global-set-key (kbd "C-x C-r") 'revert-buffer-no-confirm)

;; cua
(cua-mode t)
(setq cua-enable-cua-keys nil)
(global-set-key (kbd "C-\\") 'cua-set-rectangle-mark)

;; redo
(require 'redo+)
(global-set-key (kbd "M-z") 'redo)

;; ruby
(setq ruby-insert-encoding-magic-comment nil)
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.jbuilder$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(require 'ruby-end)
(require 'ruby-block)
(add-hook 'ruby-mode-hook
      '(lambda()
        (setq flycheck-checker 'ruby-rubylint)
        (flycheck-mode t)
        (ruby-block-mode t)
        (abbrev-mode t)
        (setq ruby-block-highlight-toggle t)))

;; haml, yaml
(require 'haml-mode)
(require 'yaml-mode)

;; go-lang
(require 'go-mode)
(require 'go-autocomplete)
(add-hook 'go-mode-hook
          '(lambda()
            (flycheck-mode t)
            (setq c-basic-offset 4)
            (setq indent-tabs-mode t)
            (local-set-key (kbd "C-c C-c") 'godef-jump)
            (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)
            (local-set-key (kbd "C-c i") 'go-goto-imports)
            (local-set-key (kbd "C-c d") 'godoc)
            (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)))
(add-hook 'before-save-hook 'gofmt-before-save)

;; font color
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background nil :foreground "color-254" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 1 :width normal :foundry "default" :family "default"))))
 '(font-lock-builtin-face ((t (:foreground "color-198"))))
 '(font-lock-comment-face ((t (:foreground "brightblack"))))
 '(font-lock-constant-face ((t (:foreground "color-165"))))
 '(font-lock-function-name-face ((t (:foreground "cyan"))))
 '(font-lock-keyword-face ((t (:foreground "color-161"))))
 '(font-lock-string-face ((t (:foreground "color-94"))))
 '(font-lock-type-face ((t (:foreground "color-70"))))
 '(font-lock-variable-name-face ((t (:foreground "color-130"))))
 '(helm-buffer-directory ((t (:background "LightGray" :foreground "color-162"))))
 '(helm-buffer-process ((t (:foreground "color-240"))))
 '(helm-candidate-number ((t (:background "color-247" :foreground "black"))))
 '(helm-selection ((t (:background "color-19"))))
 '(helm-source-header ((t (:background "color-237" :foreground "white" :weight bold :height 1.3 :family "Sans Serif"))))
 '(helm-visible-mark ((t (:background "color-178"))))
 '(highlight ((t (:background "color-232"))))
 '(mode-line ((t (:background "brightblack" :foreground "white" :box (:line-width -1 :style released-button)))))
 '(mode-line-inactive ((t (:inherit mode-line :background "brightblack" :foreground "white" :box (:line-width -1 :color "grey75") :weight light))))
 '(region ((t (:background "color-19")))))
