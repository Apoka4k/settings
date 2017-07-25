
;; load flycheck
(require 'flycheck)

;; remove fringes
(setq flycheck-indication-mode nil)

;; enable flycheck for all modes
(add-hook 'after-init-hook #'global-flycheck-mode)

;; enable flycheck for special modes
;; (add-hook 'c-mode-hook 'flycheck-mode)
;; (add-hook 'python-mode-hook 'flycheck-mode)
