(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 102 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))

(setq org-agenda-files (quote ("~/NETWORK/hdrive/org/dc.org" "~/NETWORK/hdrive/org/unidrive.org")))
(setq tool-bar-mode nil)

;;; Python Dev
(setq python-python-command "python3")
(setq python-mode-hook (function cscope:hook))

;;; Perl Dev
;;; cperl-mode is preferred to perl-mode                 
(defalias 'perl-mode 'cperl-mode)
(setq cperl-mode-hook (function cscope:hook))
(require 'perldoc)

(load "~/.emacs.d/dcl.el" 'noerror)
