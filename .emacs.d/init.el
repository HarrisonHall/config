;; Harrison Hall - emacs config

;; general
(setq auto-revert-mode t)
(setq scroll-step 1
      scroll-conservatively 10000)

(setq make-backup-files nil)


(xterm-mouse-mode 1)
(global-set-key (kbd "<mouse-5>") (lambda () (interactive) (scroll-up 3)))
(global-set-key (kbd "<mouse-4>") (lambda () (interactive) (scroll-down 3)))
;(setq mouse-wheel-scroll-amount '(3 ((shift) . 1))) ;; one line at a time
;(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
;(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time
;(setq mouse-wheel-progressive-speed nil)
(electric-pair-mode 1)
(column-number-mode)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
;;(setq warning-minimum-level :emergency)


(menu-bar-mode -1)
;(tool-bar-mode -1)
;(scroll-bar-mode -1)
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
(global-set-key (kbd "C-x C-x") 'delete-window)
;;(global-set-key (kbd "C-x r") 'query-replace)
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
;;(global-unset-key (kbd "<C-backspace>")) ;; todo
(global-set-key (kbd "C-x m") 'exchange-point-and-mark)  ;; jump to mark


;; use customized linum-format: add a addition space after the line number
(setq linum-format (lambda (line) (propertize (format (let ((w (length (number-to-string (count-lines (point-min) (point-max)))))) (concat "%" (number-to-string w) "d ")) line) 'face 'linum)))

;; other packages
(let ((default-directory "~/.emacs.d/plugins/"))
  (normal-top-level-add-subdirs-to-load-path))

(set-face-background 'vertical-border "#5e81ac")
(set-face-foreground 'vertical-border (face-background 'vertical-border))

(require 'xclip)
(xclip-mode 1)

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
(require 'flycheck)
(global-flycheck-mode)

;; toggle evil mode with C-z
(define-key evil-normal-state-map (kbd "C-z") 'evil-mode)
(global-set-key (kbd "C-z") 'evil-mode)

;; use yaml-mode for yaml files
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode))

;; use dockerfile mode
(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

;; use gdscript mode
(require 'gdscript-mode)

;; use markdown mode
(require 'markdown-mode)

;; use go mode
(add-to-list 'load-path "~/.emacs.d/plugins/go-mode/")
(autoload 'go-mode "go-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

;; use plantuml mode
;;(add-to-list 'load-path "~/.emacs.d/plugins/plantuml-mode/")
(require 'plantuml-mode)
(add-to-list 'auto-mode-alist '("\\.plantuml\\'" . plantuml-mode))
(add-to-list 'auto-mode-alist '("\\.plantuml\\'" . plantuml-mode))
;;(setq plantuml-jar-path (expand-file-name "/usr/share/java/plantuml/plantuml.jar"))
(setq plantuml-jar-path "/usr/share/java/plantuml/plantuml.jar")
(setq plantuml-default-exec-mode 'jar)
;;(add-hook 'plantuml-mode-hook
;;		  (lambda ()
;;			local-set-key (kbd "C-c C-c") 'plantuml-preview-buffer))
;;(add-to-list
;;  'org-src-lang-modes '("plantuml" . plantuml))


;; ido-mode - find files easier
(ido-mode t)
(ido-everywhere)
(setq ido-enable-flex-matching t)

;; code folding (hide-show mode)
(add-hook 'prog-mode-hook 'hs-minor-mode)
(global-set-key (kbd "C-x C-u") 'hs-hide-all)
(global-set-key (kbd "C-x C-d") 'hs-show-all)
(setq hs-special-modes-alist
  (mapcar 'purecopy
  '((c-mode "{" "}" "/[*/]" nil nil)
    (c++-mode "{" "}" "/[*/]" nil nil)
    (bibtex-mode ("@\\S(*\\(\\s(\\)" 1))
    (java-mode "{" "}" "/[*/]" nil nil)
    (js-mode "{" "}" "/[*/]" nil)
    ;; (html-mode "<!-- {{{ " "<!-- }}} -->" " -->" nil t)
    (html-mode "<\([A-Za-z][A-Za-z0-9]*\)[^>]*>.*?"  "</\1>" "-->" nil nil) ;gw: self edited, see blw ref:
	(mhtml-mode "<\([A-Za-z][A-Za-z0-9]*\)[^>]*>.*?"  "</\1>" "-->" nil nil) ;gw: self edited, see blw ref:
    ;; http://www.regular-expressions.info/examples.html
    )))
;; hideshowvis
(autoload 'hideshowvis-enable "hideshowvis" "Highlight foldable regions")
(require 'hideshowvis)
(autoload 'hideshowvis-minor-mode
  "hideshowvis"
  "Will indicate regions foldable with hideshow in the fringe."
  'interactive)
(dolist (hook (list 'emacs-lisp-mode-hook
                    'c++-mode-hook))
  (add-hook hook 'hideshowvis-enable))
(hideshowvis-symbols)

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
(add-hook 'org-mode-hook 'org-toggle-pretty-entities)
;;(setq org-agenda-files '("~/workspace/classes/about/todo/misc.org"))
(setq org-agenda-files (directory-files-recursively "~/workspace/classes" "\\.org$"))

;;;; Org coding
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))

(require 'eyebrowse)
(eyebrowse-mode t)

;; RSS
(require 'elfeed)
(setq elfeed-feeds
      '("https://old.reddit.com/.rss?feed=71e68a9313aae45cf6647d31e7ea6cae483f6628&user=capt_jelly"
        "https://news.ycombinator.com/rss"
        "https://www.nasa.gov/rss/dyn/breaking_news.rss"
		"https://github.com/HarrisonHall.private.atom?token=AGEQZQY3VH5WIPPP2GWPEZF6M7WI6"
		"http://suckless.org/atom.xml"
		))
(setf url-queue-timeout 30)
(global-set-key (kbd "M-e") 'elfeed)
(define-key elfeed-show-mode-map "u" 'elfeed-update-feed)
(add-hook 'elfeed-show-mode-hook
          (lambda()
            (local-set-key (kbd "u") 'elfeed-update-feed)))

;; annotate.el mode
;(require 'annotate)
;(add-hook 'prog-mode-hook 'annotate-mode)

;; Use smex instead of M-x for commands
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command) ;; normal M-x

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

;; discover-my-major help
;;(require 'discover-my-major)
;;(global-set-key (kbd "C-h C-m") 'discover-my-major)

;; dumb-jump
(require 'xref)
(require 'dumb-jump)
(add-to-list 'xref-backend-functions #'dumb-jump-xref-activate)
;; Use dumb-jump with M-.

;; bookmark modes
;(require 'bookmark+)
;(setq bmkp-auto-light-when-set 'all-in-buffer)
;(setq bmkp-auto-light-when-jump 'all-in-buffer)

;; imenu-list
(require 'imenu-list)
(global-set-key (kbd "C-x i") #'imenu-list-smart-toggle)

;; frame
(global-set-key (kbd "C-x f") 'make-frame-command)

;; copy-paste
;(setq x-select-enable-clipboard t)
;(setq x-select-enable-primary t)

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


;; Shutdown
(global-set-key (kbd "M-Q") 'server-shutdown)

;; Theme
(add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/themes/"))
(load-theme 'nord t)

;; gui settings
(set-face-attribute 'default nil :height 160)

;; startup
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)

(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg"
  (selected-frame))))
(add-hook 'window-setup-hook 'on-after-init)
(put 'narrow-to-region 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.p
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bmkp-last-as-first-bookmark-file "/home/harrison/.emacs.d/bookmarks"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Rebind keys modified by other packages
(global-set-key (kbd "C-x x") 'delete-window)
