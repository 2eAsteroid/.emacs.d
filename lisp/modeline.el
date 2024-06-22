(defun 2e/mode-line-truncate-string-p (str)
  "returns non-nil if the string should be truncated"
  (or (< (window-total-width) split-width-threshold)
       (and (> (length str) mode-line-truncate-length)
       (not (one-window-p :no-minibuffer)))))

(defvar-local mode-line-truncate-length 15)                          ; How long should a string at least be until being truncated

(defun 2e/mode-line-truncate-string (str)                        ; Truncates the string function
  "Returns the truncated string, else return the original string."
  (if (2e/mode-line-truncate-string-p str)                              ; If the string should be truncated
      (concat (substring str 0 mode-line-truncate-length) "...")     ; Add the first 9 characters of the string and append a '...' at the end.
    str))                                                            ; Else, return original string

  (defun 2e/mode-line-right-align-rest-width ()
  "Returns the length to be conserved at the right side of the modeline."
  (1+ (length display-time-string)))

(defun 2e/mode-line-right-align ()
  "Returns empty space using the default 'mode-line' face and leaving RESERVE space on the right."
  (propertize " "
          'display `(space . (:align-to (- (+ right right-fringe right-margin)  ,(2e/mode-line-right-align-rest-width)))))) ; This adds up all of the space at the right of the modeline, and subtracts the space we want to conserve

(defun 2e/static-blank ()
  "Returns a string of one space."
  " ")

  (defun 2e/mode-line-modified ()
  "This returns a all-the-icons icon based on the modified state of the buffer."
  (let* (
         (config-alist                                                             ; Lets `config-alist` to be a list of information that we pull from
        '(("*" all-the-icons-faicon "chain-broken" :height 1.2 :v-adjust -0.0)     ; If it's `*`, then call `all-the-icons-faicon` on "chain-broken :height 1.2 :v-adjust -0.0"
          ("-" all-the-icons-faicon "link" :height 1.2 :v-adjust -0.0)             ; If it's `-`, then call `all-the-icons-faicon` on "link :height 1.2 :v-adjust -0.0"
          ("%" all-the-icons-faicon "lock" :height 1.2 :v-adjust 0.1)))            ; If it's `%`, then call `all-the-icons-faicon` on "lock :height 1.2 :v-adjust 0.1"
       (result (cdr (assoc (format-mode-line "%*") config-alist))))                ; Since it's `let*`, the variables are bound sequentially and so `result` can use `config-alist`.
      (propertize (format "%s" (apply (car result) (cdr result)))                  ; We return a propertized string
          'face `(:family ,(all-the-icons-faicon-family))                          ; The family of the font is the string returned from the function `all-the-icons-faicon-family`
          'help-echo (if (string-equal (cadr result) "chain-broken")               ; We add a minibuffer display when we hover over the icon.
                 (format "Buffer: `%s` is modified." (buffer-name))
                   (if (string-equal (cadr result) "link")
                   (format "Buffer: `%s` is saved." (buffer-name))
                   (format "Buffer: `%s` is read-only." (buffer-name)))))))

  (defun 2e/mode-line-region-info ()
  "Returns a string containing information from the current region, if there is any. The left number is the lines in the region, and the right number is the characters in the region."
  (when mark-active                                                ; When the mark is active (there's actually a highlighted region)
  (let ((lines (count-lines (region-beginning) (region-end)))      ; Set `lines` to be the amount of lines in the region
        (chars (- (region-end) (region-beginning))))               ; Sets `chars` to be the characters in the region
    (concat                                                        ; Adds the pencil octicon to the information
     (propertize (format "%s " (all-the-icons-octicon "pencil"))
                 'face `(:family ,(all-the-icons-octicon-family))
         'display `(raise -0.0))
     (propertize (format "%s:%s" lines chars)
                 'face `(:height 0.9))))))

(defun 2e/mode-line-region-buffer-info ()
  "Returns either the output of `2e/mode-line-region-info`, or if there isn't a region marked, then return a string containing information from the entire buffer, with the left number being the lines in the buffer, and the right number being the characters in the buffer."
  (if mark-active
    (2e/mode-line-region-info)
  (concat
   (propertize
    (format "%s" (all-the-icons-octicon "pencil"))
    'face `(:family ,(all-the-icons-octicon-family))
    'display `(raise -0.0))
   (propertize
    (concat
     (format "%s:" (car (buffer-line-statistics)))
     "%i")
    'face `(:height 0.9)))))


(defun 2e/mode-line-buffer-name ()
  (2e/mode-line-truncate-string
   (format "%s"
           (propertize (2e/mode-line-truncate-string
                        (buffer-name))
                       'help-echo (format "Buffer Name: `%s`" (buffer-name))
                       'face `(:foreground "#dfffee")))))

(defun 2e/mode-line-mode-icon ()
  "Returns the mode icon of the buffer."
  (propertize
   (format "%s" (all-the-icons-icon-for-mode major-mode :v-adjust 0.0))
   'help-echo (format "Major Mode: `%s`" major-mode)
   'face `(:height 170 :family ,(all-the-icons-icon-family-for-buffer))))

(defun 2e/mode-line-github-vc ()
  (if vc-mode
      (let ((branch (cdr (string-split vc-mode "[:-]"))))
        (concat
         (propertize
          (format "%s " (all-the-icons-octicon "git-branch"))
          'face `(:family ,(all-the-icons-octicon-family) :height 1.3)
          'display `(raise -0.1))
         (propertize (2e/mode-line-truncate-string
                      (format "%s" branch))
                     'face `(:height 0.9))))
    (concat
     (propertize
      (format "%s " (all-the-icons-octicon "git-branch"))
      'face `(:family ,(all-the-icons-octicon-family) :height 1.3)
      'display `(raise -0.1))
     (propertize (format "%s" "(git init)") 'face `(:height 0.9)))))

(defun 2e/mode-line-mode-vc-info ()
  (if vc-mode
      (let ((branch (cdr (string-split vc-mode "[:-]"))))
        (concat
         "("
         (2e/mode-line-mode-icon)
         ", "
         (propertize (2e/mode-line-truncate-string
                      (format "#%s" branch))
                     'face `(:height 0.9))
         ")"))
    (2e/mode-line-mode-icon)))


(require 'org-timer)
(defun 2e/mode-line-org-timer ()
  (unless (eq (org-timer-value-string) "0:00:00 ")
    (propertize (format "Timer: %s" (org-timer-value-string)) 'face `(:weight bold))))

  (setq display-time-interval 1)                         ; Updates the time every second
(display-time)                                         ; Starts displaying the time

(defun 2e/mode-line-time ()
  "returns the time with the associated clock icon with it."
  (let* ((hour (string-to-number (format-time-string "%I")))
         (icon (all-the-icons-wicon (format "time-%s" hour) :height 1.3 :v-adjust 0.0)))
    (concat
     (propertize (format-time-string " [%d/%a] %k:%M:%S (%z) ") 'face `(:height 0.9))
     (propertize (format "%s " icon) 'face `(:height 1.0 :family ,(all-the-icons-wicon-family)) 'display '(raise -0.0)))))


  (setq-default mode-line-format
              '("%e"
                (:eval (2e/mode-line-modified))
                " "
                (:eval (2e/mode-line-buffer-name))
                " "
                (:eval (2e/mode-line-mode-vc-info))
                " | "
                (:eval (2e/mode-line-region-buffer-info))
                " | "
                (:eval (2e/mode-line-org-timer))
                (:eval (2e/mode-line-right-align))
                (:eval (2e/mode-line-time))
                ))

(setq-default header-line-format nil)
