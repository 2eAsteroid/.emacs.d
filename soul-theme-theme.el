;;; package --- A beautiful theme.
;;; Commentary:
;;; very monochrome theme


;;; Code:
(eval-when-compile
  (require 'cl-lib))

(require 'autothemer)

(unless (>= emacs-major-version 24)
  (error "Requires Emacs 24 or later"))


(autothemer-deftheme
 soul-theme "For professionals."

 ((((class color) (min-colors #xFFFFFF))        ; col 1 GUI/24bit
   ((class color) (min-colors #xFF)))           ; col 2 Xterm/256

  ;; Define our color palette
  (spirit           "#9A7AA0" "#9977AA")  ; The official purple of this theme.
  (ectoplasm        "#8CB369" "#88BB66")  ; The official green of this theme.
  (blood            "#BC4B51" "#CC0000")  ; The official red of this theme.
  (tears            "#5B8E7D" "#558877")  ; The official blue of this theme.
  (text             "#27221F" "#000000")  ; The standard text color; this is used for all text.
  (subtle           "#000000" "#000000")  ; The slightly-higher contrast gives it a subtlety. Used for especially important text.
  (overlay          "#F9FBFF" "#ffffff")  ; Leaves; this is used for temporary backgrounds, like popups or temporary buffers (anything above the surface)
  (surface          "#F4EDED" "#ffffff")  ; Base of all background colors; this is used for the main backgrounds (files, etc)
  (base             "#F9FBFF" "#FFFFFF")) ; Basically the same as overlay, but this is for below the surface.

 ;; Customize faces
 (
  (default                              (:background surface :foreground text :family "Berkeley Mono"  :height 185)) ; Default
  (border                               (:foreground text)) ; Frame Border
  (bookmark-face                        (:foreground blood)) ; Color of the bookmark symbol in the gutter
  (button                               (:foreground ectoplasm)) ; Color of buttons
  (child-frame                          (:foreground surface)) ; Color of child frames?
  (child-frame-border                   (:foreground surface)) ; Color of the border
  (cursor                               (:background text :foreground surface :distant-foreground text)) ; Cursor face
  (error                                (:foreground blood)) ; Color of errors
  (link                                 (:foreground ectoplasm)) ; Color of links
  (fringe                               (:foreground base)) ; Color of gutter at the left
  (file-name-shadow                     (:foreground text)) ; Color of dimmed out file name parts
  (glyph-face                           (:background blood :foreground text)) ; Color of glyphs that aren't supposed to be there?
  (glyphless-char                       (:foreground text)) ; Color of glyphs with no graphic representation
  (header-line                          (:background text :foreground surface)) ;
  (highlight                            (:background ectoplasm :foreground text))
  (hl-line                              (:background overlay :distant-foreground text))
  (homoglyph                            (:foreground blood))
  (line-number                          (:background overlay :foreground text))
  (line-number-current-line             (:background overlay :bold t))
  (match                                (:background blood :foreground base))
  (menu                                 (:foreground text))
  (fill-column-indicator                (:foreground text))
  (mode-line                            (:background text :foreground surface))
  (mode-line-inactive                   (:background surface :foreground text))
  (mode-line-active                     (:background text :foreground surface))
  (mode-line-highlight                  (:foreground ectoplasm))
  (mode-line-buffer-id                  (:bold t))
  (numbers                              (:background blood))
  (region                               (:background text :distant-foreground surface))
  (tooltip                              (:background text :foreground base))
  (shadow                               (:foreground text))
  (success                              (:foreground ectoplasm))
  (vertical-border                      (:foreground overlay))
  (warning                              (:foreground tears))
  (window-divider                       (:foreground surface :distant-foreground overlay))

  (whitespace-newline                   (:foreground text))
  (whitespace-space                     (:foreground text))
  (whitespace-trailing                  (:foreground base :background tears))
  (trailing-whitespace                  (:foreground text :background blood))

  ;; ;; Font lock
  (font-lock-keyword-face               (:foreground text))
  (font-lock-type-face                  (:foreground text))
  (font-lock-builtin-face               (:foreground text))
  (font-lock-function-name-face         (:foreground tears))
  (font-lock-variable-name-face         (:foreground text))
  (font-lock-comment-face               (:foreground blood))
  (font-lock-doc-face                   (:foreground blood))
  (font-lock-string-face                (:foreground ectoplasm))
  (font-lock-warning-face               (:foreground "#FF0000"))
  (font-lock-constant-face              (:foreground spirit))
  (font-lock-regexp-grouping-backslash  (:foreground ectoplasm))

  (font-lock-reference-face				(:foreground text))
  (font-lock-negation-char-face         (:foreground text))
  (font-lock-comment-delimiter-face     (:foreground blood))
  (font-lock-doc-markup-face            (:foreground blood))
  (font-lock-preprocessor-face	   		(:foreground text))

  (elisp-shorthand-font-lock-face       (:foreground text))

  (highlight-operators-face             (:foreground tears))
  (highlight-quoted-symbol              (:foreground ectoplasm))
  (highlight-numbers-face               (:foreground tears))
  (highlight-symbol-face                (:background text :foreground subtle))
  (info-xref                            (:foreground blood))

  (minibuffer-prompt-end                (:foreground tears))
  (minibuffer-prompt                    (:foreground tears))
  (epa-mark                             (:foreground tears))
  (dired-mark                           (:foreground tears))
  (dired-ignored                        (:background blood))

  (iedit-occurrence                     (:background ectoplasm :foreground base))
  (iedit-read-only-occurrence           (:background spirit :foreground base))

  (trailing-ectoplasmwaterspace              (:background overlay))

  ;; ;; Battery colors
  (doom-modeline-battery-critical       (:inherit 'error))
  (doom-modeline-battery-warning        (:inherit 'warning))
  (doom-modeline-battery-charging       (:foreground text))
  (doom-modeline-battery-error          (:inherit 'error))
  (doom-modeline-battery-normal         (:foreground text))
  (doom-modeline-battery-full           (:foreground text))

  ;; Doom visual state
  (doom-modeline-evil-motion-state      (:foreground ectoplasm))
  (doom-modeline-evil-emacs-state       (:foreground ectoplasm))
  (doom-modeline-evil-insert-state      (:foreground ectoplasm))
  (doom-modeline-evil-normal-state      (:foreground text))
  (doom-modeline-evil-visual-state      (:foreground ectoplasm))
  (doom-modeline-evil-replace-state     (:foreground tears))
  (doom-modeline-evil-operator-state    (:foreground ectoplasm))

  (doom-modeline-project-dir            (:foreground text))
  (doom-modeline-buffer-path            (:foreground text))
  (doom-modeline-buffer-file            (:foreground text))
  (doom-modeline-buffer-major-mode      (:foreground ectoplasm))
  (doom-modeline-buffer-modified        (:foreground text))
  (doom-modeline-error                  (:background tears))
  (doom-modeline-info                   (:foreground subtle))
  (doom-modeline-time                   (:foreground text))
  (doom-modeline-project-dir            (:foreground ectoplasm))
  (doom-modeline-bar                    (:background blood))
  (doom-modeline-bar-inactive           (:background overlay))
  (doom-modeline-panel                  (:background ectoplasm :foreground base))
  (doom-modeline                        (:foreground text))
  (doom-themes-visual-bell              (:background tears))

  ;;elfeed
  (elfeed-search-feed-face              (:foreground spirit))
  (elfeed-search-tag-face               (:foreground ectoplasm))

  ;; message colors
  (message-header-name                  (:foreground text))
  (message-header-other                 (:foreground blood))
  (message-header-subject               (:foreground blood))
  (message-header-to                    (:foreground ectoplasm))
  (message-header-cc                    (:foreground spirit))
  (message-header-xheader               (:foreground ectoplasm))
  (custom-link                          (:foreground ectoplasm :underline t))

  ;; org-mode
  (with-eval-after-load "org"
    (org-done                             (:foreground text))
    (org-code                             (:background base))
    (org-meta-line                        (:background overlay :foreground ectoplasm))
    (org-block                            (:background base))
    (org-block-begin-line                 (:background base :foreground text))
    (org-block-end-line	                (:background base :foreground text))
    (org-headline-done                    (:foreground text :strike-through t))
    (org-todo                             (:foreground spirit))
    (org-headline-todo                    (:foreground surface))
    (org-upcoming-deadline                (:foreground tears))
    (org-footnote                         (:foreground spirit))
    (org-indent                           (:foreground surface))
    (org-hide	                            (:foreground surface))
    (org-date                             (:foreground text))
    (org-ellipsis                         (:foreground text))
    (org-level-1                          (:foreground tears :height 1.3))
    (org-level-2                          (:foreground spirit :height 1.15))
    (org-level-3                          (:foreground ectoplasm :height 1.05))
    (org-level-4                          (:foreground text))
    (org-level-5                          (:foreground text))
    (org-level-6                          (:foreground blood))
    (org-level-7                          (:foreground blood))
    (org-level-8                          (:foreground ectoplasm)))

  ;; which-key
  (which-key-key-face                   (:inherit 'font-lock-variable-name-face))
  (which-func							(:inherit 'font-lock-function-name-face))
  (which-key-group-description-face     (:foreground tears))
  (which-key-command-description-face   (:foreground ectoplasm))
  (which-key-local-map-description-face (:foreground blood))
  (which-key-posframe					(:background base))
  (which-key-posframe-border			(:background base))

  ;; swiper
  (swiper-line-face                     (:foreground blood))
  (swiper-background-match-face-1       (:background blood :foreground base))
  (swiper-background-match-face-2       (:background ectoplasm :foreground base))
  (swiper-background-match-face-3       (:background ectoplasm :foreground base))
  (swiper-background-match-face-4       (:background tears :foreground base))
  (swiper-match-face-1					(:inherit 'swiper-background-match-face-1))
  (swiper-match-face-2					(:inherit 'swiper-background-match-face-2))
  (swiper-match-face-3					(:inherit 'swiper-background-match-face-3))
  (swiper-match-face-4					(:inherit 'swiper-background-match-face-4))

  (counsel-outline-default              (:foreground blood))
  (info-header-xref                     (:foreground blood))
  (xref-file-header                     (:foreground blood))
  (xref-match		                    (:foreground blood))

  ;; rainbow delimiter
  (rainbow-delimiters-mismatched-face   (:foreground base :background tears))
  (rainbow-delimiters-unmatched-face    (:foreground base :background tears))
  (rainbow-delimiters-base-error-face   (:foreground base :background tears))

  (rainbow-delimiters-base-face         (:foreground text))

  (rainbow-delimiters-depth-1-face      (:foreground spirit))
  (rainbow-delimiters-depth-2-face      (:foreground ectoplasm))
  (rainbow-delimiters-depth-3-face      (:foreground tears))
  (rainbow-delimiters-depth-4-face      (:foreground ectoplasm))
  (rainbow-delimiters-depth-5-face      (:foreground spirit))
  (rainbow-delimiters-depth-6-face      (:foreground subtle))
  (rainbow-delimiters-depth-7-face      (:foreground text))
  (rainbow-delimiters-depth-8-face      (:foreground blood))
  (rainbow-delimiters-depth-9-face      (:foreground spirit))

  ;; show-paren
  (show-paren-match						(:background ectoplasm :foreground base))
  (show-paren-match-expression			(:background ectoplasm :foreground base))
  (show-paren-mismatch					(:background tears))

  (markdown-hr-face                     (:foreground overlay))

  ;; Flycheck
  (flycheck-posframe-background-face    (:background base))
  (flycheck-posframe-face               (:background base))
  (flycheck-posframe-info-face          (:foreground ectoplasm :background text :height 160))
  (flycheck-posframe-warning-face       (:foreground surface :background text :height 160))
  (flycheck-posframe-error-face         (:foreground surface :background text :height 160))
  (flycheck-fringe-warning              (:inherit 'warning))
  (flycheck-fringe-error                (:inherit 'error))
  (flycheck-fringe-info                 (:inherit 'info ))
  (flycheck-error-list-warning          (:inherit 'warning))
  (flycheck-error-list-error            (:inheirt 'error))
  (flycheck-error-list-info             (:foreground ectoplasm))
  (flycheck-inline-error                (:background tears :foreground tears :height 128))
  (flycheck-inline-info                 (:background ectoplasm :foreground ectoplasm :height 128))
  (flycheck-inline-warning              (:background blood :foreground blood :height 128))

  ;; indent dots
  (highlight-indent-guides-character-face       (:foreground tears :background tears))
  (highlight-indent-guides-stack-character-face (:foreground tears :background tears))
  (highlight-indent-guides-top-character-face   (:foreground tears :background tears))
  (highlight-indent-guides-stack-odd-face       (:foreground tears :background tears))
  (highlight-indent-guides-stack-even-face      (:foreground tears :background tears))
  (highlight-indent-guides-even-face            (:foreground tears :background tears))
  (highlight-indent-guides-odd-face             (:foreground tears :background tears))
  (highlight-indent-guides-top-odd-face         (:foreground tears :background tears))
  (highlight-indent-guides-top-even-face        (:foreground tears :background tears))

  (vertico-multiline                            (:background base))
  (vertico-group-title                          (:foreground subtle :height 180))
  (vertico-group-separator                      (:foreground text :strike-through t))
  (vertico-current                              (:background overlay :distant-foreground text :foreground surface))

  (vertico-posframe-border                      (:background text))
  (vertico-posframe                             (:background base :foreground text))

  (corfu-annotations                            (:foreground text))
  (corfu-current                                (:inherit 'vertico-current))
  (corfu-border                                 (:background overlay))
  (corfu-bar                                    (:background blood))
  (corfu-default                                (:background base :foreground text))
  (corfu-popupinfo                              (:background overlay :foreground text))

  (orderless-match-face-0                       (:foreground spirit))
  (orderless-match-face-1                       (:foreground spirit))
  (orderless-match-face-2                       (:foreground spirit))
  (orderless-match-face-3                       (:foreground spirit))

  (comint-highlight-prompt                      (:background blood :foreground base))

  (completions-annotations                      (:foreground text))
  (completions-highlight                        (:foreground ectoplasm))
  (completions-common-part                      (:foreground blood :distant-foreground base :distant-background spirit))
  (completions-first-difference                 (:foreground tears :strike-through t))
  (consult-file                                 (:foreground text :distant-foreground base))

  (diff-added (:background spirit :foreground text))
  (diff-changed (:background blood :foreground base))

  (treemacs-directory-collapsed-face			(:foreground text))
  (treemacs-directory-face						(:foreground subtle))
  (treemacs-file-face							(:foreground subtle))
  (treemacs-fringe-indicator-face               (:foreground tears))

  (treemacs-git-added-face						(:foreground blood))
  (treemacs-git-renamed-face				   	(:foreground ectoplasm))
  (treemacs-git-ignored-face				   	(:foreground text))
  (treemacs-git-unmodified-face		   			(:foreground text))
  (treemacs-git-renamed-face		   			(:foreground text))
  (treemacs-git-modified-face		   			(:foreground ectoplasm))

  ;; lets support solaire mode
  (solaire-default-face (:background base))
  ;; lsp
  (lsp-headerline-breadcrumb-path-error-face (:underline (:color ectoplasm :style 'wave)
							 :foreground text :background base))

  (lsp-headerline-breadcrumb-path-face				(:background text))
  (lsp-headerline-breadcrumb-path-hint-face	   		(:background base))
  (lsp-headerline-breadcrumb-path-info-face	   		(:background text))
  (lsp-headerline-breadcrumb-separator-face			(:background text))
  (lsp-headerline-breadcrumb-symbols-face			(:background ectoplasm))
  (lsp-headerline-breadcrumb-project-prefix-face	(:background blood))
  (lsp-headerline-breadcrumb-symbols-error-face     (:foreground tears))

  (lsp-ui-doc-background							(:background base :foreground tears))
  (lsp-ui-doc-header								(:background base :foreground tears))
  (lsp-ui-peek-filename								(:foreground ectoplasm))
  (lsp-ui-sideline-code-action			   			(:foreground blood))
  (lsp-ui-sideline-current-symbol					(:foreground ectoplasm))
  (lsp-ui-sideline-symbol							(:foreground text))

  ;; dashboard
  (dashboard-items-face								(:height 150))
  (dashboard-banner-logo-title						(:height 320))
  (dashboard-heading								(:foreground subtle :height 170))
  (dashboard-no-items-face							(:foreground text))

  ;; all-the-icons
  (all-the-icons-dgreen							(:foreground spirit))
  (all-the-icons-green							(:foreground spirit))
  (all-the-icons-dpurple						(:foreground spirit))
  (all-the-icons-purple							(:foreground spirit))

  (ansi-color-crust (:background base))

  (term (:background base :foreground text))
  (term-color-blue (:background ectoplasm :foreground ectoplasm))
  (term-color-bright-blue (:inherit 'term-color-blue))
  (term-color-red (:background tears :foreground tears))
  (term-color-bright-red (:background ectoplasm :foreground ectoplasm))
  (term-color-yellow (:background blood :foreground blood))
  (term-color-bright-yellow (:background blood :foreground blood))

  (term-color-green (:background spirit :foreground spirit))
  (term-color-bright-green (:inherit 'term-color-green))

  (term-color-bright-crust (:background base :foreground tears))
  (term-color-ectoplasmwater (:background text :foreground text))
  (term-color-bright-ectoplasmwater (:background ectoplasm :foreground ectoplasm))
  (term-color-cyan (:background ectoplasm :foreground ectoplasm))
  (term-color-bright-cyan (:background ectoplasm :foreground ectoplasm))
  (term-color-magenta (:background spirit :foreground spirit))
  (term-color-bright-magenta (:background spirit :foreground spirit))
  (term-underline (:background spirit :foreground ectoplasm))

  (vterm-color-crust (:background base :foreground base))
  (vterm-color-blue (:background ectoplasm :foreground ectoplasm))
  (vterm-color-cyan (:background ectoplasm :foreground ectoplasm))
  (vterm-color-green (:background spirit :foreground spirit))
  (vterm-color-magenta (:background ectoplasm :foreground ectoplasm))
  (vterm-color-yellow (:background blood :foreground blood))
  (vterm-color-red (:background tears :foreground tears))
  (vterm-color-ectoplasmwater (:background text :foreground text))

  (popup-face (:inherit 'tooltip))
  (popup-selection-face (:inherit 'tooltip))
  (popup-tip-face (:inherit 'tooltip))

  (anzu-match-1 (:foreground spirit :background base))
  (anzu-match-2 (:foreground blood :background base))
  (anzu-match-3 (:foreground ectoplasm :background base))

  (anzu-mode-line		(:foreground base :background spirit))
  (anzu-mode-no-match	(:foreground text :background tears))
  (anzu-replace-to		(:foreground blood :background text))

  (ace-jump-face-background (:foreground text))
  (ace-jump-face-foreground (:foreground tears :background base))

  (hydra-face-amaranth		(:foreground spirit))
  (hydra-face-blue			(:foreground ectoplasm))
  (hydra-face-pink			(:foreground tears))
  (hydra-face-red			(:foreground tears))
  (hydra-face-teal			(:foreground ectoplasm))

  ;; Bookmarks
  (bm-fringe-face                           (:background tears :foreground base))
  (bm-fringe-persistent-face                (:background tears :foreground base))

  (centaur-tabs-active-bar-face				(:background base :foreground text))
  (centaur-tabs-selected					(:background base :foreground text))
  (centaur-tabs-selected-modified			(:background base :foreground text))
  (centaur-tabs-modified-marker-selected	(:background base :foreground text))
  (centaur-tabs-close-selected				(:inherit 'centaur-tabs-selected))

  (centaur-tabs-unselected					(:background base :foreground text))
  (centaur-tabs-unselected-modified			(:background base :foreground spirit))
  (centaur-tabs-modified-marker-unselected	(:background base :foreground text))
  (centaur-tabs-close-unselected			(:background base :foreground text))

  (centaur-tabs-close-mouse-face			(:foreground tears))
  (centaur-tabs-default						(:background base))
  (centaur-tabs-name-mouse-face				(:foreground ectoplasm))

  (git-gutter:added                              (:foreground spirit))
  (git-gutter:deleted                            (:foreground tears))
  (git-gutter:modified                           (:foreground ectoplasm))

  (goggles-added (:background spirit))
  (goggles-changed (:background ectoplasm))
  (goggles-removed (:background tears))

  ;; Tree sitter highlightning
  (tree-sitter-hl-face:function                  (:inherit 'font-lock-function-name-face))
  (tree-sitter-hl-face:function.call             (:inherit 'tree-sitter-hl-face:function))
  (tree-sitter-hl-face:function.builtin          (:foreground tears))
  (tree-sitter-hl-face:function.special          (:foreground text))
  (tree-sitter-hl-face:function.macro            (:foreground spirit))
  (tree-sitter-hl-face:function.label            (:foreground blood))

  (tree-sitter-hl-face:method                    (:inherit 'tree-sitter-hl-face:function))
  (tree-sitter-hl-face:method.call               (:inherit 'tree-sitter-hl-face:method))

  (tree-sitter-hl-face:type                      (:inherit 'font-lock-type-face))
  (tree-sitter-hl-face:type.parameter            (:foreground spirit))
  (tree-sitter-hl-face:type.argument             (:foreground text))
  (tree-sitter-hl-face:type.builtin              (:inherit 'font-lock-builtin-face))
  (tree-sitter-hl-face:type.super                (:foreground ectoplasm))
  (tree-sitter-hl-face:constructor               (:foreground ectoplasm))

  (tree-sitter-hl-face:variable                  (:inherit 'font-lock-variable-name-face))
  (tree-sitter-hl-face:variable.parameter        (:inherit 'tree-sitter-hl-face:type.parameter))
  (tree-sitter-hl-face:variable.builtin          (:foreground ectoplasm))
  (tree-sitter-hl-face:variable.special          (:foreground spirit))
  (tree-sitter-hl-face:variable.synthesized      (:foreground tears))
  (tree-sitter-hl-face:property                  (:foreground ectoplasm))
  (tree-sitter-hl-face:property.definition       (:inherit 'tree-sitter-hl-face:property))

  (tree-sitter-hl-face:comment                   (:inherit 'font-lock-comment-face))
  (tree-sitter-hl-face:doc                       (:inherit 'font-lock-comment-face))
  (tree-sitter-hl-face:string                    (:inherit 'font-lock-string-face))
  (tree-sitter-hl-face:string.special            (:inherit 'font-lock-string-face))
  (tree-sitter-hl-face:escape                    (:inherit 'font-lock-regexp-grouping-backslash))
  (tree-sitter-hl-face:embedded                  (:foreground ectoplasm))

  (tree-sitter-hl-face:keyword                   (:inherit 'font-lock-keyword-face))
  (tree-sitter-hl-face:operator                  (:foreground subtle))
  (tree-sitter-hl-face:label                     (:foreground text))
  (tree-sitter-hl-face:constant                  (:inherit 'font-lock-constant-face))
  (tree-sitter-hl-face:constant.builtin          (:inherit 'font-lock-constant-face))
  (tree-sitter-hl-face:number                    (:foreground blood))

  (tree-sitter-hl-face:punctuation               (:foreground subtle))
  (tree-sitter-hl-face:punctuation.bracket       (:foreground subtle))
  (tree-sitter-hl-face:punctuation.delimiter     (:foreground text))
  (tree-sitter-hl-face:punctuation.special       (:foreground subtle))

  (tree-sitter-hl-face:case-pattern              (:foreground blood))
  (tree-sitter-hl-face:keyword.compiler          (:foreground text))

  ;; ;; Custom for pinkus tree-sitter-swift
  (tree-sitter-hl-face:include                   (:foreground text))
  (tree-sitter-hl-face:parameter                 (:foreground spirit))
  (tree-sitter-hl-face:repeat                    (:foreground ectoplasm))
  (tree-sitter-hl-face:boolean                   (:inherit 'font-lock-constant-face))
  (tree-sitter-hl-face:keyword.return            (:inherit 'tree-sitter-hl-face:keyword))
  (tree-sitter-hl-face:keyword.operator          (:foreground spirit))
  (tree-sitter-hl-face:keyword.function          (:inherit 'tree-sitter-hl-face:keyword))
  (tree-sitter-hl-face:conditional               (:inherit 'tree-sitter-hl-face:keyword))

  (swift-mode:preprocessor-keyword-face (:foreground text))
  (swift-mode:property-access-face (:foreground subtle))
  (swift-mode:builtin-property-face (:foreground ectoplasm))
  (swift-mode:builtin-enum-case-face (:foreground ectoplasm))
  (swift-mode:builtin-method-trailing-closure-face (:foreground ectoplasm))
  (swift-mode:builtin-function-trailing-closure-face (:foreground ectoplasm))
  (swift-mode:function-call-face (:foreground tears))

  ;; (localizeable-variable-face (:inherit font-lock-string-face))
  ;; (localizeable-value-face (:inherit font-lock-keyword-face))

  ))

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
		  (file-name-as-directory
		   (file-name-directory load-file-name))))

(provide 'soul-theme)
;;; soul-theme-theme.el ends here
