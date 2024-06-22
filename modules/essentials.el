(setq-default ad-redefinition-action 'warn            ; When we redefine an active function then deactivate it, it will accept the redefinition as the new definition, but warn us. Might change to 'accept
              confirm-kill-emacs 'y-or-n-p            ; Asks us y / n if we want to kill emacs.
              cursor-in-non-selected-windows nil      ; Only show the cursor in the frame that we are in.
              display-time-default-load-average nil   ; Removes the load average from the time displayed. Might be obselete since we redefine the time format.
              display-time-format "%k:%M:%S (%Z)"     ; Format of the time displayed. It displays it as 24 hour time basically, with the time removed by timezone in parentheses
              help-window-select t                    ; Puts the focus (cursor) on the help window we opened
              indent-tabs-mode nil                    ; Indentation does not add tabs but just indents somehow
              initial-scratch-message ""              ; Starting text in the scratch buffer. Replace it with libraries for coding in the future?
              mouse-yank-at-point t                   ; Allows mouse to paste text at the cursor not at the click
              select-enable-clipboard t               ; Copy-pasting uses system clipboard (but still have kill-ring functionality)
              sentence-end-double-space nil           ; Makes the sentence (something for text navigation) be defined by one space, not two.
              blink-cursor-mode nil                   ; Don't blink the cursor
              tab-width 4                             ; Sets a tab to be four spaces
              x-stretch-cursor nil                    ; Cursor is a constant size and doesn't change based on text under it
              delete-old-versions t                   ; Asks for confirmation for removing excess backup versions
              version-control t                       ; Use version control to number backup versions
              inhibit-compacting-font-caches t        ; Stops the font cache from compacting -> higher memory footprint but increases speed for certain fonts
              display-line-numbers-type 'relative     ; Display line numbers relatively (current line has the actual line number and the others have the distance between them and the current line)
              use-default-font-for-symbols nil        ; Use the actual fontset for symbols and punctuation instead of defaulting to default font
              blink-matching-paren nil                ; Don't flash matching parentheses
              delete-pair-blink-delay 0.1             ; How long to delay the command 'delete-pair'
              save-interprogram-paste-before-kill t   ; Saves clipboard text into kill-ring before replacing it
              mode-require-final-newline 'visit-save  ; Adds a newline (if it doesn't already have one) to the end of files when you first open it and when you save
              eval-expression-print-length nil        ; When returning the value of an evaluated expression, don't truncate it at all
              scroll-conservatively 101               ; When the cursor leaves the screen, scroll up/down enough text to /just/ bring the cursor back into view
              backup-by-copying t                     ; Instead of symlinking, make a copy for the backup. Apparently symlinks are bad ?
              tab-always-indent 'complete             ; First trys to indent, then complete
              kill-do-not-save-duplicates t)          ; When saving something to the kill ring, if it duplicates the last entry, don't save it.

(cd "~/")

(setq-default show-trailing-whitespace t) ; Show trailing whitespace after a line for cleanup
(add-function-to-hooks (lambda () (setq show-trailing-whitespace nil))
                       '(calendar-mode-hook
                         dashboard-mode-hook
                         undo-tree-visualize-mode-hook
                         chemtable-mode-hook
                         chemtable-info-mode-hook))

(add-hook 'before-save-hook 'delete-trailing-whitespace) ; Delete whitespace when I save

(if (not use-exwm)
    (if (string-equal window-system 'ns)
        (toggle-frame-maximized)
      (toggle-frame-fullscreen)))

(add-hook 'focus-out-hook #'garbage-collect)

(delete-selection-mode 1)

(global-auto-revert-mode 1)

(electric-pair-mode t)   ; Turns on Electric Pair Mode globally
(electric-indent-mode t) ; Turns on Electric Indent Mode globally

(defalias 'yes-or-no-p 'y-or-n-p) ; Sets yes/no to be y/n

(set-frame-parameter nil 'alpha-background 100)
(add-to-list 'default-frame-alist '(alpha-background . 100))

(defun toggle-transparency ()
  (interactive)
  (if (>= (string-to-number emacs-version) 29.0)
      (let ((alpha-background (frame-parameter nil 'alpha-background)))
        (set-frame-parameter
         nil 'alpha-background
         (if (eql (cond ((numberp alpha-background) alpha-background)
                        ((numberp (cdr alpha-background)) (cdr alpha-background))
                        ;; Also handle undocumented (<active> <inactive>) form.
                        ((numberp (cadr alpha-background)) (cadr alpha-background)))
                  100)
             85
           100)))
    (let ((alpha-background (frame-parameter nil 'alpha)))
      (set-frame-parameter
       nil 'alpha
       (if (eql (cond ((numberp alpha-background) alpha-background)
                      ((numberp (cdr alpha-background)) (cdr alpha-background))
                      ;; Also handle undocumented (<active> <inactive>) form.
                      ((numberp (cadr alpha-background)) (cadr alpha-background)))
                100)
           '(85 . 50)
         '(100 . 100))))))

(global-subword-mode)  ; Enables global subword mode

(setq show-paren-delay 0)  ; Don't delay the parentheses showing
(show-paren-mode 1)

(setq mouse-wheel-scroll-amount
      '(1
        ((shift) . 5)
        ((meta) . 0.5)
        ((control) . text-scale))
      mouse-drag-copy-region nil
      make-pointer-invisible t
      mouse-wheel-progressive-speed t
      mouse-wheel-follow-mouse t)

(setq-default scroll-preserve-screen-position t
              scroll-conservatively 1
              scroll-margin 0
              next-screen-context-lines 0)

(mouse-wheel-mode 1)
(define-key global-map (kbd "C-M-<mouse-3>") #'tear-off-window)

(defun sudo-find-file (file-name)
"Like find file, but opens the file as root."
(interactive "FSudo Find File: ")
(let ((tramp-file-name (concat "/sudo::" (expand-file-name file-name))))
  (find-file tramp-file-name)))

(setq auto-save-list-file-prefix nil)
(setq auto-save-list-file-name nil)

(provide 'essentials)
