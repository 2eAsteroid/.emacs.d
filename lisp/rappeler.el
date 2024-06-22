;;; Dependencies
(require 'alert-toast)

;;; Code
(defun 2e-emacs-remind (reminder parent)
  (with-output-to-temp-buffer "Reminder"
    (princ (format "%s\n" reminder))
    (princ (format-time-string "Sent at: %H:%M\n"))
    (princ (format "Sent by %s\n" parent)))
  (alert-toast-notify `(:title ,parent :message ,reminder :data (:alarm default :long t))))
