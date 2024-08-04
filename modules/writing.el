(straight-use-package
 '(olivetti :type git
            :host github
            :repo "rnkn/olivetti"
            :files (:defaults)))

(require 'olivetti)

(add-function-to-hooks #'olivetti-mode '(text-mode-hook
                                         prog-mode-hook
                                         Info-mode-hook
                                         ; pdf-view-mode-hook
                                         org-mode-hook))

(straight-use-package
 '(hydra :type git
         :host github
         :repo "abo-abo/hydra"
         :files (:defaults)))

(require 'hydra)

(provide 'writing)
