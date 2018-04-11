
;;
;; ---- #happymacs --------------------
;;  "cheerful emacs for modern humans"
;;  created: 01/08/2015
;; ------------------------------------
;;

;; --- TODO ---
;;
;; TOP 3:
;; • autoformat
;; • git simple stage and commit current buffer
;; • "eval" current buffer depending on lang mode

;; • modeline line nums are borked sometimes in brew emacs (not railwaycat)
;; • prevent copy from clearing region
;; • tabs
;; • fix indenting - use tabs
;; • lisp paren cuddling - change formatting?
;; • show total line count in modeline
;; • shortcut key for reindent region
;; • autocomplete / etags
;; • spell checking
;; • move into dropbox
;; • shortcuts for window/frame movement
;; • function lists/jumps
;; • docco for symbol under cursor
;; • change minimap line hl color from yellow to light gray
;; • add pre and post init.el calls
;; • happimacs
;; • swap ctrl and super on win and linux then remove custom ctrl bindings
;; • load user packages from prehook
;; • custom super key in prehook (eg for tablet kbs)
;; • switch between standard LISP indenting and javaish indeting in prehook
;; • switch between spaces and tabs for indenting in prehook
;; • esc to quit help windows (act as q)
;; • fix backward kill word to not kill past SOL
;; • turn off/hide cursor in minimap
;; • add irony for C mode
;; • when SOL, alt-right should move to first non-whitespace character
;; • remap meta-x to something better
;; • remap esc to quit
;; • flycheck, flyspell
;; • fix weird line duplication flakes

;; ---- TODO done
;;
;; • del current line
;; • dupe current line
;; • highilght current line in fringe?
;; • ctrl s to save file
;; • ctrl o to open file
;; • start of line / eol shortcut keys
;; • speedbar / goog-nav
;; • project mgmt - helm?

;; ---- FOUNDATION ----

(load-file "~/.config/aetherwolf/emacs/functions.el")

;; ---- PACKAGE MANAGEMENT ----

