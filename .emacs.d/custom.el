(tool-bar-mode -1)

(require 'org-install)

(require 'framemove)
(setq framemove-hook-into-windmove t)

(require 'bookmark+)
(require 'buff-menu+)

;; org-mode
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
