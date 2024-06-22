(setq frame-resize-pixelwise t                           ; Makes sure that you can resize the window by pixels (obselete since I use EXWM)
      frame-title-format '("%b")                         ; Makes the title of the window the buffer name
      ring-bell-function 'ignore                         ; Stops the error bell sound
      use-short-answers t                                ; Instead of yes or no, it uses y / n
      inhibit-splash-screen t                            ; Stops the starting screen from showing.
      inhibit-startup-echo-area-message user-login-name) ; Stops the starting minibuffer message from showing.

(menu-bar-mode -1)                                       ; Stops the menu bar from showing (text)
(scroll-bar-mode -1)                                     ; Stops the scroll bar from showing (scroll)
(tool-bar-mode -1)                                       ; Stops the tool bar from showing (icons)
(tooltip-mode -1)                                        ; Instead of a help thing showing up from hovering, it displays the message in the minibuffer

(defun prot-emacs-avoid-initial-flash-of-light ()
  "avoid flash of light when starting emacs, if needed."
  (setq mode-line-format nil)
  (set-face-attribute 'default nil :background "#000000" :foreground "#000000")
  (set-face-attribute 'mode-line nil :background "#000000" :foreground "#000000" :box 'unspecified))

(prot-emacs-avoid-initial-flash-of-light)