;(require 'package)
;(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
;                    (not (gnutls-available-p))))
;       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
;  (add-to-list 'package-archives (cons "melpa" url) t))
;(when (< emacs-major-version 24)
;  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
;(package-initialize)

(require 'package)

(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
;;(add-to-list 'package-archives '("melpa" . "http://melpa-stable.milkbox.net/packages/") t)
;;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
;;(add-to-list 'package-archives '("tromey" . "http://tromey.com/elpa/") t)

(package-initialize)
(package-refresh-contents)

; (when (not package-archive-contents)
;   (package-refresh-contents))

(defvar my-packages
  '(
        aggressive-indent
        cider
        clang-format
        clojure-mode
        clojure-mode-extra-font-locking
        color-theme-sanityinc-tomorrow
        company
        ;; ergoemacs-mode
        ;; eldoc
        exec-path-from-shell
        fuzzy-format
        flx
        flx-ido
        ;; flyspell
        git-gutter
        git-gutter+
        git-gutter-fringe
        helm
        helm-projectile
        ;; icicles
        ido-ubiquitous
        ;;      ido-completing-read
        ;;        neotree
        ;;lispy
        ;ivy
        minimap ;; sublime-stye minimap, toggle with <f5>
        nyan-mode
        org ;; everyone seems to love org-mode
        pager
        ;;      paredit ;; better sexp editing for clojure etc
        shell-pop
        pretty-mode
        project-explorer
        projectile
        rainbow-delimiters ;; show nested parens with matching colors
        rainbow-mode ;; pretty syntax for hex colors eg #0000ff
        redo+ ;; modern undo/redo - less powerful than emacs native but easier to use
        saveplace ;; restore last known cursor location in current file on focus
        ;; project-persist-drawer
        ;; ppd-sr-speedbar
        slime
        smartparens
        smex
        ;;        smooth-scrolling
        ;;      srefactor
        tabbar
        ;; windmove
        ;;        tagedit
        magit
        ))

;; ;; fix shell on osx
;; (if (eq system-type 'darwin)
;;      (add-to-list 'my-packages 'exec-path-from-shell))

(dolist (p my-packages)
  (when (not (package-installed-p p))
        (package-install p)))

;; --- Local packages ---

;(add-to-list 'load-path "~/.config/aetherwolf/emacs/local-packages")
;;(add-to-list 'load-path "~/.happymacs/local-packages/lispy")
;; (load "~/.happymacs/local-packages/aggressive-indent/aggressive-indent.el")
;;(load "~/.happymacs/local-packages/git-gutter+/git-gutter+.el") ;; just use for committing, also melpa version is borked
;;(load "~/.happymacs/local-packages/nyan-mode/nyan-mode.el")
;;(load "~/.happymacs/local-packages/slime/slime.el")
;;(load "~/.happymacs/local-packages/smartparens/smartparens.el")
;;(load "~/.happymacs/local-packages/uncrustify/uncrustify.el")
;;(load "~/.happymacs/local-packages/lispy/lispy.el")

;; (load "git-gutter-fringe+/git-gutter-fringe+.el") ;; "

;; (load "emacs-nav/nav.el")
;; (load "sr-speedbar/sr-speedbar.el")

;; (load "sublimity/sublimity.el")
;; (load "sublimity/sublimity-scroll.el")
;; (load "sublimity/sublimity-map.el")
;; (load "sublimity/sublimity-attractive.el")

(message "#happymacs: Package setup complete.")

;; --- Environment config ---
;;

;;(set-variable ‘scroll-step 1)
;;(set-variable ‘scroll-conservatively 5)
;; (setq scroll-step 1)
;; (setq scroll-conservatively 50)

;; ---- make scrolling less bad
;; (setq redisplay-dont-pause t
;;        scroll-margin 1
;;        scroll-step 1
;;        scroll-conservatively 10000
;;        scroll-preserve-screen-position 1)

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ; one line at a time
(setq mouse-wheel-progressive-speed nil)            ; don't accelerate scrolling
(setq-default smooth-scroll-margin 0)
(setq scroll-step 1
      scroll-margin 1
      scroll-conservatively 100000)

(setq delete-by-moving-to-trash t)

;; ---- backups
;; (setq make-backup-files nil)
(setq backup-directory-alist '(("." . "~/.cache/emacs/backups")))
(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms '((".*" "~/.cache/emacs/auto-save-list/" t)))

;; ---- sessions
(setq desktop-dirname             "~/.cache/emacs"
          desktop-base-file-name          "emacs.desktop"
          desktop-base-lock-name          "lock"
          desktop-path            (list desktop-dirname)
          desktop-save            t
          desktop-files-not-to-save       "^$" ;reload tramp paths
          desktop-load-locked-desktop nil)
(desktop-save-mode 1) ; save session on quit
(add-hook 'auto-save-hook (lambda () (desktop-save-in-desktop-dir))) ; autosave sessions

(message "#happymacs: environment setup complete.")

;; --- Navigation ---
;;
(load-file "~/.config/aetherwolf/emacs/navigation.el")
(message "#happymacs: navigation config complete.")

;; ---- Minibuffer
;;

(setq savehist-file "~/.cache/emacs/mb-history") ; save history to this location
(setq savehist-additional-variables '(kill-ring search-ring regexp-search-ring))
(savehist-mode 1)

(message "#happymacs: editing setup complete.")

;; --- Appearance ---
;;

;; ---- general ux
(setq-default cursor-type 'bar) ; use bar instead of box for cursor
(setq gdb-many-windows t) ; enable gui mode for gdb
(setq ring-bell-function 'ignore) ; don't beep
                                                                                ;(menu-bar-mode -1)
(setq frame-title-format '("%f - " user-real-login-name "@" system-name))

(when (fboundp 'tool-bar-mode) (tool-bar-mode -1)) ; hide toolbar
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1)) ; hide scrollbars
;; (when (display-graphic-p) (tool-bar-mode 0)) ; hide toolbar
(show-paren-mode 1) ; show matching parens
;; (setq show-paren-style 'expression) ; highlight entire bracket expression
(setq inhibit-splash-screen t) ; hide splash screen
(fset 'yes-or-no-p 'y-or-n-p) ; ask shorter questions
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "s-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "s--") 'text-scale-decrease)
(setq echo-keystrokes 0.0)
;; (setq use-dialog-box nil)

;; open these things in the same window instead of a "popup"
(setq same-window-regexps (quote ("\*vc\-.+\*" "\*magit.+\*" "grep" "\*compilation\*\(\|<[0-9]+>\)" "\*Help\*\(\|<[0-9]+>\)" "\*Shell Command Output\*\(\|<[0-9]+>\)" "\*dictem.*")))

;; ---- prettify-symbols
(global-prettify-symbols-mode +1)

;; ---- line highlight
(global-hl-line-mode 1) ; highlight current line
;; (set-face-background 'hl-line "#3e4446")
;; (set-face-foreground 'highlight nil) ; retain syntax hl

;; ---- theme
(load-theme 'sanityinc-tomorrow-eighties t)

;; ---- line numbers
(global-linum-mode t)
(set-face-attribute 'fringe nil :background "#2D2D2D")
(set-face-attribute 'linum nil :foreground "gray40" :background "#2D2D2D")

(defun display-startup-echo-area-message () (message ""))

;; (setq initial-scratch-message "")            

;; ;; ---- suppress pointless minibuff messages

;; (defadvice message (around my-message-filter activate)
;;   (unless (string-match "Text is read-only" (or (ad-get-arg 0) ""))
;;     ad-do-it))

;; (setq minibuffer-prompt-properties
;;    (quote
;;      (read-only t point-entered minibuffer-avoid-prompt face minibuffer-prompt)))

(plist-put minibuffer-prompt-properties 'point-entered 'minibuffer-avoid-prompt)

;; fonts & colors
(set-face-attribute 'default nil
                                        :family "Inconsolata"
                                        :family "Menlo"
                                        :height 140
                                        :weight 'normal
                                        :width 'normal)

(when (functionp 'set-fontset-font)
  (set-fontset-font "fontset-default"
                                        'unicode
                                        (font-spec :family "DejaVu Sans Mono"
                                                           :width 'normal
                                                           :size 12.4
                                                           :weight 'normal)))


;; ;; TODO: make this update the application title
;; ;; automatically save buffers associated with files on buffer switch
;; ;; and on windows switch
;; (defadvice switch-to-buffer (before save-buffer-now activate)
;;       (when buffer-file-name (save-buffer)))
;; (defadvice other-window (before other-window-now activate)
;;       (when buffer-file-name (save-buffer)))
;; (defadvice windmove-up (before other-window-now activate)
;;       (when buffer-file-name (save-buffer)))
;; (defadvice windmove-down (before other-window-now activate)
;;       (when buffer-file-name (save-buffer)))
;; (defadvice windmove-left (before other-window-now activate)
;;       (when buffer-file-name (save-buffer)))
;; (defadvice windmove-right (before other-window-now activate)
;;       (when buffer-file-name (save-buffer)))

(message "#happymacs: UI setup complete.")

;; --- Package config ---
;;

;; ---- org mode
;;(require 'org)
;; (setq org-base-path (expand-file-name "~/org"))

;; (setq org-default-notes-file-path (format "%s/%s" org-base-path "notes.org")
;;       todo-file-path                  (format "%s/%s" org-base-path "gtd.org")
;;       journal-file-path               (format "%s/%s" org-base-path "journal.org")
;;       today-file-path                 (format "%s/%s" org-base-path "2010.org"))

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
;;  (setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
  (setq exec-path (append "/usr/local/bin/uncrustify" exec-path)))

;; ---- ido mode

(setq ido-enable-flex-matching t
          ;;      ido-auto-merge-work-directories-length -1
          ;;      ido-create-new-buffer 'always
          ido-use-filename-at-point 'guess
          ido-everywhere t
          ido-default-buffer-method 'selected-window
          )

(ido-mode 1)
(ido-everywhere 1)
;;(require 'ido-ubiquitous)
(ido-ubiquitous-mode 1)
;;(setq org-completion-use-ido t)
;;(setq magit-completing-read-function 'magit-ido-completing-read)
;;(setq gnus-completing-read-function 'gnus-ido-completing-read)

;; helm seems nicer than smex
;; ---- smex
;; (smex-initialize)
;; (global-set-key (kbd "M-x") 'smex)
;; (global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; ;; This is your old M-x.
;; (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; ---- helm
(setq helm-M-x-fuzzy-match t
          ;; helm-M-x-reverse-history t
          helm-buffers-fuzzy-matching t
          helm-recentf-fuzzy-match t
          )
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "s-b") 'helm-mini)
(global-set-key (kbd "s-o") 'helm-find-files)

;; ---- rainbow delims
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; ---- paredit mode
;; (add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
;; (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
;;(global-rainbow-delimiters-mode)
;;(rainbow-delimiters-mode)

;; ---- hyperspec
(eval-after-load "slime"
  '(progn
     (setq common-lisp-hyperspec-root
           "/usr/local/share/doc/hyperspec/HyperSpec/")
     (setq common-lisp-hyperspec-symbol-table
           (concat common-lisp-hyperspec-root "Data/Map_Sym.txt"))
     (setq common-lisp-hyperspec-issuex-table
           (concat common-lisp-hyperspec-root "Data/Map_IssX.txt"))))

;; ;; ---- smooth scrolling
;; (setq scroll-margin 5 scroll-conservatively 9999 scroll-step 1)

;; ---- minimap
(when (display-graphic-p)
  (message "#happymacs: gui present, enabling minimap")
  (setq minimap-window-location 'right
                minimap-hide-fringes t
                minimap-highlight-line -1 ; broken, bug in package
                minimap-update-delay 0.3) ; slower updates for smoother scrolling

  (add-hook 'minimap-sb-mode-hook (lambda ()
                                                                        (setq mode-line-format nil)
                                                                        (hl-line-mode -1)
                                                                        (setq mode-line-format nil)
                                                                                ; fix hardcoded ugly yellow line highlight
                                                                        (setq minimap-line-overlay (make-overlay (point) (1+ (point)) nil t))
                                                                        ;; (overlay-put minimap-line-overlay 'face '(:background "gray40" :foreground "gray40"))
                                                                        (overlay-put minimap-line-overlay 'priority 7)
                                                                                ; TODO disable buffer cursor or change cursor color
                                                                        ))
  (add-hook 'minimap-mode-hook (lambda () (setq mode-line-format nil) (hl-line-mode -1)))
  (global-set-key (kbd "<f6>") 'minimap-toggle)
  ;;(minimap-toggle)
  ;;(minimap-create)
  )



;; ;; ---- emacs-nav
;; (require 'nav)
;; ;; (nav-disable-overeager-window-splitting)
;; (global-set-key (kbd "<f8>") 'nav-toggle)

;; ---- nyanyanyan cat!!
(nyan-mode 1)
(setq nyan-wavy-trail t)

;; ---- Rainbow mode (display colors for hex strings etc)
(define-globalized-minor-mode my-global-rainbow-mode rainbow-mode (lambda () (rainbow-mode 1)))
(my-global-rainbow-mode 1)

;; ---- sr-speedbar
;; (setq speedbar-use-images nil)
;; (make-face 'speedbar-face)
;; (set-face-font 'speedbar-face "Inconsolata-12")
;; (setq speedbar-mode-hook '(lambda () (buffer-face-set 'speedbar-face)))

;; ---- project-explorer sidebar
(global-set-key (kbd "<f5>") 'project-explorer-toggle)

;; ---- redo+
(setq undo-no-redo t) ;; discard the old undo branch immediately

;; ---- projectile
(projectile-global-mode)
;; (add-hook 'ruby-mode-hook 'projectile-mode)

;; ---- git-gutter-fringe+
(global-git-gutter-mode t)
;;(global-git-gutter+-mode t)
;;(git-gutter-fr+-minimal)
(git-gutter:linum-setup)

;; (set-face-foreground 'git-gutter-fr+-added    "#5C97CF")
;; (set-face-foreground 'git-gutter-fr+-modified "#5C97CF")
;; (set-face-foreground 'git-gutter-fr+-deleted  "#CD93A8")

;; (setq-default left-fringe-width 20)

(set-face-attribute 'git-gutter:added nil :foreground "#5C97CF" :weight 'normal)
(set-face-attribute 'git-gutter:modified nil :foreground "#5C97CF" :weight 'normal)
(set-face-attribute 'git-gutter:deleted nil :foreground "#CD93A8" :weight 'normal)

(setq git-gutter:added-sign " + "
          git-gutter:deleted-sign " - "
          git-gutter:modified-sign " > "
          git-gutter:update-interval 5)

(add-hook 'git-gutter:update-hooks 'magit-revert-buffer-hook)

;; (set-face-attribute 'git-gutter:added nil :foreground "#5C97CF" :weight 'normal)
;; (set-face-attribute 'git-gutter:modified nil :foreground "#5C97CF" :weight 'normal)
;; (set-face-attribute 'git-gutter:deleted nil :foreground "#CD93A8" :weight 'normal)

;; (global-set-key (kbd "C-x g") 'git-gutter+-mode) ; Turn on/off in the current buffer
;; (global-set-key (kbd "C-x G") 'global-git-gutter+-mode) ; Turn on/off globally

;; (eval-after-load 'git-gutter
;;   '(progn
;;      ;;; Jump between hunks
;;      (define-key git-gutter-mode-map (kbd "C-x n") 'git-gutter-next-hunk)
;;      (define-key git-gutter-mode-map (kbd "C-x p") 'git-gutter-previous-hunk)

;;      ;;; Act on hunks
;;      (define-key git-gutter-mode-map (kbd "C-x v =") 'git-gutter-show-hunk)
;;      (define-key git-gutter-mode-map (kbd "C-x r") 'git-gutter-revert-hunks)
;;      ;; Stage hunk at point.
;;      ;; If region is active, stage all hunk lines within the region.
;;      (define-key git-gutter-mode-map (kbd "C-x t") 'git-gutter-stage-hunks)
;;      (define-key git-gutter-mode-map (kbd "C-x c") 'git-gutter-commit)
;;      (define-key git-gutter-mode-map (kbd "C-x C") 'git-gutter-stage-and-commit)
;;      (define-key git-gutter-mode-map (kbd "C-x C-y") 'git-gutter-stage-and-commit-whole-buffer)
;;      (define-key git-gutter-mode-map (kbd "C-x U") 'git-gutter-unstage-whole-buffer)))


;; TODO hunk navigations
;; (global-set-key (kbd "C-x C-g") 'git-gutter:toggle)
;; (global-set-key (kbd "C-x v =") 'git-gutter:popup-hunk)
;; (global-set-key (kbd "C-x p") 'git-gutter:previous-hunk)
;; (global-set-key (kbd "C-x n") 'git-gutter:next-hunk)
;; (global-set-key (kbd "C-x v s") 'git-gutter:stage-hunk)
;; (global-set-key (kbd "C-x v r") 'git-gutter:revert-hunk)

;; ---- company mode & autocomplete
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0.3) ;; delay in s, t for no delay
(with-eval-after-load 'company
  (define-key company-active-map (kbd "ESC") 'company-abort)
  (define-key company-active-map (kbd "<tab>") 'company-complete))

;; (define-key company-active-map (kbd "\C-n") 'company-select-next)
;; (define-key company-active-map (kbd "\C-p") 'company-select-previous)
;; (define-key company-active-map (kbd "\C-d") 'company-show-doc-buffer)
;; (define-key company-active-map (kbd "<tab>") 'company-complete)

(global-set-key (kbd "s-.") 'hippie-expand)

; ;; uncrustify
; (setq uncrustify-uncrustify-cfg-file "~/.happymacs/uncrustify.cfg")
; (setq uncrustify-uncrustify-path "/usr/local/bin/uncrustify")

;; ---- tabs
(tabbar-mode t)

(setq tabbar-background-color "gray20") ;; the color of the tabbar background
(custom-set-faces
 '(tabbar-default ((t (:inherit default :background "#393939" :foreground "gray60" :weight normal))))
 '(tabbar-button ((t (:inherit tabbar-default :foreground "#F1BA00"))))
 '(tabbar-button-highlight ((t (:inherit tabbar-default))))
 '(tabbar-highlight ((t (:foreground "#F1BA00"))))
 '(tabbar-selected ((t (:inherit tabbar-default :foreground "#F1BA00" :weight bold))))
 '(tabbar-separator ((t (:inherit tabbar-default))))
 '(tabbar-unselected ((t (:inherit tabbar-default)))))

;; (set-face-attribute
;;  'tabbar-default nil
;;  :background "gray20"
;;  :foreground "gray20"
;;  :box '(:line-width 1 :color "gray20" :style nil)
;;  :height 1.3)

;; adding spaces
(defun tabbar-buffer-tab-label (tab)
  "Return a label for TAB. That is, a string used to represent it on the tab bar."
  (let ((label  (if tabbar--buffer-show-groups
                    (format "[%s]  " (tabbar-tab-tabset tab))
                  (format "%s  " (tabbar-tab-value tab)))))
    ;; Unless the tab bar auto scrolls to keep the selected tab
    ;; visible, shorten the tab label to keep as many tabs as possible
    ;; in the visible area of the tab bar.
    (if tabbar-auto-scroll-flag
        label
      (tabbar-shorten
       label (max 1 (/ (window-width)
                       (length (tabbar-view
                                (tabbar-current-tabset)))))))))

(global-set-key (kbd "s-{") 'tabbar-backward-group)
(global-set-key (kbd "s-}") 'tabbar-forward-group)
(global-set-key (kbd "s-[") 'tabbar-backward)
(global-set-key (kbd "s-]") 'tabbar-forward) ;; tabbar.el, put all the buffers on the tabs.

;; mimic sublime, chrome, safari
(global-set-key (kbd "M-s-<left>") 'tabbar-backward)
(global-set-key (kbd "M-s-<right>") 'tabbar-forward)
(global-set-key (kbd "S-s-<left>") 'tabbar-backward)
(global-set-key (kbd "S-s-<right>") 'tabbar-forward)

;; (defun tabbar-buffer-groups ()
;;   "Return the list of group names the current buffer belongs to.
;; This function is a custom function for tabbar-mode's tabbar-buffer-groups.
;; This function group all buffers into 3 groups:
;; Those Dired, those user buffer, and those emacs buffer.
;; Emacs buffer are those starting with “*”."
;;   (list
;;    (cond
;;     ((string-equal "*" (substring (buffer-name) 0 1))
;;      "Emacs Buffer"
;;      )
;;     ((eq major-mode 'dired-mode)
;;      "Dired"
;;      )
;;     (t
;;      "User Buffer"
;;      )
;;     ))) 

;; (setq tabbar-buffer-groups-function 'tabbar-buffer-groups)

;; --- Key config ---
;;

;; ---- fix escape key

;; TODO: make escape clear marked region

;; (defadvice top-level (around top-level activate)
;; (message "Modified (top-level)...")
;;       )

;; (defun my-top-level ()
;;       (if (mark-active) (setq deactivate-mark t))
;;       (top-level)
;; )

;; ;; (defun my-minibuffer-top-level ()
;; ;;   "Abort recursive edit.
;; ;; In Delete Selection mode, if the mark is active, just deactivate it;
;; ;; then it takes a second \\[keyboard-quit] to abort the minibuffer."
;; ;;   (interactive)
;; ;;   (if (and delete-selection-mode transient-mark-mode mark-active)
;; ;;           (setq deactivate-mark  t)
;; ;;     (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
;; ;;     (abort-recursive-edit))
;; ;;   (my-top-level)
;; ;;  )

;; TODO add keyboard-quit stuff in here

;; (global-set-key [escape] 'top-level) ;; breaks <esc> in company mode
(define-key minibuffer-local-map [escape] 'top-level)
(define-key minibuffer-local-ns-map [escape] 'top-level)
(define-key minibuffer-local-completion-map [escape] 'top-level)
(define-key minibuffer-local-must-match-map [escape] 'top-level)
(define-key minibuffer-local-isearch-map [escape] 'top-level)

;; (defun sublime-escape-quit ()
;;   "Forcefully closes the minibuffer window."
;;   (interactive)
;;   (when (active-minibuffer-window)
;;     (select-window (active-minibuffer-window)))
;;   (keyboard-escape-quit))

;; (setq fuzzy-format-default-indent-tabs-mode t)
;;(global-fuzzy-format-mode t)

;; ---- symbols
;; TODO these shortcuts kinda suck
(progn (define-key key-translation-map (kbd "M-s-3") (kbd "•"))
           (define-key key-translation-map (kbd "M-s-4") (kbd "◇"))
           (define-key key-translation-map (kbd "M-s-5") (kbd "†")))

(add-hook 'prog-mode-hook 'aggressive-indent-mode)
;;(add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)
;;q(add-hook 'css-mode-hook #'aggressive-indent-mode)

(add-hook 'prog-mode-hook 
                  '(lambda()
                         (aggressive-indent-mode)
                         (setq-default indent-tabs-mode t)
                         (setq tab-width 4)))

(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'sgml-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)

(eval-after-load 'scss-mode
  '(add-hook
    'scss-mode-hook
    (lambda () (unless defun-prompt-regexp 
                                 (setq-local defun-prompt-regexp "^[^[:blank:]].*")))))




(message "#happymacs: package config complete.")

;; --- Version control

(defun git-add-current-buffer ()
  "call 'git add [current-buffer]'"      
  (interactive)
  (let* ((buffile (buffer-file-name))
         (output (shell-command-to-string
                  (concat "git add " (buffer-file-name)))))
    (message (if (not (string= output ""))
                 output
               (concat "Added " buffile)))))

;; TODO prompt for commit message and push after current buffer added

(defun git-commit ()
  "call 'git commit'"
  
  (interactive)
  (async-shell-command "git commit"))

(defun git-add-commit ()

  (git-add-current-buffer)
  (git-commit)

  )


;; --- Modeline
(load-file "~/.config/aetherwolf/emacs/modeline.el")
(message "#happymacs: modeline config complete.")

;; --- User post config
;(load-file "~/.happymacs/init-post.el")
;(message "#happymacs: init-post.el complete")

;; (eval-after-load 'project-explorer
;;       '(progn
;;      project-explorer-open
;;      ))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;; '(git-gutter:added-sign " + ")
 ;; '(git-gutter:deleted-sign " - ")
 ;; '(git-gutter:modified-sign " > ")
 ;; '(git-gutter:update-interval 30)
 '(pe/width 30))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;; '(git-gutter:added ((t (:foreground "lawn green" :weight bold))))
 ;; '(git-gutter:deleted ((t (:foreground "red" :weight bold))))
 ;; '(git-gutter:modified ((t (:foreground "orange red" :weight bold))))
 '(minimap-active-region-background ((t (:background "#393939")))))
