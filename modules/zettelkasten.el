(straight-use-package
 '(org-roam :type git
            :host github
            :repo "org-roam/org-roam"
            :files (:defaults)))

(require 'org-roam)

(setq org-roam-verbose t
      org-roam-directory "~/.emacs.d/zettels/") ; Add org roam directory later
(org-roam-setup)

(setq org-roam-capture-templates
        '(("m" "main" plain "%?"
           :if-new (file+head "main/${slug}.org"
                              "#+title: ${title}\n")
           :immediate-finish t
           :unnarrowed t)
          ("r" "reference" plain "%?"
           :if-new (file+head "reference/${citar-citekey}.org"
                              "#+title: ${note-title}\n")
           :immediate-finish t
           :unnarrowed t)
          ("h" "hierarchy" plain "%?"
           :if-new (file+head "reference/${slug}.org"
                              "#+title: ${hierarchy-title}\n")
           :immediate-finish t
           :unnarrowed t)
          ("c" "companion" plain "%?"
           :if-new (file+head "reference/${slug}.org"
                              ":PROPERTIES:
      :ROAM_REFS: @%(citar-select-ref)
      :END:
#+title: ${title}\n")
           :immediate-finish t
           :unnarrowed t)))

(cl-defmethod org-roam-node-type ((node org-roam-node))
  "Return the TYPE of NODE."
  (condition-case nil
      (file-name-nondirectory
       (directory-file-name
        (file-name-directory
         (file-relative-name (org-roam-node-file node) org-roam-directory))))
    (error "")))

(setq org-roam-node-display-template
      (concat "${type:15} ${hierarchy}${title:*}${spacing}" (propertize "${tags:10}" 'face 'org-tag)))

(defun tag-new-node-as-draft ()
  (org-roam-tag-add '("draft")))
(add-hook 'org-roam-capture-new-node-hook #'tag-new-node-as-draft)

(defun org-roam-capture-slipbox ()
  (interactive)
  (org-capture nil "s"))

(require 'ucs-normalize) ; Allows for the unicode normalizing representation function

(cl-defmethod org-roam-node-slug ((node org-roam-node))
  "Return the slug of NODE."
  (let ((title (org-roam-node-title node))
        (slug-trim-chars '(;; Combining Diacritical Marks https://www.unicode.org/charts/PDF/U0300.pdf
                           768 ; U+0300 COMBINING GRAVE ACCENT
                           769 ; U+0301 COMBINING ACUTE ACCENT
                           770 ; U+0302 COMBINING CIRCUMFLEX ACCENT
                           771 ; U+0303 COMBINING TILDE
                           772 ; U+0304 COMBINING MACRON
                           774 ; U+0306 COMBINING BREVE
                           775 ; U+0307 COMBINING DOT ABOVE
                           776 ; U+0308 COMBINING DIAERESIS
                           777 ; U+0309 COMBINING HOOK ABOVE
                           778 ; U+030A COMBINING RING ABOVE
                           780 ; U+030C COMBINING CARON
                           795 ; U+031B COMBINING HORN
                           803 ; U+0323 COMBINING DOT BELOW
                           804 ; U+0324 COMBINING DIAERESIS BELOW
                           805 ; U+0325 COMBINING RING BELOW
                           807 ; U+0327 COMBINING CEDILLA
                           813 ; U+032D COMBINING CIRCUMFLEX ACCENT BELOW
                           814 ; U+032E COMBINING BREVE BELOW
                           816 ; U+0330 COMBINING TILDE BELOW
                           817 ; U+0331 COMBINING MACRON BELOW
                           )))
    (cl-flet* ((nonspacing-mark-p (char)
                 (memq char slug-trim-chars))
               (strip-nonspacing-marks (s)
                 (ucs-normalize-NFC-string
                  (apply #'string (seq-remove #'nonspacing-mark-p
                                              (ucs-normalize-NFD-string s)))))
               (cl-replace (title pair)
                 (replace-regexp-in-string (car pair) (cdr pair) title)))
      (let* ((pairs `(("[^[:alnum:][:digit:].]" . "-") ;; convert anything not alphanumeric or a dot
                      ("--*" . "-")                   ;; remove sequential underscores
                      ("^-" . "")                     ;; remove starting underscore
                      ("-$" . "")))                   ;; remove ending underscore
             (slug (-reduce-from #'cl-replace (strip-nonspacing-marks title) pairs)))
        (downcase slug)))))

(straight-use-package
 '(dendroam :type git
            :host github
            :repo "2eAsteroid/dendroam"
            :files (:defaults)))

(require 'dendroam)

(straight-use-package
 '(org-roam-bibtex :type git
                   :host github
                   :repo "org-roam/org-roam-bibtex"
                   :files (:defaults)))

(require 'org-roam-bibtex)

(setq bibtex-completion-bibliography '("~/.emacs.d/zettels/biblio.bib"))   ; This allows bibtex-completion to not throw a fit

(provide 'zettelkasten)
