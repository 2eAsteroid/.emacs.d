;;; No Littering
(straight-use-package
 '(no-littering :type git
                :host github
                :repo "emacscollective/no-littering"
                :files (:defaults)))

(defvar no-littering-etc-directory
      (expand-file-name "config/" user-emacs-directory))
(defvar no-littering-var-directory
      (expand-file-name "data/" user-emacs-directory))

(require 'no-littering)

(require 'recentf)
(add-to-list 'recentf-exclude                                          ; Excludes all no-littering files from recentf
             (recentf-expand-file-name no-littering-var-directory))
(add-to-list 'recentf-exclude                                          ; ^
             (recentf-expand-file-name no-littering-etc-directory))

(setq custom-file (no-littering-expand-etc-file-name "custom.el"))     ; Stores Emacs' configuration interface in the config folder, called custom.el

(provide 'no-litter)
