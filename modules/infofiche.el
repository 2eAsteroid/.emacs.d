(straight-use-package
 '(elfeed :type git
          :host github
          :repo "skeeto/elfeed"
          :files (:defaults)))

(require 'elfeed)

(straight-use-package
 '(elfeed-org :type git
              :host github
              :repo "remyhonig/elfeed-org"
              :files (:defaults)))

(require 'elfeed-org)

(elfeed-org) ; Inits the process

(straight-use-package
 '(elfeed-score :type git
                :host github
                :repo "sp1ff/elfeed-score"
                :files (:defaults)))

(require 'elfeed-score)
(elfeed-score-enable) ; Inits it

(provide 'infofiche)
