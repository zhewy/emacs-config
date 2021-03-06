(windmove-default-keybindings 'control)
;(global-set-key (kbd "C-c <left>")  'windmove-left)
;(global-set-key (kbd "C-c <right>") 'windmove-right)
;(global-set-key (kbd "C-c <up>")    'windmove-up)
;(global-set-key (kbd "C-c <down>")  'windmove-down)

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
   (calc . t)
   ))

;; org customise
(setq org-agenda-custom-commands 
      '(
	("p" "Personal" agenda ""
         ((org-agenda-files '("~/Dropbox/zShare/personal/org/personal.org"))) )
        ))

(setq org-link-file-path-type "relative")
(setq org-agenda-files '("~/Documents/org/"))

;; remember customise
;(setq org-default-notes-file "c:/z/Dropbox/org/inbox.org")
(setq org-remember-templates
     '(
       ("Personal" ?p "* TODO %? %^g\n %i\n " 
	"~/Dropbox/zShare/personal/org/personal.org" "=inbox=")
       ))

;; yassnippet
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas/global-mode 1)
(setf yas/indent-line nil)
(yas/load-directory "~/.emacs.d/plugins/yasnippet/snippets")

;; load pdfs in evince
(eval-after-load "org"
  '(progn
     ;; Change .pdf association directly within the alist
     (setcdr (assoc "\\.pdf\\'" org-file-apps) "evince %s")))

(require 'color-moccur)
