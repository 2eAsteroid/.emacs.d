(straight-use-package
 '(projectile :type git
              :host github
              :repo "bbatsov/projectile"
              :files (:defaults)))

(require 'projectile)

(projectile-mode +1) ; Turns on projectile

(provide 'projecting)
