;;; package --- Generic information file mode
;;; Commentary:
;;; Code:

;; ------------------------------------------------------------------------ ;;
;; FACES                                                                    ;;
;; ------------------------------------------------------------------------ ;;

;; comment
(defvar comment-face 'comment-face)
(defface comment-face
  '((t (:foreground "DarkOrange1")))
  "comment face"
  :group 'information-group)

;; directive
(defvar directive-face 'directive-face)
(defface directive-face
  '((t (:foreground "coral1")))
  "directive face"
  :group 'information-group)

;; term
(defvar term-face 'term-face)
(defface term-face
  '((t (:foreground "light goldenrod")))
  "term face"
  :group 'information-group)

;; comma
(defvar comma-face 'comma-face)
(defface comma-face
  '((t (:foreground "light sky blue")))
  "comma face"
  :group 'information-group)

;; colon
(defvar colon-face 'colon-face)
(defface colon-face
  '((t (:foreground "light sky blue")))
  "colon face"
  :group 'information-group)

;; precolon
(defvar precolon-face 'precolon-face)
(defface precolon-face
  '((t (:foreground "light green")))
  "precolon face"
  :group 'information-group)

;; bracket
(defvar bracket-face 'bracket-face)
(defface bracket-face
  '((t (:foreground "light sky blue")))
  "bracket face"
  :group 'information-group)

;; symbol
(defvar symbol-face 'symbol-face)
(defface symbol-face
  '((t (:foreground "light sky blue")))
  "symbol face"
  :group 'information-group)

;; ------------------------------------------------------------------------ ;;
;; HIGHLIGHTS                                                               ;;
;; ------------------------------------------------------------------------ ;;

;; define highlights
(defvar information-highlights)
(setq information-highlights
      '(
        ("\\(#.*\\)$" . (1 comment-face append))
        ("^ *\\(-.*\\)$" . (1 directive-face append))
        ("^ *\\(_.*\\)$" . (1 directive-face append))
        ("\\(:\\)[ \n]". (1 colon-face append))
        ("\\(%[0-9]+\\)". (1 symbol-face append))
        ("\\(,\\)[ \n]". (1 comma-face append))
        ("\\([.]\\)[ \n]". (1 comma-face append))
        ("\\([][)(}{]\\)". (1 bracket-face append))
        ("^\\([^:]*\\):[ \n]". (1 precolon-face append))
        ("\\(.+\\)". (1 term-face append))
        ))

;; ------------------------------------------------------------------------ ;;
;; COMMENTS                                                                 ;;
;; ------------------------------------------------------------------------ ;;

;; define comments
(add-hook 'information-mode-hook
          (lambda ()
            (set (make-local-variable 'comment-start) "# ")
            (set (make-local-variable 'comment-end) "")))

;; ------------------------------------------------------------------------ ;;
;; MODE                                                                     ;;
;; ------------------------------------------------------------------------ ;;

(define-derived-mode information-mode fundamental-mode
  (setq font-lock-defaults '(information-highlights))
  (setq mode-name "information"))

;; ------------------------------------------------------------------------ ;;
;; PROVIDE MODE                                                             ;;
;; ------------------------------------------------------------------------ ;;

(provide 'information)

;;; information.el ends here
