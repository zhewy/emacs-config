(load "~/.emacs.d/win-general.el")
(load "~/.emacs.d/winxp.el")

(windmove-default-keybindings 'super)

;; org customise
(setq org-agenda-custom-commands 
      '(
	("p" "Personal" agenda ""
         ((org-agenda-files '("~/Dropbox/zShare/personal/personal.org"))) )
	("d" "DCL" agenda ""
         ((org-agenda-files '("~/Dropbox/zShare/work/dcl.org"))) )
        ))

;; remember customise
;(setq org-directory "~/Dropbox/org/")
;(setq org-default-notes-file "~/Dropbox/org/inbox.org")
(setq org-remember-templates
     '(
       ("Personal" ?p "* TODO %? %^g\n %i\n " 
	"~/Dropbox/zShare/personal/personal.org" "=inbox=")
       ("DCL" ?d "* TODO %? %^g\n %i\n " 
	"~/Dropbox/zShare/work/dcl.org" "=inbox=")
       ("Journal"   ?j "** %^{Head Line} %U %^g\n%i%?"  
	"~/Dropbox/zWork/journal.org")
       ))
