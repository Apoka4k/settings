
;; IMPOSTARE LA CARTELLA DEI MODI
(setq load-path (cons "/home/apoka/.emacs_dir/modes" load-path))

;; AGGIUNGERE IL MODO GTAGS
(autoload 'xgtags-mode "xgtags.el" "Major mode for GTags targeted files." t)

;; AGGIUNGERE IL MODO GENERIC_INFO
(autoload 'configuration-mode "generic_info.el" "Major mode for generic information files." t)
(setq auto-mode-alist
      (append
       (list (cons "\\.gi" 'generic_info-mode))
       auto-mode-alist))

;; AGGIUNGERE IL MODO MATLAB
(autoload 'matlab-mode "matlab.el" "Major mode for matlab files." t)
(setq auto-mode-alist
      (append
       (list (cons "\\.m" 'matlab-mode))
       auto-mode-alist))

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
     ;; highlight tabs
     ("\t+" . general-tab-face)
     ;; highlight trailing spaces
     ("[ ]+$" . general-space-face)
     ;; highlight excessive chars of long lines
     ("^.\\{79\\}\\(.+\\)$" (1 'general-line-face t))
     ;; highlight first 2 chars of long lines (for readibility)
     ("^\\(.\\{2\\}\\).\\{78,\\}$" (1 'general-line-face t))
     )))
;; aggiungere il sottomodo ai modi
(general-mode 'c-mode)
(general-mode 'c++-mode)
(general-mode 'python-mode)
(general-mode 'generic_info-mode)
(general-mode 'matlab-mode)

;; CARICARE AUTOMATICAMENTE IL MODO GTAGS IN MODALITA' C
(add-hook 'c-mode-hook 'xgtags-mode)
