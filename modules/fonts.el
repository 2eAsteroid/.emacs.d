(cond ((string-equal window-system 'w32) (progn
                                           (when (member "Segoe UI Emoji" (font-family-list))
                                             (set-fontset-font t 'symbol (font-spec :family "Segoe UI Emoji") nil 'prepend)
                                             (set-fontset-font "fontset-default" '(#xFE00 . #xFE0F) "Segoe UI Emoji"))

                                           (when (member "Times New Roman" (font-family-list))
                                             (set-fontset-font "fontset-default" 'unicode "Times New Roman"))

                                           (when (member "Unifont" (font-family-list))
                                             (set-fontset-font t nil "Unifont" nil 'append)
                                             (set-fontset-font t nil "Unifont Upper" nil 'append)))
       (string-equal window-system 'x) (progn
                                         (when (member "Noto Color Emoji" (font-family-list))
                                           (set-fontset-font t 'symbol (font-spec :family "Noto Color Emoji") nil 'prepend)
                                           (set-fontset-font "fontset-default" '(#xFE00 . #xFE0F) "Noto Color Emoji"))

                                         (when (member "Unifont" (font-family-list))
                                           (set-fontset-font t nil "Unifont" nil 'append)
                                           (set-fontset-font t nil "Unifont Upper" nil 'append)))))

;;; Rainbow Mode
(straight-use-package
 '(rainbow-mode :type git
                :host github
                :repo "emacsmirror/rainbow-mode"
                :files (:defaults)))
(require 'rainbow-mode)

(add-hook 'prog-mode-hook 'rainbow-mode) ; Adds rainbow-mode to all programming modes.
(setq rainbow-x-colors nil)              ; Prevents words like 'gold' from being highlighted

;;; Fira Code Mode
(straight-use-package
 '(fira-code-mode :type git
                  :host github
                  :repo "jming422/fira-code-mode"
                  :files (:defaults)))

(require 'fira-code-mode)

(unless (member "Fira Code Symbol" (font-family-list))
  (fira-code-mode-install-fonts))

(fira-code-mode-set-font)
(setq fira-code-mode-disabled-ligatures '("*" "?=" "[]" "x"))
(add-hook 'prog-mode-hook 'fira-code-mode)

(provide 'fonts)
