(straight-use-package
 '(org :type built-in))  ; Uses the built-in version of org.

(require 'org)

(setq org-ellipsis nil                               ; Uses ... for hidden org headlines, which might change in the future.
      org-startup-folded t                           ; Folds and hides org headlines at startup
      org-pretty-entities t                          ; Makes certain characters display as UTF-8 unicode symbols.
      org-auto-align-tags t                          ; Keeps org tags aligned always
      org-fold-catch-invisible-edits 'show-and-error ; When editing text inside a hidden area, open the headline and abort edit
      org-special-ctrl-a/e t                         ; Makes C-a and C-e be special in a headline
      org-image-actual-width 1000                    ; Messes things up
      org-insert-heading-respect-content t           ; When adding a new headline, have it respect the current tree you're in
      org-hide-emphasis-markers t                    ; Hides markup characters
      org-startup-indented t)                        ; Start org modes with text under a headline indented to the depth of the headline.

(add-hook 'org-mode-hook 'visual-line-mode) ; Makes Org Mode display with visual lines (smart wrapping)

;; I also have to add org modules once I know what I want to add
(setq org-modules '(ol-doi
                    ol-w3m
                    ol-bbdb
                    ol-bibtex
                    ol-docview
                    ol-gnus
                    ol-info
                    ol-irc
                    ol-mhe
                    ol-rmail
                    ol-eww
                    org-habit))

(require 'org-agenda)

(setq org-todo-keywords '((sequence "TODO(t)" "NEXT(n!)" "WAITING(w@/!)" "|" "DONE(d!)" "CANCELED(c@/!)")) ; Setq todo keywords to that sequence
      org-agenda-block-separator ?-       ; Sets the block separator to ?-
      org-agenda-time-grid '((daily today require-timed)              ; Explain Later
                             (800 1000 1200 1400 1600 1800 2000)
                             " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
      org-agenda-current-time-string "◀-- now -------------------------------------------------"
      org-agenda-files '("~/.emacs.d/work/tasks.org")
      org-agenda-tags-column org-tags-column
      org-agenda-sticky t
      org-agenda-inhibit-startup nil
      org-agenda-dim-blocked-tasks nil
      org-agenda-compact-blocks nil
      org-deadline-warning-days 7)

(straight-use-package
 '(org-edit-latex :type git
                  :host github
                  :repo "et2010/org-edit-latex"
                  :files (:defaults)))

(require 'org-edit-latex)

(setq org-hide-leading-stars t)

(straight-use-package
 '(org-bullets :type git
               :host github
               :repo "sabof/org-bullets"
               :files (:defaults)))

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda ()
                           (org-bullets-mode 1)))

(setq org-bullets-bullet-list '("⦿" "○" "◎"))

(eval-after-load "zettelkasten"
  '(setq org-capture-templates
         `(("t" "Task" entry (file "~/.emacs.d/work/tasks.org")
            "* TODO %^{Task}\nADDED: %T\nDEADLINE: %^{DEADLINE}t\n\n%?\n")
           ("p" "Project" entry (file "~/.emacs.d/work/tasks.org")
            "* %? :PROJECT:\n")
           ("s" "Slipbox" entry (file ,(expand-file-name "inbox.org" org-roam-directory))
            "* %T\n%?\n"))))

;; These are the refiling targets for org-capture
(setq org-refile-targets '((org-agenda-files . (:tag . "PROJECT"))))

(setq org-persist-directory (locate-user-emacs-file "data/org-persist/"))

(provide 'ogre)
