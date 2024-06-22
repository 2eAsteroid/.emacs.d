(straight-use-package
 '(emms :type git
        :host github
        :repo "emacsmirror/emms"
        :files (:defaults)))

(require 'emms)

(emms-minimalistic)

;; Add actual config later

(provide 'music)
