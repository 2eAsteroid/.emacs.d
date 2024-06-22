(straight-use-package
 '(dashboard :type git
             :host github
             :repo "emacs-dashboard/emacs-dashboard"
             :files (:defaults "banners/*.txt")))

(dashboard-setup-startup-hook)  ; Sets up dashboard to show at startup
(setq dashboard-banner-logo-title "Chimera Systems™") ; You can also propertize the title and have it be (propertize "TITLE" 'face FACE)
(setq dashboard-startup-banner 1)  ; Change this to my own banner in the future
(setq dashboard-center-content t
      dashboard-set-heading-icons t)

(provide 'emacs-dashboard)
