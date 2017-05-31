;;; package --- summary
;;; Commentary:
;;; Code:


;; ------------------------------------------------------------------------ ;;
;; FACES                                                                    ;;
;; ------------------------------------------------------------------------ ;;

;; type
(defvar kratos2IR-type-face 'kratos2IR-type-face)
(defface kratos2IR-type-face
  '((t (:foreground "light green")))
  "Type face."
  :group 'kratos2IR-group)

;; value
(defvar kratos2IR-value-face 'kratos2IR-value-face)
(defface kratos2IR-value-face
  '((t (:foreground "aquamarine1")))
  "Value face."
  :group 'kratos2IR-group)

;; expression
(defvar kratos2IR-expression-face 'kratos2IR-expression-face)
(defface kratos2IR-expression-face
  '((t (:foreground "light goldenrod")))
  "Expression face."
  :group 'kratos2IR-group)

;; basic operator
; (defvar kratos2IR-basic-operator-face 'kratos2IR-basic-operator-face)
; (defface kratos2IR-basic-operator-face
;   '((t (:foreground "white")))
;   "Basic operator face."
;   :group 'kratos2IR-group)

;; complex operator
(defvar kratos2IR-complex-operator-face 'kratos2IR-complex-operator-face)
(defface kratos2IR-complex-operator-face
  '((t (:foreground "cyan")))
  "Complex operator face."
  :group 'kratos2IR-group)

;; function
(defvar kratos2IR-function-face 'kratos2IR-function-face)
(defface kratos2IR-function-face
  '((t (:foreground "SkyBlue1")))
  "Function face."
  :group 'kratos2IR-group)

;; program
(defvar kratos2IR-program-face 'kratos2IR-program-face)
(defface kratos2IR-program-face
  '((t (:foreground "SkyBlue1")))
  "Program face."
  :group 'kratos2IR-group)

;; comment
(defvar kratos2IR-comment-face 'kratos2IR-comment-face)
(defface kratos2IR-comment-face
  '((t (:foreground "DarkOrange1")))
  "Comment face."
  :group 'kratos2IR-group)

;; assert
; (defvar kratos2IR-assert-face 'kratos2IR-assert-face)
; (defface kratos2IR-assert-face
;   '((t (:foreground "cyan")))
;   "Assert face."
;   :group 'kratos2IR-group)

;; error
(defvar kratos2IR-error-face 'kratos2IR-error-face)
(defface kratos2IR-error-face
  '((t (:foreground "coral1")))
  "Error face."
  :group 'kratos2IR-group)

;; ------------------------------------------------------------------------ ;;
;; HIGHLIGHTS                                                               ;;
;; ------------------------------------------------------------------------ ;;

(defvar kratos2IR-highlights)
(setq kratos2IR-highlights
      '(

        ;; comment

        ("\\(;.*\\)$" . (1 kratos2IR-comment-face append))

        ;; type

        ("[^a-zA-Z0-9_.]\\(bool\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-type-face append))
        ("^\\(bool\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-type-face append))
        ("[^a-zA-Z0-9_.]\\(bool\\)$" . (1 kratos2IR-type-face append))
        ("^\\(bool\\)$" . (1 kratos2IR-type-face append))

        ("[^a-zA-Z0-9_.]\\(bv\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-type-face append))
        ("^\\(bv\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-type-face append))
        ("[^a-zA-Z0-9_.]\\(bv\\)$" . (1 kratos2IR-type-face append))
        ("^\\(bv\\)$" . (1 kratos2IR-type-face append))

        ("[^a-zA-Z0-9_.]\\(fp\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-type-face append))
        ("^\\(fp\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-type-face append))
        ("[^a-zA-Z0-9_.]\\(fp\\)$" . (1 kratos2IR-type-face append))
        ("^\\(fp\\)$" . (1 kratos2IR-type-face append))

        ("[^a-zA-Z0-9_.]\\(fun\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-type-face append))
        ("^\\(fun\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-type-face append))
        ("[^a-zA-Z0-9_.]\\(fun\\)$" . (1 kratos2IR-type-face append))
        ("^\\(fun\\)$" . (1 kratos2IR-type-face append))

        ("[^a-zA-Z0-9_.]\\(int\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-type-face append))
        ("^\\(int\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-type-face append))
        ("[^a-zA-Z0-9_.]\\(int\\)$" . (1 kratos2IR-type-face append))
        ("^\\(int\\)$" . (1 kratos2IR-type-face append))

        ("[^a-zA-Z0-9_.]\\(ptr\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-type-face append))
        ("^\\(ptr\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-type-face append))
        ("[^a-zA-Z0-9_.]\\(ptr\\)$" . (1 kratos2IR-type-face append))
        ("^\\(ptr\\)$" . (1 kratos2IR-type-face append))

        ("[^a-zA-Z0-9_.]\\(real\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-type-face append))
        ("^\\(real\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-type-face append))
        ("[^a-zA-Z0-9_.]\\(real\\)$" . (1 kratos2IR-type-face append))
        ("^\\(real\\)$" . (1 kratos2IR-type-face append))

        ("[^a-zA-Z0-9_.]\\(record\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-type-face append))
        ("^\\(record\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-type-face append))
        ("[^a-zA-Z0-9_.]\\(record\\)$" . (1 kratos2IR-type-face append))
        ("^\\(record\\)$" . (1 kratos2IR-type-face append))

        ("[^a-zA-Z0-9_.]\\(sym\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-type-face append))
        ("^\\(sym\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-type-face append))
        ("[^a-zA-Z0-9_.]\\(sym\\)$" . (1 kratos2IR-type-face append))
        ("^\\(sym\\)$" . (1 kratos2IR-type-face append))

        ("[^a-zA-Z0-9_.]\\(void\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-type-face append))
        ("^\\(void\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-type-face append))
        ("[^a-zA-Z0-9_.]\\(void\\)$" . (1 kratos2IR-type-face append))
        ("^\\(void\\)$" . (1 kratos2IR-type-face append))

        ;; value

        ("[^a-zA-Z0-9_.]\\(false\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-value-face append))
        ("^\\(false\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-value-face append))
        ("[^a-zA-Z0-9_.]\\(false\\)$" . (1 kratos2IR-value-face append))
        ("^\\(false\\)$" . (1 kratos2IR-value-face append))

        ("[^a-zA-Z0-9_.]\\(true\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-value-face append))
        ("^\\(true\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-value-face append))
        ("[^a-zA-Z0-9_.]\\(true\\)$" . (1 kratos2IR-value-face append))
        ("^\\(true\\)$" . (1 kratos2IR-value-face append))

        ;; expression

        ("[^a-zA-Z0-9_.]\\(const\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-expression-face append))
        ("^\\(const\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-expression-face append))
        ("[^a-zA-Z0-9_.]\\(const\\)$" . (1 kratos2IR-expression-face append))
        ("^\\(const\\)$" . (1 kratos2IR-expression-face append))

        ("[^a-zA-Z0-9_.]\\(var\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-expression-face append))
        ("^\\(var\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-expression-face append))
        ("[^a-zA-Z0-9_.]\\(var\\)$" . (1 kratos2IR-expression-face append))
        ("^\\(var\\)$" . (1 kratos2IR-expression-face append))

        ;; basic operator

;         ("[^a-zA-Z0-9_.]\\(add\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-basic-operator-face append))
;         ("^\\(add\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-basic-operator-face append))
;         ("[^a-zA-Z0-9_.]\\(add\\)$" . (1 kratos2IR-basic-operator-face append))
;         ("^\\(add\\)$" . (1 kratos2IR-basic-operator-face append))

;         ("[^a-zA-Z0-9_.]\\(and\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-basic-operator-face append))
;         ("^\\(and\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-basic-operator-face append))
;         ("[^a-zA-Z0-9_.]\\(and\\)$" . (1 kratos2IR-basic-operator-face append))
;         ("^\\(and\\)$" . (1 kratos2IR-basic-operator-face append))

;         ("[^a-zA-Z0-9_.]\\(bitand\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-basic-operator-face append))
;         ("^\\(bitand\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-basic-operator-face append))
;         ("[^a-zA-Z0-9_.]\\(bitand\\)$" . (1 kratos2IR-basic-operator-face append))
;         ("^\\(bitand\\)$" . (1 kratos2IR-basic-operator-face append))

;         ("[^a-zA-Z0-9_.]\\(bitnot\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-basic-operator-face append))
;         ("^\\(bitnot\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-basic-operator-face append))
;         ("[^a-zA-Z0-9_.]\\(bitnot\\)$" . (1 kratos2IR-basic-operator-face append))
;         ("^\\(bitnot\\)$" . (1 kratos2IR-basic-operator-face append))

;         ("[^a-zA-Z0-9_.]\\(bitor\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-basic-operator-face append))
;         ("^\\(bitor\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-basic-operator-face append))
;         ("[^a-zA-Z0-9_.]\\(bitor\\)$" . (1 kratos2IR-basic-operator-face append))
;         ("^\\(bitor\\)$" . (1 kratos2IR-basic-operator-face append))

;         ("[^a-zA-Z0-9_.]\\(bitxor\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-basic-operator-face append))
;         ("^\\(bitxor\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-basic-operator-face append))
;         ("[^a-zA-Z0-9_.]\\(bitxor\\)$" . (1 kratos2IR-basic-operator-face append))
;         ("^\\(bitxor\\)$" . (1 kratos2IR-basic-operator-face append))

;         ("[^a-zA-Z0-9_.]\\(div\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-basic-operator-face append))
;         ("^\\(div\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-basic-operator-face append))
;         ("[^a-zA-Z0-9_.]\\(div\\)$" . (1 kratos2IR-basic-operator-face append))
;         ("^\\(div\\)$" . (1 kratos2IR-basic-operator-face append))

;         ("[^a-zA-Z0-9_.]\\(eq\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-basic-operator-face append))
;         ("^\\(eq\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-basic-operator-face append))
;         ("[^a-zA-Z0-9_.]\\(eq\\)$" . (1 kratos2IR-basic-operator-face append))
;         ("^\\(eq\\)$" . (1 kratos2IR-basic-operator-face append))

;         ("[^a-zA-Z0-9_.]\\(ge\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-basic-operator-face append))
;         ("^\\(ge\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-basic-operator-face append))
;         ("[^a-zA-Z0-9_.]\\(ge\\)$" . (1 kratos2IR-basic-operator-face append))
;         ("^\\(ge\\)$" . (1 kratos2IR-basic-operator-face append))

;         ("[^a-zA-Z0-9_.]\\(gt\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-basic-operator-face append))
;         ("^\\(gt\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-basic-operator-face append))
;         ("[^a-zA-Z0-9_.]\\(gt\\)$" . (1 kratos2IR-basic-operator-face append))
;         ("^\\(gt\\)$" . (1 kratos2IR-basic-operator-face append))

;         ("[^a-zA-Z0-9_.]\\(le\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-basic-operator-face append))
;         ("^\\(le\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-basic-operator-face append))
;         ("[^a-zA-Z0-9_.]\\(le\\)$" . (1 kratos2IR-basic-operator-face append))
;         ("^\\(le\\)$" . (1 kratos2IR-basic-operator-face append))

;         ("[^a-zA-Z0-9_.]\\(lshift\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-basic-operator-face append))
;         ("^\\(lshift\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-basic-operator-face append))
;         ("[^a-zA-Z0-9_.]\\(lshift\\)$" . (1 kratos2IR-basic-operator-face append))
;         ("^\\(lshift\\)$" . (1 kratos2IR-basic-operator-face append))

;         ("[^a-zA-Z0-9_.]\\(lt\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-basic-operator-face append))
;         ("^\\(lt\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-basic-operator-face append))
;         ("[^a-zA-Z0-9_.]\\(lt\\)$" . (1 kratos2IR-basic-operator-face append))
;         ("^\\(lt\\)$" . (1 kratos2IR-basic-operator-face append))

;         ("[^a-zA-Z0-9_.]\\(mul\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-basic-operator-face append))
;         ("^\\(mul\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-basic-operator-face append))
;         ("[^a-zA-Z0-9_.]\\(mul\\)$" . (1 kratos2IR-basic-operator-face append))
;         ("^\\(mul\\)$" . (1 kratos2IR-basic-operator-face append))

;         ("[^a-zA-Z0-9_.]\\(neg\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-basic-operator-face append))
;         ("^\\(neg\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-basic-operator-face append))
;         ("[^a-zA-Z0-9_.]\\(neg\\)$" . (1 kratos2IR-basic-operator-face append))
;         ("^\\(neg\\)$" . (1 kratos2IR-basic-operator-face append))

;         ("[^a-zA-Z0-9_.]\\(not\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-basic-operator-face append))
;         ("^\\(not\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-basic-operator-face append))
;         ("[^a-zA-Z0-9_.]\\(not\\)$" . (1 kratos2IR-basic-operator-face append))
;         ("^\\(not\\)$" . (1 kratos2IR-basic-operator-face append))

;         ("[^a-zA-Z0-9_.]\\(or\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-basic-operator-face append))
;         ("^\\(or\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-basic-operator-face append))
;         ("[^a-zA-Z0-9_.]\\(or\\)$" . (1 kratos2IR-basic-operator-face append))
;         ("^\\(or\\)$" . (1 kratos2IR-basic-operator-face append))

;         ("[^a-zA-Z0-9_.]\\(rem\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-basic-operator-face append))
;         ("^\\(rem\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-basic-operator-face append))
;         ("[^a-zA-Z0-9_.]\\(rem\\)$" . (1 kratos2IR-basic-operator-face append))
;         ("^\\(rem\\)$" . (1 kratos2IR-basic-operator-face append))

;         ("[^a-zA-Z0-9_.]\\(rshift\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-basic-operator-face append))
;         ("^\\(rshift\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-basic-operator-face append))
;         ("[^a-zA-Z0-9_.]\\(rshift\\)$" . (1 kratos2IR-basic-operator-face append))
;         ("^\\(rshift\\)$" . (1 kratos2IR-basic-operator-face append))

;         ("[^a-zA-Z0-9_.]\\(sub\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-basic-operator-face append))
;         ("^\\(sub\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-basic-operator-face append))
;         ("[^a-zA-Z0-9_.]\\(sub\\)$" . (1 kratos2IR-basic-operator-face append))
;         ("^\\(sub\\)$" . (1 kratos2IR-basic-operator-face append))

        ;; complex operator

        ("[^a-zA-Z0-9_.]\\(addrof\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-complex-operator-face append))
        ("^\\(addrof\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-complex-operator-face append))
        ("[^a-zA-Z0-9_.]\\(addrof\\)$" . (1 kratos2IR-complex-operator-face append))
        ("^\\(addrof\\)$" . (1 kratos2IR-complex-operator-face append))

        ("[^a-zA-Z0-9_.]\\(assign\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-complex-operator-face append))
        ("^\\(assign\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-complex-operator-face append))
        ("[^a-zA-Z0-9_.]\\(assign\\)$" . (1 kratos2IR-complex-operator-face append))
        ("^\\(assign\\)$" . (1 kratos2IR-complex-operator-face append))

        ("[^a-zA-Z0-9_.]\\(assume\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-complex-operator-face append))
        ("^\\(assume\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-complex-operator-face append))
        ("[^a-zA-Z0-9_.]\\(assume\\)$" . (1 kratos2IR-complex-operator-face append))
        ("^\\(assume\\)$" . (1 kratos2IR-complex-operator-face append))

        ("[^a-zA-Z0-9_.]\\(call\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-complex-operator-face append))
        ("^\\(call\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-complex-operator-face append))
        ("[^a-zA-Z0-9_.]\\(call\\)$" . (1 kratos2IR-complex-operator-face append))
        ("^\\(call\\)$" . (1 kratos2IR-complex-operator-face append))

        ("[^a-zA-Z0-9_.]\\(choice\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-complex-operator-face append))
        ("^\\(choice\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-complex-operator-face append))
        ("[^a-zA-Z0-9_.]\\(choice\\)$" . (1 kratos2IR-complex-operator-face append))
        ("^\\(choice\\)$" . (1 kratos2IR-complex-operator-face append))

        ("[^a-zA-Z0-9_.]\\(deref\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-complex-operator-face append))
        ("^\\(deref\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-complex-operator-face append))
        ("[^a-zA-Z0-9_.]\\(deref\\)$" . (1 kratos2IR-complex-operator-face append))
        ("^\\(deref\\)$" . (1 kratos2IR-complex-operator-face append))

        ("[^a-zA-Z0-9_.]\\(field\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-complex-operator-face append))
        ("^\\(field\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-complex-operator-face append))
        ("[^a-zA-Z0-9_.]\\(field\\)$" . (1 kratos2IR-complex-operator-face append))
        ("^\\(field\\)$" . (1 kratos2IR-complex-operator-face append))

        ("[^a-zA-Z0-9_.]\\(havoc\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-complex-operator-face append))
        ("^\\(havoc\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-complex-operator-face append))
        ("[^a-zA-Z0-9_.]\\(havoc\\)$" . (1 kratos2IR-complex-operator-face append))
        ("^\\(havoc\\)$" . (1 kratos2IR-complex-operator-face append))

        ("[^a-zA-Z0-9_.]\\(jump\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-complex-operator-face append))
        ("^\\(jump\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-complex-operator-face append))
        ("[^a-zA-Z0-9_.]\\(jump\\)$" . (1 kratos2IR-complex-operator-face append))
        ("^\\(jump\\)$" . (1 kratos2IR-complex-operator-face append))

        ("[^a-zA-Z0-9_.]\\(label\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-complex-operator-face append))
        ("^\\(label\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-complex-operator-face append))
        ("[^a-zA-Z0-9_.]\\(label\\)$" . (1 kratos2IR-complex-operator-face append))
        ("^\\(label\\)$" . (1 kratos2IR-complex-operator-face append))

        ("[^a-zA-Z0-9_.]\\(op\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-complex-operator-face append))
        ("^\\(op\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-complex-operator-face append))
        ("[^a-zA-Z0-9_.]\\(op\\)$" . (1 kratos2IR-complex-operator-face append))
        ("^\\(op\\)$" . (1 kratos2IR-complex-operator-face append))

        ("[^a-zA-Z0-9_.]\\(seq\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-complex-operator-face append))
        ("^\\(seq\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-complex-operator-face append))
        ("[^a-zA-Z0-9_.]\\(seq\\)$" . (1 kratos2IR-complex-operator-face append))
        ("^\\(seq\\)$" . (1 kratos2IR-complex-operator-face append))

        ("[^a-zA-Z0-9_.]\\(typecast\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-complex-operator-face append))
        ("^\\(typecast\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-complex-operator-face append))
        ("[^a-zA-Z0-9_.]\\(typecast\\)$" . (1 kratos2IR-complex-operator-face append))
        ("^\\(typecast\\)$" . (1 kratos2IR-complex-operator-face append))

        ("[^a-zA-Z0-9_.]\\(visit_[^a-zA-Z0-9_.]*\\)" . (1 kratos2IR-complex-operator-face append))
        ("^\\(visit_[^a-zA-Z0-9_.]*\\)" . (1 kratos2IR-complex-operator-face append))
        ("[^a-zA-Z0-9_.]\\(visit_\\)$" . (1 kratos2IR-complex-operator-face append))
        ("^\\(visit_\\)$" . (1 kratos2IR-complex-operator-face append))

        ("[^a-zA-Z0-9_.]\\(mapat\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-complex-operator-face append))
        ("^\\(mapat\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-complex-operator-face append))
        ("[^a-zA-Z0-9_.]\\(mapat\\)$" . (1 kratos2IR-complex-operator-face append))
        ("^\\(mapat\\)$" . (1 kratos2IR-complex-operator-face append))

        ("[^a-zA-Z0-9_.]\\(map\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-complex-operator-face append))
        ("^\\(map\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-complex-operator-face append))
        ("[^a-zA-Z0-9_.]\\(map\\)$" . (1 kratos2IR-complex-operator-face append))
        ("^\\(map\\)$" . (1 kratos2IR-complex-operator-face append))

        ;; function

        ("[^a-zA-Z0-9_.]\\(function\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-function-face append))
        ("^\\(function\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-function-face append))
        ("[^a-zA-Z0-9_.]\\(function\\)$" . (1 kratos2IR-function-face append))
        ("^\\(function\\)$" . (1 kratos2IR-function-face append))

        ("[^a-zA-Z0-9_.]\\(locals\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-function-face append))
        ("^\\(locals\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-function-face append))
        ("[^a-zA-Z0-9_.]\\(locals\\)$" . (1 kratos2IR-function-face append))
        ("^\\(locals\\)$" . (1 kratos2IR-function-face append))

        ("[^a-zA-Z0-9_.]\\(return\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-function-face append))
        ("^\\(return\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-function-face append))
        ("[^a-zA-Z0-9_.]\\(return\\)$" . (1 kratos2IR-function-face append))
        ("^\\(return\\)$" . (1 kratos2IR-function-face append))

        ;; program

        ("[^a-zA-Z0-9_.]\\(entry\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-program-face append))
        ("^\\(entry\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-program-face append))
        ("[^a-zA-Z0-9_.]\\(entry\\)$" . (1 kratos2IR-program-face append))
        ("^\\(entry\\)$" . (1 kratos2IR-program-face append))

        ("[^a-zA-Z0-9_.]\\(globals\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-program-face append))
        ("^\\(globals\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-program-face append))
        ("[^a-zA-Z0-9_.]\\(globals\\)$" . (1 kratos2IR-program-face append))
        ("^\\(globals\\)$" . (1 kratos2IR-program-face append))

        ("[^a-zA-Z0-9_.]\\(michele\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-program-face append))
        ("^\\(michele\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-program-face append))
        ("[^a-zA-Z0-9_.]\\(michele\\)$" . (1 kratos2IR-program-face append))
        ("^\\(michele\\)$" . (1 kratos2IR-program-face append))

        ;; assert

;         ("[^a-zA-Z0-9_.]\\(assert#[0-9]+\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-assert-face append))
;         ("^\\(assert#[0-9]+\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-assert-face append))
;         ("[^a-zA-Z0-9_.]\\(assert#[0-9]+\\)$" . (1 kratos2IR-assert-face append))
;         ("^\\(assert#[0-9]+\\)$" . (1 kratos2IR-assert-face append))

        ;; error

        ("[^a-zA-Z0-9_.]\\(ERROR\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-error-face append))
        ("^\\(ERROR\\)[^a-zA-Z0-9_.]" . (1 kratos2IR-error-face append))
        ("[^a-zA-Z0-9_.]\\(ERROR\\)$" . (1 kratos2IR-error-face append))
        ("^\\(ERROR\\)$" . (1 kratos2IR-error-face append))

        ))

;; ------------------------------------------------------------------------ ;;
;; MODE                                                                     ;;
;; ------------------------------------------------------------------------ ;;

(define-derived-mode kratos2IR-mode fundamental-mode
  (setq font-lock-defaults '(kratos2IR-highlights))
  (setq mode-name "kratos2IR"))

;; ------------------------------------------------------------------------ ;;
;; PROVIDE MODE                                                             ;;
;; ------------------------------------------------------------------------ ;;

(provide 'kratos2IR)

;; ------------------------------------------------------------------------ ;;

;;; kratos2IR ends here
