(straight-use-package
 '(eglot :type built-in))

(require 'eglot)

(straight-use-package
 '(treesit :type built-in))

(straight-use-package
 '(treesit-auto :type git
                :host github
                :repo "renzmann/treesit-auto"
                :files (:defaults)))

(require 'treesit)
(require 'treesit-auto)

(setq treesit-auto-install nil
      treesit-auto-add-to-auto-mode-alist 'all)
(global-treesit-auto-mode)

(straight-use-package
 '(nix-mode :type git
            :host github
            :repo "NixOS/nix-mode"
            :files (:defaults)))

(require 'nix-mode)
(require 'nix-drv-mode)
(require 'nix-shell)
(require 'nix-repl)
(add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-mode)) ; Makes all *.nix files use nix-mode.

(straight-use-package
 '(highlight-numbers :type git
                     :host github
                     :repo "Fanael/highlight-numbers"
                     :files (:defaults)))

(require 'highlight-numbers)

(add-hook  'prog-mode-hook 'highlight-numbers-mode) ; Makes all programming modes have number literals be highlighted

(provide 'coding)
