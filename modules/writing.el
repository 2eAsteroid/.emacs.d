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

(provide 'writing)
