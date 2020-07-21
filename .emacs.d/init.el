;; Harrison Hall - emacs config

;; general
(setq auto-revert-mode t)
(setq scroll-step 1
      scroll-conservatively 10000)

(setq make-backup-files nil)
(setq mouse-wheel-scroll-amount '(3 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time
(xterm-mouse-mode 1)
(setq mouse-wheel-progressive-speed nil)
(electric-pair-mode 1)
(column-number-mode)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
;;(setq warning-minimum-level :emergency)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(require 'linum)
(global-linum-mode t)
(add-hook 'prog-mode-hook 'hl-line-mode)
(add-hook 'prog-mode-hook 'delete-selection-mode)
(add-hook 'prog-mode-hook 'save-place-mode)
(set-default 'truncate-lines t)

;; custom keys
(global-set-key (kbd "C-x |") 'split-window-right)
(global-set-key (kbd "C-x \\") 'split-window-right)
(global-set-key (kbd "C-x -") 'split-window-below)
(global-set-key (kbd "C-x _") 'split-window-below)
(global-set-key (kbd "C-x x") 'delete-window)
(global-set-key (kbd "C-x C-x") 'delete-window)
(global-set-key (kbd "C-x r") 'query-replace)
(global-set-key (kbd "C-x q") 'keyboard-quit)
(global-set-key (kbd "C-u") 'undo)
(global-set-key (kbd "C-t") 'dired-sidebar-toggle-sidebar)
(global-set-key (kbd "C-h") 'hs-toggle-hiding)
(windmove-default-keybindings)  ;; shift to move between windows
(global-set-key (kbd "<C-up>") 'buf-move-up)  ;; moving windows
(global-set-key (kbd "<C-down>") 'buf-move-down)
(global-set-key (kbd "<C-left>") 'buf-move-left)
(global-set-key (kbd "<C-right>") 'buf-move-right)
(global-set-key (kbd "<C-up>") 'buf-move-up)  ;; swapping windows
(global-set-key (kbd "<C-down>") 'buf-move-down)
(global-set-key (kbd "<C-left>") 'buf-move-left)
(global-set-key (kbd "<C-right>") 'buf-move-right)
(global-unset-key (kbd "C-<backspace>")) ;; todo


;; use customized linum-format: add a addition space after the line number
(setq linum-format (lambda (line) (propertize (format (let ((w (length (number-to-string (count-lines (point-min) (point-max)))))) (concat "%" (number-to-string w) "d ")) line) 'face 'linum)))

;; other packages
(let ((default-directory "~/.emacs.d/plugins/"))
  (normal-top-level-add-subdirs-to-load-path))

(set-face-background 'vertical-border "#5e81ac")
(set-face-foreground 'vertical-border (face-background 'vertical-border))

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

;; markdown mode
(require 'markdown-mode)

;; code folding (hide-show mode)
(add-hook 'prog-mode-hook 'hs-minor-mode)
(global-set-key (kbd "C-x C-u") 'hs-hide-all)
(global-set-key (kbd "C-x C-d") 'hs-show-all)

;; magit
(add-to-list 'load-path "~/.emacs.d/site-lisp/magit/lisp")
(require 'magit)
(with-eval-after-load 'info
  (info-initialize)
  (add-to-list 'Info-directory-list
               "~/.emacs.d/site-lisp/magit/Documentation/"))
(add-hook 'after-save-hook 'magit-after-save-refresh-status)

;; move windows
(require 'buffer-move)

;; hl todo
(require 'hl-todo)
(setq hl-todo-keyword-faces
      '(("TODO"   . "#d08770")
        ("FIXME"  . "#d08770")
        ("DEBUG"  . "#d08770")
        ("GOTCHA" . "#d08770")
        ("STUB"   . "#d08770")))
(add-hook 'prog-mode-hook 'hl-todo-mode)

;; org-mode
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(require 'org-brain)
(add-hook 'org-mode-hook
          (lambda()
            (local-set-key (kbd "C-c b") '(org-brain-prefix-map org-mode-map))
            (local-set-key (kbd "C-c t") 'org-show-todo-tree)))
;;(setq org-agenda-files '("~/workspace/classes/about/todo/misc.org"))
(setq org-agenda-files (directory-files-recursively "~/workspace/classes" "\\.org$"))

(require 'eyebrowse)
(eyebrowse-mode t)

;; RSS
(require 'elfeed)
(setq elfeed-feeds
      '("https://old.reddit.com/.rss?feed=71e68a9313aae45cf6647d31e7ea6cae483f6628&user=capt_jelly"
        "https://news.ycombinator.com/rss"
        "https://www.nasa.gov/rss/dyn/breaking_news.rss"))
(setf url-queue-timeout 30)
(global-set-key (kbd "M-e") 'elfeed)
(define-key elfeed-show-mode-map "u" 'elfeed-update-feed)
(add-hook 'elfeed-show-mode-hook
          (lambda()
            (local-set-key (kbd "u") 'elfeed-update-feed)))

;; movement/motion
(require 'doremi)
(require 'window-movement)
(global-set-key (kbd "<M-down>") 'win-resize-minimize-vert)
(global-set-key (kbd "<M-up>") 'win-resize-enlarge-vert)
(global-set-key (kbd "<M-left>") 'win-resize-minimize-horiz)
(global-set-key (kbd "<M-right>") 'win-resize-enlarge-horiz)
(global-set-key (kbd "<M-up>") 'win-resize-enlarge-horiz)
(global-set-key (kbd "<M-down>") 'win-resize-minimize-horiz)
(global-set-key (kbd "<M-left>") 'win-resize-enlarge-vert)
(global-set-key (kbd "<M-right>") 'win-resize-minimize-vert)


;; dumb-jump
(require 'xref)
(require 'dumb-jump)
(add-to-list 'xref-backend-functions #'dumb-jump-xref-activate)

;; frame
(global-set-key (kbd "C-x f") 'make-frame-command)

;; copy-paste
(setq x-select-enable-clipboard t)

;; closing emacs
;; define function to shutdown emacs server instance
(defun server-shutdown ()
  "Save buffers, Quit, and Shutdown (kill) server"
  (interactive)
  (save-some-buffers)
  (kill-emacs))

;; tabbing
(setq-default c-basic-offset 4
              tab-width 4
              indent-tabs-mode t)
(c-set-offset 'case-label '+)
(add-hook 'python-mode-hook 'guess-style-guess-tabs-mode)
(add-hook 'python-mode-hook (lambda ()
                              (guess-style-guess-tab-width)))


(global-set-key (kbd "M-Q") 'server-shutdown)

;; Theme
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
(put 'narrow-to-region 'disabled nil)
