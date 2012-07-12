(tool-bar-mode -1)
(put 'dired-find-alternate-file 'disabled nil)
(setq calendar-week-start-day 1)

(require 'org-install)

(require 'framemove)
(setq framemove-hook-into-windmove t)

(require 'bookmark+)

;; org-mode
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; remember
(setq remember-annotation-functions '(org-remember-annotation))
(setq remember-handler-functions '(org-remember-handler))
(add-hook 'remember-mode-hook 'org-remember-apply-template)
(define-key global-map "\C-cr" 'org-remember)
