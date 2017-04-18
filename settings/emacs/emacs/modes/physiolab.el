;;; package --- Physiolab
;;; Commentary:
;;; Code:

;; define faces
(defvar physiolab-dash-face 'physiolab-dash-face)
(defface physiolab-dash-face
  '((t (:foreground "yellow2")))
  "Dash face."
  :group 'physiolab-group)
(defvar physiolab-title-face 'physiolab-title-face)
(defface physiolab-title-face
  '((t (:foreground "purple")))
  "Title face."
  :group 'physiolab-group)
(defvar physiolab-io-face 'physiolab-io-face)
(defface physiolab-io-face
  '((t (:foreground "green")))
  "IO face."
  :group 'physiolab-group)
(defvar physiolab-subtitle-face 'physiolab-subtitle-face)
(defface physiolab-subtitle-face
  '((t (:foreground "light green")))
  "Subtitle face."
  :group 'physiolab-group)
(defvar physiolab-file-face 'physiolab-file-face)
(defface physiolab-file-face
  '((t (:foreground "light blue")))
  "File face."
  :group 'physiolab-group)
(defvar physiolab-main-face 'physiolab-main-face)
(defface physiolab-main-face
  '((t (:foreground "pink")))
  "Main face."
  :group 'physiolab-group)
(defvar physiolab-colon-face 'physiolab-colon-face)
(defface physiolab-colon-face
  '((t (:foreground "yellow2")))
  "Colon face."
  :group 'physiolab-group)
(defvar physiolab-semicolon-face 'physiolab-semicolon-face)
(defface physiolab-semicolon-face
  '((t (:foreground "yellow2")))
  "Semicolon face."
  :group 'physiolab-group)
(defvar physiolab-semantics-face 'physiolab-semantics-face)
(defface physiolab-semantics-face
  '((t (:foreground "orange")))
  "Semantics face."
  :group 'physiolab-group)
(defvar physiolab-header-face 'physiolab-header-face)
(defface physiolab-header-face
  '((t (:foreground "orange")))
  "Header face."
  :group 'physiolab-group)
(defvar physiolab-object-face 'physiolab-object-face)
(defface physiolab-object-face
  '((t (:foreground "light goldenrod")))
  "Object face."
  :group 'physiolab-group)
(defvar physiolab-parentheses-face 'physiolab-parentheses-face)
(defface physiolab-parentheses-face
  '((t (:foreground "light goldenrod")))
  "Parentheses face."
  :group 'physiolab-group)
(defvar physiolab-comment-face 'physiolab-comment-face)
(defface physiolab-comment-face
  '((t (:foreground "coral1")))
  "Comment face."
  :group 'physiolab-group)

;; define highlights
(defvar physiolab-highlights)
(setq physiolab-highlights
      '(
        ("#.*$" . physiolab-comment-face)
        ("-" . physiolab-dash-face)
        ("HEADERS". physiolab-subtitle-face)
        ("MODULE\\|HEADER" . physiolab-title-face)
        ("CONSTANTS\\|VARIABLES\\|FUNCTIONS\\|MISCELLANEA\\|HEADERS".
         physiolab-subtitle-face)
        ("IMPORT\\|EXPORT" . physiolab-io-face)
        ("^\\(.+\\):" . (1 physiolab-file-face append))
        ("^\\(.+\\) - " . (1 physiolab-semantics-face append))
        (":\\(.+\\)$" . (1 'physiolab-main-face append))
        ("\\([a-zA-Z0-9_]+\\)[;(]" . (1 'physiolab-object-face append))
        ("[()]" . physiolab-parentheses-face)
        (":" . physiolab-colon-face)
        (";" . physiolab-semicolon-face)
        ))

;; define mode
(define-derived-mode physiolab-mode fundamental-mode
  (setq font-lock-defaults '(physiolab-highlights))
  (setq mode-name "physiolab"))

;; provide mode
(provide 'physiolab)

;;; physiolab.el ends here
