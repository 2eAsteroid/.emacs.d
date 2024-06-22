(straight-use-package
 '(zotra :type git
         :host github
         :repo "mpedramfar/zotra"
         :files (:defaults)))

(require 'zotra)

(setq zotra-default-bibliography (expand-file-name "biblio.bib" org-roam-directory))

(straight-use-package
 '(oc :type built-in))

(require 'oc)

(setq org-cite-global-bibliography
      '("~/.emacs.d/zettels/biblio.bib"))

(setq org-cite-export-processors
      `((md . (csl ,(expand-file-name "chicago-fullnote-bibliography.csl" csl-style-directory)))
        (latex biblatex)
        (odt . (csl ,(expand-file-name "chicago-fullnote-bibliography.csl" csl-style-directory)))
        (t . (csl ,(expand-file-name "chicago-fullnote-bibliography.csl" csl-style-directory)))))

(straight-use-package
 '(citeproc :type git
            :host github
            :repo "andras-simonyi/citeproc-el"
            :files (:defaults)))

(require 'citeproc)

(straight-use-package
 '(citar :type git
         :host github
         :repo "emacs-citar/citar"
         :files (:defaults)))

(require 'citar)

(setq org-cite-insert-processor 'citar
      org-cite-follow-processor 'citar
      org-cite-activate-processor 'citar
      citar-bibliography org-cite-global-bibliography)

(straight-use-package
 '(citar-org-roam :type git
                  :host github
                  :repo "emacs-citar/citar-org-roam"
                  :files (:defaults)))

(require 'citar-org-roam)

(citar-register-notes-source
 'orb-citar-source (list :name "Zettels"
                         :category 'org-roam-node
                         :items #'citar-org-roam--get-candidates
                         :hasitems #'citar-org-roam-has-notes
                         :open #'citar-org-roam-open-note
                         :create #'orb-citar-edit-note
                         :annotate #'citar-org-roam--annotate))

(setq citar-org-roam-note-title-template "${author editor} :: ${title}"
      citar-org-roam-capture-template-key "r"
      citar-notes-source 'orb-citar-source)

(citar-org-roam-mode) ; Has to be after everything above

(provide 'citation)
