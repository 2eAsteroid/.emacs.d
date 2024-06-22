(setq doc-view-scale-internally t
      doc-view-resolution 600)

(straight-use-package
 '(pdf-tools :type git
             :host github
             :repo "vedang/pdf-tools"
             :files (:defaults)))

(require 'pdf-tools)
(pdf-tools-install)

(provide 'pdfs)
