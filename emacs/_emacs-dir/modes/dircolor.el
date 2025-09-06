
;; ------------------------------------------------------------------------- ;;
;; HOOK                                                                      ;;
;; ------------------------------------------------------------------------- ;;

(defvar dircolor-mode-hook nil)

;; ------------------------------------------------------------------------- ;;
;; FACES                                                                     ;;
;; ------------------------------------------------------------------------- ;;

;; We use font-lock-mode faces

;; ------------------------------------------------------------------------- ;;
;; KEYWORDS                                                                  ;;
;; ------------------------------------------------------------------------- ;;

(defvar dircolor-font-lock-keywords
  (list
   '("^[^#]*\\(#.*\\)" . (1 font-lock-comment-face t))
   '("^[ \t]*\\([.][^ \t]*\\)" . (1 'font-lock-builtin-face t))
   '("^[ \t]*\\([A-Z]+\\)[ \t\n#]" . (1 'font-lock-keyword-face t))
   '("^[ \t]*\\([A-Z]+[^A-Z \t\n#]+.*\\)" . (1 'font-lock-warning-face t))
   '("^[ \t]*\\([^A-Z.# \t].*\\)" . (1 'font-lock-warning-face t))
   )
  "Highlighting expressions for dircolor mode")

;; ------------------------------------------------------------------------- ;;
;; INDENTATION                                                               ;;
;; ------------------------------------------------------------------------- ;;

(defun dircolor-indent-line ()
  "Indent current line with dircolor rule"
  ;; (setq current-point (point))
  ;; (setq current-indent (current-indentation))
  (indent-line-to 0)
  ;; (goto-char (- current-point current-indent))
  )

;; ------------------------------------------------------------------------- ;;
;; SYNTAX TABLE                                                              ;;
;; ------------------------------------------------------------------------- ;;

(defvar dircolor-mode-syntax-table
  (let ((st (make-syntax-table)))
    (modify-syntax-entry ?_ "w" st)
    st)
  "Syntax table for dircolor-mode")

;; ------------------------------------------------------------------------- ;;
;; MODE                                                                      ;;
;; ------------------------------------------------------------------------- ;;

(defun dircolor-mode ()
  "Major mode for dircolor files"
  (interactive)
  (kill-all-local-variables)
  (set-syntax-table dircolor-mode-syntax-table)
  (set (make-local-variable 'font-lock-defaults) '(dircolor-font-lock-keywords))
  (set (make-local-variable 'indent-line-function) 'dircolor-indent-line)
  (setq major-mode 'dircolor-mode)
  (setq mode-name "dircolor")
  (run-hooks 'dircolor-mode-hook))

;; ------------------------------------------------------------------------- ;;
;; EXPORT                                                                    ;;
;; ------------------------------------------------------------------------- ;;

(provide 'dircolor-mode)

;; ------------------------------------------------------------------------- ;;
