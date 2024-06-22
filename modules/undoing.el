(setq undo-limit 1000000)   ; The undo limit is the max amount of bytes of undo data to store. I think 1 mB is enough for now (I can change it later).

(straight-use-package
 '(undo-fu :type git
           :host github
           :repo "emacsmirror/undo-fu"
           :files (:defaults)))

(require 'undo-fu)

;; Switch these later
(global-set-key (kbd "C-/")   'undo-fu-only-undo)
(global-set-key (kbd "C-S-/") 'undo-fu-only-redo)

(provide 'undoing)
