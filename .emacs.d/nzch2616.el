(load "~/.emacs.d/winxp.el")

(windmove-default-keybindings 'super)

;; org customise
(setq org-agenda-custom-commands 
      '(
	("p" "Personal" agenda ""
         ((org-agenda-files '("c:/z/Dropbox/zShare/personal/org/personal.org"))) )
	("d" "DCL" agenda ""
         ((org-agenda-files '("c:/z/Dropbox/zShare/work/org/dcl.org"))) )
        ))

;; remember customise
;(setq org-directory "~/Dropbox/org/")
;(setq org-default-notes-file "~/Dropbox/org/inbox.org")
(setq org-remember-templates
     '(
       ("Personal" ?p "* TODO %? %^g\n %i\n " 
	"c:/z/Dropbox/zShare/personal/org/personal.org" "=inbox=")
       ("DCL" ?d "* TODO %? %^g\n %i\n " 
	"c:/z/Dropbox/zShare/work/org/dcl.org" "=inbox=")
       ("Journal"   ?j "** %^{Head Line} %U %^g\n%i%?"  
	"~/Dropbox/zWork/journal.org")
       ))

;; mj-map hyperlink types define
(require 'org)
(org-add-link-type "mj-map" 'org-mj-map-open)
(defun org-mj-map-open (path)
       ""
       (shell-command (concat "cmd /c start mj-map:" path)))
;; notes hyperlink types define
(org-add-link-type "Notes" 'org-notes-open)
(defun org-notes-open (path)
       ""
       (shell-command (concat "cmd /c start Notes:" path)))

(add-to-list 'load-path "~/.emacs.d/")
(require 'taskjuggler-mode)

(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/plugins/yasnippet/snippets")
