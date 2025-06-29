
;; SCORCIATOIE NEL MENU M-x

;; aggiornare il buffer
(defalias 'bb 'revert-buffer)

; ricarica il file .emacs
(defalias 'll 'reload-init-file)

;; rimuovere le evidenziazioni
(defalias 'cc 'lazy-highlight-cleanup)

;; ordinare le righe della regione selezionata
(defalias 'ss 'sort-lines)

;; sostituire nella regione selezionata
(defalias 'qq 'query-replace)

;; sostituire con espressioni regolari nella regione selezionata
(defalias 'qqq 'query-replace-regexp)

;; rimuovere le righe doppie nella regione selezionata,
;  mantenendo solo la prima occorrenza
(defalias 'rr 'uniquify-all-lines-region)

;; attivare la modalita' gtags
(defalias 'xx 'xgtags-mode)

;; copiare il token selezionato
(defalias 'ww 'copy-word)

;; evidenziare le occorrenze della stringa
(defalias 'hh 'highlight-regexp)

;; rimuovere l'evidenziazione delle occorrenze di una stringa
(defalias 'hhh 'unhighlight-regexp)

;; stampare i colori usabili per le evidenziazioni
(defun hh-color ()
  (interactive)
  (princ "hi-black-b\n")
  (princ "hi-black-hb\n")
  (princ "hi-blue\n")
  (princ "hi-blue-b\n")
  (princ "hi-green\n")
  (princ "hi-green-b\n")
  (princ "hi-pink\n")
  (princ "hi-red-b\n")
  (princ "hi-yellow\n"))

;; apri un buffer con i colori di EMACS
(defalias 'colors 'list-colors-display)

;; etichetta la macro attuale
(defalias 'macro-name 'name-last-kbd-macro)

;; salva la macro con l'etichetta specificata
(defalias 'macro-save 'insert-kbd-macro)

;; elimina le righe che matchano l'espressione regolare
(defalias 'remove-lines-regexp 'flush-lines)

;; salva solo le righe che matchano l'espressione regolare
(defalias 'keep-lines-regexp 'keep-lines)

;; comunica il numero di occorrenze dell'espressione regolare
(defalias 'oo 'count-matches)

;; SCORCIATOIE DA TASTIERA

;; copia il token attualmente selezionato
(global-set-key (kbd "M-q") 'copy-word)

;; capitalizza le parole nella regione selezionata
(global-set-key (kbd "C-x C-k") 'capitalize-region)

;; MACRO PERSONALIZZATE

;; passa alla prima occorrenza della stringa nel buffer corrente
(fset 'aa
      [?\M-g ?\M-g ?1 return ?\C-s ?\C-y ?\C-x ?\)])
