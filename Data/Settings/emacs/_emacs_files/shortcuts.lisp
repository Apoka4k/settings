
;; SCORCIATOIE NEL MENU M-x

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

;; aggiornare il buffer
(defalias 'bb 'revert-buffer)

;; copiare il token selezionato
(defalias 'ww 'copy-word)

;; evidenziare le occorrenze della stringa
(defalias 'hh 'highlight-regexp)

;; rimuovere le evidenziazioni
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

;; SCORCIATOIE DA TASTIERA

;; copia il token attualmente selezionato
(global-set-key (kbd "M-q") 'copy-word)

;; MACRO PERSONALIZZATE

;; passa alla prima occorrenza della stringa nel buffer corrente
(fset 'aa
      [?\M-g ?\M-g ?1 return ?\C-s ?\C-y ?\C-x ?\)])

;; copia il contenuto della prossima coppia di parentesi graffe
(fset 'gg
   [?\C-s ?\{ S-left ?\S-\C-\M-n S-left ?\M-w])

;; comando per il cluter:
;;   trasforma l'output di un ($ ls) in una colonna di stringhe
;;   del tipo (korein-to-cube-one-file *.txt;)
(fset 'cluster
   [?\C-x ?h ?\M-x ?q ?q ?q return ?. ?* ?\[ ?. ?\] ?n ?u ?x ?m ?v ?\C-q ?\C-j return return ?! ?\C-x ?h ?\M-x ?q ?q ?q return ?. ?* ?\[ ?. ?\] ?s ?h ?\C-q ?\C-j return return ?! ?\C-x ?h ?\M-x ?q ?q ?q return ?. ?* ?\[ ?. ?\] ?t ?\C-q ?\C-j return return ?! ?\C-x ?h ?\M-x ?q ?q ?q return ?. ?* ?\[ ?. ?\] ?s ?m ?v ?\C-q ?\C-j return return ?! ?\C-x ?h ?\M-x ?q ?q ?q return ?n ?u ?X ?m ?v ?\C-q ?\C-j return return ?! ?\C-x ?h ?\M-x ?q ?q ?q return ?^ return ?k ?o ?r ?e ?i ?n ?- ?t ?o ?- ?c ?u ?b ?e ?- ?o ?n ?e ?- ?f ?i ?l ?e ?  return ?! ?\C-x ?h ?\M-x ?q ?q ?q return ?$ return ?\; return ?!])
