(windmove-default-keybindings 'control)

;; babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '((ledger . t)         ;this is the important one for this tutorial
   ))

;; agenda customise
(setq org-directory "c:/z/Dropbox/org/")

;; org customise
(setq org-agenda-custom-commands 
      '(
	("p" "Personal" agenda ""
         ((org-agenda-files '("c:/z/Dropbox/zShare/personal/org/personal.org"))) )
	("d" "DCL" agenda ""
         ((org-agenda-files '("c:/z/Dropbox/zShare/work/org/dcl.org"))) )
        ))

;; remember customise
;(setq org-default-notes-file "c:/z/Dropbox/org/inbox.org")
(setq org-remember-templates
     '(
       ("Personal" ?p "* TODO %? %^g\n %i\n " 
	"c:/z/Dropbox/zShare/personal/org/personal.org" "=inbox=")
       ("DCL" ?d "* TODO %? %^g\n %i\n " 
	"c:/z/Dropbox/zShare/work/dcl.org" "=inbox=")
       ("Journal"   ?j "** %^{Head Line} %U %^g\n%i%?"  
	"c:/z/Dropbox/zPersonal/org/journal.org")
       ))

;; mj-map hyperlink types define
(require 'org)
(org-add-link-type "mj-map" 'org-mj-map-open)
(defun org-mj-map-open (path)
       ""
       (shell-command (concat "cmd /c start mj-map:" path)))
