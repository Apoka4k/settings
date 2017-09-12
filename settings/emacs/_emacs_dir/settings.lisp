
;; MOSTRARE IL PATH COMPLETO DEL FILE APERTO
(setq inhibit-default-init t)

;; IMPOSTARE LO SFONDO NERO E LE SCRITTE BIANCHE
(when window-system
  (add-to-list 'default-frame-alist '(background-color . "black"))
  (add-to-list 'default-frame-alist '(foreground-color . "white"))
  )

;; SOSTITUIRE LE TABULAZIONI CON GLI SPAZI AD OGNI SALVATAGGIO
(setq-default indent-tabs-mode nil)

;; AGGIUNGERE UNA RIGA VUOTA ALLA FINE DEL FILE AD OGNI SALVATAGGIO
(setq require-final-newline t)

;; RIMUOVERE GLI SPAZI PRECEDENTI IL TERMINE DI RIGA AD OGNI SALVATAGGIO
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; MASSIMIZZARE LA FINESTRA DI EMACS ALL'AVVIO
(setq initial-frame-alist
      `((left . 0) (top . 0)
        (width . 88) (height . 60)))

;; EVIDENZIARE LE PAROLE DURANTE UNA RICERCA
(setq lazy-highlight-cleanup nil)

;; AVERE IL NUMERO DI RIGA
(global-linum-mode t)

;; ABILITARE LA SOSTITUZIONE IN SCRITTURA DEL TESTO EVIDENZIATO
(delete-selection-mode 1)

;; MOSTRARE IL PERCORSO DEL FILE NEL SUO TITOLO
(setq-default frame-title-format "%b (%f)")

;; SCORCIATOIA PER COMMENTARE E DECOMMENTARE UNA REGIONE
(global-set-key (kbd "S-<f1>") 'comment-region)
(global-set-key (kbd "S-<f2>") 'uncomment-region)

;; ELIMINARE LA SCHERMATA INIZIALE DI PRESENTAZIONE
(custom-set-variables
 '(inhibit-startup-screen t)
 )

;; ACCOPPIARE LE PARENTESI
(custom-set-variables
 '(show-paren-mode t)
 )

;; DISTINGUERE LETTERE MAIUSCOLE E MINUSCOLE
(custom-set-variables
 '(case-fold-search nil)
 )

;; ABILITARE I COMANDI PER MODIFICARE IL CASO DELLE LETTERE DI UNA REGIONE
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; ABILITARE L'AGGIUSTAMENTO ORIZZONTALE AUTOMATICO DELLA VISUALE
(put 'scroll-left 'disabled nil)
