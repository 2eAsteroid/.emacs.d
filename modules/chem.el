(straight-use-package
 '(chemtable :type git
             :host github
             :repo "sergiruiztrepat/chemtable"
             :files (:defaults)))

(require 'chemtable)

(straight-use-package
 '(chembalance :type git
               :host github
               :repo "sergiruiztrepat/chembalance"
               :files (:defaults)))

(require 'chembalance)

(setq chembalance-arrow-syntax '("=" "=>" "→" "->"))

(straight-use-package
 '(molar-mass :type git
              :host github
              :repo "sergiruiztrepat/molar-mass"
              :files (:defaults)))

(require 'molar-mass)

(provide 'chem)
