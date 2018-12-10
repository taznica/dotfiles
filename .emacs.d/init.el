;; straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; install use-package
(straight-use-package 'use-package)

;; fallback use-package to straight.el
(setq straight-use-package-by-default t)


;; UTF-8
(prefer-coding-system 'utf-8)

;; disable *.~
(setq make-backup-files nil)

;; disable .#*
(setq auto-save-default nil)

;; delete auto save files
(setq delete-auto-save-files t)

;; prevent auto-save-list to be created
(setq auto-save-list-file-prefix nil)

;; column / line
(column-number-mode t)
(global-linum-mode t)
(setq linum-format "%4d \u2502")

;; show full path in the titlebar
(setq frame-title-fomat "%f")

;; tab
(setq-default tab-width 4 indent-tabs-mode nil)

;; startup message
(setq inhibit-startup-message t)

;; scratch message
(setq initial-scratch-message "")

;; menu bar (top)
(menu-bar-mode -1)

;; tool bar (bottom of menu bar)
(tool-bar-mode -1)

;; pareable brackets
(show-paren-mode t)

;; mac key bind
;;(straight-use-package 'redo)
;;(straight-use-package 'mac-key-mode)
;;(mac-key-mode 1)

;; option to meta
(setq mac-option-modifier 'meta)

;; y or n
(fset 'yes-or-no-p 'y-or-n-p)

;; scroll by 1 line
(setq scroll-conservatively 1)

;; select by shift + arrow
;;(straight-use-package 'pc-selection-mode)
;;(setq pc-select-selection-keys-only t)
;;(pc-selection-mode 1)

;; beep
(defun my-bell-function ()
  (unless (memq this-command
        '(isearch-abort abort-recursive-edit exit-minibuffer
              keyboard-quit mwheel-scroll down up next-line previous-line
              backward-char forward-char))
    (ding)))
(setq ring-bell-function 'my-bell-function)

;; move multi window
(global-set-key (kbd "C-x <left>")  'windmove-left)
(global-set-key (kbd "C-x <down>")  'windmove-down)
(global-set-key (kbd "C-x <up>")    'windmove-up)
(global-set-key (kbd "C-x <right>") 'windmove-right)

;; C-h is backspace
(global-set-key "\C-h" 'delete-backward-char)

;; company
(straight-use-package 'company)
(use-package company)
(global-company-mode)
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 2)
(setq company-selection-wrap-around t)
