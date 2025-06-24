
;; ------------------------------------------------------------------------ ;;
;; FACES                                                                    ;;
;; ------------------------------------------------------------------------ ;;

(defvar long-lines-line-face 'long-lines-line-face)
(defface long-lines-line-face
  '((t (:background "grey22")))
  "Long line face."
  :group 'long-lines-group)

;; ------------------------------------------------------------------------ ;;
;; MODE                                                                     ;;
;; ------------------------------------------------------------------------ ;;

(defun long-lines-mode (mode)
  "Add long-lines-mode to argument MODE."
  (font-lock-add-keywords
   mode
   '(
     ;; highlight excessive chars of long lines
     ("^.\\{80\\}\\(.+\\)$" (1 'long-lines-line-face t))

     ;; highlight first 2 chars of long lines
     ("^\\(.\\{2\\}\\).\\{79,\\}$" (1 'long-lines-line-face t))
     )))

;; ------------------------------------------------------------------------ ;;
