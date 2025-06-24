
;; ------------------------------------------------------------------------ ;;
;; FACES                                                                    ;;
;; ------------------------------------------------------------------------ ;;

(defvar general-tab-face 'general-tab-face)
(defface general-tab-face
  '((t (:background "grey22")))
  "Tab face."
  :group 'general-group)
(defvar general-space-face 'general-space-face)
(defface general-space-face
  '((t (:background "grey22")))
  "Trailing space face."
  :group 'general-group)
(defvar general-line-face 'general-line-face)
(defface general-line-face
  '((t (:background "grey22")))
  "Long line face."
  :group 'general-group)

;; ------------------------------------------------------------------------ ;;
;; MODE                                                                     ;;
;; ------------------------------------------------------------------------ ;;

(defun general-mode (mode)
  "Add general-mode to argument MODE."
  (font-lock-add-keywords
   mode
   '(
     ;; highlight tabs
     ("\t+" . general-tab-face)

     ;; highlight trailing spaces
     ("[ ]+$" . general-space-face)

     ;; highlight excessive chars of long lines
     ;; ("^.\\{80\\}\\(.+\\)$" (1 'general-line-face t))

     ;; highlight first 2 chars of long lines
     ;; ("^\\(.\\{2\\}\\).\\{78,\\}$" (1 'general-line-face t))
     )))

;; ------------------------------------------------------------------------ ;;
