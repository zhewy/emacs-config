(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("/media/sf_Dropbox/org/org.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(windmove-default-keybindings 'super)

(require 'xcscope)

;;; Python Dev
(setq python-python-command "python3")

;;; Perl Dev
;;; cperl-mode is preferred to perl-mode                                        
(defalias 'perl-mode 'cperl-mode)
(setq cperl-mode-hook (function cscope:hook))

