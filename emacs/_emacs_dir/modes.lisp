
;; ------------------------------------------------------------------------- ;;
;; MODES DIRECTORY                                                           ;;
;; ------------------------------------------------------------------------- ;;

;; SET MODES DIRECTORY
(setq load-path (cons "/home/apoka/.emacs_dir/modes" load-path))

;; ------------------------------------------------------------------------- ;;
;; LOAD MODES                                                                ;;
;; ------------------------------------------------------------------------- ;;

;; DEFAULT MODE
(autoload 'ext-mode "ext" "Mode with predefined struct." t)

;; GTAGS MODE
;; we autoload gtags mode when in c mode
(autoload 'xgtags-mode "xgtags.el" "Major mode for GTags targeted files." t)
(add-hook 'c-mode-hook 'xgtags-mode)

;; CALLTREE MODE
(autoload 'calltree-mode "calltree.el"
  "Major mode for calltree visualization." t)
(setq auto-mode-alist
      (append
       (list (cons "\\.calltree" 'calltree-mode))
       auto-mode-alist))

;; MATLAB MODE
(autoload 'matlab-mode "matlab.el" "Major mode for matlab files." t)
(setq auto-mode-alist
      (append
       (list (cons "\\.m" 'matlab-mode))
       auto-mode-alist))

;; LATEX MODE
;; if a .tex file doesn't start with '\documentclass' or '% -*-latex-*-'
;; the default mode mode is 'latex' instead of 'LaTeX';
;; we force to load the more functional 'LaTeX'
(setq auto-mode-alist
      (append
       (list (cons "\\.tex" 'LaTeX-mode))
       auto-mode-alist))

;; PHP MODE
(autoload 'php-mode "php-mode.el"
  "Major mode for php files." t)
(setq auto-mode-alist
      (append
       (list (cons "\\.php" 'php-mode))
       auto-mode-alist))

;; DEFAULT MODE
;; default mode is given by the function 'general-mode';
;; apply it to a mode to add default features to such mode
(load "/home/apoka/.emacs_dir/modes/default.lisp")
(general-mode 'c-mode)
(general-mode 'c++-mode)
(general-mode 'python-mode)
(general-mode 'matlab-mode)
(general-mode 'lisp-mode)
(general-mode 'latex-mode)
(general-mode 'LaTeX-mode)

;; ------------------------------------------------------------------------- ;;
