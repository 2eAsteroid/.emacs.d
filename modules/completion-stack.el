(straight-use-package
 '(vertico :type git
           :host github
           :repo "minad/vertico"
           :files (:defaults "extensions/*")))

(require 'vertico)
(require 'vertico-indexed)
(require 'vertico-mouse)
(require 'vertico-multiform)
(require 'vertico-reverse)
(require 'vertico-quick)
(require 'vertico-buffer)


(vertico-mode) ; Starts Vertico
(setq vertico-cycle t) ; When you reach the end or top, it cycles to the top / end

(setq read-extended-command-predicate #'command-completion-default-include-p) ; Stops commands from showing in M-x if it doesn't apply to the current mode

(straight-use-package
   '(marginalia :type git
                :host github
                :repo "minad/marginalia"
                :files (:defaults)))

  (require 'marginalia)

  (marginalia-mode)

  (setq marginalia-max-relative-age 2592000 ; For time-based metadata (like time created) how far do we want to go (30 days) before switching from a relative (5 days ago) date to a fixed date (December 31st, 2020)
        marginalia-align 'right) ; How we align the annotations: to the right

(straight-use-package
 '(all-the-icons-completion :type git
                            :host github
                            :repo "iyefrat/all-the-icons-completion"
                            :files (:defaults)))

 (require 'all-the-icons-completion)

 (all-the-icons-completion-mode) ; Turns on icons
 (add-hook 'marginalia-mode-hook #'all-the-icons-completion-marginalia-setup) ; Sets up the icons when annotations are set up.

(straight-use-package
 '(orderless :type git
             :host github
             :repo "oantolin/orderless"
             :files (:defaults)))

(require 'orderless)

(setq completion-styles '(orderless basic) ; Sets the default style to be orderless with basic as a backup
      completion-category-defaults nil     ; Don't have defaults for most categories (override if necessary)
      completion-category-overrides '((file (styles basic partial-completion)))) ; For files, we want to not use orderless, and instead stick with basic and partial completion (e.x. /e/n/c -> /etc/nixos/configuration.nix)

(straight-use-package
 '(corfu :type git
         :host github
         :repo "minad/corfu"
         :files (:defaults "extensions/*")))

(straight-use-package
 '(cape :type git
        :host github
        :repo "minad/cape"
        :files (:defaults)))

(require 'corfu)
(require 'cape)

(setq corfu-cycle t            ; Cycle through the options
      corfu-auto t             ; Auto completion (opens menu automatically)
      corfu-auto-prefix 2      ; How many characters you type before it pops up; I think 2 is pretty great because for smaller symbols it won't pop up.
      corfu-auto-delay 1       ; How long to wait; I've found that it becomes annoying when it constantly pops up when I don't want it to.
      corfu-preview-current t) ; Preview the current option

(global-corfu-mode)   ; Sets up Corfu globally

(add-to-list 'completion-at-point-functions #'cape-file)      ; Allows Corfu to complete file paths
(add-to-list 'completion-at-point-functions #'cape-elisp-block)   ; Allows Corfu to complete in source code blocks (Org)

(defun corfu-enable-in-minibuffer ()
  "Enable Corfu in the minibuffer."
  (when (local-variable-p 'completion-at-point-functions)
    (setq-local corfu-auto t) ;; Enable/disable auto completion
    (setq-local corfu-echo-delay 3 ;; Disable automatic echo and popup
                corfu-popupinfo-delay 3)
    (corfu-mode 1)))

(add-hook 'minibuffer-setup-hook #'corfu-enable-in-minibuffer)

(defun corfu-move-to-minibuffer ()
  (interactive)
  (pcase completion-in-region--data
    (`(,beg ,end ,table ,pred ,extras)
     (let ((completion-extra-properties extras)
           completion-cycle-threshold completion-cycling)
       (consult-completion-in-region beg end table pred)))))

(keymap-set corfu-map "M-m" #'corfu-move-to-minibuffer)

(add-to-list 'corfu-continue-commands #'corfu-move-to-minibuffer)

(straight-use-package
 '(consult :type git
           :host github
           :repo "minad/consult"
           :files (:defaults)))

(require 'consult)

(provide 'completion-stack)
