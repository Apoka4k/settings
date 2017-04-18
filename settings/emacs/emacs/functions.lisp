
;; COMANDO PER RIMUOVERE RIGHE DUPLICATE
;; nella regione selezionata
(defun uniquify-all-lines-region (start end)
  "Find duplicate lines in region START to END keeping first occurrence."
  (interactive "*r")
  (save-excursion
    (let ((end (copy-marker end)))
      (while
          (progn
            (goto-char start)
            (re-search-forward "^\\(.*\\)\n\\(\\(.*\n\\)*\\)\\1\n" end t))
        (replace-match "\\1\n\\2")))))
;; in tutto il buffer
(defun uniquify-all-lines-buffer ()
  "Delete duplicate lines in buffer and keep first occurrence."
  (interactive "*")
  (uniquify-all-lines-region (point-min) (point-max)))

;; COMANDO PER COPIARE IL TOKEN [a-zA-Z0-9_]+ SELEZIONATO DAL CURSORE
; aggiungi il carattere underscore ai caratteri del token
(add-hook 'c-mode-hook
          (lambda () (modify-syntax-entry ?_ "w")))
(add-hook 'c++-mode-hook
          (lambda () (modify-syntax-entry ?_ "w")))
(add-hook 'python-mode-hook
          (lambda () (modify-syntax-entry ?_ "w")))
; definisci la selezione del cursore
(defun get-point (symbol &optional arg)
  "get the point"
  (funcall symbol arg)
  (point)
  )
; definisci la copia dell'oggetto selezionato
(defun copy-thing (begin-of-thing end-of-thing &optional arg)
  "copy thing between beg & end into kill ring"
  (save-excursion
    (let ((beg (get-point begin-of-thing 1))
          (end (get-point end-of-thing arg)))
      (copy-region-as-kill beg end)))
  )
; definisci la copia del token
(defun copy-word (&optional arg)
  "Copy words at point into kill-ring"
  (interactive "P")
  (copy-thing 'backward-word 'forward-word arg)
  )

;; COMANDO PER RICARICARE IL FILE .EMACS
; definisci la funzione
(defun reload-init-file ()
  (interactive)
  (load-file "~/.emacs"))
