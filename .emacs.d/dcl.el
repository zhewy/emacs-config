;; dcl emacs setup


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 102 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))


(windmove-default-keybindings 'super)

;;; *****************************
;;; DCL template ****************
;;; *****************************

;; Basic visual customisation
;;;(set-default-font "Bitstream Vera Sans Mono-10")
;; Setup for ido.el
;(require 'ido)
;ido-mode t)
;(setq ido-enable-flex-matching t)

;; Setup for AsciiDoc doc-mode
;;;(require 'doc-mode)
;;;(add-to-list 'auto-mode-alist '("\\.adoc$" . doc-mode))
;;;(autoload 'doc-mode "doc-mode")
;; Create my personal C style.
(defconst my-c-style
  '((c-basic-offset . 3)
    (c-tab-always-indent        . t)
    (c-comment-only-line-offset . 0)
    (c-hanging-braces-alist     . ((substatement-open after)
                                   (brace-list-open)))
    (c-hanging-colons-alist     . ((member-init-intro before)
                                   (inher-intro)
                                   (case-label after)
                                   (label after)
                                   (access-label after)))
    (c-cleanup-list             . (scope-operator
                                   empty-defun-braces
                                   defun-close-semi))
    (c-offsets-alist            . ((arglist-close . c-lineup-arglist)
                                   (substatement-open . 0)
                                   (case-label        . 3)
                                   (block-open        . 0)
                                   (knr-argdecl-intro . -)))
    (c-echo-syntactic-information-p . t))
  "My C Programming Style")
(c-add-style "PERSONAL" my-c-style)

;; Customizations for all modes in CC Mode.
(defun my-c-mode-common-hook ()
  ;; set my personal style for the current buffer
  (c-set-style "PERSONAL")
  ;; other customizations
  (setq tab-width 3
        ;; this will make sure spaces are used instead of tabs
        indent-tabs-mode nil))
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;; Customisation for text mode.
(add-hook 'text-mode-hook
	  '(lambda ()
		  (auto-fill-mode 1)
		  (flyspell-mode 1)))

;; key bindings
(global-set-key [(control .)] 'tags-search) ;Regex through files in tag table.




;;; *****************************
;;; TAGS         ****************
;;; *****************************

;;; xcscope
(require 'xcscope)

;;; gtags
(autoload 'gtags-mode "gtags" "" t)
(add-hook 'c-mode-hook
	  '(lambda ()
	     (gtags-mode 1)
	     ))
(global-set-key "\C-cdt" 'gtags-find-with-grep)
(global-set-key "\C-cdc" 'gtags-find-rtag)
