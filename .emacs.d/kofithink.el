;(windmove-default-keybindings 'control)
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

;; mj-map hyperlink types define
;(require 'org)
;(org-add-link-type "mj-map" 'org-mj-map-open)
;(defun org-mj-map-open (path)
;       ""
;       (shell-command (concat "cmd /c start mj-map:" path)))
