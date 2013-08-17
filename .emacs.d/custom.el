(tool-bar-mode -1)
(put 'dired-find-alternate-file 'disabled nil)
(setq calendar-week-start-day 1)

(require 'framemove)
(setq framemove-hook-into-windmove t)

(require 'bookmark+)

;; org-mode
(package-initialize)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
