(load "~/.emacs.d/dcl.el" 'noerror)

;;; Python Dev
(setq python-python-command "python3")
(setq python-mode-hook (function cscope:hook))

;;; Perl Dev
;;; cperl-mode is preferred to perl-mode                 
(defalias 'perl-mode 'cperl-mode)
(setq cperl-mode-hook (function cscope:hook))
(require 'perldoc)
