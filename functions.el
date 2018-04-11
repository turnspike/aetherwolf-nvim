
;; ---- autovivify folders (otherwise emacs will error when creating a file in a new folder)

(defadvice find-file (before make-directory-maybe (filename &optional wildcards) activate)
  "Create parent directory if not exists while visiting file."
  (unless (file-exists-p filename)
        (let ((dir (file-name-directory filename)))
          (unless (file-exists-p dir)
                (make-directory dir)))))
