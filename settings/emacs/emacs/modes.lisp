
;; IMPOSTARE LA CARTELLA DEI MODI
(setq load-path (cons "/home/sbicego/emacs/modes" load-path))

;; IMPOSTARE IL MODO USATO DI DEFAULT
(autoload 'ext-mode "ext" "Mode with predefined struct." t)

;; AGGIUNGERE LE FUNZIONALITA' GENERALI
;; definire le facce
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
;; definire il sottomodo
(defun general-mode (mode)
  "Add general functionalities to argument MODE."
  (font-lock-add-keywords
   mode
   '(
     ("\t+" . general-tab-face)
     ("[ ]+$" . general-space-face)
     ;; ("^.\\{80,\\}$" (0 'general-line-face t))
     )))
;; aggiungere il sottomodo ai modi
; (general-mode 'kratos-mode)
(general-mode 'c-mode)
(general-mode 'c++-mode)
(general-mode 'python-mode)
(general-mode 'caml-mode)
(general-mode 'matlab-mode)

;; CARICARE AUTOMATICAMENTE IL MODO XGTAGS IN MODALITA' C
(add-hook 'c-mode-hook 'xgtags-mode)

;; CARICARE AUTOMATICAMENTE IL FLYCHECK IN MODALITA' PYTHON
 (add-hook 'python-mode-hook 'flycheck-mode)

;; CARICARE AUTOMATICAMENTE IL FLYCHECK IN MODALITA' C
 (add-hook 'c-mode-hook 'flycheck-mode)

;; AGGIUNGERE ESTENSIONI AL MODO PYTHON
;(add-to-list 'auto-mode-alist '("\\.pyx\\'" . python-mode))

;; AGGIUNGERE IL MODO NUSMV
(autoload 'nusmv-mode "nusmv.el" "Major mode for NuSMV specification files." t)
(setq auto-mode-alist
      (append
       (list (cons "\\.smv$"  'nusmv-mode)
             (cons "\\.hydi$" 'nusmv-mode)
             (cons "\\.scen$" 'nusmv-mode)
             )
       auto-mode-alist))

;; AGGIUNGERE IL MODO GTAGS
(autoload 'gtags-mode "gtags.el" "Major mode for GTags targeted files." t)
(autoload 'xgtags-mode "xgtags.el" "Major mode for GTags targeted files." t)

;; ;; AGGIUNGERE IL MODO PHYSIOLAB
;; (autoload 'physiolab-mode "physiolab.el" "Major mode for Physiolab specification files." t)
;; (setq auto-mode-alist
;;       (append
;;        (list (cons "\\.phy" 'physiolab-mode)
;;              )
;;        auto-mode-alist))

;; AGGIUNGERE IL MODO KRATOS2IR
(autoload 'kratos2IR-mode "kratos2IR.el" "Major mode for Kratos2IR specification files." t)
(setq auto-mode-alist
      (append
       (list (cons "\\.IR" 'kratos2IR-mode)
             )
       auto-mode-alist))

;; AGGIUNGERE IL MODO CONFIGURATION
(autoload 'configuration-mode "configuration.el" "Major mode for generic configuration files." t)
(setq auto-mode-alist
      (append
       (list (cons "\\.cg" 'configuration-mode))
       auto-mode-alist))

;; AGGIUNGERE IL MODO INFORMATION
(autoload 'information-mode "information.el" "Major mode for generic information files." t)
(setq auto-mode-alist
      (append
       (list (cons "\\.in" 'information-mode))
       auto-mode-alist))

;; AGGIUNGERE IL MODO OCAML
(add-to-list 'auto-mode-alist '("\\.ml[iylp]?$" . caml-mode))
(autoload 'caml-mode "caml" "Major mode for editing OCaml code." t)
(autoload 'run-caml "inf-caml" "Run an inferior OCaml process." t)
(autoload 'camldebug "camldebug" "Run ocamldebug on program." t)
(add-to-list 'interpreter-mode-alist '("ocamlrun" . caml-mode))
(add-to-list 'interpreter-mode-alist '("ocaml" . caml-mode))

;; AGGIUNGERE IL MODO MATLAB
(autoload 'matlab-mode "matlab.el" "Major mode for matlab files." t)
(setq auto-mode-alist
      (append
       (list (cons "\\.m" 'matlab-mode))
       auto-mode-alist))
