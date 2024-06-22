(straight-use-package
 '(tempel :type git
          :host github
          :repo "minad/tempel"
          :files (:defaults)))

(require 'tempel)

(setq tempel-trigger-prefix nil)

(add-to-list 'completion-at-point-functions #'tempel-complete)



(straight-use-package
 '(cdlatex :type git
           :host github
           :repo "cdominik/cdlatex"
           :files (:defaults)))

(require 'cdlatex)

(add-hook 'LaTeX-mode-hook #'turn-on-cdlatex)   ; with AUCTeX LaTeX mode
(add-hook 'latex-mode-hook #'turn-on-cdlatex)   ; with Emacs latex mode
(add-hook 'org-mode-hook #'turn-on-org-cdlatex) ; with Org Mode

(setq cdlatex-command-alist '(("ang"         "Insert \\ang{}"
                               "\\ang{?}" cdlatex-position-cursor nil t t)
                              ("si"          "Insert \\SI{}{}"
                               "\\SI{?}{}" cdlatex-position-cursor nil t t)
                              ("sl"          "Insert \\SIlist{}{}"
                               "\\SIlist{?}{}" cdlatex-position-cursor nil t t)
                              ("sr"          "Insert \\SIrange{}{}{}"
                               "\\SIrange{?}{}{}" cdlatex-position-cursor nil t t)
                              ("num"         "Insert \\num{}"
                               "\\num{?}" cdlatex-position-cursor nil t t)
                              ("nl"          "Insert \\numlist{}"
                               "\\numlist{?}" cdlatex-position-cursor nil t t)
                              ("nr"          "Insert \\numrange{}{}"
                               "\\numrange{?}{}" cdlatex-position-cursor nil t t)
                              ("fr"          "Insert \\frac{}{}"
                               "\\frac{}{}" cdlatex-position-cursor nil t t)
                              ("rt"          "Insert \\sqrt[]{}"
                               "\\sqrt[?]{}" cdlatex-position-cursor nil t t)))

(provide 'cookie-cutter)
