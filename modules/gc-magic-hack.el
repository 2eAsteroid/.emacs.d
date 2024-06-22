(straight-use-package
 '(gcmh :type git
        :host github
        :repo "emacsmirror/gcmh"
        :files (:defaults)))
(require 'gcmh)

(setq gcmh-low-cons-threshold 800000   ; 800 kB
      gcmh-high-cons-threshold 3200000 ; 1.6 mB
      gcmh-idle-delay 20               ; 15 sec.
      gcmh-verbose t)                  ; Tells us when it garbage collects.
(gcmh-mode)

(provide 'gc-magic-hack)
