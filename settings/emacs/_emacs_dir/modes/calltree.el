
;; ------------------------------------------------------------------------ ;;
;; FACES                                                                    ;;
;; ------------------------------------------------------------------------ ;;

(defvar green-face 'green-face)
(defface green-face
  '((t (:foreground "LightGreen")))
  "green face"
  :group 'calltree-group)

(defvar cyan-face 'cyan-face)
(defface cyan-face
  '((t (:foreground "LightSkyBlue")))
  "cyan face"
  :group 'calltree-group)

(defvar yellow-face 'yellow-face)
(defface yellow-face
  '((t (:foreground "LightGoldenrod")))
  "yellow face"
  :group 'calltree-group)

(defvar red-face 'red-face)
(defface red-face
  '((t (:foreground "coral1")))
  "red face"
  :group 'calltree-group)

(defvar pink-face 'pink-face)
(defface pink-face
  '((t (:foreground "LightPink")))
  "pink face"
  :group 'calltree-group)

(defvar orange-face 'orange-face)
(defface orange-face
  '((t (:foreground "DarkOrange1")))
  "orange face"
  :group 'calltree-group)

;; ------------------------------------------------------------------------ ;;
;; HIGHLIGHTS                                                               ;;
;; ------------------------------------------------------------------------ ;;

;; define highlights
(defvar calltree-highlights)
(setq calltree-highlights
      '(
        ("\\(#.*\\)$" . (1 orange-face append))
        ("::\\([0-9]+\\)" . (1 cyan-face append))
        ("\\([0-9]+.[0-9][0-9]s\\)" . (1 yellow-face append))
        ("\\([0-9]+.[0-9][0-9]%\\)" . (1 red-face append))
        ("\\([0-9]+ calls\\)" . (1 pink-face append))
        ("\\([a-zA-Z0-9_.<>]+\\) " . (1 green-face append))
        (" \\([a-zA-Z0-9_.~]+\\)" . (1 cyan-face append))
        ))

;; ------------------------------------------------------------------------ ;;
;; COMMENTS                                                                 ;;
;; ------------------------------------------------------------------------ ;;

(add-hook 'information-mode-hook
          (lambda ()
            (set (make-local-variable 'comment-start) "#")
            (set (make-local-variable 'comment-end) "")))

;; ------------------------------------------------------------------------ ;;
;; MODE                                                                     ;;
;; ------------------------------------------------------------------------ ;;

(define-derived-mode calltree-mode fundamental-mode
  (setq font-lock-defaults '(calltree-highlights))
  (setq mode-name "calltree"))

(provide 'calltree)

;; ------------------------------------------------------------------------ ;;
