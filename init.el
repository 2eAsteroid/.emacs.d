(defcustom use-exwm nil
  "Whether or not you want to use EXWM. Set to t if you do."
  :type :boolean)
(defcustom csl-style-directory "~/.emacs.d/data/csl-styles/"
  "The directory where csl styles are stored (for reference management). By default they are stored in the above directory."
 :type :directory)
(defcustom use-pdfview nil
  "Whether or not you want to use PDFView. Set to t if you do."
  :type :boolean)
(defcustom user-name "Daniel Lin"
  "Your full name, for Emacs purposes."
  :type :string)
(defcustom user-email "two-e-asteroid@outlook.com"
  "Your email, for Emacs purposes."
  :type :string)
(defcustom zettelkasten-directory (locate-user-emacs-file "zettels/")
  "Your zettelkasten directory."
  :type :string)

;;; Bootstrapping straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;;; Stop Checking of Modifications
(setq straight-check-for-modifications nil) ; This stops the package manager from checking for modifications to package source code, and makes this a conscious process (call 'straight-rebuild-package')

(setq custom-safe-themes t) ; Sets custom themes to be safe.

;;; Theme
(straight-use-package
 '(autothemer :type git
              :host github
              :repo "jasonm23/autothemer"
              :files ("autothemer.el")))

(setq custom-theme-directory (locate-user-emacs-file "config/"))
(load-theme 'soul-theme t)

(straight-use-package
 '(all-the-icons :type git
                 :host github
                 :repo "domtronn/all-the-icons.el"
                 :files (:defaults ("data" "data/data-*.el"))))

(require 'all-the-icons)
(let ((default-directory "~/.emacs.d/data/all-the-icons/"))
  (if (not (file-directory-p "~/.emacs.d/data/all-the-icons/"))
      (progn (make-directory "~/.emacs.d/data/all-the-icons/" t)
             (all-the-icons-install-fonts t))))

(setq-default delete-by-moving-to-trash nil ; When you delete a file, it will not be moved to the trash instead
              recentf-mode t              ; You can see files that you have recently been in
              make-backup-files nil)        ; Don't create backups of the file every modification save. You can choose between renaming and copying, but there's a difference?

(set-default-coding-systems 'utf-8)
(set-language-environment "UTF-8")
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(add-to-list 'load-path (locate-user-emacs-file "modules"))

(defun add-function-to-hooks (function hooks)
  "Adds FUNCTION to every hook in the list HOOK."
  (mapc (lambda (hook)
          (add-hook hook function))
        hooks))

;; SYSTEM
(if use-exwm
    (require 'emacs-x-wm))
(require 'gc-magic-hack)
(require 'no-litter)
(require 'essentials)
(require 'fonts)
;; EXTENSION
(require 'undoing)
(if use-pdfview
    (require 'pdfs))
(require 'emacs-dashboard)
(require 'coding)
(require 'ogre)
(require 'latech)
(require 'zettelkasten)
(require 'citation)
(require 'completion-stack)
(require 'projecting)
(require 'infofiche)
(require 'chem)
(require 'cookie-cutter)
(require 'music)
