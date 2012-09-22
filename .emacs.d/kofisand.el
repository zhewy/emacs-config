(windmove-default-keybindings 'super)

;; ledger
(load "ledger")

;; babel
(setq org-confirm-babel-evaluate nil)
(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (ledger . t)         ;this is the important one for this tutorial
   (sh . t)
   (python . t)
   ))

;; agenda customise
(setq org-directory "/media/sf_Z/Dropbox/")

;; org customise
(setq org-agenda-custom-commands 
      '(
	("p" "Personal" agenda ""
         ((org-agenda-files '("/media/sf_Z/Dropbox/zShare/personal/org/personal.org"))) )
	("d" "DCL" agenda ""
         ((org-agenda-files '("/media/sf_Z/Dropbox/zShare/work/org/dcl.org"))) )
        ))

;; remember customise
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

;; mj-map hyperlink types define
(require 'org)
(org-add-link-type "mj-map" 'org-mj-map-open)
(defun org-mj-map-open (path)
       ""
       (shell-command (concat "cmd /c start mj-map:" path)))

;; yassnippet
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas/global-mode 1)
(setf yas/indent-line nil)
(yas/load-directory "~/.emacs.d/plugins/yasnippet/snippets")
