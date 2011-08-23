(require 'cl) ; a rare necessary use of REQUIRE

(defvar *emacs-load-start* (current-time))

;; setup variables
(setq dotfiles-dir (file-name-directory
		    (or (buffer-file-name) load-file-name)))
(setq my-site-lisp-dir (concat dotfiles-dir "site-lisp/"))
(setq my-custom-file (concat dotfiles-dir "custom.el"))
(setq this-system-name (car (split-string system-name "\\.")))
(setq system-specific-config (concat dotfiles-dir this-system-name ".el"))

;;; recursive local site-lisp
(add-to-list 'load-path my-site-lisp-dir)
(let ((default-directory  my-site-lisp-dir))
  (setq load-path
	(append
	 (let ((load-path (copy-sequence load-path))) ;; Shadow
	   (normal-top-level-add-subdirs-to-load-path))
	 load-path)))

;; customise file
(load my-custom-file 'noerror)

;; system specific file load
(if (file-exists-p system-specific-config) (load system-specific-config))

(message "My .emacs loaded in %ds" (destructuring-bind (hi lo ms) (current-time)
				     (- (+ hi lo) (+ (first *emacs-load-start*) (second *emacs-load-start*)))))
