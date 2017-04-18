;;; package --- Generic configuration file mode
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
  :group 'configuration-group)

;; directive
(defvar directive-face 'directive-face)
(defface directive-face
  '((t (:foreground "coral1")))
  "directive face"
  :group 'configuration-group)

;; term
(defvar term-face 'term-face)
(defface term-face
  '((t (:foreground "light goldenrod")))
  "term face"
  :group 'configuration-group)

;; comma
(defvar comma-face 'comma-face)
(defface comma-face
  '((t (:foreground "light sky blue")))
  "comma face"
  :group 'configuration-group)

;; colon
(defvar colon-face 'colon-face)
(defface colon-face
  '((t (:foreground "light sky blue")))
  "colon face"
  :group 'configuration-group)

;; precolon
(defvar precolon-face 'precolon-face)
(defface precolon-face
  '((t (:foreground "light green")))
  "precolon face"
  :group 'configuration-group)

;; bracket
(defvar bracket-face 'bracket-face)
(defface bracket-face
  '((t (:foreground "light sky blue")))
  "bracket face"
  :group 'configuration-group)

;; symbol
(defvar symbol-face 'symbol-face)
(defface symbol-face
  '((t (:foreground "light sky blue")))
  "symbol face"
  :group 'configuration-group)

;; ------------------------------------------------------------------------ ;;
;; HIGHLIGHTS                                                               ;;
;; ------------------------------------------------------------------------ ;;

;; define highlights
(defvar configuration-highlights)
(setq configuration-highlights
      '(
        ("\\(#.*\\)$" . (1 comment-face append))
        ("^ *\\(-.*\\)$" . (1 directive-face append))
        ("\\(:\\)". (1 colon-face append))
        ("\\(%[0-9]+\\)". (1 symbol-face append))
        ("\\(,\\)". (1 comma-face append))
        ("\\([][)(}{]\\)". (1 bracket-face append))
        ("^\\(.*\\):". (1 precolon-face append))
        ("\\(.+\\)". (1 term-face append))
        ))

;; ------------------------------------------------------------------------ ;;
;; COMMENTS                                                                 ;;
;; ------------------------------------------------------------------------ ;;

;; define comments
(add-hook 'configuration-mode-hook
          (lambda ()
            (set (make-local-variable 'comment-start) "# ")
            (set (make-local-variable 'comment-end) "")))

;; ------------------------------------------------------------------------ ;;
;; MODE                                                                     ;;
;; ------------------------------------------------------------------------ ;;

(define-derived-mode configuration-mode fundamental-mode
  (setq font-lock-defaults '(configuration-highlights))
  (setq mode-name "configuration"))

;; ------------------------------------------------------------------------ ;;
;; PROVIDE MODE                                                             ;;
;; ------------------------------------------------------------------------ ;;

(provide 'configuration)

;;; configuration.el ends here
