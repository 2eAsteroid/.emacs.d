(straight-use-package
 '(auctex :type git
          :host github
          :repo "emacs-straight/auctex"
          :files ("*" (:exclude ".git"))))

(require 'auctex)

(setq TeX-command-default (if (executable-find "latexmk") "LatexMk" "LaTeX")  ; the default command for running tex files
      TeX-engine (if (executable-find "xetex") 'xetex 'default)  ; The engine for tex
      TeX-auto-save t  ; Whether to save style info when you save the file
      TeX-parse-self t  ; Parse the file if there's no style hook
      TeX-syntactic-comment t  ; Non-nil comments parsed to specification
      TeX-auto-local ".auctex-auto"  ; Where to put auto-gen tex info
      TeX-style-local ".auctex-style"  ; Where to put hand-made tex info
      TeX-source-correlate-mode t  ; A connection from the output and the source can be made
      TeX-source-correlate-method 'synctex  ; Other package for syncing between output and source
      TeX-source-correlate-start-server nil  ; Don't auto-start the correlation server
      TeX-electric-sub-and-superscript t  ; Add braces when you use sub/super script in tex
      TeX-fill-break-at-separators nil  ; Don't auto hard-wrap stuff
      TeX-electric-math '("\\( " . " \\)")  ; Allows for auto completion of a starting inline equation.
      TeX-master t ; All files are probably master files
      TeX-save-query t)  ; Ask to save before starting tex

(add-hook 'TeX-mode-hook #'visual-line-mode)

(straight-use-package
 '(tex-mode :type built-in))

(require 'tex-mode)

(setq LaTeX-section-hook '(LaTeX-section-heading
                           LaTeX-section-title
                           LaTeX-section-toc
                           LaTeX-section-section
                           LaTeX-section-label)
      LaTeX-fill-break-at-separators nil
      LaTeX-item-indent 0)

(provide 'latech)
