(windmove-default-keybindings 'super)

;; org customise
(setq org-agenda-custom-commands 
      '(
	("p" "Personal" agenda ""
         ((org-agenda-files '("/media/sf_Z/Dropbox/zShare/personal/org/personal.org"))) )
	("d" "DCL" agenda ""
         ((org-agenda-files '("/media/sf_Z/Dropbox/zShare/work/org/dcl.org"))) )
        ))

;; remember customise
;(setq org-directory "c:/z/Dropbox/org/")
;(setq org-default-notes-file "c:/z/Dropbox/org/inbox.org")
(setq org-remember-templates
     '(
       ("Personal" ?p "* TODO %? %^g\n %i\n " 
	"/media/sf_Z/Dropbox/zShare/personal/org/personal.org" "=inbox=")
       ("DCL" ?d "* TODO %? %^g\n %i\n " 
	"/media/sf_Z/Dropbox/zShare/work/dcl.org" "=inbox=")
       ("Journal"   ?j "** %^{Head Line} %U %^g\n%i%?"  
	"/media/sf_Z/Dropbox/zPersonal/org/journal.org")
       ))

