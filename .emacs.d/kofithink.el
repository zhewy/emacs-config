(load "~/.emacs.d/win-general.el")

(windmove-default-keybindings 'control)

;; org customise
(setq org-agenda-custom-commands 
      '(
	("p" "Personal" agenda ""
         ((org-agenda-files '("c:/z/Dropbox/zShare/personal/personal.org"))) )
	("d" "DCL" agenda ""
         ((org-agenda-files '("c:/z/Dropbox/zShare/work/org/dcl.org"))) )
        ))

;; remember customise
;(setq org-directory "c:/z/Dropbox/org/")
;(setq org-default-notes-file "c:/z/Dropbox/org/inbox.org")
(setq org-remember-templates
     '(
       ("Personal" ?p "* TODO %? %^g\n %i\n " 
	"c:/z/Dropbox/zShare/personal/personal.org" "=inbox=")
       ("DCL" ?d "* TODO %? %^g\n %i\n " 
	"c:/z/Dropbox/zShare/work/dcl.org" "=inbox=")
       ("Journal"   ?j "** %^{Head Line} %U %^g\n%i%?"  
	"c:/z/Dropbox/zPersonal/journal.org")
       ))

;; mj-map hyperlink types define
(require 'org)
(org-add-link-type "mj-map" 'org-mj-map-open)
(defun org-mj-map-open (path)
       ""
       (shell-command (concat "cmd /c start mj-map:" path)))
