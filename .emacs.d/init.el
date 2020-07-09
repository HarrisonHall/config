;; Harrison Hall - emacs config

;; general
(setq auto-revert-mode t)
(setq scroll-step 1
      scroll-conservatively 10000)

(setq make-backup-files nil)
(setq-default indent-tabs-mode nil)
(xterm-mouse-mode 1)
(electric-pair-mode 1)
(column-number-mode)
;;(setq warning-minimum-level :emergency) 

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(require 'linum)
(global-linum-mode t)
(add-hook 'prog-mode-hook 'hl-line-mode)
(set-default 'truncate-lines t)

;; custom keys
(global-set-key (kbd "C-x |") 'split-window-right)
(global-set-key (kbd "C-x \\") 'split-window-right)
(global-set-key (kbd "C-x -") 'split-window-below)
(global-set-key (kbd "C-x _") 'split-window-below)
(global-set-key (kbd "C-x x") 'delete-window)
(global-set-key (kbd "C-x <right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-x <up>") 'enlarge-window-vertically)
(global-set-key (kbd "C-x <left>") 'shrink-window-horizontally)
(global-set-key (kbd "C-x <down>") 'shrink-window-horizontally)
(global-set-key (kbd "C-x r") 'query-replace)
(global-set-key (kbd "C-x q") 'keyboard-quit)
(global-set-key (kbd "C-u") 'undo)
(global-set-key (kbd "C-t") 'dired-sidebar-toggle-sidebar)

;; use customized linum-format: add a addition space after the line number
(setq linum-format (lambda (line) (propertize (format (let ((w (length (number-to-string (count-lines (point-min) (point-max)))))) (concat "%" (number-to-string w) "d ")) line) 'face 'linum)))

;; other packages
(let ((default-directory "~/.emacs.d/plugins/"))
  (normal-top-level-add-subdirs-to-load-path))

;;(require 'all-the-icons)
(require 'dired-sidebar)  ;; sidebar
(setq dired-sidebar-theme 'nerd)  ;; no icons
(require 'powerline)
(powerline-default-theme)
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(require 'auto-complete-config)
(ac-config-default)
(require 'evil)

;; toggle evil mode with C-z
(define-key evil-normal-state-map (kbd "C-z") 'evil-mode)
(global-set-key (kbd "C-z") 'evil-mode)

;; use yaml-mode for yaml files
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode))

;; magit
(add-to-list 'load-path "~/.emacs.d/site-lisp/magit/lisp")
(require 'magit)
(with-eval-after-load 'info
  (info-initialize)
  (add-to-list 'Info-directory-list
               "~/.emacs.d/site-lisp/magit/Documentation/"))

;; org-mode
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)


;; theme
(add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/themes/"))
(load-theme 'nord t)


;; startup
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)

(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg"
  (selected-frame))))
(add-hook 'window-setup-hook 'on-after-init)
