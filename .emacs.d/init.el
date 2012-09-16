;;; GENERIC init file
;;;  - sets up local directories
;;;  - calls init file depending on which computer run from

(defvar *emacs-load-start* (current-time))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(indent-tabs-mode nil)
 '(org-special-ctrl-a/e t)
 '(tab-width 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; setup variables
(setq dotfiles-dir (file-name-directory
		    (or (buffer-file-name) load-file-name)))
(setq my-site-lisp-dir (concat dotfiles-dir "site-lisp/"))
(setq my-custom-file (concat dotfiles-dir "custom.el"))
(setq this-system-name (car (split-string system-name "\\.")))
(setq system-specific-config (concat dotfiles-dir this-system-name ".el"))

;; recursive local site-lisp
(add-to-list 'load-path my-site-lisp-dir)
(let ((default-directory  my-site-lisp-dir))
  (setq load-path
	(append
	 (let ((load-path (copy-sequence load-path))) ;; Shadow
	   (normal-top-level-add-subdirs-to-load-path))
	 load-path)))

;; customise file
(load my-custom-file 'noerror)

; system specific file load
(if (file-exists-p system-specific-config) (load system-specific-config))

(message "My .emacs loaded in %ds" (destructuring-bind (hi lo ms) (current-time)
				     (- (+ hi lo) (+ (first *emacs-load-start*) (second *emacs-load-start*)))))
