(transient-mark-mode 1)
(delete-selection-mode 1) ; type over selections
(cua-mode t)
(winner-mode 1)
(setq ring-bell-function 'ignore)

(define-key global-map (kbd "RET") 'newline-and-indent) ; auto indent newlines

;; -- indenting
(global-set-key (kbd "s-;") 'comment-dwim)
(global-set-key (kbd "s-/") 'comment-or-uncomment-region) ;; modern-style region commenting
;; TODO if nothing selected, indent current line only
(setq-default indent-tabs-mode t) ;; use tabs not spaces
(setq tab-width 4)
(setq indent-tabs-mode t)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)
(setq default-tab-width 4)
(setq c-basic-indent 4)
(setq c-basic-offset 4)

;;(superword-mode 1)

;;/usr/local/Cellar/clang-format/2015-07-31/bin
(load "/usr/local/Cellar/clang-format/2015-07-31/share/clang/clang-format.el")
(global-set-key (kbd "C-F") 'clang-format-region)

(defun pprint (form &optional output-stream)
  (princ (with-temp-buffer
           (cl-prettyprint form)
           (buffer-string))
         output-stream))


(defun iwb ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (tabify (point-min) (point-max)))


;; -- searching
(global-set-key (kbd "s-f") 'isearch-forward-regexp)
(define-key isearch-mode-map (kbd "s-f") 'isearch-repeat-forward)
(define-key isearch-mode-map (kbd "<return>") 'isearch-repeat-forward)
(global-set-key (kbd "s-F") 'isearch-backward-regexp)
(define-key isearch-mode-map (kbd "s-F") 'isearch-repeat-backward)
;; (define-key isearch-mode-map (kbd "<up>") 'isearch-repeat-backward)

;; automatically wrap isearch at EOF (instead of displaying "failing search" message)
(defadvice isearch-search (after isearch-no-fail activate)
  (unless isearch-success
	(ad-disable-advice 'isearch-search 'after 'isearch-no-fail)
	(ad-activate 'isearch-search)
	(isearch-repeat (if isearch-forward 'forward))
	(ad-enable-advice 'isearch-search 'after 'isearch-no-fail)
	(ad-activate 'isearch-search)))

;; -- replacing
;; TODO select whole buffer if no selection?
(global-set-key (kbd "s-r") 'replace-string)
(global-set-key (kbd "s-R") 'replace-regexp)

;; -- moving around lines

;; ;; experimental...
;; (defun back-to-indentation-then-sol () (interactive) ; jump to indent first then sol
;;	  (if (= (point) (progn (back-to-indentation) (point)))
;;	  (beginning-of-line)))

;; (global-set-key (kbd "s-<left>") 'back-to-indentation-then-sol)

;; (defun fwd-past-indentation-then-eol () (interactive)
;;	  (if (= (point) (progn (forward-to-indentation) (point)))
;;	  (end-of-line)))

(defvar lawlist-movement-syntax-table
  (let ((st (make-syntax-table)))
    ;; ` default = punctuation
    ;; ' default = punctuation
    ;; , default = punctuation
    ;; ; default = punctuation
    (modify-syntax-entry ?{ "." st)  ;; { = punctuation
    (modify-syntax-entry ?} "." st)  ;; } = punctuation
    (modify-syntax-entry ?\" "." st) ;; " = punctuation
    (modify-syntax-entry ?\\ "_" st) ;; \ = symbol
    (modify-syntax-entry ?\$ "_" st) ;; $ = symbol
    (modify-syntax-entry ?\% "_" st) ;; % = symbol
    st)
  "Syntax table used while executing custom movement functions.")

(defun lawlist-forward-entity ()
"http://stackoverflow.com/q/18675201/2112489"
(interactive "^")
  (with-syntax-table lawlist-movement-syntax-table
    (cond
      ((eolp)
        (forward-char))
      ((and
          (save-excursion (< 0 (skip-chars-forward " \t")))
          (not (region-active-p)))
        (skip-chars-forward " \t"))
      ((and
          (save-excursion (< 0 (skip-chars-forward " \t")))
          (region-active-p))
        (skip-chars-forward " \t")
        (cond
          ((save-excursion (< 0 (skip-syntax-forward "w")))
            (skip-syntax-forward "w"))
          ((save-excursion (< 0 (skip-syntax-forward ".")))
            (skip-syntax-forward "."))
          ((save-excursion (< 0 (skip-syntax-forward "_()")))
            (skip-syntax-forward "_()"))))
      ((save-excursion (< 0 (skip-syntax-forward "w")))
        (skip-syntax-forward "w")
        (if (and
              (not (region-active-p))
              (save-excursion (< 0 (skip-chars-forward " \t"))))
          (skip-chars-forward " \t")))
      ((save-excursion (< 0 (skip-syntax-forward ".")))
        (skip-syntax-forward ".")
        (if (and
              (not (region-active-p))
              (save-excursion (< 0 (skip-chars-forward " \t"))))
          (skip-chars-forward " \t")))
      ((save-excursion (< 0 (skip-syntax-forward "_()")))
        (skip-syntax-forward "_()")
        (if (and
              (not (region-active-p))
              (save-excursion (< 0 (skip-chars-forward " \t"))))
          (skip-chars-forward " \t"))))))

(defun lawlist-backward-entity ()
"http://stackoverflow.com/q/18675201/2112489"
(interactive "^")
  (with-syntax-table lawlist-movement-syntax-table
    (cond
      ((bolp)
        (backward-char))
      ((save-excursion (> 0 (skip-chars-backward " \t")) (bolp))
        (skip-chars-backward " \t"))
      ((save-excursion (> 0 (skip-chars-backward " \t")) (> 0 (skip-syntax-backward "w")))
        (skip-chars-backward " \t")
        (skip-syntax-backward "w"))
      ((save-excursion (> 0 (skip-syntax-backward "w")))
        (skip-syntax-backward "w"))
      ((save-excursion (> 0 (skip-syntax-backward ".")))
        (skip-syntax-backward "."))
      ((save-excursion (> 0 (skip-chars-backward " \t")) (> 0 (skip-syntax-backward ".")))
        (skip-chars-backward " \t")
        (skip-syntax-backward "."))
      ((save-excursion (> 0 (skip-syntax-backward "_()")))
        (skip-syntax-backward "_()"))
      ((save-excursion (> 0 (skip-chars-backward " \t")) (> 0 (skip-syntax-backward "_()")))
        (skip-chars-backward " \t")
        (skip-syntax-backward "_()")))))

;; (add-hook 'text-mode-hook 'superword-mode)
;; (add-hook 'prog-mode-hook 'superword-mode)

(defvar xah-brackets nil "string of brackets")
(setq xah-brackets "()[]{}（）［］｛｝⦅⦆〚〛⦃⦄“”‘’‹›«»「」〈〉《》【】〔〕⦗⦘『』〖〗〘〙｢｣⟦⟧⟨⟩⟪⟫⟮⟯⟬⟭⌈⌉⌊⌋⦇⦈⦉⦊❛❜❝❞❨❩❪❫❴❵❬❭❮❯❰❱❲❳〈〉⦑⦒⧼⧽﹙﹚﹛﹜﹝﹞⁽⁾₍₎⦋⦌⦍⦎⦏⦐⁅⁆⸢⸣⸤⸥⟅⟆⦓⦔⦕⦖⸦⸧⸨⸩｟｠⧘⧙⧚⧛⸜⸝⸌⸍⸂⸃⸄⸅⸉⸊᚛᚜༺༻༼༽⏜⏝⎴⎵⏞⏟⏠⏡﹁﹂﹃﹄︹︺︻︼︗︘︿﹀︽︾﹇﹈︷︸")

(defvar
  xah-left-brackets
  '("(" "{" "[" "<" "〔" "【" "〖" "〈" "《" "「" "『" "“" "‘" "‹" "«" )
  "List of left bracket chars.")
(progn
  (setq xah-left-brackets '())
  (dotimes (x (- (length xah-brackets) 1))
    (message "%s" x)
    (when (= (% x 2) 0)
      (push (char-to-string (elt xah-brackets x))
            xah-left-brackets)))
  (setq xah-left-brackets (reverse xah-left-brackets)))

(defvar
  xah-right-brackets
  '(")" "]" "}" ">" "〕" "】" "〗" "〉" "》" "」" "』" "”" "’" "›" "»")
  "List of right bracket chars.")
(progn
  (setq xah-right-brackets '())
  (dotimes (x (- (length xah-brackets) 1))
    (message "%s" x)
    (when (= (% x 2) 1)
      (push (char-to-string (elt xah-brackets x))
            xah-right-brackets)))
  (setq xah-right-brackets (reverse xah-right-brackets)))
(defun xah-backward-left-bracket ()
  "Move cursor to the previous occurrence of left bracket.
The list of brackets to jump to is defined by `xah-left-brackets'.
URL `http://ergoemacs.org/emacs/emacs_navigating_keys_for_brackets.html'
Version 2015-03-24"
  (interactive)
  (search-backward-regexp (eval-when-compile (regexp-opt xah-left-brackets)) nil t))

(defun xah-forward-right-bracket ()
  "Move cursor to the next occurrence of right bracket.
The list of brackets to jump to is defined by `xah-right-brackets'.
URL `http://ergoemacs.org/emacs/emacs_navigating_keys_for_brackets.html'
Version 2015-03-24"
  (interactive)
  (search-forward-regexp (eval-when-compile (regexp-opt xah-right-brackets)) nil t))

(global-set-key (kbd "M-C-<left>") 'xah-backward-left-bracket)
(global-set-key (kbd "M-C-<right>") 'xah-forward-right-bracket)

(global-set-key (kbd "M-<up>") 'backward-paragraph)
(global-set-key (kbd "M-<down>") 'forward-paragraph)
(global-set-key (kbd "M-<left>") 'lawlist-backward-entity)
(global-set-key (kbd "M-<right>") 'lawlist-forward-entity)

(global-set-key (kbd "s-<left>") 'beginning-of-line)
(global-set-key (kbd "s-<right>") 'end-of-line)
(global-set-key (kbd "M-s-<left>") 'beginning-of-line)
(global-set-key (kbd "M-s-<right>") 'end-of-line)
(global-set-key (kbd "M-s-<up>") 'beginning-of-buffer)
(global-set-key (kbd "M-s-<down>") 'end-of-buffer)

(defun sfp-page-down ()
      (interactive)
      (setq this-command 'next-line)
      (next-line
       (- (window-text-height)
          next-screen-context-lines)))
    
    (defun sfp-page-up ()
      (interactive)
      (setq this-command 'previous-line)
      (previous-line
       (- (window-text-height)
          next-screen-context-lines)))
    
    (global-set-key [next] 'sfp-page-down)
    (global-set-key [prior] 'sfp-page-up)

(global-set-key (kbd "s-<up>") 'sfp-page-up)
(global-set-key (kbd "s-<down>") 'sfp-page-down)

;; TODO shift-tab unindent

;; (global-set-key (kbd "s-o") 'ido-find-file)
(global-set-key (kbd "s-c") 'kill-ring-save)
(global-set-key (kbd "s-x") 'kill-region)
(global-set-key (kbd "s-v") 'yank)
(global-set-key (kbd "s-s") 'save-buffer)
(global-set-key (kbd "s-w") 'kill-this-buffer)
(global-set-key (kbd "s-q") 'save-buffers-kill-terminal)
(global-set-key (kbd "s-z") 'undo)
(global-set-key (kbd "s-Z") 'redo)
(global-set-key (kbd "s-y") 'redo)
(global-set-key (kbd "s-a") 'mark-whole-buffer) ;; TODO retain scroll position
;; TODO how to clear the mark / select none?

;; -- buffers, windows, frames
;;(global-set-key (kbd "s-b") 'ido-switch-buffer)

;; (global-set-key (kbd "S-s-<left>") 'previous-buffer)
;; (global-set-key (kbd "S-s-<right>") 'next-buffer)
;; (global-set-key (kbd "s-[") 'previous-buffer)
;; (global-set-key (kbd "s-]") 'next-buffer)
(global-set-key (kbd "<C-tab>") 'bury-buffer)
;; mapping C-; to other-window (cycling through windows)
;; mapping C-' to other-frame

;; -- launch "apps"
(global-set-key (kbd "s-1") 'eshell)
;; (global-set-key (kbd "s-2") 'org)
(global-set-key (kbd "s-3") 'calendar)
;; (global-set-key (kbd "s-4") 'email)
;; (global-set-key (kbd "s-5") 'web)
;; (global-set-key (kbd "s-6") 'chat)


;; create new buffer
(defun new-empty-buffer ()
  "Opens a new empty buffer."
  (interactive)
  (switch-to-buffer (generate-new-buffer "untitled"))
  (funcall initial-major-mode)
  (put 'buffer-offer-save 'permanent-local t)
  (setq buffer-offer-save t))
(global-set-key (kbd "s-n") 'new-empty-buffer)

;; -- set modifier keys for osx
(when (equal system-type 'darwin)
  (setq mac-option-modifier 'meta) ;; Bind meta to alt
  (setq mac-command-modifier 'super) ;; Bind apple/command to super
  ;;  (setq mac-function-modifier 'hyper)) ;; Bind function key to hyper
  )

;; -- super keys for windows + osx
(setq w32-pass-lwindow-to-system nil)
(setq w32-lwindow-modifier 'super) ; left windows key
(setq w32-pass-rwindow-to-system nil)
(setq w32-rwindow-modifier 'super) ; right windows key

;; -- delete backwards by word
;; TODO make this move same as meta-left
(defun backward-kill-word-or-kill-region (&optional arg)
  (interactive "p")
  (if (region-active-p)
	  (kill-region (region-beginning) (region-end))
	(backward-kill-word arg)))

;;(global-set-key (kbd "C-w") 'backward-kill-word-or-kill-region)
;;(global-set-key (kbd "<M-backspace>") 'backward-kill-word-or-kill-region)
(global-set-key (kbd "<M-backspace>") 'backward-kill-word)
;;(global-set-key "\M-\d" 'backward-kill-word-or-kill-region)

;; -- lines

;; FIXME: this is a bit flaky, maybe clear region
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (move-beginning-of-line 1)
  (yank)
  )
(global-set-key (kbd "s-d") 'duplicate-line)
(global-set-key (kbd "s-D") 'kill-whole-line)
(global-set-key (kbd "s-D") 'kill-whole-line)
