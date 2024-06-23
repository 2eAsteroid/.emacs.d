fundamental-mode

(today (format-time-string "%Y-%m-%d"))

text-mode

(box "┌-" (make-string (length str) ?-) "-┐" n
     "│ " (s str)                        " │" n
     "└-" (make-string (length str) ?-) "-┘" n)
(abox "+-" (make-string (length str) ?-) "-+" n
      "| " (s str)                       " |" n
      "+-" (make-string (length str) ?-) "-+" n)

lisp-mode emacs-lisp-mode

(lambda "(lambda (" p ")" n> r> ")")

emacs-lisp-mode

(fn "(defun " p " (" p ")\n  \"" p "\"" n> r> ")")

(if "(if " p n> r> ")")

(cond "(cond (" p ")" n> "(" q "))")

python-ts-mode python-mode

(fn "def " p "(" p ") -> " p ":" n> "\"" p "\"" n> q)

(if "if " p ":" n> q)

(iff "if " p ":" (p (current-indentation) indent t) n> p n> (indent-line-to indent) "elif " p ":" n> p n> (indent-line-to indent) "else:" n> q)

(for "for " p " in " p ":" n> q)

(forc "for i in range(" p "):" n> q)

(while "while " p ":" n> q)

(class "class " p "(" p "):" n> p n> "def __init__(self, " p ") -> None:" n> q)

(imp "import " q)

(impas "import " p " as " q)

(fimp "from " p " import " q)

(fimpas "from " p " import " p " as " q)

org-mode

(math "\\( " q " \\)")

(mathh "\\[ " q " \\]")
