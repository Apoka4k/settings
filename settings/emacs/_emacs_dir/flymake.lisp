
;; AVVIARE AUTOMATICAMENTE FLYMAKE
; (require 'flymake)

;; ABILITARE LA SEGNALAZIONE DEGLI ERRORI NEL MINIBUFFER
; (require 'flymake-cursor) ;; sembra funzionare anche se segnala errore

;; DEFINIRE IL MODO KRATOS
; (define-derived-mode kratos-mode c-mode "Kratos Mode"
;   "Major mode for Kratos files.")
; (add-to-list 'auto-mode-alist '("\\.k\\'" . kratos-mode))

;; DEFINIRE IL FLYMAKE KRATOS
; (defconst kratoslint "/home/sbicego/Desktop/kratos_flymake/parse.py")
; (defvar flymake-allowed-file-name-masks)
; (when (load "flymake" t)
;   (defun flymake-kratoslint-init ()
;     (let* ((temp-file (flymake-init-create-temp-buffer-copy
;                        'flymake-create-temp-inplace))
;            (local-file (file-relative-name
;                         temp-file
;                         (file-name-directory buffer-file-name))))
;       (list kratoslint (list local-file))))
;   (add-to-list 'flymake-allowed-file-name-masks
;                '("\\.k\\'" flymake-kratoslint-init)))
;; associare il flymake kratos al modo kratos
; (add-hook 'kratos-mode-hook 'flymake-mode)
