<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: dired+.el</title><link rel="alternate" type="application/wiki" title="Edit this page" href="http://www.emacswiki.org/emacs?action=edit;id=dired%2b.el" /><link type="text/css" rel="stylesheet" href="/emacs/wiki.css" /><meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="http://www.emacswiki.org/emacs?action=rss" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki: dired+.el" href="http://www.emacswiki.org/emacs?action=rss;rcidonly=dired%2b.el" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content"
      href="http://www.emacswiki.org/emacs/full.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content and diff"
      href="http://www.emacswiki.org/emacs/full-diff.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki including minor differences"
      href="http://www.emacswiki.org/emacs/minor-edits.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Changes for dired+.el only"
      href="http://www.emacswiki.org/emacs?action=rss;rcidonly=dired%2b.el" /><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head><body class="http://www.emacswiki.org/emacs"><div class="header"><a class="logo" href="http://www.emacswiki.org/emacs/SiteMap"><img class="logo" src="/emacs_logo.png" alt="[Home]" /></a><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/Glossary">Glossary</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span>
<!-- Google CSE Search Box Begins  -->
<form class="tiny" action="http://www.google.com/cse" id="searchbox_004774160799092323420:6-ff2s0o6yi"><p>
<input type="hidden" name="cx" value="004774160799092323420:6-ff2s0o6yi" />
<input type="text" name="q" size="25" />
<input type="submit" name="sa" value="Search" />
</p></form>
<script type="text/javascript" src="http://www.google.com/coop/cse/brand?form=searchbox_004774160799092323420%3A6-ff2s0o6yi"></script>
<!-- Google CSE Search Box Ends -->
<br /><span class="specialdays">Antigua and Barbuda, National Day, Algeria, Anniversary of the Revolution</span><h1><a title="Click to search for references to this page" rel="nofollow" href="http://www.google.com/cse?cx=004774160799092323420:6-ff2s0o6yi&amp;q=%22dired%2b.el%22">dired+.el</a></h1></div><div class="wrapper"><div class="wrapper"><div class="content browse"><p class="download"><a href="http://www.emacswiki.org/emacs-en/download/dired%2b.el">Download</a></p><pre class="code"><span class="linecomment">;;; dired+.el --- Extensions to Dired.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Filename: dired+.el</span>
<span class="linecomment">;; Description: Extensions to Dired.</span>
<span class="linecomment">;; Author: Drew Adams</span>
<span class="linecomment">;; Maintainer: Drew Adams</span>
<span class="linecomment">;; Copyright (C) 1999-2012, Drew Adams, all rights reserved.</span>
<span class="linecomment">;; Created: Fri Mar 19 15:58:58 1999</span>
<span class="linecomment">;; Version: 21.2</span>
<span class="linecomment">;; Last-Updated: Sat Oct  6 09:00:42 2012 (-0700)</span>
<span class="linecomment">;;           By: dradams</span>
<span class="linecomment">;;     Update #: 6157</span>
<span class="linecomment">;; URL: http://www.emacswiki.org/cgi-bin/wiki/dired+.el</span>
<span class="linecomment">;; Doc URL: http://www.emacswiki.org/emacs/DiredPlus</span>
<span class="linecomment">;; Keywords: unix, mouse, directories, diredp, dired</span>
<span class="linecomment">;; Compatibility: GNU Emacs: 20.x, 21.x, 22.x, 23.x, 24.x</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Features that might be required by this library:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;   `bookmark', `bookmark+', `bookmark+-1', `bookmark+-bmu',</span>
<span class="linecomment">;;   `bookmark+-key', `bookmark+-lit', `cl', `dired', `dired+',</span>
<span class="linecomment">;;   `dired-aux', `dired-x', `ediff-diff', `ediff-help',</span>
<span class="linecomment">;;   `ediff-init', `ediff-merg', `ediff-mult', `ediff-util',</span>
<span class="linecomment">;;   `ediff-wind', `ffap', `misc-fns', `pp', `pp+', `thingatpt',</span>
<span class="linecomment">;;   `thingatpt+', `w32-browser'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Commentary:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    Extensions to Dired.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  This file extends functionalities provided by standard GNU Emacs</span>
<span class="linecomment">;;  files `dired.el', `dired-aux.el', and `dired-x.el'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Key bindings changed.  Menus redefined.  `diredp-mouse-3-menu'</span>
<span class="linecomment">;;  popup menu added.  New commands.  Some commands enhanced.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  All of the new functions, variables, and faces defined here have</span>
<span class="linecomment">;;  the prefix `diredp-' (for Dired Plus) in their names.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Additional suggested key bindings:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    (define-key ctl-x-map   "d" 'diredp-dired-files)</span>
<span class="linecomment">;;    (define-key ctl-x-4-map "d" 'diredp-dired-files-other-window)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Fontification Level</span>
<span class="linecomment">;;  -------------------</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  If you want a maximum or minimum fontification for Dired mode,</span>
<span class="linecomment">;;  then customize option `font-lock-maximum-decoration'.  If you want</span>
<span class="linecomment">;;  a different fontification level for Dired than for other modes,</span>
<span class="linecomment">;;  you can do this too by customizing</span>
<span class="linecomment">;;  `font-lock-maximize-decoration'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Act on All Files</span>
<span class="linecomment">;;  ----------------</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Most of the commands (such as `C' and `M-g') that operate on the</span>
<span class="linecomment">;;  marked files have the added feature here that multiple `C-u' use</span>
<span class="linecomment">;;  not the files that are marked or the next or previous N files, but</span>
<span class="linecomment">;;  *all* of the files in the Dired buffer.  Just what "all" files</span>
<span class="linecomment">;;  means changes with the number of `C-u', as follows:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `C-u C-u'         - Use all files present, but no directories.</span>
<span class="linecomment">;;    `C-u C-u C-u'     - Use all files and dirs except `.' and `..'.</span>
<span class="linecomment">;;    `C-u C-u C-u C-u' - use all files and dirs, `.' and `..'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    (More than four `C-u' act the same as two.)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  This feature can be particularly useful when you have a Dired</span>
<span class="linecomment">;;  buffer with files chosen from multiple directories.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Note that this behavior is described only in the doc string of</span>
<span class="linecomment">;;  function `dired-get-marked-files'.  It is *not* described in the</span>
<span class="linecomment">;;  doc strings of the various commands, because that would require</span>
<span class="linecomment">;;  redefining each command separately here.  Instead, we redefine</span>
<span class="linecomment">;;  only macro `dired-map-over-marks' and function</span>
<span class="linecomment">;;  `dired-get-filename' in order to achieve this effect.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Act on Marked (or All) Files Here and Below</span>
<span class="linecomment">;;  -------------------------------------------</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  The prefix argument behavior just described does not apply to the</span>
<span class="linecomment">;;  `diredp-*-recursive' commands.  These commands act on the marked</span>
<span class="linecomment">;;  files in the current Dired buffer or on all files in the directory</span>
<span class="linecomment">;;  if none are marked.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  But these commands also handle marked subdirectories recursively,</span>
<span class="linecomment">;;  in the same way.  That is, they act also on the marked files in</span>
<span class="linecomment">;;  any marked subdirectories, found recursively.  If there is no</span>
<span class="linecomment">;;  Dired buffer for a given marked subdirectory then all of its files</span>
<span class="linecomment">;;  and subdirs are acted on.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  With a prefix argument, all marks are ignored.  The commands act</span>
<span class="linecomment">;;  on all files in the current Dired buffer and all of its</span>
<span class="linecomment">;;  subdirectories, recursively.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  All of the `diredp-*-recursive' commands are on prefix key `M-+',</span>
<span class="linecomment">;;  and they are available on submenu `Marked Here and Below' of the</span>
<span class="linecomment">;;  `Multiple' menu-bar menu.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  If you use library `Icicles' then you have these additional</span>
<span class="linecomment">;;  commands/keys that act recursively on marked files.  They are in</span>
<span class="linecomment">;;  the `Icicles' submenu of menu `Multiple' &gt; `Marked Here and</span>
<span class="linecomment">;;  Below'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  * `M-+ M-s M-s' or `M-s M-s m' - Use Icicles search (and its</span>
<span class="linecomment">;;                  on-demand replace) on the marked files.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  * Save the names of the marked files:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `M-+ C-M-&gt;' - Save as a completion set, for use during</span>
<span class="linecomment">;;                  completion (e.g. with `C-x C-f').</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `M-+ C-&gt;'   - Add marked names to the names in the current saved</span>
<span class="linecomment">;;                  completion set.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `M-+ C-}'   - Save persistently to an Icicles cache file, for</span>
<span class="linecomment">;;                  use during completion in another session.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `icicle-dired-save-marked-to-fileset-recursive' - Like `M-+</span>
<span class="linecomment">;;                  C-}', but save persistently to an Emacs fileset.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `M-+ C-M-}' - Save to a Lisp variable.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  In the other direction, if you have a saved set of file names then</span>
<span class="linecomment">;;  you can use `C-M-&lt;' (`icicle-dired-chosen-files-other-window') in</span>
<span class="linecomment">;;  Dired to open a Dired buffer for just those files.  So you can</span>
<span class="linecomment">;;  mark some files and subdirs in a hierarchy of Dired buffers, use</span>
<span class="linecomment">;;  `M-+ C-}' to save their names persistently, then later use `C-{'</span>
<span class="linecomment">;;  to retrieve them, and `C-M-&lt;' (in Dired) to open Dired on them.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Inserted Subdirs, Multiple Dired Buffers, Files from Anywhere,...</span>
<span class="linecomment">;;  -----------------------------------------------------------------</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  These two standard Dired features are worth pointing out:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  * You can insert multiple subdirectory listings into a single</span>
<span class="linecomment">;;    Dired buffer using `i' on each subdir line.  Use `C-u i' to</span>
<span class="linecomment">;;    specify `ls' switches.  Specifying switch `R' inserts the</span>
<span class="linecomment">;;    inserted subdirectory's subdirs also, recursively.  You can also</span>
<span class="linecomment">;;    use `i' to bounce between a subdirectory line and its</span>
<span class="linecomment">;;    inserted-listing header line.  You can delete a subdir listing</span>
<span class="linecomment">;;    using `C-u k' on its header line.  You can hide/show an inserted</span>
<span class="linecomment">;;    subdir using `$' and `M-$'.  You can use `C-_' to undo any of</span>
<span class="linecomment">;;    these operations.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  * You can open a Dired buffer for an arbitrary set of files, from</span>
<span class="linecomment">;;    different directories.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    First, you can pass a glob pattern with wildcards to `dired'</span>
<span class="linecomment">;;    interactively, as the file name.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    Beyond that, you can invoke `dired' non-interactively, passing</span>
<span class="linecomment">;;    it a cons of buffer name and file names.  Relative file names</span>
<span class="linecomment">;;    are interpreted relative to the value of `default-directory'.</span>
<span class="linecomment">;;    Use absolute file names if appropriate.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Some other libraries, such as `Bookmark+' and `Icicles', make it</span>
<span class="linecomment">;;  easy to create or re-create Dired buffers that list specific files</span>
<span class="linecomment">;;  and have a particular set of markings.  This can be handy for</span>
<span class="linecomment">;;  using Dired buffers to manage projects.  In such use cases you</span>
<span class="linecomment">;;  might have multiple Dired buffers that have quite specific</span>
<span class="linecomment">;;  contents and that you want to keep around during a session.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  This is one motivation for the Dired+ `diredp-*-recursive'</span>
<span class="linecomment">;;  commands, which act on the marked files in marked subdirectories,</span>
<span class="linecomment">;;  recursively.  In one sense these commands are an alternative to</span>
<span class="linecomment">;;  using a single Dired buffer with inserted subdirectories.  They</span>
<span class="linecomment">;;  let you use the same operations on the files in a set of Dired</span>
<span class="linecomment">;;  directories, without inserting those directories into an ancestor</span>
<span class="linecomment">;;  Dired buffer.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  So you might have some subdirectories inserted in the same Dired</span>
<span class="linecomment">;;  buffer, and you might have separate Dired buffers for some</span>
<span class="linecomment">;;  subdirectories.  Sometimes it is useful to have both for the same</span>
<span class="linecomment">;;  subdirectory.  And sometimes it is useful to move from one</span>
<span class="linecomment">;;  presentation to the other.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  You can use command `diredp-dired-inserted-subdirs' to open a</span>
<span class="linecomment">;;  separate Dired buffer for each of the subdirs that is inserted in</span>
<span class="linecomment">;;  the current Dired buffer.  Markings and Dired switches are</span>
<span class="linecomment">;;  preserved.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  In the opposite direction, if you use `Icicles' then you can use</span>
<span class="linecomment">;;  multi-command `icicle-dired-insert-as-subdir', which lets you</span>
<span class="linecomment">;;  insert any number of directories you choose interactively into a</span>
<span class="linecomment">;;  Dired ancestor directory listing.  If a directory you choose to</span>
<span class="linecomment">;;  insert already has its own Dired buffer, then its markings and</span>
<span class="linecomment">;;  switches are preserved for the new, subdirectory listing in the</span>
<span class="linecomment">;;  ancestor Dired buffer.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Faces defined here:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `diredp-compressed-file-suffix', `diredp-date-time',</span>
<span class="linecomment">;;    `diredp-deletion', `diredp-deletion-file-name',</span>
<span class="linecomment">;;    `diredp-dir-heading', `diredp-dir-priv', `diredp-display-msg',</span>
<span class="linecomment">;;    `diredp-exec-priv', `diredp-executable-tag', `diredp-file-name',</span>
<span class="linecomment">;;    `diredp-file-suffix', `diredp-flag-mark',</span>
<span class="linecomment">;;    `diredp-flag-mark-line', `diredp-get-file-or-dir-name',</span>
<span class="linecomment">;;    `diredp-ignored-file-name', `diredp-link-priv',</span>
<span class="linecomment">;;    `diredp-mode-line-flagged', `diredp-mode-line-marked'</span>
<span class="linecomment">;;    `diredp-no-priv', `diredp-number', `diredp-other-priv',</span>
<span class="linecomment">;;    `diredp-rare-priv', `diredp-read-priv', `diredp-symlink',</span>
<span class="linecomment">;;    `diredp-write-priv'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Commands defined here:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `diredp-bookmark-this-file', `diredp-byte-compile-this-file',</span>
<span class="linecomment">;;    `diredp-capitalize', `diredp-capitalize-recursive',</span>
<span class="linecomment">;;    `diredp-capitalize-this-file', `diredp-chgrp-this-file',</span>
<span class="linecomment">;;    `diredp-chmod-this-file', `diredp-chown-this-file',</span>
<span class="linecomment">;;    `diredp-compress-this-file',</span>
<span class="linecomment">;;    `diredp-copy-filename-as-kill-recursive',</span>
<span class="linecomment">;;    `diredp-copy-tags-this-file', `diredp-copy-this-file',</span>
<span class="linecomment">;;    `diredp-delete-this-file', `diredp-describe-file',</span>
<span class="linecomment">;;    `diredp-describe-mode', `diredp-dired-files',</span>
<span class="linecomment">;;    `diredp-dired-files-other-window', `diredp-dired-for-files',</span>
<span class="linecomment">;;    `diredp-dired-for-files-other-window',</span>
<span class="linecomment">;;    `diredp-dired-inserted-subdirs', `diredp-dired-plus-help',</span>
<span class="linecomment">;;    `diredp-dired-this-subdir', `diredp-dired-union',</span>
<span class="linecomment">;;    `diredp-dired-union-other-window', `diredp-do-bookmark',</span>
<span class="linecomment">;;    `diredp-do-bookmark-in-bookmark-file',</span>
<span class="linecomment">;;    `diredp-do-bookmark-in-bookmark-file-recursive',</span>
<span class="linecomment">;;    `diredp-do-bookmark-recursive', `diredp-do-chmod-recursive',</span>
<span class="linecomment">;;    `diredp-do-chgrp-recursive', `diredp-do-chown-recursive',</span>
<span class="linecomment">;;    `diredp-do-copy-recursive', `diredp-do-decrypt-recursive',</span>
<span class="linecomment">;;    `diredp-do-encrypt-recursive',</span>
<span class="linecomment">;;    `diredp-do-find-marked-files-recursive', `diredp-do-grep',</span>
<span class="linecomment">;;    `diredp-do-grep-recursive', `diredp-do-hardlink-recursive',</span>
<span class="linecomment">;;    `diredp-do-isearch-recursive',</span>
<span class="linecomment">;;    `diredp-do-isearch-regexp-recursive',</span>
<span class="linecomment">;;    `diredp-do-move-recursive', `diredp-do-paste-add-tags',</span>
<span class="linecomment">;;    `diredp-do-paste-replace-tags', `diredp-do-print-recursive',</span>
<span class="linecomment">;;    `diredp-do-query-replace-regexp-recursive',</span>
<span class="linecomment">;;    `diredp-do-redisplay-recursive',</span>
<span class="linecomment">;;    `diredp-do-relsymlink-recursive', `diredp-do-remove-all-tags',</span>
<span class="linecomment">;;    `diredp-do-search-recursive', `diredp-do-set-tag-value',</span>
<span class="linecomment">;;    `diredp-do-shell-command-recursive', `diredp-do-sign-recursive',</span>
<span class="linecomment">;;    `diredp-do-symlink-recursive', `diredp-do-tag',</span>
<span class="linecomment">;;    `diredp-do-touch-recursive', `diredp-do-untag',</span>
<span class="linecomment">;;    `diredp-do-verify-recursive', `diredp-downcase-recursive',</span>
<span class="linecomment">;;    `diredp-downcase-this-file', `diredp-ediff', `diredp-fileset',</span>
<span class="linecomment">;;    `diredp-find-a-file', `diredp-find-a-file-other-frame',</span>
<span class="linecomment">;;    `diredp-find-a-file-other-window',</span>
<span class="linecomment">;;    `diredp-find-file-other-frame',</span>
<span class="linecomment">;;    `diredp-find-file-reuse-dir-buffer',</span>
<span class="linecomment">;;    `diredp-flag-region-files-for-deletion',</span>
<span class="linecomment">;;    `diredp-grep-this-file', `diredp-hardlink-this-file',</span>
<span class="linecomment">;;    `diredp-image-dired-comment-files-recursive',</span>
<span class="linecomment">;;    `diredp-image-dired-delete-tag-recursive',</span>
<span class="linecomment">;;    `diredp-image-dired-display-thumbs-recursive',</span>
<span class="linecomment">;;    `diredp-image-dired-tag-files-recursive',</span>
<span class="linecomment">;;    `diredp-insert-as-subdir', `diredp-insert-subdirs',</span>
<span class="linecomment">;;    `diredp-insert-subdirs-recursive',</span>
<span class="linecomment">;;    `diredp-list-marked-recursive', `diredp-load-this-file',</span>
<span class="linecomment">;;    `diredp-marked', `diredp-marked-other-window',</span>
<span class="linecomment">;;    `diredp-marked-recursive',</span>
<span class="linecomment">;;    `diredp-marked-recursive-other-window',</span>
<span class="linecomment">;;    `diredp-mark-files-tagged-all', `diredp-mark-files-tagged-none',</span>
<span class="linecomment">;;    `diredp-mark-files-tagged-not-all',</span>
<span class="linecomment">;;    `diredp-mark-files-tagged-some',</span>
<span class="linecomment">;;    `diredp-mark-files-tagged-regexp', `diredp-mark-region-files',</span>
<span class="linecomment">;;    `diredp-mark/unmark-extension', `diredp-mouse-3-menu',</span>
<span class="linecomment">;;    `diredp-mouse-backup-diff', `diredp-mouse-copy-tags',</span>
<span class="linecomment">;;    `diredp-mouse-describe-file', `diredp-mouse-diff',</span>
<span class="linecomment">;;    `diredp-mouse-do-bookmark', `diredp-mouse-do-byte-compile',</span>
<span class="linecomment">;;    `diredp-mouse-do-chgrp', `diredp-mouse-do-chmod',</span>
<span class="linecomment">;;    `diredp-mouse-do-chown', `diredp-mouse-do-compress',</span>
<span class="linecomment">;;    `diredp-mouse-do-copy', `diredp-mouse-do-delete',</span>
<span class="linecomment">;;    `diredp-mouse-do-grep', `diredp-mouse-do-hardlink',</span>
<span class="linecomment">;;    `diredp-mouse-do-load', `diredp-mouse-do-print',</span>
<span class="linecomment">;;    `diredp-mouse-do-remove-all-tags', `diredp-mouse-do-rename',</span>
<span class="linecomment">;;    `diredp-mouse-do-set-tag-value',</span>
<span class="linecomment">;;    `diredp-mouse-do-shell-command', `diredp-mouse-do-symlink',</span>
<span class="linecomment">;;    `diredp-mouse-do-tag', `diredp-mouse-do-untag',</span>
<span class="linecomment">;;    `diredp-mouse-downcase', `diredp-mouse-ediff',</span>
<span class="linecomment">;;    `diredp-mouse-find-file', `diredp-mouse-find-file-other-frame',</span>
<span class="linecomment">;;    `diredp-mouse-find-file-reuse-dir-buffer',</span>
<span class="linecomment">;;    `diredp-mouse-flag-file-deletion', `diredp-mouse-mark',</span>
<span class="linecomment">;;    `diredp-mouse-mark-region-files', `diredp-mouse-mark/unmark',</span>
<span class="linecomment">;;    `diredp-mouse-unmark', `diredp-mouse-upcase',</span>
<span class="linecomment">;;    `diredp-mouse-view-file',</span>
<span class="linecomment">;;    `diredp-multiple-w32-browser-recursive',</span>
<span class="linecomment">;;    `diredp-nb-marked-in-mode-name', `diredp-omit-marked',</span>
<span class="linecomment">;;    `diredp-omit-unmarked', `diredp-paste-add-tags-this-file',</span>
<span class="linecomment">;;    `diredp-paste-replace-tags-this-file', `diredp-print-this-file',</span>
<span class="linecomment">;;    `diredp-relsymlink-this-file',</span>
<span class="linecomment">;;    `diredp-remove-all-tags-this-file', `diredp-rename-this-file',</span>
<span class="linecomment">;;    `diredp-send-bug-report',</span>
<span class="linecomment">;;    `diredp-set-bookmark-file-bookmark-for-marked',</span>
<span class="linecomment">;;    `diredp-set-bookmark-file-bookmark-for-marked-recursive',</span>
<span class="linecomment">;;    `diredp-set-tag-value-this-file',</span>
<span class="linecomment">;;    `diredp-shell-command-this-file', `diredp-symlink-this-file',</span>
<span class="linecomment">;;    `diredp-tag-this-file', `diredp-toggle-find-file-reuse-dir',</span>
<span class="linecomment">;;    `diredp-touch-this-file', `diredp-toggle-marks-in-region',</span>
<span class="linecomment">;;    `diredp-unmark-files-tagged-all',</span>
<span class="linecomment">;;    `diredp-unmark-files-tagged-none',</span>
<span class="linecomment">;;    `diredp-unmark-files-tagged-not-all',</span>
<span class="linecomment">;;    `diredp-unmark-files-tagged-some', `diredp-unmark-region-files',</span>
<span class="linecomment">;;    `diredp-untag-this-file', `diredp-upcase-recursive',</span>
<span class="linecomment">;;    `diredp-upcase-this-file', `diredp-w32-drives',</span>
<span class="linecomment">;;    `diredp-w32-drives-mode', `toggle-diredp-find-file-reuse-dir'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  User options defined here:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `diff-switches', `diredp-prompt-for-bookmark-prefix-flag',</span>
<span class="linecomment">;;    `diredp-w32-local-drives'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Non-interactive functions defined here:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `diredp-all-files', `diredp-ancestor-dirs', `diredp-bookmark',</span>
<span class="linecomment">;;    `diredp-create-files-non-directory-recursive',</span>
<span class="linecomment">;;    `diredp-directories-within',</span>
<span class="linecomment">;;    `diredp-dired-files-interactive-spec',</span>
<span class="linecomment">;;    `diredp-dired-plus-description',</span>
<span class="linecomment">;;    `diredp-dired-plus-description+links',</span>
<span class="linecomment">;;    `diredp-dired-plus-help-link', `diredp-dired-union-1',</span>
<span class="linecomment">;;    `diredp-dired-union-interactive-spec',</span>
<span class="linecomment">;;    `diredp-do-chxxx-recursive', `diredp-do-create-files-recursive',</span>
<span class="linecomment">;;    `diredp-do-grep-1', `diredp-fewer-than-2-files-p',</span>
<span class="linecomment">;;    `diredp-find-a-file-read-args', `diredp-files-within',</span>
<span class="linecomment">;;    `diredp-files-within-1', `diredp-get-confirmation-recursive',</span>
<span class="linecomment">;;    `diredp-get-files', `diredp-get-files-for-dir',</span>
<span class="linecomment">;;    `diredp-internal-do-deletions', `diredp-list-files',</span>
<span class="linecomment">;;    `diredp-make-find-file-keys-reuse-dirs',</span>
<span class="linecomment">;;    `diredp-make-find-file-keys-not-reuse-dirs', `diredp-maplist',</span>
<span class="linecomment">;;    `diredp-marked-here', `diredp-mark-files-tagged-all/none',</span>
<span class="linecomment">;;    `diredp-mark-files-tagged-some/not-all',</span>
<span class="linecomment">;;    `diredp-paste-add-tags', `diredp-paste-replace-tags',</span>
<span class="linecomment">;;    `diredp-read-bookmark-file-args', `diredp-remove-if-not',</span>
<span class="linecomment">;;    `diredp-set-tag-value', `diredp-tag',</span>
<span class="linecomment">;;    `diredp-this-file-marked-p', `diredp-this-file-unmarked-p',</span>
<span class="linecomment">;;    `diredp-this-subdir', `diredp-untag', `diredp-y-or-n-files-p'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Variables defined here:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `diredp-file-line-overlay', `diredp-files-within-dirs-done',</span>
<span class="linecomment">;;    `diredp-font-lock-keywords-1', `diredp-loaded-p',</span>
<span class="linecomment">;;    `diredp-menu-bar-immediate-menu',</span>
<span class="linecomment">;;    `diredp-menu-bar-immediate-bookmarks-menu',</span>
<span class="linecomment">;;    `diredp-menu-bar-mark-menu', `diredp-menu-bar-operate-menu',</span>
<span class="linecomment">;;    `diredp-menu-bar-operate-bookmarks-menu',</span>
<span class="linecomment">;;    `diredp-menu-bar-recursive-marked-menu',</span>
<span class="linecomment">;;    `diredp-menu-bar-regexp-menu', `diredp-menu-bar-subdir-menu',</span>
<span class="linecomment">;;    `diredp-re-no-dot', `diredp-w32-drives-mode-map'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  ***** NOTE: The following macros defined in `dired.el' have</span>
<span class="linecomment">;;              been REDEFINED HERE:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  `dired-map-over-marks'    - Treat multiple `C-u' specially.</span>
<span class="linecomment">;;  `dired-mark-if'           - Better initial msg - Emacs bug #8523.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  ***** NOTE: The following functions defined in `dired.el' have</span>
<span class="linecomment">;;              been REDEFINED HERE:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  `dired-do-delete'         - Display message to warn that marked,</span>
<span class="linecomment">;;                              not flagged, files will be deleted.</span>
<span class="linecomment">;;  `dired-do-flagged-delete' - Display message to warn that flagged,</span>
<span class="linecomment">;;                              not marked, files will be deleted.</span>
<span class="linecomment">;;  `dired-find-file'         - Allow `.' and `..' (Emacs 20 only).</span>
<span class="linecomment">;;  `dired-get-filename'      - Test `./' and `../' (like `.', `..').</span>
<span class="linecomment">;;  `dired-goto-file'         - Fix Emacs bug #7126.</span>
<span class="linecomment">;;                              Remove `/' from dir before compare.</span>
<span class="linecomment">;;  `dired-insert-directory'  - Compute WILDCARD arg for</span>
<span class="linecomment">;;                              `insert-directory' for individual file</span>
<span class="linecomment">;;                              (don't just use nil). (Emacs 23+, and</span>
<span class="linecomment">;;                              only for MS Windows)</span>
<span class="linecomment">;;  `dired-insert-set-properties' - `mouse-face' on whole line.</span>
<span class="linecomment">;;  `dired-mark-files-regexp' - Add regexp to `regexp-search-ring'.</span>
<span class="linecomment">;;  `dired-mark-pop-up'       - Delete the window or frame popped up,</span>
<span class="linecomment">;;                              afterward, and bury its buffer. Do not</span>
<span class="linecomment">;;                              show a menu bar for pop-up frame.</span>
<span class="linecomment">;;  `dired-pop-to-buffer'     - Put window point at bob (bug #12281).</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; NOT YET:</span>
<span class="linecomment">;;; ;;  `dired-readin-insert'     - Use t as WILDCARD arg to</span>
<span class="linecomment">;;; ;;                              `dired-insert-directory'.  (Emacs 23+,</span>
<span class="linecomment">;;; ;;                              and only for MS Windows)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  `dired-revert'            - Reset `mode-line-process' to nil.</span>
<span class="linecomment">;;  `dired-switches-escape-p' - Made compatible with Emacs 20, 21.</span>
<span class="linecomment">;;  `dired-up-directory'      - On Windows, go up to list of drives.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  The following functions are included here with NO CHANGES to their</span>
<span class="linecomment">;;  definitions.  They are here only to take advantage of the new</span>
<span class="linecomment">;;  definition of macro `dired-map-over-marks':</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  `dired-do-redisplay', `dired-get-marked-files',</span>
<span class="linecomment">;;  `dired-map-over-marks-check',</span>
<span class="linecomment">;;  `image-dired-dired-insert-marked-thumbs' (from `image-dired.el').</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  ***** NOTE: The following functions defined in `dired-aux.el' have</span>
<span class="linecomment">;;              been REDEFINED HERE:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  `dired-do-byte-compile', `dired-do-compress', `dired-do-load' -</span>
<span class="linecomment">;;     Redisplay only if at most one file is being treated.</span>
<span class="linecomment">;;  `dired-maybe-insert-subdir' - Go back to subdir line if in listing.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  ***** NOTE: The following functions defined in `dired-x.el' have</span>
<span class="linecomment">;;              been REDEFINED HERE:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  `dired-do-find-marked-files' -</span>
<span class="linecomment">;;     Doc string reflects new `dired-simultaneous-find-file'.</span>
<span class="linecomment">;;  `dired-mark-sexp' - 1. Variable `s' -&gt; `blks'.</span>
<span class="linecomment">;;                      2. Fixes to `uid' and `gid'.</span>
<span class="linecomment">;;  `dired-mark-unmarked-files' (Emacs &lt; 24 only) - Emacs 24+ version.</span>
<span class="linecomment">;;  `dired-simultaneous-find-file' -</span>
<span class="linecomment">;;     Use separate frames instead of windows if `pop-up-frames' is</span>
<span class="linecomment">;;     non-nil, or if prefix arg &lt; 0.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  ***** NOTE: (Emacs 20 only) The following variable defined in</span>
<span class="linecomment">;;        `dired.el' has been REDEFINED HERE:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  `dired-move-to-filename-regexp' - Recognize file size in k etc.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Change Log:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 2012/10/06 dadams</span>
<span class="linecomment">;;     Added: minibuffer-with-setup-hook for code byte-compiled using Emacs &lt; 22.</span>
<span class="linecomment">;; 2012/09/28 dadams</span>
<span class="linecomment">;;     Moved dired-*w32* bindings after normal mouse bindings, so they override them.</span>
<span class="linecomment">;; 2012/09/05 dadams</span>
<span class="linecomment">;;     diredp-(rename|copy|(rel)symlink|hardlink)-this-file: Bind use-file-dialog to nil.</span>
<span class="linecomment">;; 2012/08/26 dadams</span>
<span class="linecomment">;;     Set font-lock-defaults to a 3-element list, so it works with font-menus(-da).el.</span>
<span class="linecomment">;; 2012/08/25 dadams</span>
<span class="linecomment">;;     Added: redefinition of dired-pop-to-buffer (fix for bug #12281).</span>
<span class="linecomment">;;     dired-mark-pop-up: If buffer is shown in a separate frame, do not show menu bar.</span>
<span class="linecomment">;; 2012/07/10 dadams</span>
<span class="linecomment">;;     Removed unneeded substitute-key-definition for (next|previous)-line.</span>
<span class="linecomment">;; 2012/07/09 dadams</span>
<span class="linecomment">;;     Added redefinition of dired-mark-files-regexp: Push REGEXP onto regexp-search-ring.</span>
<span class="linecomment">;; 2012/06/21 dadams</span>
<span class="linecomment">;;     diredp-nb-marked-in-mode-name:</span>
<span class="linecomment">;;       Add marker numbers regardless of name match.</span>
<span class="linecomment">;;       Use text property dired+-mode-name to tell whether mode-name was already changed.</span>
<span class="linecomment">;; 2012/06/20 dadams</span>
<span class="linecomment">;;     Added: diredp-nb-marked-in-mode-name, diredp-mode-line-(flagged|marked).  Added to hooks.</span>
<span class="linecomment">;;     Thx to Michael Heerdegen.</span>
<span class="linecomment">;; 2012/06/14 dadams</span>
<span class="linecomment">;;     dired-mark-pop-up: Wrap save-excursion around window/frame deletion.</span>
<span class="linecomment">;;     dired-do-redisplay: Updated wrt Emacs 23: bind, (then run) dired-after-readin-hook.</span>
<span class="linecomment">;;     diredp-y-or-n-files-p: Corrected construction of prompt wrt final SPC.</span>
<span class="linecomment">;; 2012/06/13 dadams</span>
<span class="linecomment">;;     dired-buffers-for-dir: Updated wrt Emacs 23:</span>
<span class="linecomment">;;       If dired-directory is a list then expand FILE in DIR & check whether in cdr of list.</span>
<span class="linecomment">;;     diredp-get-files-for-dir, diredp-files-within-1, diredp-insert-as-subdir:</span>
<span class="linecomment">;;       Expand dir name before passing it to dired-buffers-for-dir.</span>
<span class="linecomment">;; 2012/06/05 dadams</span>
<span class="linecomment">;;     MS Windows: Just do not define commands that are inappropriate for Windows (instead of</span>
<span class="linecomment">;;       defining them to raise an error or making them invisible in menus).</span>
<span class="linecomment">;; 2012/06/02 dadams</span>
<span class="linecomment">;;     Added: diredp-do-(print|encrypt|decrypt|sign|verify)-recursive.  Menus.  Keys.</span>
<span class="linecomment">;;     diredp-do-move-recursive: Corrected to use dired-rename-file, not dired-copy-file.</span>
<span class="linecomment">;; 2012/05/30 dadams</span>
<span class="linecomment">;;     diredp-insert-as-subdir: Added optional arg IN-DIRED-NOW-P.  Pick up markings & switches</span>
<span class="linecomment">;;                              from sole Dired buffer for CHILD if not in Dired now.</span>
<span class="linecomment">;; 2012/05/29 dadams</span>
<span class="linecomment">;;     Added: diredp-do-(chxxx|chgrp|chown|touch)-recursive, diredp-touch-this-file,</span>
<span class="linecomment">;;       diredp-menu-bar-(immediate|operate)-bookmarks-menu.  Added to menus.  Bound to keys.</span>
<span class="linecomment">;;     Factored bookmark stuff into Bookmark(s) submenus.</span>
<span class="linecomment">;;     diredp-menu-bar-immediate-menu: Added dired-kill-subdir, [goto-subdir].</span>
<span class="linecomment">;;     diredp-dired-this-subdir, dired-maybe-insert-subdir: Corrected :visible/enable.</span>
<span class="linecomment">;;     diredp-dired-inserted-subdirs: Do dired-(remember-marks|mark-rememberd) in this-buff.</span>
<span class="linecomment">;;     diredp-mouse-3-menu:</span>
<span class="linecomment">;;       Do not use save-excursion, because some commands move point on purpose.  Just return to</span>
<span class="linecomment">;;         original point unless command intends to MOVEP.</span>
<span class="linecomment">;;       Added to menu dired-maybe-insert-subdir (two entries), dired-kill-subdir.</span>
<span class="linecomment">;;       Use *-this-file*, not *-do-*: copy|symlink|shell-command|grep|load (don't use :keys).</span>
<span class="linecomment">;; 2012/05/26 dadams</span>
<span class="linecomment">;;     diredp-dired-inserted-subdirs, diredp-insert-as-subdir:</span>
<span class="linecomment">;;       Preserve markings and switches in target buffer.</span>
<span class="linecomment">;;     dired-mark-pop-up: Use unwind-protect.  Bury buffer too.</span>
<span class="linecomment">;;     diredp-do-chmod-recursive: Use only 5 args if &lt; Emacs 23.</span>
<span class="linecomment">;; 2012/05/25 dadams</span>
<span class="linecomment">;;     Added: diredp-insert-as-subdir, diredp-ancestor-dirs, diredp-maplist,</span>
<span class="linecomment">;;            diredp-do-redisplay-recursive, diredp-do-chmod-recursive.</span>
<span class="linecomment">;;            Bound diredp-do-chmod-recursive. to M-+ M and added to menu.</span>
<span class="linecomment">;;     diredp-get-files: Added optional arg DONT-ASKP.</span>
<span class="linecomment">;;     diredp-y-or-n-files-p: Kill list buffer if it was never shown.</span>
<span class="linecomment">;;     dired-mark-pop-up: ignore error when delete frame/window.</span>
<span class="linecomment">;; 2012/05/22 dadams</span>
<span class="linecomment">;;     diredp-get-files(-for-dir): Added optional arg INCLUDE-DIRS-P.</span>
<span class="linecomment">;;     Added: diredp-insert-subdirs(-recursive), diredp(-this)-dired-inserted-subdir(s).</span>
<span class="linecomment">;;            Added to menus.  Bound diredp-insert-subdirs* to (M-+) M-i.</span>
<span class="linecomment">;;     Bound diredp-capitalize(-recursive) to (M-+) %c.</span>
<span class="linecomment">;;     Added diredp-dired-union-other-window to Dirs menu.</span>
<span class="linecomment">;;     Updated diredp-dired-plus-description.</span>
<span class="linecomment">;; 2012/05/19 dadams</span>
<span class="linecomment">;;     Added: diredp-image-dired-*-recursive, diredp-*link-recursive,</span>
<span class="linecomment">;;            diredp-do-isearch(-regexp)-recursive, diredp-do-query-replace-regexp-recursive,</span>
<span class="linecomment">;;            diredp-do-search-recursive, diredp-(capitalize|(up|down)case)-recursive,</span>
<span class="linecomment">;;            diredp-create-files-non-directory-recursive.</span>
<span class="linecomment">;;              Bound on M-+ prefix key.  Added to menus.</span>
<span class="linecomment">;;     diredp-get-files, diredp-y-or-n-files-p, diredp-list-files, diredp-list-marked-recursive:</span>
<span class="linecomment">;;       Added optional arg PREDICATE.</span>
<span class="linecomment">;;     diredp-do-create-files-recursive: Removed MARKER-CHAR arg.  Hard-code to keep markings.</span>
<span class="linecomment">;;     diredp-do-(copy|move)-recursive: Use arg IGNORE-MARKS-P (forgot to use it).</span>
<span class="linecomment">;;                                      Removed MARKER-CHAR arg in call to d-d-c-f-r.</span>
<span class="linecomment">;;     Added missing autoload cookies.</span>
<span class="linecomment">;; 2012/05/06 dadsms</span>
<span class="linecomment">;;     diredp-y-or-n-files-p: Do not kill buffer *Files* - just bury it.</span>
<span class="linecomment">;; 2012/05/05 dadams</span>
<span class="linecomment">;;     Added: diredp-do-bookmark-recursive, diredp-do-bookmark-in-bookmark-file-recursive,</span>
<span class="linecomment">;;            diredp-set-bookmark-file-bookmark-for-marked-recursive.</span>
<span class="linecomment">;;              Bound to M-+ M-b, M-+ C-M-B, M-+ C-M-b, respectively.  Added to menus.</span>
<span class="linecomment">;;     diredp-bookmark: Added optional arg FILE.</span>
<span class="linecomment">;;     diredp-do-bookmark-in-bookmark-file: Added optional arg FILES.</span>
<span class="linecomment">;;     diredp-dired-plus-description: Updated.</span>
<span class="linecomment">;;     diredp-get-confirmation-recursive: Raise error if not in Dired.</span>
<span class="linecomment">;;     diredp-do-bookmark-recursive, diredp-marked-recursive(-other-window),</span>
<span class="linecomment">;;       diredp-multiple-w32-browser-recursive:</span>
<span class="linecomment">;;         Use diredp-get-confirmation-recursive.</span>
<span class="linecomment">;; 2012/05/04 dadams</span>
<span class="linecomment">;;     Added: dired-mark-unmarked-files for Emacs &lt; 24.</span>
<span class="linecomment">;;     diredp-do-create-files-recursive: Corrected for Emacs &lt; 24.</span>
<span class="linecomment">;;     diredp-do-create-files-recursive, diredp-(un)mark-files-tagged-regexp,</span>
<span class="linecomment">;;       diredp(-mouse)-do-(un)tag, diredp(-mouse)-do-remove-all-tags,</span>
<span class="linecomment">;;       diredp(-mouse)-do-paste-(add|replace)-tags, diredp(-mouse)-do-set-tag-value,</span>
<span class="linecomment">;;       diredp(-mouse)-do-bookmark(-in-bookmark-file), diredp-find-a-file-read-args,</span>
<span class="linecomment">;;       diredp-mouse-do-shell-command:</span>
<span class="linecomment">;;         Use lexical-let(*), to get closures for free vars in lambdas.</span>
<span class="linecomment">;; 2012/04/28 dadams</span>
<span class="linecomment">;;     Added:</span>
<span class="linecomment">;;       diredp-copy-filename-as-kill-recursive, diredp-do-copy-recursive,</span>
<span class="linecomment">;;       diredp-do-find-marked-files-recursive, diredp-do-grep-recursive,</span>
<span class="linecomment">;;       diredp-do-move-recursive, diredp-do-shell-command-recursive,</span>
<span class="linecomment">;;       diredp-list-marked-recursive, diredp-marked-recursive(-other-window),</span>
<span class="linecomment">;;       diredp-multiple-w32-browser-recursive, diredp-do-create-files-recursive,</span>
<span class="linecomment">;;       diredp-get-confirmation-recursive, diredp-list-files, diredp-y-or-n-files-p,</span>
<span class="linecomment">;;       diredp-menu-bar-recursive-marked-menu.</span>
<span class="linecomment">;;     diredp-get-files: Use diredp-y-or-n-files-p, not y-or-n-p.</span>
<span class="linecomment">;;     Commented out dired-readin-insert - see comment.</span>
<span class="linecomment">;;     Moved bookmark menu items to submenu Bookmarks.</span>
<span class="linecomment">;;     Added keys (with M-+ prefix) and menu items for new (*-recursive) commands.</span>
<span class="linecomment">;;     Reordered w32-browser stuff in menus.</span>
<span class="linecomment">;;     diredp-do-grep: Combined defs for diff Emacs versions - do version test at runtime.</span>
<span class="linecomment">;; 2012/04/25 dadams</span>
<span class="linecomment">;;     dired-insert-directory: Updated per Emacs 24.</span>
<span class="linecomment">;; 2012/04/23 dadams</span>
<span class="linecomment">;;     Added (moved here from Icicles, and renamed prefix):</span>
<span class="linecomment">;;       diredp-re-no-dot, diredp-get-files, diredp-get-files-for-dir, diredp-files-within,</span>
<span class="linecomment">;;       diredp-files-within-dirs-done.</span>
<span class="linecomment">;; 2012/04/05 dadams</span>
<span class="linecomment">;;     Added redefinition of dired-mark-pop-up, to fix Emacs bug #7533.  If they ever fix it</span>
<span class="linecomment">;;     then remove this hack.</span>
<span class="linecomment">;; 2012/03/13 dadams</span>
<span class="linecomment">;;     diredp-dired(-for)-files(-other-window):</span>
<span class="linecomment">;;       Bind: icicle-sort-comparer, icicle-all-candidates-list-alt-action-fn.</span>
<span class="linecomment">;;       Use icicle-(un)bind-file-candidate-keys.</span>
<span class="linecomment">;;     diredp-dired-files-interactive-spec: Updated doc strings accordingly.</span>
<span class="linecomment">;; 2012/03/07 dadams</span>
<span class="linecomment">;;     Added: dired-switches-escape-p.</span>
<span class="linecomment">;;     dired-get-filename: Updated wrt Emacs 24:</span>
<span class="linecomment">;;       whitespace quoting for bug #10469, filename quoting per Emacs 23.3+,</span>
<span class="linecomment">;;         MS Windows conversion of \ to / per Emacs 23.3+.</span>
<span class="linecomment">;;     dired-goto-file: Escape whitespace, per Emacs 24 (for bug #10469).</span>
<span class="linecomment">;; 2012/03/02 dadams</span>
<span class="linecomment">;;     Require cl.el at compile time even for Emacs 22+, for case macro.</span>
<span class="linecomment">;; 2012/02/28 dadams</span>
<span class="linecomment">;;     Do not bother to soft-require mkhtml.el anymore.</span>
<span class="linecomment">;; 2012/02/18 dadams</span>
<span class="linecomment">;;     Swapped keys for dired-w32(-browser|explore), so the former is M-RET, as in Bookmark+.</span>
<span class="linecomment">;; 2012/01/10 dadams</span>
<span class="linecomment">;;     diredp-font-lock-keywords-1: Corrected for date/time when locale is used, not iso.</span>
<span class="linecomment">;; 2011/12/19 dadams</span>
<span class="linecomment">;;     dired-insert-set-properties, dired-mark-sexp, diredp-(un)mark-region-files,</span>
<span class="linecomment">;;       diredp-flag-region-files-for-deletion, diredp-mouse-3-menu:</span>
<span class="linecomment">;;         Use line-(beginning|end)-position.</span>
<span class="linecomment">;; 2011/12/16 dadams</span>
<span class="linecomment">;;     diredp-menu-bar-mark-menu: Removed Revert item.</span>
<span class="linecomment">;;     diredp-menu-bar-subdir-menu: Added: image-dired-dired-toggle-marked-thumbs.</span>
<span class="linecomment">;;     diredp-mouse-3-menu:</span>
<span class="linecomment">;;       Use commands bound to keys, so the keys show up in the menu.  Prefer *-this-file.</span>
<span class="linecomment">;;       Correct the mark/unmark/flag menu-item visibility.  Added Capitalize.</span>
<span class="linecomment">;; 2011/12/09 dadams</span>
<span class="linecomment">;;     diredp-w32-drives: Use dolist, not mapcar.</span>
<span class="linecomment">;;     diredp-mouse-3-menu: Use easymenu to build the menu.  Conditionalize some items.</span>
<span class="linecomment">;;     Bind down-mouse-3, not mouse-3, to diredp-mouse-3-menu.  (bind mouse-3 to ignore).</span>
<span class="linecomment">;;     Added eval-when-compile for easymenu.el.</span>
<span class="linecomment">;; 2011/12//02 dadams</span>
<span class="linecomment">;;     Added diredp-internal-do-deletions.</span>
<span class="linecomment">;;     dired(-mouse)-do(-flagged)-delete, : Use diredp-internal-do-deletions, for trash.</span>
<span class="linecomment">;; 2011/11/29 dadams</span>
<span class="linecomment">;;     diredp-read-bookmark-file-args: Corrected use of list of default file names: &gt; Emacs 23.1.</span>
<span class="linecomment">;; 2011/10/31 dadams</span>
<span class="linecomment">;;     dired-mode-hook: Call font-lock-refresh-defaults - see Emacs 24 bugs #6662 and #9919.</span>
<span class="linecomment">;; 2011/10/24 dadams</span>
<span class="linecomment">;;     Protect dired-show-file-type with fboundp.</span>
<span class="linecomment">;; 2011/09/03 dadams</span>
<span class="linecomment">;;     diredp-do-grep-1: Map shell-quote-argument over file names.  Thx to Joe Bloggs.</span>
<span class="linecomment">;; 2011/08/07 dadams</span>
<span class="linecomment">;;     diredp-bookmark (need to keep in sync with bmkp-make-record-for-target-file):</span>
<span class="linecomment">;;       Instead of image-bookmark-make-record, use explicit function that includes file, type.</span>
<span class="linecomment">;; 2011/07/25 dadams</span>
<span class="linecomment">;;     Changed featurep to eval-after-load, for bookmark+-1.el and w32-browser.el.</span>
<span class="linecomment">;; 2011/07/01 dadams</span>
<span class="linecomment">;;     Fixed typo: dired-toggle-find-file-reuse-dir -&gt; ...diredp....  Thx to pasja on Emacs Wiki.</span>
<span class="linecomment">;; 2011/06/18 dadams</span>
<span class="linecomment">;;     Added: diredp-describe-mode, diredp-dired-plus-help(-link), diredp-help-button,</span>
<span class="linecomment">;;            diredp-dired-plus-description(+links), diredp-send-bug-report.</span>
<span class="linecomment">;;     Bound diredp-describe-mode to whatever describe-mode is bound to.</span>
<span class="linecomment">;;     All menus, :enable with mark-active: Added transient-mark-mode and mark != point.</span>
<span class="linecomment">;;     toggle-diredp-find-file-reuse-dir: Swapped which one is the alias.</span>
<span class="linecomment">;;     diredp-w32-list-mapped-drives: Display *Shell Command Output* at end.</span>
<span class="linecomment">;;     diredp-mouse-(describe-file|3-menu|mark/unmark|(find|view)-file(-other-window)):</span>
<span class="linecomment">;;       save-excursion set-buffer -&gt; with-current-buffer.</span>
<span class="linecomment">;; 2011/06/08 dadams</span>
<span class="linecomment">;;     Added: diredp-dired-for-files(-other-window).</span>
<span class="linecomment">;; 2011/06/07 dadams</span>
<span class="linecomment">;;     Bound dired-show-file-type to _, since y is diredp-relsymlink-this-file.</span>
<span class="linecomment">;; 2011/04/25 dadams</span>
<span class="linecomment">;;     Added (from files+.el): dired(-mouse)-describe-file. Bound to C-h (C-)RET, added to menus.</span>
<span class="linecomment">;; 2011/04/23 dadams</span>
<span class="linecomment">;;     Added, bound (T c, T M-w, T 0, T v, T p, T C-y, T q), and added to menus:</span>
<span class="linecomment">;;       diredp-copy-tags-this-file, diredp-mouse-copy-tags,</span>
<span class="linecomment">;;       diredp(-mouse)(-do)-remove-all-tags(-this-file),</span>
<span class="linecomment">;;       diredp(-mouse)(-do)-set-tag-value(-this-file),</span>
<span class="linecomment">;;       diredp(-mouse)(-do)-paste-(add|replace)-tags(-this-file).</span>
<span class="linecomment">;;     diredp-mark-files-tagged-(all/none|some/not-all): Bound free var presentp.</span>
<span class="linecomment">;;     dired-map-over-marks: Corrected: Bind NEWARG and use that, not ARG.</span>
<span class="linecomment">;;     dired-get-marked-files: let* -&gt; let.</span>
<span class="linecomment">;;     dired-do-redisplay, diredp-mouse-diff: when/if -&gt; and.</span>
<span class="linecomment">;;     dired-readin-insert, dired-get-filename: if -&gt; unless/when.</span>
<span class="linecomment">;;     diredp-mouse-find-file-reuse-dir-buffer: with-current-buffer, not save...</span>
<span class="linecomment">;;     diredp-mouse-mark/unmark: Removed unused bol/eol vars.</span>
<span class="linecomment">;; 2011/04/19 dadams</span>
<span class="linecomment">;;     Added: diredp-(un)mark-files-tagged-((not-)all|none|some|regexp|all/none|some/not-all),</span>
<span class="linecomment">;;            dired-mark-if.  Added Tagged submenu for Mark menu.</span>
<span class="linecomment">;;     Put tags commands on prefix key T, as in Bookmark+.  Removed C-(M-)+/- tags-cmd bindings.</span>
<span class="linecomment">;;     diredp-untag-this-file: Added prefix-arg behavior.</span>
<span class="linecomment">;; 2011/04/18 dadams</span>
<span class="linecomment">;;     Added: diredp-prompt-for-bookmark-prefix-flag.</span>
<span class="linecomment">;;            Use it in diredp(-mouse)-do-(un)tag, diredp-read-bookmark-file-args,</span>
<span class="linecomment">;;                      diredp(-mouse)-do-bookmark, diredp-(bookmark|(un)tag)-this-file.</span>
<span class="linecomment">;;     diredp-(bookmark|(un)tag)-this-file, diredp(-do)-bookmark, diredp-(un)tag,</span>
<span class="linecomment">;;       diredp-do-bookmark-in-bookmark-file, diredp-set-bookmark-file-bookmark-for-marked:</span>
<span class="linecomment">;;         Made PREFIX arg optional.</span>
<span class="linecomment">;; 2011/04/17 dadams</span>
<span class="linecomment">;;     Added: diredp-(bookmark|(un)tag)-this-file, diredp(-mouse)(-do)-(un)tag.</span>
<span class="linecomment">;;     diredp-mouse-3-menu: Added: diredp-mouse-do-(un)tag.</span>
<span class="linecomment">;;     diredp-menu-bar-immediate-menu: Added diredp-(un)tag-this-file, diredp-bookmark-this-file.</span>
<span class="linecomment">;;     diredp-menu-bar-operate-menu: Added diredp-do-(un)tag.</span>
<span class="linecomment">;;     Bound diredp-do-tag to C-+, diredp-tag-this-file to C-M-+, diredp-do-untag to C--,</span>
<span class="linecomment">;;           diredp-untag-this-file to C-M--, diredp-bookmark-this-file to C-B.</span>
<span class="linecomment">;;     diredp-bookmark: Use bmkp-autofile-set, not bmkp-file-target-set, so get autofile.</span>
<span class="linecomment">;;     diredp-read-bookmark-file-args, diredp(-mouse)-do-bookmark:</span>
<span class="linecomment">;;       Default for prefix is now an empty string, not the directory.</span>
<span class="linecomment">;;     diredp-mouse-do-bookmark: Removed optional second arg.</span>
<span class="linecomment">;;     Corrected typo: direp-read-bookmark-file-args -&gt; diredp-read-bookmark-file-args.</span>
<span class="linecomment">;; 2011/03/25 dadams</span>
<span class="linecomment">;;     diredp-bookmark: Fixed typo: bmkp-file-indirect-set -&gt; bmkp-file-target-set.</span>
<span class="linecomment">;; 2011/02/11 dadams</span>
<span class="linecomment">;;     diredp-deletion, diredp-deletion-file-name, diredp-executable-tag:</span>
<span class="linecomment">;;       Made default the same for dark background as for light.</span>
<span class="linecomment">;;     diredp-ignored-file-name: Made default a bit darker for dark background.</span>
<span class="linecomment">;; 2011/02/03 dadams</span>
<span class="linecomment">;;     All deffaces: Provided default values for dark-background screens too.</span>
<span class="linecomment">;; 2011/01/12 dadams</span>
<span class="linecomment">;;     dired-do-flagged-delete: Removed sit-for added on 1/02.</span>
<span class="linecomment">;; 2011/01/04 dadams</span>
<span class="linecomment">;;     defsubst -&gt; defun everywhere.</span>
<span class="linecomment">;;     Removed autoload cookies from non def* sexps, defvar, and non-interactive functions.</span>
<span class="linecomment">;;     Added some missing autoload cookies for defcustom and commands.</span>
<span class="linecomment">;; 2011/01/02 dadams</span>
<span class="linecomment">;;     Added: diredp-this-file-(un)marked-p, diredp-toggle-marks-in-region.</span>
<span class="linecomment">;;     diredp-(un)mark-region-files, diredp-flag-region-files-for-deletion:</span>
<span class="linecomment">;;       Act only on marked/unmarked files (opposite).  Fix 2nd arg to dired-mark-if.</span>
<span class="linecomment">;;     diredp-mouse-3-menu:</span>
<span class="linecomment">;;       If region is active and mouse3.el was loaded, then use its popup.</span>
<span class="linecomment">;;       Fix Toggle Marked/Unmarked:</span>
<span class="linecomment">;;         Use diredp-toggle-marks-in-region, so widen, show details and use bol/eol.</span>
<span class="linecomment">;;     dired-do-flagged-delete: Added sit-for.</span>
<span class="linecomment">;; 2010/11/28 dadams</span>
<span class="linecomment">;;     diredp-mouse-3-menu: Added Toggle Marked/Unmarked for region menu.</span>
<span class="linecomment">;; 2010/10/20 dadams</span>
<span class="linecomment">;;     Moved Emacs 20 tweak to recognize k in file sizes to var dired-move-to-filename-regexp.</span>
<span class="linecomment">;;     Added diredp-loaded-p.</span>
<span class="linecomment">;; 2010/10/19 dadams</span>
<span class="linecomment">;;     diredp-font-lock-keywords-1:</span>
<span class="linecomment">;;       Handle decimal pt in file size.  Thx to Michael Heerdegen.</span>
<span class="linecomment">;;       Enable Emacs 20/21 to handle -h option (decimal point size).</span>
<span class="linecomment">;;     Renamed: face diredp-inode+size to diredp-number.</span>
<span class="linecomment">;; 2010/10/01 dadams</span>
<span class="linecomment">;;     dired-goto-file: Avoid infloop from looking for dir line.  Thx to not-use.dilines.net.</span>
<span class="linecomment">;; 2010/09/29 dadams</span>
<span class="linecomment">;;     Added: diredp-dired-union(-1|-other-window|-interactive-spec).</span>
<span class="linecomment">;;     dired-goto-file: fix for Emacs bug #7126.</span>
<span class="linecomment">;; 2010/09/27 dadams</span>
<span class="linecomment">;;     Renamed diredp-dired-interactive-spec to diredp-dired-files-interactive-spec.</span>
<span class="linecomment">;;     diredp-dired-files-interactive-spec: Respect file-list arg: kill existing Dired buffer.</span>
<span class="linecomment">;;                                          Fix use of prefix arg for switches.</span>
<span class="linecomment">;; 2010/09/26 dadams</span>
<span class="linecomment">;;     Added: dired-insert-directory: Compute WILDCARD arg for individual files.</span>
<span class="linecomment">;;     Added: dired-readin-insert: Use t as WILDCARD arg to dired-insert-directory.</span>
<span class="linecomment">;;     Added: diredp-dired-files(-other-window), diredp-dired-interactive-spec.</span>
<span class="linecomment">;; 2010/08/27 dadams</span>
<span class="linecomment">;;     Use diredp-font-lock-keywords-1 properly as a second level of fontification.</span>
<span class="linecomment">;;     Added: diredp-w32-drives(-mode(-map)), dired-up-directory.</span>
<span class="linecomment">;; 2010/08/07 dadams</span>
<span class="linecomment">;;     dired-map-over-marks: Removed loop that used dired-between-files.</span>
<span class="linecomment">;;     diredp-get-file-or-dir-name: test against subdir/..? also.</span>
<span class="linecomment">;;     dired-do-find-marked-files: Pass original ARG to dired-get-marked-files.</span>
<span class="linecomment">;; 2010/08/05 dadams</span>
<span class="linecomment">;;     diredp-bookmark:</span>
<span class="linecomment">;;       Handle image files (and sound files, if Bookmark+ is used).</span>
<span class="linecomment">;;       Use bmkp-file-indirect-set if available.</span>
<span class="linecomment">;;       Use error-message-string to get failure msg.</span>
<span class="linecomment">;; 2010/07/11 dadams</span>
<span class="linecomment">;;     Added: diredp-set-bookmark-file-bookmark-for-marked (C-M-b), diredp-mouse-do-bookmark,</span>
<span class="linecomment">;;            diredp-do-bookmark-in-bookmark-file (C-M-S-b), diredp-read-bookmark-file-args.</span>
<span class="linecomment">;;     Added them to the operate menu.  Added diredp-do-bookmark to mouse-3 menu.</span>
<span class="linecomment">;; 2010/07/07 dadams</span>
<span class="linecomment">;;     dired-do-*: Updated doc strings for prefix arg treatment from dired-map-over-marks-check.</span>
<span class="linecomment">;;     Added missing autoload cookies.</span>
<span class="linecomment">;; 2010/05/29 dadams</span>
<span class="linecomment">;;     diredp-bookmark: Use relative file name in bookmark name.</span>
<span class="linecomment">;;     Removed defvar of directory-listing-before-filename-regexp.</span>
<span class="linecomment">;; 2010/05/28 dadams</span>
<span class="linecomment">;;     Changed menu item for dired-create-directory to New Directory.  Moved it before Up Dir.</span>
<span class="linecomment">;; 2010/03/19 dadams</span>
<span class="linecomment">;;     diredp-font-lock-keywords-1: Handle date+time wrt regexp changes for Emacs 23.2.</span>
<span class="linecomment">;; 2010/01/31 dadams</span>
<span class="linecomment">;;     diredp-bookmark:</span>
<span class="linecomment">;;       Don't use bookmark-set or find-file-noselect - inline the needed bookmark-store code.</span>
<span class="linecomment">;;       Call bookmark-maybe-load-default-file.  Use rudimentary bookmark-make-record-function.</span>
<span class="linecomment">;; 2010/01/21 dadams</span>
<span class="linecomment">;;     Renamed:</span>
<span class="linecomment">;;       diredp-subst-find-alternate-for-find to diredp-make-find-file-keys-reuse-dirs</span>
<span class="linecomment">;;       diredp-subst-find-for-find-alternate to diredp-make-find-file-keys-not-reuse-dirs.</span>
<span class="linecomment">;;     diredp-make-find-file-keys(-not)-reuse-dirs: Handle also dired(-mouse)-w32-browser.</span>
<span class="linecomment">;; 2010/01/10 dadams</span>
<span class="linecomment">;;     Added: face diredp-inode+size.  Use in diredp-font-lock-keywords-1.</span>
<span class="linecomment">;;     diredp-font-lock-keywords-1: Allow decimal point in file size.  Thx to Regis.</span>
<span class="linecomment">;; 2010/01/05 dadams</span>
<span class="linecomment">;;     dired-insert-set-properties:</span>
<span class="linecomment">;;       Add text property dired-filename to the file name (for Emacs 23).</span>
<span class="linecomment">;; 2009/10/23 dadams</span>
<span class="linecomment">;;     diredp-font-lock-keywords-1: Override `l' and `t' matches in headings with default face.</span>
<span class="linecomment">;; 2009/10/13 dadams</span>
<span class="linecomment">;;     Added: diredp(-do)-bookmark.  Added to Multiple menu, and bound to M-b.</span>
<span class="linecomment">;; 2009/10/11 dadams</span>
<span class="linecomment">;;     diredp-menu-bar-immediate-menu:</span>
<span class="linecomment">;;       Added items: image display items, dired-maybe-insert-subdir.</span>
<span class="linecomment">;;       Test dired-do-relsymlink, not diredp-relsymlink-this-file.</span>
<span class="linecomment">;;     diredp-menu-bar-operate-menu:</span>
<span class="linecomment">;;       Added items: epa encryption items, image items, isearch items.</span>
<span class="linecomment">;;     diredp-menu-bar-subdir-menu:</span>
<span class="linecomment">;;       Added items: revert, isearch file names, dired-compare-directories.</span>
<span class="linecomment">;;     Removed macro menu-item-any-version - use menu-item everywhere (works for Emacs 20+).</span>
<span class="linecomment">;;     Added wdired-change-to-wdired-mode to subdir menu even for Emacs 20, if defined.</span>
<span class="linecomment">;; 2009/07/09 dadams</span>
<span class="linecomment">;;     dired-goto-file: Make sure we have a string before calling directory-file-name.</span>
<span class="linecomment">;; 2009/05/08 dadams</span>
<span class="linecomment">;;     dired-find-file (Emacs 20): Raise error if dired-get-filename returns nil.</span>
<span class="linecomment">;; 2009/04/26 dadams</span>
<span class="linecomment">;;     dired-insert-set-properties, diredp-(un)mark-region-files,</span>
<span class="linecomment">;;       diredp-flag-region-files-for-deletion, diredp-mouse-3-menu, diredp-mouse-mark/unmark:</span>
<span class="linecomment">;;         Bind inhibit-field-text-motion to t, to ensure real eol.</span>
<span class="linecomment">;; 2008/12/17 dadams</span>
<span class="linecomment">;;     diredp-font-lock-keywords-1: Don't do diredp-deletion, diredp-flag-mark for empty lines.</span>
<span class="linecomment">;; 2008/09/22 dadams</span>
<span class="linecomment">;;     Added: diredp-fileset, diredp-get-file-or-dir-name, and redefinitions of</span>
<span class="linecomment">;;            dired-map-over-marks, dired-find-file, and dired-mouse-find-file-other-window.</span>
<span class="linecomment">;;     Added vanilla code to pick up macro dired-map-over-marks:</span>
<span class="linecomment">;;       dired-get-marked-files, dired-do-delete, dired-map-over-marks-check,</span>
<span class="linecomment">;;       dired-do-redisplay, image-dired-dired-insert-marked-thumbs.</span>
<span class="linecomment">;;     diredp-find-file-other-frame, diredp-mouse-(find|view)-file:</span>
<span class="linecomment">;;       Added nil t args to dired-get-filename calls.</span>
<span class="linecomment">;;     diredp-do-grep(-1): Use new dired-get-marked-files instead of ad-hoc treatment of C-u.</span>
<span class="linecomment">;; 2008/09/21 dadams</span>
<span class="linecomment">;;     diredp-marked(-other-window): Don't treat zero prefix arg as numerical (no empty Dired).</span>
<span class="linecomment">;;     Added dired-find-file redefinition for Emacs 20.</span>
<span class="linecomment">;; 2008/09/11 dadams</span>
<span class="linecomment">;;     diredp-do-grep: Plain C-u means grep all files in Dired buffer.</span>
<span class="linecomment">;;     diredp-do-grep-1: Treat 'all value of FILES arg.</span>
<span class="linecomment">;;     Added: diredp-all-files.</span>
<span class="linecomment">;; 2008/09/09 dadams</span>
<span class="linecomment">;;     Added: diredp-marked(-other-window).  Added to menus.  Bound *-other-window to C-M-*.</span>
<span class="linecomment">;; 2008/09/07 dadams</span>
<span class="linecomment">;;     Added: diredp(-mouse)-do-grep(-1), diredp-grep-this-file.</span>
<span class="linecomment">;;     Bound diredp-do-grep to M-g.  Added grep commands to menus.</span>
<span class="linecomment">;; 2008/07/18 dadams</span>
<span class="linecomment">;;     Soft-require w32-browser.el.  Bind its commands in Dired map and menus.</span>
<span class="linecomment">;; 2008/03/08 dadams</span>
<span class="linecomment">;;     dired-maybe-insert-subdir: Fit one-window frame after inserting subdir.</span>
<span class="linecomment">;; 2008/03/07 dadams</span>
<span class="linecomment">;;     Added: redefinitions of dired-maybe-insert-subdir, dired-goto-file, dired-get-filename.</span>
<span class="linecomment">;;     Added: diredp-this-subdir.</span>
<span class="linecomment">;; 2007/11/27 dadams</span>
<span class="linecomment">;;     diredp-mouse(-backup)-diff: If available, use icicle-read-string-completing.</span>
<span class="linecomment">;; 2007/09/23 dadams</span>
<span class="linecomment">;;     Removed second arg to undefine-killer-commands.</span>
<span class="linecomment">;; 2007/07/27 dadams</span>
<span class="linecomment">;;     diredp-font-lock-keywords-1: Allow also for bz2 compressed files - Thx to Andreas Eder.</span>
<span class="linecomment">;; 2006/09/03 dadams</span>
<span class="linecomment">;;     diredp-font-lock-keywords-1: Corrected file size and inode number.  Thx to Peter Barabas.</span>
<span class="linecomment">;; 2006/08/20 dadams</span>
<span class="linecomment">;;     Added: diredp-find-a-file*.</span>
<span class="linecomment">;; 2006/06/18 dadams</span>
<span class="linecomment">;;     diredp-font-lock-keywords-1: Highlight file name (also) of flagged files.</span>
<span class="linecomment">;;                                  Use dired-del-marker instead of literal D.</span>
<span class="linecomment">;;     Added: diredp-deletion-file-name.</span>
<span class="linecomment">;; 2006/03/31 dadams</span>
<span class="linecomment">;;     No longer use display-in-minibuffer.</span>
<span class="linecomment">;; 2006/01/07 dadams</span>
<span class="linecomment">;;     Added: link for sending bug report.</span>
<span class="linecomment">;; 2006/01/06 dadams</span>
<span class="linecomment">;;     Added defgroup Dired-Plus and used it. Added :link.</span>
<span class="linecomment">;; 2006/01/04 dadams</span>
<span class="linecomment">;;     Added defvar of directory-listing-before-filename-regexp, for Emacs 22 compatibility.</span>
<span class="linecomment">;; 2005/12/29 dadams</span>
<span class="linecomment">;;     Added: diredp-mouse-mark/unmark-mark-region-files.</span>
<span class="linecomment">;; 2005/12/26 dadams</span>
<span class="linecomment">;;     Updated groups.</span>
<span class="linecomment">;; 2005/12/05 dadams</span>
<span class="linecomment">;;     diredp-ignored-file-name: Made it slightly darker.</span>
<span class="linecomment">;; 2005/11/05 dadams</span>
<span class="linecomment">;;     Renamed all stuff defined here to have diredp- prefix.</span>
<span class="linecomment">;;     diredp-relsymlink-this-file: Protected with fboundp.</span>
<span class="linecomment">;;     Changed to soft require: dired-x.el.</span>
<span class="linecomment">;;     Removed comment to require this inside eval-after-load.</span>
<span class="linecomment">;; 2005/11/03 dadams</span>
<span class="linecomment">;;     Added: dired-display-msg.  Replace blue-foreground-face with it.</span>
<span class="linecomment">;;     Alias dired-do-toggle to dired-toggle-marks, if defined.</span>
<span class="linecomment">;; 2005/11/02 dadams</span>
<span class="linecomment">;;     Added: dired-get-file-for-visit, dired(-mouse)-find-alternate-file*,</span>
<span class="linecomment">;;            togglep-dired-find-file-reuse-dir, dired+-subst-find-*.</span>
<span class="linecomment">;;     Use defface for all faces.  Renamed without "-face".  No longer require def-face-const.</span>
<span class="linecomment">;;     dired-simultaneous-find-file: Minor bug fix (typo).</span>
<span class="linecomment">;; 2005/07/10 dadams</span>
<span class="linecomment">;;     dired-unmark-all-files-no-query -&gt; dired-unmark-all-marks</span>
<span class="linecomment">;;       (thanks to Sivaram Neelakantan for bug report).</span>
<span class="linecomment">;; 2005/05/25 dadams</span>
<span class="linecomment">;;     string-to-int -&gt; string-to-number everywhere.</span>
<span class="linecomment">;; 2005/05/17 dadams</span>
<span class="linecomment">;;     Updated to work with Emacs 22.x.</span>
<span class="linecomment">;; 2005/02/16 dadams</span>
<span class="linecomment">;;     Added dired-mark/unmark-extension. Replaced dired-mark-extension with it everywhere.</span>
<span class="linecomment">;; 2005/01/08 dadams</span>
<span class="linecomment">;;     Bind [S-mouse-1], instead of [S-down-mouse-1], to dired-mouse-mark-region-files.</span>
<span class="linecomment">;; 2004/11/20 dadams</span>
<span class="linecomment">;;     dired-mark-sexp: Search for literal month names only for versions before Emacs 20.</span>
<span class="linecomment">;;     Refined to deal with Emacs 21 &lt; 21.3.50 (soon to be 22.x)</span>
<span class="linecomment">;; 2004/11/14 dadams</span>
<span class="linecomment">;;     Bound dired-no-confirm to non-nil for dired-mouse-*.</span>
<span class="linecomment">;;     Updated for Emacs 21 and improved highlighting:</span>
<span class="linecomment">;;       Spaces OK in file and directory names. Highlight date/time and size.</span>
<span class="linecomment">;; 2004/10/17 dadams</span>
<span class="linecomment">;;     Require cl only for Emacs 20, and only when compile.</span>
<span class="linecomment">;; 2004/10/01 dadams</span>
<span class="linecomment">;;     Updated to work with Emacs 21 also.</span>
<span class="linecomment">;; 2004/04/02 dadams</span>
<span class="linecomment">;;     dired-font-lock-keywords-1: Prefer using dired-omit-extensions</span>
<span class="linecomment">;;     to completion-ignored-extensions, if available.</span>
<span class="linecomment">;; 2004/03/22 dadams</span>
<span class="linecomment">;;     Added dired-mouse-mark-region-files and dired-mouse-mark/unmark.</span>
<span class="linecomment">;; 2000/09/27 dadams</span>
<span class="linecomment">;;     1. dired-font-lock-keywords-1: fixed for spaces in dir names.</span>
<span class="linecomment">;;     2. Added: dired-buffers-for-dir.</span>
<span class="linecomment">;; 1999/09/06 dadams</span>
<span class="linecomment">;;     Added S-*-mouse-2 bindings (same as C-*-mouse-2).</span>
<span class="linecomment">;; 1999/08/26 dadams</span>
<span class="linecomment">;;     1. Added *-face vars and dired-font-lock-keywords-1.</span>
<span class="linecomment">;;     2. Added possibility to use dired-font-lock-keywords-1 via hook.</span>
<span class="linecomment">;; 1999/08/26 dadams</span>
<span class="linecomment">;;     Changed key binding of dired-mouse-find-file from down-mouse-2 to mouse-2.</span>
<span class="linecomment">;; 1999/08/25 dadams</span>
<span class="linecomment">;;     Changed (C-)(M-)mouse-2 bindings.</span>
<span class="linecomment">;; 1999/08/25 dadams</span>
<span class="linecomment">;;     1. Added cmds & menu bar and key bindings: (dired-)find-file-other-frame.</span>
<span class="linecomment">;;     2. Changed binding for dired-display-file.</span>
<span class="linecomment">;; 1999/03/26 dadams</span>
<span class="linecomment">;;     1. Get rid of Edit menu-bar menu.</span>
<span class="linecomment">;;     2. dired-mouse-3-menu: Changed popup titles and item names.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; This program is free software; you can redistribute it and/or modify</span>
<span class="linecomment">;; it under the terms of the GNU General Public License as published by</span>
<span class="linecomment">;; the Free Software Foundation; either version 2, or (at your option)</span>
<span class="linecomment">;; any later version.</span>

<span class="linecomment">;; This program is distributed in the hope that it will be useful,</span>
<span class="linecomment">;; but WITHOUT ANY WARRANTY; without even the implied warranty of</span>
<span class="linecomment">;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the</span>
<span class="linecomment">;; GNU General Public License for more details.</span>

<span class="linecomment">;; You should have received a copy of the GNU General Public License</span>
<span class="linecomment">;; along with this program; see the file COPYING.  If not, write to</span>
<span class="linecomment">;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth</span>
<span class="linecomment">;; Floor, Boston, MA 02110-1301, USA.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Code:</span>

(eval-when-compile (require 'cl)) <span class="linecomment">;; case (plus, for Emacs 20: dolist, pop, push)</span>
(eval-when-compile (require 'easymenu)) <span class="linecomment">;; easy-menu-create-menu</span>

(require 'dired) <span class="linecomment">;; dired-revert</span>
(require 'dired-aux) <span class="linecomment">;; dired-bunch-files, dired-do-chxxx, dired-do-create-files,</span>
                     <span class="linecomment">;; dired-mark-read-string, dired-read-shell-command,</span>
                     <span class="linecomment">;; dired-run-shell-command, dired-shell-stuff-it</span>
(require 'ediff-util) <span class="linecomment">;; ediff-read-file-name</span>

(require 'dired-x nil t) <span class="linecomment">;; (no error if not found) dired-do-relsymlink</span>
(require 'misc-fns nil t) <span class="linecomment">;; (no error if not found): undefine-killer-commands</span>
(when (memq system-type '(windows-nt ms-dos))
  <span class="linecomment">;; (no error if not found):</span>
  (require 'w32-browser nil t))<span class="linecomment">;; dired-w32explore, dired-w32-browser, dired-mouse-w32-browser,</span>
                               <span class="linecomment">;; dired-multiple-w32-browser</span>
<span class="linecomment">;;; (when (&lt; emacs-major-version 21)</span>
<span class="linecomment">;;;   (require 'mkhtml nil t)) ;; (no error if not found): mkhtml-dired-files</span>

<span class="linecomment">;; Don't require Icicles, else get recursive requires.</span>
<span class="linecomment">;; (require 'icicles nil t) ;; (no error if not found): icicle-read-string-completing</span>

<span class="linecomment">;; Provide macro for code byte-compiled using Emacs &lt; 22.</span>
(eval-when-compile
 (when (&lt; emacs-major-version 22)
   (defmacro minibuffer-with-setup-hook (fun &rest body)
     "<span class="quote">Temporarily add FUN to `minibuffer-setup-hook' while executing BODY.
BODY should use the minibuffer at most once.
Recursive uses of the minibuffer are unaffected (FUN is not
called additional times).

This macro actually adds an auxiliary function that calls FUN,
rather than FUN itself, to `minibuffer-setup-hook'.</span>"
     <span class="linecomment">;; (declare (indent 1) (debug t))</span>
     (let ((hook (make-symbol "<span class="quote">setup-hook</span>")))
       `(let (,hook)
         (setq ,hook  (lambda ()
                        <span class="linecomment">;; Clear out this hook so it does not interfere</span>
                        <span class="linecomment">;; with any recursive minibuffer usage.</span>
                        (remove-hook 'minibuffer-setup-hook ,hook)
                        (funcall ,fun)))
         (unwind-protect
              (progn (add-hook 'minibuffer-setup-hook ,hook) ,@body)
           (remove-hook 'minibuffer-setup-hook ,hook)))))))

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;</span>

(provide 'dired+)
(require 'dired+)                       <span class="linecomment">; Ensure loaded before compile this.</span>

<span class="linecomment">;; Quiet the byte-compiler.</span>
(defvar bmkp-copied-tags)               <span class="linecomment">; In `bookmark+-1.el'</span>
(defvar bmkp-current-bookmark-file)     <span class="linecomment">; In `bookmark+-1.el'</span>
(defvar dired-keep-marker-hardlink)     <span class="linecomment">; In `dired-x.el'</span>
(defvar dired-switches-alist)
(defvar dired-subdir-switches)
(defvar dired-touch-program) <span class="linecomment">; Emacs 22+</span>
(defvar dired-use-ls-dired) <span class="linecomment">; Emacs 22+</span>
(defvar filesets-data)
(defvar grep-use-null-device)
(defvar image-dired-line-up-method)     <span class="linecomment">; In `image-dired.el'</span>
(defvar image-dired-thumbnail-buffer)   <span class="linecomment">; In `image-dired.el'</span>

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;</span>

 
<span class="linecomment">;;; Variables</span>

<span class="linecomment">;; `dired-do-toggle' was renamed to `dired-toggle-marks' after Emacs 20.</span>
(when (fboundp 'dired-toggle-marks) (defalias 'dired-do-toggle 'dired-toggle-marks))

<span class="linecomment">;;; This is duplicated in `diff.el' and `vc.el'.</span>
<span class="linecomment">;;;###autoload</span>
(defcustom diff-switches "<span class="quote">-c</span>"
  "<span class="quote">*A string or list of strings specifying switches to be passed to diff.</span>"
  :type '(choice string (repeat string))
  :group 'dired :group 'diff)

<span class="linecomment">;;;###autoload</span>
(defcustom diredp-prompt-for-bookmark-prefix-flag nil
  "<span class="quote">*Non-nil means prompt for a prefix string for bookmark names.</span>"
  :type 'boolean :group 'Dired-Plus)

<span class="linecomment">;;;###autoload</span>
(defcustom diredp-w32-local-drives '(("<span class="quote">C:</span>" "<span class="quote">Local disk</span>"))
  "<span class="quote">*Local MS Windows drives that you want to use for `diredp-w32-drives'.
Each entry is a list (DRIVE DESCRIPTION), where DRIVE is the drive
name and DESCRIPTION describes DRIVE.</span>"
  :type '(alist
          :key-type   (string        :tag "<span class="quote">Drive name</span>")
          :value-type (group (string :tag "<span class="quote">Drive description</span>")))
  :group 'Dired-Plus)

<span class="linecomment">;; Same value as the default value of `icicle-re-no-dot'.</span>
(defvar diredp-re-no-dot "<span class="quote">^\\([^.]\\|\\.\\([^.]\\|\\..\\)\\).*</span>"
  "<span class="quote">Regexp that matches anything except `.' and `..'.</span>")

(defvar diredp-w32-drives-mode-map (let ((map  (make-sparse-keymap)))
                                     (define-key map "<span class="quote">q</span>"       'bury-buffer)
                                     (define-key map "<span class="quote">\r</span>"      'widget-button-press)
                                     (define-key map [mouse-2] 'widget-button-click)
                                     map)
  "<span class="quote">Keymap for `diredp-w32-drives-mode'.</span>")

<span class="linecomment">;;; $$$$$$ Starting with Emacs 22, *-move-to* is defvaraliased to *-listing-before*.</span>
<span class="linecomment">;;; But `files+.el' defines *-listing-before*, so we define it here too.</span>
<span class="linecomment">;;; (unless (&gt; emacs-major-version 21)</span>
<span class="linecomment">;;;   (defvar directory-listing-before-filename-regexp dired-move-to-filename-regexp</span>
<span class="linecomment">;;;     "Regular expression to match up to the file name in a directory listing.</span>
<span class="linecomment">;;; The default value is designed to recognize dates and times</span>
<span class="linecomment">;;; regardless of the language."))</span>

 
<span class="linecomment">;;; Macros</span>


<span class="linecomment">;; REPLACE ORIGINAL in `dired.el'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Better initial message - depends on `dired-marker-char'.</span>
<span class="linecomment">;;</span>
(defmacro dired-mark-if (predicate msg)
  "<span class="quote">Mark files for PREDICATE, according to `dired-marker-char'.
PREDICATE is evaluated on each line, with point at beginning of line.
MSG is a noun phrase for the type of files being marked.
It should end with a noun that can be pluralized by adding `s'.
Return value is the number of files marked, or nil if none were marked.</span>"
  `(let ((inhibit-read-only  t)
         count)
    (save-excursion
      (setq count  0)
      (when ,msg (message "<span class="quote">%s %ss%s...</span>"
                          ,(cond ((eq ?\040 dired-marker-char)            "<span class="quote">Unmarking</span>")
                                 ((eq dired-del-marker dired-marker-char) "<span class="quote">Flagging</span>")
                                 (t                                       "<span class="quote">Marking</span>"))
                          ,msg
                          ,(if (eq dired-del-marker dired-marker-char) "<span class="quote"> for deletion</span>" "<span class="quote"></span>")))
      (goto-char (point-min))
      (while (not (eobp))
        (when ,predicate (delete-char 1) (insert dired-marker-char) (setq count  (1+ count)))
        (forward-line 1))
      (when ,msg (message "<span class="quote">%s %s%s %s%s</span>" count ,msg
                          (dired-plural-s count)
                          (if (eq dired-marker-char ?\040) "<span class="quote">un</span>" "<span class="quote"></span>")
                          (if (eq dired-marker-char dired-del-marker) "<span class="quote">flagged</span>" "<span class="quote">marked</span>"))))
    (and (&gt; count 0)  count)))


<span class="linecomment">;; Just a helper function for `dired-map-over-marks'.</span>
(defun diredp-get-file-or-dir-name (arg)
  "<span class="quote">Return name of next file or directory or nil if none.
Argument ARG:
 `all-files-no-dirs' or nil means skip directories.
 `all-files-no-dots' means skip `.' and `..'.</span>"
  (let ((fname  nil))
    (while (and (not fname)  (not (eobp)))
      (setq fname  (dired-get-filename t t))
      (when (and fname  (or (not arg) (eq arg 'all-files-no-dirs))  (file-directory-p fname))
        (setq fname  nil))
      (when (and fname  (eq arg 'all-files-no-dots)
                 (or (member fname '("<span class="quote">.</span>" "<span class="quote">..</span>")) (string-match "<span class="quote">/\.\.?$</span>" fname)))
        (setq fname  nil))
      (forward-line 1))
    (forward-line -1)
    fname))


<span class="linecomment">;; REPLACE ORIGINAL in `dired.el'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Treat multiple `C-u' specially.</span>
<span class="linecomment">;;</span>
(defmacro dired-map-over-marks (body arg &optional show-progress
                                distinguish-one-marked)
  "<span class="quote">Eval BODY with point on each marked line.  Return a list of BODY's results.
If no marked file could be found, execute BODY on the current line.
ARG, if non-nil, specifies the files to use instead of the marked files.
 If ARG is an integer, use the next ARG files (previous -ARG, if &lt; 0).
   In that case point is dragged along.  This is so that commands on
   the next ARG (instead of the marked) files can be easily chained.
 If ARG is a cons with element 16, 64, or 256, corresponding to
   `C-u C-u', `C-u C-u C-u', or `C-u C-u C-u C-u', then use all files
   in the Dired buffer, where:
     16 includes NO directories (including `.' and `..')
     64 includes directories EXCEPT `.' and `..'
    256 includes ALL directories (including `.' and `..')
 If ARG is otherwise non-nil, use the current file.
If optional third arg SHOW-PROGRESS evaluates to non-nil,
 redisplay the dired buffer after each file is processed.
 No guarantee is made about the position on the marked line.
 BODY must ensure this itself, if it depends on this.
Search starts at the beginning of the buffer, thus the car of the list
 corresponds to the line nearest to the buffer's bottom.  This
 is also true for (positive and negative) integer values of ARG.
BODY should not be too long, since it is expanded four times.
If DISTINGUISH-ONE-MARKED is non-nil, then return (t FILENAME) instead
 of (FILENAME), if only one file is marked.</span>"
  <span class="linecomment">;;</span>
  <span class="linecomment">;;Warning: BODY must not add new lines before point - this may cause an</span>
  <span class="linecomment">;;endless loop.</span>
  <span class="linecomment">;;This warning should not apply any longer, sk  2-Sep-1991 14:10.</span>
  `(prog1
    (let ((inhibit-read-only  t)
          (newarg             ,arg)
          multi-C-u case-fold-search found results)
      (when (and (consp newarg)  (&gt; (prefix-numeric-value newarg) 4))
        (setq newarg     (case (prefix-numeric-value newarg)
                           (16   'all-files-no-dirs) <span class="linecomment">; `C-u C-u'</span>
                           (64   'all-files-no-dots) <span class="linecomment">; `C-u C-u C-u'</span>
                           (256  'all-files) <span class="linecomment">; `C-u C-u C-u C-u'</span>
                           (t    'all-files-no-dirs))
              multi-C-u  t))
      (if (and newarg  (not multi-C-u))
          (if (integerp newarg)
              (progn                    <span class="linecomment">; No `save-excursion', want to move point.</span>
                (dired-repeat-over-lines newarg #'(lambda ()
                                                    (when ,show-progress (sit-for 0))
                                                    (setq results  (cons ,body results))))
                (if (&lt; newarg 0) (nreverse results) results))
            <span class="linecomment">;; Non-nil, non-integer ARG means use current file:</span>
            (list ,body))
        (let ((regexp  (dired-marker-regexp))
              next-position)
          (save-excursion
            (goto-char (point-min))
            <span class="linecomment">;; Remember position of next marked file before BODY can insert lines before the</span>
            <span class="linecomment">;; just found file, confusing us by finding the same marked file again and again...</span>
            (setq next-position  (and (if multi-C-u
                                          (diredp-get-file-or-dir-name newarg)
                                        (re-search-forward regexp nil t))
                                      (point-marker))
                  found          (not (null next-position)))
            (while next-position
              (goto-char next-position)
              (when ,show-progress (sit-for 0))
              (setq results  (cons ,body results))
              <span class="linecomment">;; move after last match</span>
              (goto-char next-position)
              (forward-line 1)
              (set-marker next-position nil)
              (setq next-position  (and (if multi-C-u
                                            (diredp-get-file-or-dir-name newarg)
                                          (re-search-forward regexp nil t))
                                        (point-marker)))))
          (when (and ,distinguish-one-marked  (= (length results) 1))
            (setq results  (cons t results)))
          (if found results (list ,body)))))
    <span class="linecomment">;; `save-excursion' loses, again</span>
    (dired-move-to-filename)))

 
<span class="linecomment">;;; UNALTERED vanilla Emacs code to be reloaded, to use the new definition</span>
<span class="linecomment">;;; of `dired-map-over-marks'.  Unless otherwise noted, these are from the Emacs 23+ libraries.</span>
<span class="linecomment">;;; These definitions should be IDENTICAL to what's in vanilla Emacs.</span>


<span class="linecomment">;;; Stuff from `dired.el'.</span>

<span class="linecomment">;;; The only thing modified here is the doc string, which is updated</span>
<span class="linecomment">;;; to reflect the new ARG behavior.</span>
(defun dired-get-marked-files (&optional localp arg filter distinguish-one-marked)
  "<span class="quote">Return names of the marked files as a list of strings.
The list is in the same order as the buffer, that is, the car is the
  first marked file.
Values returned are normally absolute file names.
Optional arg LOCALP as in `dired-get-filename'.
Optional second argument ARG specifies files to use instead of marked.
 Usually ARG comes from the command's prefix arg.
 If ARG is an integer, use the next ARG files (previous -ARG, if &lt; 0).
 If ARG is a cons with element 16, 64, or 256, corresponding to
  `C-u C-u', `C-u C-u C-u', or `C-u C-u C-u C-u', then use all files
  in the Dired buffer, where:
    16 includes NO directories (including `.' and `..')
    64 includes directories EXCEPT `.' and `..'
   256 includes ALL directories (including `.' and `..')
 If ARG is otherwise non-nil, use the current file.
Optional third argument FILTER, if non-nil, is a function to select
 some of the files: those for which (funcall FILTER FILENAME) is
 non-nil.
If DISTINGUISH-ONE-MARKED is non-nil, then return (t FILENAME) instead
 of (FILENAME), if only one file is marked.  Do not use non-nil
 DISTINGUISH-ONE-MARKED together with FILTER.</span>"
  (let ((all-of-them  (save-excursion
                        (dired-map-over-marks
                         (dired-get-filename localp) arg nil distinguish-one-marked)))
        result)
    (if (not filter)
        (if (and distinguish-one-marked  (eq (car all-of-them) t))
            all-of-them
          (nreverse all-of-them))
      (dolist (file  all-of-them) (when (funcall filter file) (push file result)))
      result)))



<span class="linecomment">;;; Stuff from `dired-aux.el'.</span>

(defun dired-map-over-marks-check (fun arg op-symbol &optional show-progress)
  "<span class="quote">Map FUN over marked lines and display failures.
FUN takes zero args.  It returns non-nil (the offending object, e.g.
the short form of the filename) for a failure and probably logs a
detailed error explanation using function `dired-log'.

ARG is as in `dired-map-over-marks'.

OP-SYMBOL is a symbol describing the operation performed (e.g.
`compress').  It is used with `dired-mark-pop-up' to prompt the user
\(e.g. with `Compress * [2 files]? ') and to display errors (e.g.
`Failed to compress 1 of 2 files - type W to see why (\"foo\")')

SHOW-PROGRESS if non-nil means redisplay dired after each file.</span>"
  (and (dired-mark-confirm op-symbol arg)
       (let* ((total-list               <span class="linecomment">; All of FUN's return values</span>
               (dired-map-over-marks (funcall fun) arg show-progress))
              (total     (length total-list))
              (failures  (delq nil total-list))
              (count     (length failures))
              (string    (if (eq op-symbol 'compress)
                             "<span class="quote">Compress or uncompress</span>"
                           (capitalize (symbol-name op-symbol)))))
         (if (not failures)
             (message "<span class="quote">%s: %d file%s.</span>" string total (dired-plural-s total))
           <span class="linecomment">;; end this bunch of errors:</span>
           (dired-log-summary (format "<span class="quote">Failed to %s %d of %d file%s</span>"
                                      (downcase string) count total (dired-plural-s total))
                              failures)))))

(when (boundp 'dired-subdir-switches)   <span class="linecomment">; Emacs 22+</span>
  (defun dired-do-redisplay (&optional arg test-for-subdir) <span class="linecomment">; Bound to `l'</span>
    "<span class="quote">Redisplay all marked (or next ARG) files.
If on a subdir line, redisplay that subdirectory.  In that case,
a prefix arg lets you edit the `ls' switches used for the new listing.

Dired remembers switches specified with a prefix arg, so that reverting
the buffer will not reset them.  However, using `dired-undo' to re-insert
or delete subdirectories can bypass this machinery.  Hence, you sometimes
may have to reset some subdirectory switches after a `dired-undo'.
You can reset all subdirectory switches to the default using
\\&lt;dired-mode-map&gt;\\[dired-reset-subdir-switches].
See Info node `(emacs)Subdir switches' for more details.</span>"
    <span class="linecomment">;; Moves point if the next ARG files are redisplayed.</span>
    (interactive "<span class="quote">P\np</span>")
    (if (and test-for-subdir  (dired-get-subdir))
        (let* ((dir       (dired-get-subdir))
               (switches  (cdr (assoc-string dir dired-switches-alist))))
          (dired-insert-subdir dir (and arg  (read-string "<span class="quote">Switches for listing: </span>"
                                                          (or switches dired-subdir-switches
                                                              dired-actual-switches)))))
      (message "<span class="quote">Redisplaying...</span>")
      <span class="linecomment">;; `message' much faster than making `dired-map-over-marks' show progress</span>
      (dired-uncache (if (consp dired-directory) (car dired-directory) dired-directory))
      (dired-map-over-marks (let ((fname  (dired-get-filename))
                                  <span class="linecomment">;; Postpone readin hook map over all marked files (Bug#6810).</span>
                                  (dired-after-readin-hook nil))
                              (message "<span class="quote">Redisplaying... `%s'</span>" fname)
                              (dired-update-file-line fname))
                            arg)
      (run-hooks 'dired-after-readin-hook)
      (dired-move-to-filename)
      (message "<span class="quote">Redisplaying...done</span>"))))

(unless (boundp 'dired-subdir-switches) <span class="linecomment">; Emacs 20, 21</span>
  (defun dired-do-redisplay (&optional arg test-for-subdir) <span class="linecomment">; Bound to `l'</span>
    "<span class="quote">Redisplay all marked (or next ARG) files.
If on a subdir line, redisplay that subdirectory.  In that case,
a prefix arg lets you edit the `ls' switches used for the new listing.</span>"
    <span class="linecomment">;; Moves point if the next ARG files are redisplayed.</span>
    (interactive "<span class="quote">P\np</span>")
    (if (and test-for-subdir  (dired-get-subdir))
        (dired-insert-subdir (dired-get-subdir)
                             (and arg  (read-string "<span class="quote">Switches for listing: </span>"
                                                    dired-actual-switches)))
      (message "<span class="quote">Redisplaying...</span>")
      <span class="linecomment">;; message much faster than making dired-map-over-marks show progress</span>
      (dired-uncache (if (consp dired-directory) (car dired-directory) dired-directory))
      (dired-map-over-marks (let ((fname  (dired-get-filename)))
                              (message "<span class="quote">Redisplaying... `%s'</span>" fname)
                              (dired-update-file-line fname))
                            arg)
      (dired-move-to-filename)
      (message "<span class="quote">Redisplaying...done</span>"))))


<span class="linecomment">;; REPLACE ORIGINAL in `dired.el'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Made compatible with Emacs 20, 21, which do not have [:alnum].</span>
<span class="linecomment">;; Also, this is defined here because it is used elsewhere in the file.</span>
<span class="linecomment">;;</span>
(defun dired-switches-escape-p (switches)
  "<span class="quote">Return non-nil if the string SWITCHES contains `-b' or `--escape'.</span>"
  <span class="linecomment">;; Do not match things like "--block-size" that happen to contain "b".</span>
  (if (&gt; emacs-major-version 21)
      (string-match "<span class="quote">\\(\\`\\| \\)-[[:alnum:]]*b\\|--escape\\&gt;</span>" switches)
    (string-match "<span class="quote">\\(\\`\\| \\)-\\(\w\\|[0-9]\\)*b\\|--escape\\&gt;</span>" switches)))


<span class="linecomment">;; From `dired.el'</span>

(when (and (&gt; emacs-major-version 22)  (featurep 'ls-lisp+))

<span class="linecomment">;;; 2012/04/26: Commented this out.</span>
<span class="linecomment">;;;             Might need it again when update `ls-lisp+.el' to fix other things.</span>
<span class="linecomment">;;;</span>
<span class="linecomment">;;;   ;; Use t as WILDCARD arg to `dired-insert-directory'.</span>
<span class="linecomment">;;;   ;;</span>
<span class="linecomment">;;;   (defun dired-readin-insert ()</span>
<span class="linecomment">;;;     ;; Insert listing for the specified dir (and maybe file  list)</span>
<span class="linecomment">;;;     ;; already in dired-directory, assuming a clean buffer.</span>
<span class="linecomment">;;;     (let (dir file-list)</span>
<span class="linecomment">;;;       (if (consp dired-directory)</span>
<span class="linecomment">;;;           (setq dir        (car dired-directory)</span>
<span class="linecomment">;;;                 file-list  (cdr dired-directory))</span>
<span class="linecomment">;;;         (setq dir        dired-directory</span>
<span class="linecomment">;;;               file-list  ()))</span>
<span class="linecomment">;;;       (setq dir  (expand-file-name dir))</span>
<span class="linecomment">;;;       (if (and (equal "" (file-name-nondirectory dir))  (not file-list))</span>
<span class="linecomment">;;;           ;; If we are reading a whole single directory...</span>
<span class="linecomment">;;;           (dired-insert-directory dir dired-actual-switches nil nil t)</span>
<span class="linecomment">;;;         (unless (file-readable-p (directory-file-name (file-name-directory dir)))</span>
<span class="linecomment">;;;           (error "Directory `%s' inaccessible or nonexistent" dir))</span>
<span class="linecomment">;;;         ;; Else treat it as a wildcard spec.</span>
<span class="linecomment">;;;         (dired-insert-directory dir dired-actual-switches file-list t t))))</span>

  <span class="linecomment">;; Compute WILDCARD arg for `insert-directory' for individual file (don't just use nil).</span>
  <span class="linecomment">;;</span>
  (defun dired-insert-directory (dir switches &optional file-list wildcard hdr)
    "<span class="quote">Insert a directory listing of DIR, Dired style.
Use SWITCHES to make the listings.
If FILE-LIST is non-nil, list only those files.
Otherwise, if WILDCARD is non-nil, expand wildcards;
 in that case, DIR should be a file name that uses wildcards.
In other cases, DIR should be a directory name or a directory filename.
If HDR is non-nil, insert a header line with the directory name.</span>"
    (let ((opoint               (point))
          (process-environment  (copy-sequence process-environment))
          end)
      (when (and
             <span class="linecomment">;; Do not try to invoke `ls' if on DOS/Windows, where `ls-lisp' is used, unless</span>
             <span class="linecomment">;; the user really wants to use `ls', as indicated by</span>
             <span class="linecomment">;; `ls-lisp-use-insert-directory-program'.</span>
             (or (not (featurep 'ls-lisp))  ls-lisp-use-insert-directory-program)
             (or (if (eq dired-use-ls-dired 'unspecified)
                     <span class="linecomment">;; Check if "ls --dired" gives exit code 0.  Put it in `dired-use-ls-dired'.</span>
                     (or (setq dired-use-ls-dired  (eq 0 (call-process insert-directory-program
                                                                       nil nil nil "<span class="quote">--dired</span>")))
                         (progn (message "<span class="quote">Command `ls' does not support switch `--dired' - see \
`dired-use-ls-dired'.</span>")
                                nil))
                   dired-use-ls-dired)
                 (file-remote-p dir)))
        (setq switches  (concat "<span class="quote">--dired </span>" switches)))
      <span class="linecomment">;; We used to specify the C locale here, to force English month names.  This should not be</span>
      <span class="linecomment">;; necessary any more with the new value of `directory-listing-before-filename-regexp'.</span>
      (if file-list
          (dolist (f  file-list)
            (let ((beg  (point)))
              <span class="linecomment">;; Compute wildcard arg for this file.</span>
              (insert-directory f switches (string-match "<span class="quote">[[?*]</span>" f) nil)
              <span class="linecomment">;; Re-align fields, if necessary.</span>
              (dired-align-file beg (point))))
        (insert-directory dir switches wildcard (not wildcard)))
      <span class="linecomment">;; Quote certain characters, unless ls quoted them for us.</span>
      (unless (if (fboundp 'dired-switches-escape-p)
                  (dired-switches-escape-p dired-actual-switches)
                (string-match "<span class="quote">b</span>" dired-actual-switches))
        (save-excursion
          (setq end  (point-marker))
          (goto-char opoint)
          (while (search-forward "<span class="quote">\\</span>" end t)
            (replace-match (apply #'propertize "<span class="quote">\\\\</span>" (text-properties-at (match-beginning 0)))
                           nil t))
          (goto-char opoint)
          (while (search-forward "<span class="quote">\^m</span>" end t)
            (replace-match (apply #'propertize "<span class="quote">\\015</span>" (text-properties-at (match-beginning 0)))
                           nil t))
          (set-marker end nil))
        <span class="linecomment">;; Comment in original, from some Emacs Dev developer:</span>
        <span class="linecomment">;;</span>
        <span class="linecomment">;; Replace any newlines in DIR with literal "\n" for the sake of the header line.  To</span>
        <span class="linecomment">;; disambiguate a literal "\n" in the actual dirname, we also replace "\" with "\\".</span>
        <span class="linecomment">;; I think this should always be done, irrespective of the value of</span>
        <span class="linecomment">;; dired-actual-switches, because:</span>
        <span class="linecomment">;;   i) Dired does not work with an unescaped newline in the directory name used in the</span>
        <span class="linecomment">;;      header (bug=10469#28), and</span>
        <span class="linecomment">;;  ii) "\" is always replaced with "\\" in the listing, so doing it in the header as</span>
        <span class="linecomment">;;      well makes things consistent.</span>
        <span class="linecomment">;; But at present it is done only if "-b" is in ls-switches, because newlines in dirnames</span>
        <span class="linecomment">;; are uncommon, and people may have gotten used to seeing unescaped "\" in the headers.</span>
        <span class="linecomment">;; Note: adjust `dired-build-subdir-alist' if you change this.</span>
        (setq dir  (replace-regexp-in-string "<span class="quote">\\\\</span>" "<span class="quote">\\\\</span>" dir nil t)
              dir  (replace-regexp-in-string "<span class="quote">\n</span>" "<span class="quote">\\n</span>" dir nil t)))
      (dired-insert-set-properties opoint (point))
      <span class="linecomment">;; If we used `--dired' and it worked, the lines are already indented.  Else indent them.</span>
      (unless (save-excursion (goto-char opoint) (looking-at "<span class="quote">  </span>"))
        (let ((indent-tabs-mode  nil)) (indent-rigidly opoint (point) 2)))
      <span class="linecomment">;; Insert text at the beginning to standardize things.</span>
      (save-excursion
        (goto-char opoint)
        (when (and (or hdr wildcard)  (not (and (looking-at "<span class="quote">^  \\(.*\\):$</span>")
                                                (file-name-absolute-p (match-string 1)))))
          <span class="linecomment">;; `dired-build-subdir-alist' will replace the name by its expansion, so it does not</span>
          <span class="linecomment">;; matter whether what we insert here is fully expanded, but it should be absolute.</span>
          (insert "<span class="quote">  </span>" (directory-file-name (file-name-directory dir)) "<span class="quote">:\n</span>"))
        (when wildcard
          <span class="linecomment">;; Insert "wildcard" line where "total" line would be for a full dir.</span>
          (insert "<span class="quote">  wildcard </span>" (file-name-nondirectory dir) "<span class="quote">\n</span>"))))))


<span class="linecomment">;;; Stuff from `image-dired.el'.</span>

(when (fboundp 'image-dired-get-thumbnail-image) <span class="linecomment">; Emacs 22+</span>
  (defun image-dired-dired-insert-marked-thumbs () <span class="linecomment">; Not bound</span>
    "<span class="quote">Insert thumbnails before file names of marked files in the dired buffer.</span>"
    (interactive)
    (dired-map-over-marks
     (let* ((image-pos   (dired-move-to-filename))
            (image-file  (dired-get-filename))
            (thumb-file  (image-dired-get-thumbnail-image image-file))
            overlay)
       <span class="linecomment">;; If image is not already added, then add it.</span>
       (unless (delq nil (mapcar (lambda (o) (overlay-get o 'put-image))
                                 <span class="linecomment">;; Can't use (overlays-at (point)), BUG?</span>
                                 (overlays-in (point) (1+ (point)))))
         (put-image thumb-file image-pos)
         (setq overlay  (car (delq nil (mapcar (lambda (o) (and (overlay-get o 'put-image)  o))
                                               (overlays-in (point) (1+ (point)))))))
         (overlay-put overlay 'image-file image-file)
         (overlay-put overlay 'thumb-file thumb-file)))
     nil)
    (add-hook 'dired-after-readin-hook 'image-dired-dired-after-readin-hook nil t)))

 
<span class="linecomment">;;; Key Bindings.</span>


<span class="linecomment">;; Menu Bar.</span>
<span class="linecomment">;; New order is (left -&gt; right):</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;     Dir  Regexp  Mark  Multiple  Single</span>

<span class="linecomment">;; Get rid of menu bar predefined in `dired.el'.</span>
(define-key dired-mode-map [menu-bar] nil)
<span class="linecomment">;; Get rid of Edit menu bar menu to save space.</span>
(define-key dired-mode-map [menu-bar edit] 'undefined)


<span class="linecomment">;; `Single' menu.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; REPLACE ORIGINAL `Immediate' menu in `dired.el'.</span>
<span class="linecomment">;;</span>
(defvar diredp-menu-bar-immediate-menu (make-sparse-keymap "<span class="quote">Single</span>"))
(define-key dired-mode-map [menu-bar immediate]
  (cons "<span class="quote">Single</span>" diredp-menu-bar-immediate-menu))

(define-key diredp-menu-bar-immediate-menu [diredp-describe-file]
  '(menu-item "<span class="quote">Describe</span>" diredp-describe-file
    :help "<span class="quote">Describe the file or directory at cursor</span>"))
(define-key diredp-menu-bar-immediate-menu [separator-describe] '("<span class="quote">--</span>")) <span class="linecomment">; ---------------------</span>

(when (fboundp 'image-dired-dired-display-image) <span class="linecomment">; Emacs 22+</span>
    (define-key diredp-menu-bar-immediate-menu [image-dired-dired-display-external]
      '(menu-item "<span class="quote">Display Image Externally</span>" image-dired-dired-display-external
                  :help "<span class="quote">Display image in external viewer</span>"))
    (define-key diredp-menu-bar-immediate-menu [image-dired-dired-display-image]
      '(menu-item "<span class="quote">Display Image</span>" image-dired-dired-display-image
                  :help "<span class="quote">Display sized image in a separate window</span>"))
    (define-key diredp-menu-bar-immediate-menu [separator-image] '("<span class="quote">--</span>"))) <span class="linecomment">; -------------------</span>

(when (fboundp 'diredp-chown-this-file)
  (define-key diredp-menu-bar-immediate-menu [chown]
    '(menu-item "<span class="quote">Change Owner...</span>" diredp-chown-this-file
      :help "<span class="quote">Change the owner of file at cursor</span>")))
(when (fboundp 'diredp-chgrp-this-file)
  (define-key diredp-menu-bar-immediate-menu [chgrp]
    '(menu-item "<span class="quote">Change Group...</span>" diredp-chgrp-this-file
      :help "<span class="quote">Change the group of file at cursor</span>")))
(define-key diredp-menu-bar-immediate-menu [chmod]
  '(menu-item "<span class="quote">Change Mode...</span>" diredp-chmod-this-file
    :help "<span class="quote">Change mode (attributes) of file at cursor</span>"))
(when (fboundp 'dired-do-touch)         <span class="linecomment">; Emacs 22+</span>
  (define-key diredp-menu-bar-immediate-menu [touch]
    '(menu-item "<span class="quote">Change Timestamp (`touch')...</span>" diredp-touch-this-file
      :help "<span class="quote">Change the timestamp of file at cursor, using `touch'</span>")))
(define-key diredp-menu-bar-immediate-menu [separator-change] '("<span class="quote">--</span>")) <span class="linecomment">; -----------------------</span>

(define-key diredp-menu-bar-immediate-menu [load]
  '(menu-item "<span class="quote">Load</span>" diredp-load-this-file
    :help "<span class="quote">Load this Emacs Lisp file</span>"))
(define-key diredp-menu-bar-immediate-menu [compile]
  '(menu-item "<span class="quote">Byte Compile</span>" diredp-byte-compile-this-file
    :help "<span class="quote">Byte-compile this Emacs Lisp file</span>"))
(define-key diredp-menu-bar-immediate-menu [command]
  '(menu-item "<span class="quote">Shell Command...</span>" diredp-shell-command-this-file
    :help "<span class="quote">Run a shell command on file at cursor</span>"))
(define-key diredp-menu-bar-immediate-menu [compress]
  '(menu-item "<span class="quote">Compress/Uncompress</span>" diredp-compress-this-file
    :help "<span class="quote">Compress/uncompress file at cursor</span>"))
(define-key diredp-menu-bar-immediate-menu [grep]
  '(menu-item "<span class="quote">Grep...</span>" diredp-grep-this-file :help "<span class="quote">Grep file at cursor</span>"))
(define-key diredp-menu-bar-immediate-menu [print]
  '(menu-item "<span class="quote">Print...</span>" diredp-print-this-file
    :help "<span class="quote">Print file at cursor, supplying print command</span>"))

(when (fboundp 'mkhtml-dired-files)
  (define-key diredp-menu-bar-immediate-menu [mkhtml-dired-files]
    '(menu-item "<span class="quote">Create HTML</span>" mkhtml-dired-files
      :help "<span class="quote">Create an HTML file corresponding to file at cursor</span>")))
(define-key diredp-menu-bar-immediate-menu [separator-misc] '("<span class="quote">--</span>")) <span class="linecomment">; -------------------------</span>

(define-key diredp-menu-bar-immediate-menu [hardlink]
  '(menu-item "<span class="quote">Hardlink to...</span>" diredp-hardlink-this-file
    :help "<span class="quote">Make hard links for current or marked files</span>"))
(if (not (fboundp 'dired-do-relsymlink))
    (define-key diredp-menu-bar-immediate-menu [symlink]
      '(menu-item "<span class="quote">Symlink to...</span>" diredp-symlink-this-file
        :visible (fboundp 'make-symbolic-link) :help "<span class="quote">Make symbolic link for file at cursor</span>"))
  (define-key diredp-menu-bar-immediate-menu [symlink]
    '(menu-item "<span class="quote">Symlink to (Absolute)...</span>" diredp-symlink-this-file
      :help "<span class="quote">Make absolute symbolic link for file at cursor</span>"))
  (define-key diredp-menu-bar-immediate-menu [relsymlink]
    '(menu-item "<span class="quote">Symlink to (Relative)...</span>" diredp-relsymlink-this-file <span class="linecomment">; In `dired-x.el'.</span>
      :help "<span class="quote">Make relative symbolic link for file at cursor</span>")))
(define-key diredp-menu-bar-immediate-menu [separator-link] '("<span class="quote">--</span>")) <span class="linecomment">; -------------------------</span>

(define-key diredp-menu-bar-immediate-menu [delete]
  '(menu-item "<span class="quote">Delete</span>" diredp-delete-this-file :help "<span class="quote">Delete file at cursor</span>"))
(define-key diredp-menu-bar-immediate-menu [separator-delete] '("<span class="quote">--</span>")) <span class="linecomment">; -----------------------</span>

(define-key diredp-menu-bar-immediate-menu [downcase]
  '(menu-item "<span class="quote">Downcase</span>" diredp-downcase-this-file
    <span class="linecomment">;; When running on plain MS-DOS, there is only one letter-case for file names.</span>
    :enable (or (not (fboundp 'msdos-long-file-names)) (msdos-long-file-names))
    :help "<span class="quote">Rename file at cursor to a lower-case name</span>"))
(define-key diredp-menu-bar-immediate-menu [upcase]
  '(menu-item "<span class="quote">Upcase</span>" diredp-upcase-this-file
    :enable (or (not (fboundp 'msdos-long-file-names)) (msdos-long-file-names))
    :help "<span class="quote">Rename file at cursor to an upper-case name</span>"))
(define-key diredp-menu-bar-immediate-menu [capitalize]
  '(menu-item "<span class="quote">Capitalize</span>" diredp-capitalize-this-file
    :help "<span class="quote">Capitalize (initial caps) name of file at cursor</span>"))
(define-key diredp-menu-bar-immediate-menu [rename]
  '(menu-item "<span class="quote">Rename to...</span>" diredp-rename-this-file :help "<span class="quote">Rename file at cursor</span>"))
(define-key diredp-menu-bar-immediate-menu [copy]
  '(menu-item "<span class="quote">Copy to...</span>" diredp-copy-this-file :help "<span class="quote">Copy file at cursor</span>"))
(define-key diredp-menu-bar-immediate-menu [separator-rename] '("<span class="quote">--</span>")) <span class="linecomment">; -----------------------</span>

(define-key diredp-menu-bar-immediate-menu [backup-diff]
  '(menu-item "<span class="quote">Diff with Backup</span>" dired-backup-diff
    :help "<span class="quote">Diff file at cursor with its latest backup</span>"))
(define-key diredp-menu-bar-immediate-menu [diff]
  '(menu-item "<span class="quote">Diff...</span>" dired-diff
    :help "<span class="quote">Compare file at cursor with another file using `diff'</span>"))
(define-key diredp-menu-bar-immediate-menu [ediff]
  '(menu-item "<span class="quote">Compare...</span>" diredp-ediff :help "<span class="quote">Compare file at cursor with another file</span>"))
(define-key diredp-menu-bar-immediate-menu [separator-diff] '("<span class="quote">--</span>")) <span class="linecomment">; -------------------------</span>

(define-key diredp-menu-bar-immediate-menu [dired-kill-subdir]
  '(menu-item "<span class="quote">Remove This Inserted Subdir</span>" dired-kill-subdir
    :visible (not (equal (dired-current-directory) default-directory)))) <span class="linecomment">; In subdir, not top.</span>
(define-key diredp-menu-bar-immediate-menu [diredp-dired-this-subdir]
  '(menu-item "<span class="quote">Dired This Inserted Subdir (Tear Off)</span>"
    (lambda () (interactive) (diredp-dired-this-subdir t))
    :visible (and (cdr dired-subdir-alist) <span class="linecomment">; First is current dir.  Must have at least one more.</span>
              (not (equal (dired-current-directory) default-directory))) <span class="linecomment">; Must be sub, not top.</span>
    :help "<span class="quote">Open Dired for subdir at or above point, tearing it off if inserted</span>"))
(define-key diredp-menu-bar-immediate-menu [insert-subdir]
  '(menu-item "<span class="quote">Insert This Subdir</span>" dired-maybe-insert-subdir
    :visible (and (atom (diredp-this-subdir))
              (not (assoc (file-name-as-directory (diredp-this-subdir)) dired-subdir-alist)))
    :enable (atom (diredp-this-subdir))
    :help "<span class="quote">Insert a listing of this subdirectory</span>"))
(define-key diredp-menu-bar-immediate-menu [goto-subdir]
  '(menu-item "<span class="quote">Go To Inserted Subdir</span>" dired-maybe-insert-subdir
    :visible (and (atom (diredp-this-subdir))
              (assoc (file-name-as-directory (diredp-this-subdir)) dired-subdir-alist))
    :enable (atom (diredp-this-subdir))
    :help "<span class="quote">Go to the inserted listing of this subdirectory</span>"))
(define-key diredp-menu-bar-immediate-menu [separator-subdir] '("<span class="quote">--</span>" <span class="linecomment">; ------------------------</span>
            :visible (or (atom (diredp-this-subdir)) <span class="linecomment">; Subdir line.</span>
                         (not (equal (dired-current-directory) default-directory))))) <span class="linecomment">; Not top.</span>

(define-key diredp-menu-bar-immediate-menu [view]
  '(menu-item "<span class="quote">View (Read Only)</span>" dired-view-file
    :help "<span class="quote">Examine file at cursor in read-only mode</span>"))
(define-key diredp-menu-bar-immediate-menu [display]
  '(menu-item "<span class="quote">Display in Other Window</span>" dired-display-file
    :help "<span class="quote">Display file at cursor in a different window</span>"))
<span class="linecomment">;; On Windows, bind more.</span>
(eval-after-load "<span class="quote">w32-browser</span>"
  '(progn
    (define-key diredp-menu-bar-immediate-menu [dired-w32-browser]
      '(menu-item "<span class="quote">Open Associated Windows App</span>" dired-w32-browser
        :help "<span class="quote">Open file using the Windows app associated with its file type</span>"))
    (define-key diredp-menu-bar-immediate-menu [dired-w32explore]
      '(menu-item "<span class="quote">Open in Windows Explorer</span>" dired-w32explore
        :help "<span class="quote">Open file in Windows Explorer</span>"))))
(define-key diredp-menu-bar-immediate-menu [find-file-other-frame]
  '(menu-item "<span class="quote">Open in Other Frame</span>" diredp-find-file-other-frame
    :help "<span class="quote">Edit file at cursor in a different frame</span>"))
(define-key diredp-menu-bar-immediate-menu [find-file-other-window]
  '(menu-item "<span class="quote">Open in Other Window</span>" dired-find-file-other-window
    :help "<span class="quote">Edit file at cursor in a different window</span>"))
(define-key diredp-menu-bar-immediate-menu [find-file]
  '(menu-item "<span class="quote">Open</span>" dired-find-file :help "<span class="quote">Edit file at cursor</span>"))

<span class="linecomment">;; `Single' &gt; `Bookmarks' menu.</span>
<span class="linecomment">;;</span>
(when (require 'bookmark+ nil t)
  (defvar diredp-menu-bar-immediate-bookmarks-menu (make-sparse-keymap "<span class="quote">Bookmarks</span>"))
  (define-key diredp-menu-bar-immediate-menu [bookmark]
    (cons "<span class="quote">Bookmarks</span>" diredp-menu-bar-immediate-bookmarks-menu))

  (define-key diredp-menu-bar-immediate-bookmarks-menu [diredp-set-tag-value-this-file]
    '(menu-item "<span class="quote">Set Tag Value...</span>" diredp-set-tag-value-this-file
      :help "<span class="quote">Set the value (not the name) of a given tag for this file</span>"))
  (define-key diredp-menu-bar-immediate-bookmarks-menu [diredp-paste-replace-tags-this-file]
    '(menu-item "<span class="quote">Paste Tags (Replace)</span>" diredp-paste-replace-tags-this-file
      :help "<span class="quote">Replace tags for this file with previously copied tags</span>"))
  (define-key diredp-menu-bar-immediate-bookmarks-menu [diredp-paste-add-tags-this-file]
    '(menu-item "<span class="quote">Paste Tags (Add)</span>" diredp-paste-add-tags-this-file
      :help "<span class="quote">Add previously copied tags to this file</span>"))
  (define-key diredp-menu-bar-immediate-bookmarks-menu [diredp-copy-tags-this-file]
    '(menu-item "<span class="quote">Copy Tags</span>" diredp-copy-tags-this-file
      :help "<span class="quote">Copy the tags from this file, so you can paste them to another</span>"))
  (define-key diredp-menu-bar-immediate-bookmarks-menu [diredp-remove-all-tags-this-file]
    '(menu-item "<span class="quote">Remove All Tags</span>" diredp-remove-all-tags-this-file
      :help "<span class="quote">Remove all tags from the file at cursor</span>"))
  (define-key diredp-menu-bar-immediate-bookmarks-menu [diredp-untag-this-file]
    '(menu-item "<span class="quote">Remove Tags...</span>" diredp-untag-this-file
      :help "<span class="quote">Remove some tags from the file at cursor (`C-u': remove all tags)</span>"))
  (define-key diredp-menu-bar-immediate-bookmarks-menu [diredp-tag-this-file]
    '(menu-item "<span class="quote">Add Tags...</span>" diredp-tag-this-file :help "<span class="quote">Add some tags to the file at cursor</span>")))
(when (require 'bookmark+ nil t)
  (define-key diredp-menu-bar-immediate-bookmarks-menu [diredp-bookmark-this-file]
    '(menu-item "<span class="quote">Bookmark...</span>" diredp-bookmark-this-file :help "<span class="quote">Bookmark the file at cursor</span>")))


<span class="linecomment">;; `Multiple' menu.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; REPLACE ORIGINAL "Operate" menu in `dired.el'.</span>
<span class="linecomment">;;</span>
(defvar diredp-menu-bar-operate-menu (make-sparse-keymap "<span class="quote">Multiple</span>"))
(define-key dired-mode-map [menu-bar operate]
  (cons "<span class="quote">Multiple</span>" diredp-menu-bar-operate-menu))

(when (fboundp 'epa-dired-do-decrypt)   <span class="linecomment">; Emacs 23+</span>
  (define-key diredp-menu-bar-operate-menu [epa-dired-do-decrypt]
    '(menu-item "<span class="quote">Decrypt</span>" epa-dired-do-decrypt :help "<span class="quote">Decrypt file at cursor</span>"))
  (define-key diredp-menu-bar-operate-menu [epa-dired-do-verify]
    '(menu-item "<span class="quote">Verify</span>" epa-dired-do-verify
      :help "<span class="quote">Verify digital signature of file at cursor</span>"))
  (define-key diredp-menu-bar-operate-menu [epa-dired-do-sign]
    '(menu-item "<span class="quote">Sign</span>" epa-dired-do-sign :help "<span class="quote">Create digital signature of file at cursor</span>"))
  (define-key diredp-menu-bar-operate-menu [epa-dired-do-encrypt]
    '(menu-item "<span class="quote">Encrypt</span>" epa-dired-do-encrypt :help "<span class="quote">Encrypt file at cursor</span>"))
  (define-key diredp-menu-bar-operate-menu [separator-encryption] '("<span class="quote">--</span>"))) <span class="linecomment">; ------------------</span>

(when (fboundp 'image-dired-delete-tag) <span class="linecomment">; Emacs 22+</span>
  (define-key diredp-menu-bar-operate-menu [image-dired-delete-tag]
    '(menu-item "<span class="quote">Delete Image Tag...</span>" image-dired-delete-tag
      :help "<span class="quote">Delete image tag from marked files</span>"))
  (define-key diredp-menu-bar-operate-menu [image-dired-tag-files]
    '(menu-item "<span class="quote">Add Image Tags...</span>" image-dired-tag-files
      :help "<span class="quote">Add image tags to marked files</span>"))
  (define-key diredp-menu-bar-operate-menu [image-dired-dired-comment-files]
    '(menu-item "<span class="quote">Add Image Comment...</span>" image-dired-dired-comment-files
      :help "<span class="quote">Add image comment to marked files</span>"))
  (define-key diredp-menu-bar-operate-menu [image-dired-display-thumbs]
    '(menu-item "<span class="quote">Display Image Thumbnails</span>" image-dired-display-thumbs
      :help "<span class="quote">Display image thumbnails for marked image files</span>"))
  (define-key diredp-menu-bar-operate-menu [separator-image] '("<span class="quote">--</span>"))) <span class="linecomment">; -----------------------</span>

(unless (memq system-type '(windows-nt ms-dos))
  (define-key diredp-menu-bar-operate-menu [chown]
    '(menu-item "<span class="quote">Change Owner...</span>" dired-do-chown
      :help "<span class="quote">Change the owner of marked files</span>")))
(unless (memq system-type '(windows-nt ms-dos))
  (define-key diredp-menu-bar-operate-menu [chgrp]
    '(menu-item "<span class="quote">Change Group...</span>" dired-do-chgrp
      :help "<span class="quote">Change the owner of marked files</span>")))
(define-key diredp-menu-bar-operate-menu [chmod]
  '(menu-item "<span class="quote">Change Mode...</span>" dired-do-chmod
    :help "<span class="quote">Change mode (attributes) of marked files</span>"))
(when (fboundp 'dired-do-touch)         <span class="linecomment">; Emacs 22+</span>
  (define-key diredp-menu-bar-operate-menu [touch]
    '(menu-item "<span class="quote">Change Timestamp (`touch')...</span>" dired-do-touch
      :help "<span class="quote">Change the timestamp of the marked files, using `touch'</span>")))
(define-key diredp-menu-bar-operate-menu [separator-change] '("<span class="quote">--</span>")) <span class="linecomment">; -------------------------</span>

(when (fboundp 'dired-do-isearch-regexp) <span class="linecomment">; Emacs 23+</span>
  (define-key diredp-menu-bar-operate-menu [isearch-regexp]
    '(menu-item "<span class="quote">Isearch Regexp Files...</span>" dired-do-isearch-regexp
      :help "<span class="quote">Incrementally search marked files for regexp</span>"))
  (define-key diredp-menu-bar-operate-menu [isearch]
    '(menu-item "<span class="quote">Isearch Files...</span>" dired-do-isearch
      :help "<span class="quote">Incrementally search marked files for string</span>")))
(define-key diredp-menu-bar-operate-menu [query-replace]
  (if (&lt; emacs-major-version 21)
      '(menu-item "<span class="quote">Query Replace...</span>" dired-do-query-replace)
    '(menu-item "<span class="quote">Query Replace...</span>" dired-do-query-replace-regexp
      :help "<span class="quote">Replace regexp in marked files</span>")))
(define-key diredp-menu-bar-operate-menu [search]
  '(menu-item "<span class="quote">Search Files...</span>" dired-do-search :help "<span class="quote">Search marked files for regexp</span>"))
(define-key diredp-menu-bar-operate-menu [grep]
  '(menu-item "<span class="quote">Grep...</span>" diredp-do-grep :help "<span class="quote">Grep marked, next N, or all files shown</span>"))
(define-key diredp-menu-bar-operate-menu [separator-search] '("<span class="quote">--</span>")) <span class="linecomment">; -------------------------</span>

(define-key diredp-menu-bar-operate-menu [load]
  '(menu-item "<span class="quote">Load</span>" dired-do-load :help "<span class="quote">Load marked Emacs Lisp files</span>"))
(define-key diredp-menu-bar-operate-menu [compile]
  '(menu-item "<span class="quote">Byte Compile</span>" dired-do-byte-compile :help "<span class="quote">Byte-compile marked Emacs Lisp files</span>"))
(define-key diredp-menu-bar-operate-menu [command]
  '(menu-item "<span class="quote">Shell Command...</span>" dired-do-shell-command
    :help "<span class="quote">Run a shell command on each of marked files</span>"))
(define-key diredp-menu-bar-operate-menu [compress]
  '(menu-item "<span class="quote">Compress/Uncompress</span>" dired-do-compress :help "<span class="quote">Compress/uncompress marked files</span>"))
(define-key diredp-menu-bar-operate-menu [print]
  '(menu-item "<span class="quote">Print...</span>" dired-do-print :help "<span class="quote">Print marked files, supplying print command</span>"))

(unless (require 'bookmark+ nil t)
  (define-key diredp-menu-bar-immediate-menu [diredp-bookmark-this-file]
    '(menu-item "<span class="quote">Bookmark...</span>" diredp-bookmark-this-file :help "<span class="quote">Bookmark the file at cursor</span>")))
(when (fboundp 'mkhtml-dired-files)
  (define-key diredp-menu-bar-operate-menu [mkhtml-dired-files]
    '(menu-item "<span class="quote">Create HTML</span>" mkhtml-dired-files
      :help "<span class="quote">Create HTML files corresponding to marked files</span>")))
(define-key diredp-menu-bar-operate-menu [separator-misc] '("<span class="quote">--</span>")) <span class="linecomment">; ---------------------------</span>

(define-key diredp-menu-bar-operate-menu [hardlink]
  '(menu-item "<span class="quote">Hardlink to...</span>" dired-do-hardlink
    :help "<span class="quote">Make hard links for current or marked files</span>"))
(if (not (fboundp 'dired-do-relsymlink))
    (define-key diredp-menu-bar-operate-menu [symlink]
      '(menu-item "<span class="quote">Symlink to...</span>" dired-do-symlink
        :visible (fboundp 'make-symbolic-link)
        :help "<span class="quote">Make symbolic links for current or marked files</span>"))
  (define-key diredp-menu-bar-operate-menu [symlink]
    '(menu-item "<span class="quote">Symlink to (Absolute)...</span>" dired-do-symlink
      :help "<span class="quote">Make absolute symbolic links for current or marked files</span>"))
  (define-key diredp-menu-bar-operate-menu [relsymlink] <span class="linecomment">; In `dired-x.el'.</span>
    '(menu-item "<span class="quote">Symlink to (Relative)...</span>" dired-do-relsymlink
      :help "<span class="quote">Make relative symbolic links for current or marked files</span>")))
(define-key diredp-menu-bar-operate-menu [separator-link] '("<span class="quote">--</span>")) <span class="linecomment">; ---------------------------</span>

(define-key diredp-menu-bar-operate-menu [delete-flagged]
  '(menu-item "<span class="quote">Delete Flagged</span>" dired-do-flagged-delete
    :help "<span class="quote">Delete all files flagged for deletion (D)</span>"))
(define-key diredp-menu-bar-operate-menu [delete]
  '(menu-item "<span class="quote">Delete Marked (not Flagged)</span>" dired-do-delete
    :help "<span class="quote">Delete current file or all marked files (not flagged files)</span>"))
(define-key diredp-menu-bar-operate-menu [separator-delete] '("<span class="quote">--</span>")) <span class="linecomment">; -------------------------</span>

(define-key diredp-menu-bar-operate-menu [downcase]
  '(menu-item "<span class="quote">Downcase</span>" dired-downcase
    :enable (or (not (fboundp 'msdos-long-file-names)) (msdos-long-file-names))
    :help "<span class="quote">Rename marked files to lowercase names</span>"))
(define-key diredp-menu-bar-operate-menu [upcase]
  '(menu-item "<span class="quote">Upcase</span>" dired-upcase
    :enable (or (not (fboundp 'msdos-long-file-names)) (msdos-long-file-names))
    :help "<span class="quote">Rename marked files to uppercase names</span>"))
(define-key diredp-menu-bar-operate-menu [capitalize]
  '(menu-item "<span class="quote">Capitalize</span>" diredp-capitalize
    :help "<span class="quote">Capitalize (initial caps) the names of all marked files</span>"))
(define-key diredp-menu-bar-operate-menu [rename]
  '(menu-item "<span class="quote">Rename to...</span>" dired-do-rename :help "<span class="quote">Rename current file or move marked files</span>"))
(define-key diredp-menu-bar-operate-menu [copy]
  '(menu-item "<span class="quote">Copy to...</span>" dired-do-copy :help "<span class="quote">Copy current file or all marked files</span>"))
(define-key diredp-menu-bar-operate-menu [separator-rename] '("<span class="quote">--</span>")) <span class="linecomment">; -------------------------</span>

(when (fboundp 'dired-copy-filename-as-kill)
  (define-key diredp-menu-bar-operate-menu [kill-ring]
    '(menu-item "<span class="quote">Copy File Names (to Paste)</span>" dired-copy-filename-as-kill
      :help "<span class="quote">Copy names of marked files onto kill ring, for pasting</span>")))
(define-key diredp-menu-bar-operate-menu [diredp-insert-subdirs]
  '(menu-item "<span class="quote">Insert Subdirs</span>" diredp-insert-subdirs
    :help "<span class="quote">Insert the marked subdirectories - like using `i' at each marked dir</span>"))
(define-key diredp-menu-bar-operate-menu [diredp-marked-other-window]
  '(menu-item "<span class="quote">Dired (Marked) in Other Window</span>" diredp-marked-other-window
    :enable (save-excursion (goto-char (point-min))
                            (and (re-search-forward (dired-marker-regexp) nil t)
                                 (re-search-forward (dired-marker-regexp) nil t)))
    :help "<span class="quote">Open Dired on marked files only, in other window</span>"))
(define-key diredp-menu-bar-operate-menu [diredp-marked]
  '(menu-item "<span class="quote">Dired (Marked)</span>" diredp-marked
    :enable (save-excursion (goto-char (point-min))
                            (and (re-search-forward (dired-marker-regexp) nil t)
                                 (re-search-forward (dired-marker-regexp) nil t)))
    :help "<span class="quote">Open Dired on marked files only</span>"))
<span class="linecomment">;; On Windows, bind more.</span>
(eval-after-load "<span class="quote">w32-browser</span>"
  '(define-key diredp-menu-bar-operate-menu [dired-multiple-w32-browser]
      '(menu-item "<span class="quote">Open Associated Windows Apps</span>" dired-multiple-w32-browser
        :help "<span class="quote">Open files using the Windows apps associated with their file types</span>")))
(when (fboundp 'dired-do-find-marked-files)
  (define-key diredp-menu-bar-operate-menu [find-files]
    '(menu-item "<span class="quote">Open</span>" dired-do-find-marked-files <span class="linecomment">; In `dired-x.el'.</span>
      :help "<span class="quote">Open each marked file for editing</span>")))

(defvar diredp-menu-bar-recursive-marked-menu (make-sparse-keymap "<span class="quote">Marked Here and Below</span>"))
(define-key diredp-menu-bar-operate-menu [recursive-marked]
  (cons "<span class="quote">Marked Here and Below</span>" diredp-menu-bar-recursive-marked-menu))

(when (&gt; emacs-major-version 22) <span class="linecomment">; Emacs 23+</span>
  (define-key diredp-menu-bar-recursive-marked-menu [diredp-do-decrypt-recursive]
    '(menu-item "<span class="quote">Decrypt...</span>" diredp-do-decrypt-recursive
      :help "<span class="quote">Decrypt marked files, including those in marked subdirs</span>"))
  (define-key diredp-menu-bar-recursive-marked-menu [diredp-do-verify-recursive]
    '(menu-item "<span class="quote">Verify</span>" diredp-do-verify-recursive
      :help "<span class="quote">Verify marked files, including those in marked subdirs</span>"))
  (define-key diredp-menu-bar-recursive-marked-menu [diredp-do-sign-recursive]
    '(menu-item "<span class="quote">Sign...</span>" diredp-do-sign-recursive
      :help "<span class="quote">Sign marked files, including those in marked subdirs</span>"))
  (define-key diredp-menu-bar-recursive-marked-menu [diredp-do-encrypt-recursive]
    '(menu-item "<span class="quote">Encrypt...</span>" diredp-do-encrypt-recursive
      :help "<span class="quote">Encrypt marked files, including those in marked subdirs</span>"))
  (define-key diredp-menu-bar-recursive-marked-menu [separator-crypt] '("<span class="quote">--</span>"))) <span class="linecomment">; --------------</span>

(when (fboundp 'image-dired-delete-tag) <span class="linecomment">; Emacs 22+</span>
  (define-key diredp-menu-bar-recursive-marked-menu [diredp-image-dired-delete-tag-recursive]
    '(menu-item "<span class="quote">Delete Image Tag...</span>" diredp-image-dired-delete-tag-recursive
      :help "<span class="quote">Delete image tag from marked files, including those in marked subdirs</span>"))
  (define-key diredp-menu-bar-recursive-marked-menu [diredp-image-dired-tag-files-recursive]
    '(menu-item "<span class="quote">Add Image Tags...</span>" diredp-image-dired-tag-files-recursive
      :help "<span class="quote">Add image tags to marked files, including those in marked subdirs</span>"))
  (define-key diredp-menu-bar-recursive-marked-menu [diredp-image-dired-comment-files-recursive]
    '(menu-item "<span class="quote">Add Image Comment...</span>" diredp-image-dired-comment-files-recursive
      :help "<span class="quote">Add image comment to marked files, including those in marked subdirs</span>"))
  (define-key diredp-menu-bar-recursive-marked-menu [diredp-image-dired-display-thumbs-recursive]
    '(menu-item "<span class="quote">Display Image Thumbnails</span>" diredp-image-dired-display-thumbs-recursive
      :help "<span class="quote">Show thumbnails for marked image files, including those in marked subdirs</span>"))
  (define-key diredp-menu-bar-recursive-marked-menu [separator-image] '("<span class="quote">--</span>"))) <span class="linecomment">; --------------</span>

(when (fboundp 'diredp-do-chown-recursive)
  (define-key diredp-menu-bar-recursive-marked-menu [chown]
    '(menu-item "<span class="quote">Change Owner...</span>" diredp-do-chown-recursive
      :help "<span class="quote">Change the owner of marked files, including those in marked subdirs</span>")))
(when (fboundp 'diredp-do-chgrp-recursive)
  (define-key diredp-menu-bar-recursive-marked-menu [chgrp]
    '(menu-item "<span class="quote">Change Group...</span>" diredp-do-chgrp-recursive
      :help "<span class="quote">Change the owner of marked files, including those in marked subdirs</span>")))
(define-key diredp-menu-bar-recursive-marked-menu [chmod]
  '(menu-item "<span class="quote">Change Mode...</span>" diredp-do-chmod-recursive
    :help "<span class="quote">Change mode (attributes) of marked files, including those in marked subdirs</span>"))
(when (fboundp 'dired-do-touch)         <span class="linecomment">; Emacs 22+</span>
  (define-key diredp-menu-bar-recursive-marked-menu [touch]
    '(menu-item "<span class="quote">Change Timestamp (`touch')...</span>" diredp-do-touch-recursive
      :help "<span class="quote">Change timestamp of marked files, including those in marked subdirs</span>")))
(define-key diredp-menu-bar-recursive-marked-menu [separator-change] '("<span class="quote">--</span>")) <span class="linecomment">; ----------------</span>

(when (fboundp 'dired-do-isearch-regexp) <span class="linecomment">; Emacs 23+</span>
  (define-key diredp-menu-bar-recursive-marked-menu [diredp-do-isearch-regexp-recursive]
    '(menu-item "<span class="quote">Isearch Regexp Files...</span>" diredp-do-isearch-regexp-recursive
      :help "<span class="quote">Incrementally regexp search marked files, including those in marked subdirs</span>"))
  (define-key diredp-menu-bar-recursive-marked-menu [diredp-do-isearch-recursive]
    '(menu-item "<span class="quote">Isearch Files...</span>" diredp-do-isearch-recursive
      :help "<span class="quote">Incrementally search marked files, including those in marked subdirs</span>")))
(define-key diredp-menu-bar-recursive-marked-menu [diredp-do-query-replace-regexp-recursive]
  '(menu-item "<span class="quote">Query Replace...</span>" diredp-do-query-replace-regexp-recursive
    :help "<span class="quote">Replace regexp in marked files, including those in marked subdirs</span>"))
(define-key diredp-menu-bar-recursive-marked-menu [diredp-do-search-recursive]
  '(menu-item "<span class="quote">Search Files...</span>" diredp-do-search-recursive
    :help "<span class="quote">Regexp search marked files, including those in marked subdirs</span>"))
(define-key diredp-menu-bar-recursive-marked-menu [diredp-do-grep-recursive]
    '(menu-item "<span class="quote">Grep...</span>" diredp-do-grep-recursive
      :help "<span class="quote">Run `grep' on the marked files, including those in marked subdirs</span>"))
(define-key diredp-menu-bar-recursive-marked-menu [separator-search] '("<span class="quote">--</span>")) <span class="linecomment">; ----------------</span>

(define-key diredp-menu-bar-recursive-marked-menu [diredp-do-shell-command-recursive]
    '(menu-item "<span class="quote">Shell Command...</span>" diredp-do-shell-command-recursive
      :help "<span class="quote">Run shell command on the marked files, including those in marked subdirs</span>"))
(define-key diredp-menu-bar-recursive-marked-menu [diredp-do-print-recursive]
    '(menu-item "<span class="quote">Print...</span>" diredp-do-print-recursive
      :help "<span class="quote">Print the marked files, including those in marked subdirs</span>"))
(define-key diredp-menu-bar-recursive-marked-menu [separator-misc] '("<span class="quote">--</span>")) <span class="linecomment">; ----------------</span>

(define-key diredp-menu-bar-recursive-marked-menu [diredp-do-hardlink-recursive]
  '(menu-item "<span class="quote">Hardlink to...</span>" diredp-do-hardlink-recursive
    :help "<span class="quote">Make hard links for marked files, including those in marked subdirs</span>"))
(if (not (fboundp 'dired-do-relsymlink))
    (define-key diredp-menu-bar-recursive-marked-menu [diredp-do-symlink-recursive]
      '(menu-item "<span class="quote">Symlink to...</span>" diredp-do-symlink-recursive
        :visible (fboundp 'make-symbolic-link)
        :help "<span class="quote">Make symbolic links for marked files, including those in marked subdirs</span>"))
  (define-key diredp-menu-bar-recursive-marked-menu [diredp-do-symlink-recursive]
    '(menu-item "<span class="quote">Symlink to (Absolute)...</span>" diredp-do-symlink-recursive
      :help "<span class="quote">Make absolute symbolic links for marked files, including those in marked subdirs</span>"))
  (define-key diredp-menu-bar-recursive-marked-menu [diredp-do-relsymlink-recursive]
    '(menu-item "<span class="quote">Symlink to (Relative)...</span>" diredp-do-relsymlink-recursive
      :help "<span class="quote">Make relative symbolic links for marked files, including those in marked subdirs</span>")))
(define-key diredp-menu-bar-recursive-marked-menu [separator-link] '("<span class="quote">--</span>")) <span class="linecomment">; ------------------</span>

(define-key diredp-menu-bar-recursive-marked-menu [diredp-capitalize-recursive]
  '(menu-item "<span class="quote">Capitalize</span>" diredp-capitalize-recursive
    :enable (or (not (fboundp 'msdos-long-file-names))  (msdos-long-file-names))
    :help "<span class="quote">Capitalize (initial caps) the names of all marked files</span>"))
(define-key diredp-menu-bar-recursive-marked-menu [diredp-downcase-recursive]
  '(menu-item "<span class="quote">Downcase</span>" diredp-downcase-recursive
    :enable (or (not (fboundp 'msdos-long-file-names))  (msdos-long-file-names))
    :help "<span class="quote">Rename marked files to lowercase names</span>"))
(define-key diredp-menu-bar-recursive-marked-menu [diredp-upcase-recursive]
  '(menu-item "<span class="quote">Upcase</span>" diredp-upcase-recursive
    :enable (or (not (fboundp 'msdos-long-file-names))  (msdos-long-file-names))
    :help "<span class="quote">Rename marked files to uppercase names</span>"))
(define-key diredp-menu-bar-recursive-marked-menu [diredp-do-move-recursive]
    '(menu-item "<span class="quote">Move to...</span>" diredp-do-move-recursive
      :help "<span class="quote">Move marked files, including in marked subdirs, to a given directory</span>"))
(define-key diredp-menu-bar-recursive-marked-menu [diredp-do-copy-recursive]
    '(menu-item "<span class="quote">Copy to...</span>" diredp-do-copy-recursive
      :help "<span class="quote">Copy marked files, including in marked subdirs, to a given directory</span>"))
(define-key diredp-menu-bar-recursive-marked-menu [separator-rename] '("<span class="quote">--</span>")) <span class="linecomment">; ----------------</span>

(define-key diredp-menu-bar-recursive-marked-menu [diredp-list-marked-recursive]
    '(menu-item "<span class="quote">List Marked Files</span>" diredp-list-marked-recursive
      :help "<span class="quote">List the files marked here and in marked subdirs, recursively</span>"))
(define-key diredp-menu-bar-recursive-marked-menu [diredp-copy-filename-as-kill-recursive]
    '(menu-item "<span class="quote">Copy File Names (to Paste)</span>" diredp-copy-filename-as-kill-recursive
      :help "<span class="quote">Copy names of marked files here and in marked subdirs, to `kill-ring'</span>"))
(define-key diredp-menu-bar-recursive-marked-menu [diredp-insert-subdirs-recursive]
  '(menu-item "<span class="quote">Insert Subdirs</span>" diredp-insert-subdirs-recursive
    :help "<span class="quote">Insert the marked subdirectories, gathered recursively</span>"))
(define-key diredp-menu-bar-recursive-marked-menu [separator-dirs] '("<span class="quote">--</span>")) <span class="linecomment">; ------------------</span>

(define-key diredp-menu-bar-recursive-marked-menu [diredp-do-bookmark-in-bookmark-file-recursive]
    '(menu-item "<span class="quote">Bookmark in Bookmark File</span>" diredp-do-bookmark-in-bookmark-file-recursive
      :help "<span class="quote">Bookmark marked files, including those in marked subdirs, in a bookmark file</span>"))
(define-key diredp-menu-bar-recursive-marked-menu
    [diredp-set-bookmark-file-bookmark-for-marked-recursive]
  '(menu-item "<span class="quote">Create Bookmark-File Bookmark</span>"
    diredp-set-bookmark-file-bookmark-for-marked-recursive
    :help "<span class="quote">Create a bookmark-file bookmark for marked files, including in marked subdirs</span>"))
(define-key diredp-menu-bar-recursive-marked-menu [diredp-do-bookmark-recursive]
    '(menu-item "<span class="quote">Bookmark</span>" diredp-do-bookmark-recursive
      :help "<span class="quote">Bookmark the marked files, including those in marked subdirs</span>"))
(define-key diredp-menu-bar-recursive-marked-menu [separator-bookmark] '("<span class="quote">--</span>")) <span class="linecomment">; --------------</span>

(define-key diredp-menu-bar-recursive-marked-menu [diredp-marked-recursive-other-window]
    '(menu-item "<span class="quote">Dired (Marked) in Other Window</span>" diredp-marked-recursive-other-window
      :help "<span class="quote">Open Dired (in other window) on marked files, including those in marked subdirs</span>"))
(define-key diredp-menu-bar-recursive-marked-menu [diredp-marked-recursive]
    '(menu-item "<span class="quote">Dired (Marked)</span>" diredp-marked-recursive
      :help "<span class="quote">Open Dired on marked files, including those in marked subdirs</span>"))
<span class="linecomment">;; On Windows, bind more.</span>
(eval-after-load "<span class="quote">w32-browser</span>"
  '(define-key diredp-menu-bar-recursive-marked-menu [diredp-multiple-w32-browser-recursive]
    '(menu-item "<span class="quote">Open Associated Windows Apps</span>" diredp-multiple-w32-browser-recursive
      :help "<span class="quote">Run Windows apps for with marked files, including those in marked subdirs</span>")))
(define-key diredp-menu-bar-recursive-marked-menu [diredp-do-find-marked-files-recursive]
    '(menu-item "<span class="quote">Open</span>" diredp-do-find-marked-files-recursive
      :help "<span class="quote">Find marked files simultaneously, including those in marked subdirs</span>"))


<span class="linecomment">;; `Multiple' &gt; `Bookmarks' menu.</span>
<span class="linecomment">;;</span>
(defvar diredp-menu-bar-operate-bookmarks-menu (make-sparse-keymap "<span class="quote">Bookmarks</span>"))
(define-key diredp-menu-bar-operate-menu [bookmark]
  (cons "<span class="quote">Bookmarks</span>" diredp-menu-bar-operate-bookmarks-menu))

(when (require 'bookmark+ nil t)
  (define-key diredp-menu-bar-operate-bookmarks-menu [diredp-do-set-tag-value]
    '(menu-item "<span class="quote">Set Tag Value...</span>" diredp-do-set-tag-value
      :help "<span class="quote">Set the value of a given tag for the marked or next N files</span>"))
  (define-key diredp-menu-bar-operate-bookmarks-menu [diredp-do-paste-replace-tags]
    '(menu-item "<span class="quote">Paste Tags (Replace)</span>" diredp-do-paste-replace-tags
      :help "<span class="quote">Replace tags for the marked or next N files with copied tags</span>"))
  (define-key diredp-menu-bar-operate-bookmarks-menu [diredp-do-paste-add-tags]
    '(menu-item "<span class="quote">Paste Tags (Add)</span>" diredp-do-paste-add-tags
      :help "<span class="quote">Add previously copied tags to the marked or next N files</span>"))
  (define-key diredp-menu-bar-operate-bookmarks-menu [diredp-do-remove-all-tags]
    '(menu-item "<span class="quote">Remove All Tags</span>" diredp-do-remove-all-tags
      :help "<span class="quote">Remove all tags from the marked or next N files</span>"))
  (define-key diredp-menu-bar-operate-bookmarks-menu [diredp-do-untag]
    '(menu-item "<span class="quote">Remove Tags...</span>" diredp-do-untag
      :help "<span class="quote">Remove some tags from the marked or next N files</span>"))
  (define-key diredp-menu-bar-operate-bookmarks-menu [diredp-do-tag]
    '(menu-item "<span class="quote">Add Tags...</span>" diredp-do-tag
      :help "<span class="quote">Add some tags to the marked or next N files</span>"))
  (define-key diredp-menu-bar-operate-bookmarks-menu [separator-book-2] '("<span class="quote">--</span>"))) <span class="linecomment">; ------------</span>

(define-key diredp-menu-bar-operate-bookmarks-menu
    [diredp-do-bookmark-in-bookmark-file-recursive]
  '(menu-item "<span class="quote">Bookmark in Bookmark File (Here and Below)...</span>"
    diredp-do-bookmark-in-bookmark-file-recursive
    :help "<span class="quote">Bookmark marked files (including in marked subdirs) in bookmark file and save it</span>"))
(define-key diredp-menu-bar-operate-bookmarks-menu
    [diredp-set-bookmark-file-bookmark-for-marked-recursive]
  '(menu-item "<span class="quote">Create Bookmark-File Bookmark (Here and Below)...</span>"
    diredp-set-bookmark-file-bookmark-for-marked-recursive
    :help "<span class="quote">Create a bookmark-file bookmark for marked files, including in marked subdirs</span>"))
(define-key diredp-menu-bar-operate-bookmarks-menu [diredp-do-bookmark-recursive]
  '(menu-item "<span class="quote">Bookmark (Here and Below)...</span>" diredp-do-bookmark-recursive
    :help "<span class="quote">Bookmark the marked files, including those in marked subdirs</span>"))
(define-key diredp-menu-bar-operate-bookmarks-menu [separator-book-1] '("<span class="quote">--</span>")) <span class="linecomment">; ---------------</span>

(define-key diredp-menu-bar-operate-bookmarks-menu [diredp-do-bookmark-in-bookmark-file]
  '(menu-item "<span class="quote">Bookmark in Bookmark File...</span>" diredp-do-bookmark-in-bookmark-file
    :help "<span class="quote">Bookmark the marked files in BOOKMARK-FILE and save BOOKMARK-FILE</span>"))
(define-key diredp-menu-bar-operate-bookmarks-menu [diredp-set-bookmark-file-bookmark-for-marked]
  '(menu-item "<span class="quote">Create Bookmark-File Bookmark...</span>" diredp-set-bookmark-file-bookmark-for-marked
    :help "<span class="quote">Create a bookmark-file bookmark, and bookmark the marked files in it</span>"))
(define-key diredp-menu-bar-operate-bookmarks-menu [diredp-do-bookmark]
  '(menu-item "<span class="quote">Bookmark...</span>" diredp-do-bookmark :help "<span class="quote">Bookmark the marked or next N files</span>"))


<span class="linecomment">;; `Regexp' menu.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; REPLACE ORIGINAL `Regexp' menu in `dired.el'.</span>
<span class="linecomment">;;</span>
(defvar diredp-menu-bar-regexp-menu (make-sparse-keymap "<span class="quote">Regexp</span>"))
(define-key dired-mode-map [menu-bar regexp]
  (cons "<span class="quote">Regexp</span>" diredp-menu-bar-regexp-menu))
(define-key diredp-menu-bar-regexp-menu [hardlink]
  '(menu-item "<span class="quote">Hardlink to...</span>" dired-do-hardlink-regexp
    :help "<span class="quote">Make hard links for files matching regexp</span>"))
(if (not (fboundp 'dired-do-relsymlink-regexp))
    (define-key diredp-menu-bar-regexp-menu [symlink]
      '(menu-item "<span class="quote">Symlink to...</span>" dired-do-symlink-regexp
        :visible (fboundp 'make-symbolic-link)
        :help "<span class="quote">Make symbolic links for files matching regexp</span>"))
  (define-key diredp-menu-bar-regexp-menu [symlink]
    '(menu-item "<span class="quote">Symlink to (Absolute)...</span>" dired-do-symlink-regexp
      :visible (fboundp 'make-symbolic-link)
      :help "<span class="quote">Make absolute symbolic links for files matching regexp</span>"))
  (define-key diredp-menu-bar-regexp-menu [relsymlink] <span class="linecomment">; In `dired-x.el'.</span>
    '(menu-item "<span class="quote">Symlink to (Relative)...</span>" dired-do-relsymlink-regexp
      :visible (fboundp 'make-symbolic-link)
      :help "<span class="quote">Make relative symbolic links for files matching regexp</span>")))
(define-key diredp-menu-bar-regexp-menu [rename]
  '(menu-item "<span class="quote">Rename to...</span>" dired-do-rename-regexp :help "<span class="quote">Rename marked files matching regexp</span>"))
(define-key diredp-menu-bar-regexp-menu [copy]
  '(menu-item "<span class="quote">Copy to...</span>" dired-do-copy-regexp :help "<span class="quote">Copy marked files matching regexp</span>"))
(define-key diredp-menu-bar-regexp-menu [flag]
  '(menu-item "<span class="quote">Flag...</span>" dired-flag-files-regexp :help "<span class="quote">Flag files matching regexp for deletion</span>"))
(define-key diredp-menu-bar-regexp-menu [mark]
  '(menu-item "<span class="quote">Mark...</span>" dired-mark-files-regexp
    :help "<span class="quote">Mark files matching regexp for future operations</span>"))
(define-key diredp-menu-bar-regexp-menu [mark-cont]
  '(menu-item "<span class="quote">Mark Containing...</span>" dired-mark-files-containing-regexp
    :help "<span class="quote">Mark files whose contents matches regexp</span>"))


<span class="linecomment">;; "Mark" menu.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; REPLACE ORIGINAL "Mark" menu in `dired.el'.</span>
<span class="linecomment">;;</span>
(defvar diredp-menu-bar-mark-menu (make-sparse-keymap "<span class="quote">Mark</span>"))
(define-key dired-mode-map [menu-bar mark] (cons "<span class="quote">Mark</span>" diredp-menu-bar-mark-menu))

(when (fboundp 'dired-flag-extension)
  (define-key diredp-menu-bar-mark-menu [flag-extension] <span class="linecomment">; In `dired-x.el'</span>
    '(menu-item "<span class="quote">Flag Extension...</span>" dired-flag-extension
      :help "<span class="quote">Flag all files that have a certain extension, for deletion</span>")))
(define-key diredp-menu-bar-mark-menu [garbage-files]
  '(menu-item "<span class="quote">Flag Garbage Files</span>" dired-flag-garbage-files
    :help "<span class="quote">Flag unneeded files for deletion</span>"))
(define-key diredp-menu-bar-mark-menu [backup-files]
  '(menu-item "<span class="quote">Flag Backup Files</span>" dired-flag-backup-files
    :help "<span class="quote">Flag all backup files for deletion</span>"))
(define-key diredp-menu-bar-mark-menu [auto-save-files]
  '(menu-item "<span class="quote">Flag Auto-save Files</span>" dired-flag-auto-save-files
    :help "<span class="quote">Flag auto-save files for deletion</span>"))
(define-key diredp-menu-bar-mark-menu [flag-region]
  '(menu-item "<span class="quote">Flag Region</span>" diredp-flag-region-files-for-deletion
    :enable (and transient-mark-mode  mark-active  (not (eq (mark) (point))))
    :help "<span class="quote">Flag all files in the region (selection) for deletion</span>"))
(when (&lt; emacs-major-version 21)
  (put 'diredp-flag-region-files-for-deletion
       'menu-enable '(and transient-mark-mode  mark-active  (not (eq (mark) (point))))))
(define-key diredp-menu-bar-mark-menu [deletion]
  '(menu-item "<span class="quote">Flag</span>" dired-flag-file-deletion :help "<span class="quote">Flag current line's file for deletion</span>"))
(define-key diredp-menu-bar-mark-menu [separator-flag] '("<span class="quote">--</span>")) <span class="linecomment">; ------------------------------</span>

(define-key diredp-menu-bar-mark-menu [prev]
  '(menu-item "<span class="quote">Previous Marked</span>" dired-prev-marked-file :help "<span class="quote">Move to previous marked file</span>"))
(define-key diredp-menu-bar-mark-menu [next]
  '(menu-item "<span class="quote">Next Marked</span>" dired-next-marked-file :help "<span class="quote">Move to next marked file</span>"))
(define-key diredp-menu-bar-mark-menu [marks]
  '(menu-item "<span class="quote">Change Marks...</span>" dired-change-marks
    :help "<span class="quote">Replace marker with another character</span>"))
(define-key diredp-menu-bar-mark-menu [omit-unmarked]
  '(menu-item "<span class="quote">Omit Unmarked</span>" diredp-omit-unmarked :help "<span class="quote">Hide lines of unmarked files</span>"))
(define-key diredp-menu-bar-mark-menu [omit-marked]
  '(menu-item "<span class="quote">Omit Marked</span>" diredp-omit-marked :help "<span class="quote">Hide lines of marked files</span>"))
(define-key diredp-menu-bar-mark-menu [toggle-marks]
  (if (&gt; emacs-major-version 21)
      '(menu-item "<span class="quote">Toggle Marked/Unmarked</span>" dired-toggle-marks
        :help "<span class="quote">Mark unmarked files, unmark marked ones</span>")
    '(menu-item "<span class="quote">Toggle Marked/Unmarked</span>" dired-do-toggle
      :help "<span class="quote">Mark unmarked files, unmark marked ones</span>")))
(define-key diredp-menu-bar-mark-menu [separator-mark] '("<span class="quote">--</span>")) <span class="linecomment">; ------------------------------</span>

(when (fboundp 'dired-mark-sexp)
  (define-key diredp-menu-bar-mark-menu [mark-sexp] <span class="linecomment">; In `dired-x.el'.</span>
    '(menu-item "<span class="quote">Mark If...</span>" dired-mark-sexp
      :help "<span class="quote">Mark files for which specified condition is true</span>")))
(define-key diredp-menu-bar-mark-menu [mark-extension]
  '(menu-item "<span class="quote">Mark Extension...</span>" diredp-mark/unmark-extension
    :help "<span class="quote">Mark all files with specified extension</span>"))
(define-key diredp-menu-bar-mark-menu [symlinks]
  '(menu-item "<span class="quote">Mark Symlinks</span>" dired-mark-symlinks
    :visible (fboundp 'make-symbolic-link) :help "<span class="quote">Mark all symbolic links</span>"))
(define-key diredp-menu-bar-mark-menu [directories]
  '(menu-item "<span class="quote">Mark Directories</span>" dired-mark-directories
    :help "<span class="quote">Mark all directories except `.' and `..'</span>"))
(define-key diredp-menu-bar-mark-menu [directory]
  '(menu-item "<span class="quote">Mark Old Backups</span>" dired-clean-directory
    :help "<span class="quote">Flag old numbered backups for deletion</span>"))
(define-key diredp-menu-bar-mark-menu [executables]
  '(menu-item "<span class="quote">Mark Executables</span>" dired-mark-executables :help "<span class="quote">Mark all executable files</span>"))
(define-key diredp-menu-bar-mark-menu [mark-region]
  '(menu-item "<span class="quote">Mark Region</span>" diredp-mark-region-files
    :enable (and transient-mark-mode  mark-active  (not (eq (mark) (point))))
    :help "<span class="quote">Mark all of the files in the region (selection)</span>"))
(when (&lt; emacs-major-version 21)
  (put 'diredp-mark-region-files
       'menu-enable '(and transient-mark-mode  mark-active  (not (eq (mark) (point))))))
(define-key diredp-menu-bar-mark-menu [mark]
  '(menu-item "<span class="quote">Mark</span>" dired-mark :help "<span class="quote">Mark current line's file for future operations</span>"))
(define-key diredp-menu-bar-mark-menu [separator-unmark] '("<span class="quote">--</span>")) <span class="linecomment">; ----------------------------</span>

(define-key diredp-menu-bar-mark-menu [unmark-all]
  '(menu-item "<span class="quote">Unmark All</span>" dired-unmark-all-marks :help "<span class="quote">Remove all marks from all files</span>"))
(define-key diredp-menu-bar-mark-menu [unmark-with]
  '(menu-item "<span class="quote">Unmark Marked-With...</span>" dired-unmark-all-files
    :help "<span class="quote">Remove a specific mark (or all marks) from every file</span>"))
(define-key diredp-menu-bar-mark-menu [unmark-region]
  '(menu-item "<span class="quote">Unmark Region</span>" diredp-unmark-region-files
    :enable (and transient-mark-mode  mark-active  (not (eq (mark) (point))))
    :help "<span class="quote">Unmark all files in the region (selection)</span>"))
(when (&lt; emacs-major-version 21)
  (put 'diredp-unmark-region-files
       'menu-enable '(and transient-mark-mode  mark-active  (not (eq (mark) (point))))))
(define-key diredp-menu-bar-mark-menu [unmark]
  '(menu-item "<span class="quote">Unmark</span>" dired-unmark :help "<span class="quote">Unmark or unflag current line's file</span>"))

(when (require 'bookmark+ nil t)
  (defvar diredp-mark-tags-menu (make-sparse-keymap "<span class="quote">Tagged</span>")
    "<span class="quote">`Tags' submenu for Dired menu-bar `Mark' menu.</span>")
  (define-key diredp-menu-bar-mark-menu [mark-tags] (cons "<span class="quote">Tagged</span>" diredp-mark-tags-menu))

  (define-key diredp-mark-tags-menu [diredp-unmark-files-tagged-none]
    '(menu-item "<span class="quote">Unmark Not Tagged with Any...</span>" diredp-unmark-files-tagged-none
      :help "<span class="quote">Unmark files that are not tagged with *any* of the tags you enter</span>"))
  (define-key diredp-mark-tags-menu [diredp-unmark-files-tagged-not-all]
    '(menu-item "<span class="quote">Unmark Not Tagged with All...</span>" diredp-unmark-files-tagged-not-all
      :help "<span class="quote">Unmark files that are not tagged with *all* tags</span>"))
  (define-key diredp-mark-tags-menu [diredp-unmark-files-tagged-some]
    '(menu-item "<span class="quote">Unmark Tagged with Some...</span>" diredp-unmark-files-tagged-some
      :help "<span class="quote">Unmark files that are tagged with at least one of the tags you enter</span>"))
  (define-key diredp-mark-tags-menu [diredp-unmark-files-tagged-all]
    '(menu-item "<span class="quote">Unmark Tagged with All...</span>" diredp-unmark-files-tagged-all
      :help "<span class="quote">Unmark files that are tagged with *each* tag you enter</span>"))
  (define-key diredp-mark-tags-menu [diredp-unmark-files-tagged-regexp]
    '(menu-item "<span class="quote">Unmark Tagged Matching Regexp...</span>" diredp-unmark-files-tagged-regexp
      :help "<span class="quote">Unmark files that have at least one tag that matches a regexp</span>"))

  (define-key diredp-mark-tags-menu [diredp-mark-files-tagged-none]
    '(menu-item "<span class="quote">Mark Not Tagged with Any...</span>" diredp-mark-files-tagged-none
      :help "<span class="quote">Mark files that are not tagged with *any* of the tags you enter</span>"))
  (define-key diredp-mark-tags-menu [diredp-mark-files-tagged-not-all]
    '(menu-item "<span class="quote">Mark Not Tagged with All...</span>" diredp-mark-files-tagged-not-all
      :help "<span class="quote">Mark files that are not tagged with *all* tags</span>"))
  (define-key diredp-mark-tags-menu [diredp-mark-files-tagged-some]
    '(menu-item "<span class="quote">Mark Tagged with Some...</span>" diredp-mark-files-tagged-some
      :help "<span class="quote">Mark files that are tagged with at least one of the tags you enter</span>"))
  (define-key diredp-mark-tags-menu [diredp-mark-files-tagged-all]
    '(menu-item "<span class="quote">Mark Tagged with All...</span>" diredp-mark-files-tagged-all
      :help "<span class="quote">Mark files that are tagged with *each* tag you enter</span>"))
  (define-key diredp-mark-tags-menu [diredp-mark-files-tagged-regexp]
    '(menu-item "<span class="quote">Mark Tagged Matching Regexp...</span>" diredp-mark-files-tagged-regexp
      :help "<span class="quote">Mark files that have at least one tag that matches a regexp</span>")))


<span class="linecomment">;; "Dir" menu.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; REPLACE ORIGINAL "Subdir" menu in `dired.el'.</span>
<span class="linecomment">;;</span>
(defvar diredp-menu-bar-subdir-menu (make-sparse-keymap "<span class="quote">Dir</span>"))
(define-key dired-mode-map [menu-bar subdir]
  (cons "<span class="quote">Dir</span>" diredp-menu-bar-subdir-menu))
(define-key diredp-menu-bar-subdir-menu [hide-all]
  '(menu-item "<span class="quote">Hide/Show All</span>" dired-hide-all
    :help "<span class="quote">Hide all subdirectories, leave only header lines</span>"))
(define-key diredp-menu-bar-subdir-menu [hide-subdir]
  '(menu-item "<span class="quote">Hide/Show Subdir</span>" dired-hide-subdir
    :help "<span class="quote">Hide or unhide current directory listing</span>"))
(define-key diredp-menu-bar-subdir-menu [tree-down]
  '(menu-item "<span class="quote">Tree Down</span>" dired-tree-down :help "<span class="quote">Go to first subdirectory header down the tree</span>"))
(define-key diredp-menu-bar-subdir-menu [tree-up]
  '(menu-item "<span class="quote">Tree Up</span>" dired-tree-up :help "<span class="quote">Go to first subdirectory header up the tree</span>"))
(define-key diredp-menu-bar-subdir-menu [up]
  '(menu-item "<span class="quote">Up Directory</span>" dired-up-directory :help "<span class="quote">Dired the parent directory</span>"))
(define-key diredp-menu-bar-subdir-menu [prev-subdir]
  '(menu-item "<span class="quote">Prev Subdir</span>" dired-prev-subdir :help "<span class="quote">Go to previous subdirectory header line</span>"))
(define-key diredp-menu-bar-subdir-menu [next-subdir]
  '(menu-item "<span class="quote">Next Subdir</span>" dired-next-subdir :help "<span class="quote">Go to next subdirectory header line</span>"))
(define-key diredp-menu-bar-subdir-menu [prev-dirline]
  '(menu-item "<span class="quote">Prev Dirline</span>" dired-prev-dirline :help "<span class="quote">Move to previous directory-file line</span>"))
(define-key diredp-menu-bar-subdir-menu [next-dirline]
  '(menu-item "<span class="quote">Next Dirline</span>" dired-next-dirline :help "<span class="quote">Move to next directory-file line</span>"))
(define-key diredp-menu-bar-subdir-menu [insert]
  '(menu-item "<span class="quote">This Subdir</span>" dired-maybe-insert-subdir
    :help "<span class="quote">Move to subdirectory line or listing</span>"))
(define-key diredp-menu-bar-subdir-menu [separator-subdir] '("<span class="quote">--</span>")) <span class="linecomment">; --------------------------</span>

(when (fboundp 'image-dired-dired-toggle-marked-thumbs) <span class="linecomment">; Emacs 24+</span>
  (define-key diredp-menu-bar-subdir-menu [image-dired-dired-toggle-marked-thumbs]
    '(menu-item "<span class="quote">Toggle Image Thumbnails</span>" image-dired-dired-toggle-marked-thumbs
      :help "<span class="quote">Add or remove image thumbnails in front of marked file names</span>")))
(when (fboundp 'dired-isearch-filenames) <span class="linecomment">; Emacs 23+</span>
  (define-key diredp-menu-bar-subdir-menu [isearch-filenames-regexp]
    '(menu-item "<span class="quote">Isearch Regexp in File Names...</span>" dired-isearch-filenames-regexp
      :help "<span class="quote">Incrementally search for regexp in file names only</span>"))
  (define-key diredp-menu-bar-subdir-menu [isearch-filenames]
    '(menu-item "<span class="quote">Isearch in File Names...</span>" dired-isearch-filenames
      :help "<span class="quote">Incrementally search for literal text in file names only.</span>")))
(when (or (&gt; emacs-major-version 21) (fboundp 'wdired-change-to-wdired-mode))
  (define-key diredp-menu-bar-subdir-menu [wdired-mode]
    '(menu-item "<span class="quote">Edit File Names (WDired)</span>" wdired-change-to-wdired-mode
      :help "<span class="quote">Put a dired buffer in a mode in which filenames are editable</span>"
      :keys "<span class="quote">C-x C-q</span>" :filter (lambda (x) (if (eq major-mode 'dired-mode) x)))))
(when (fboundp 'dired-compare-directories) <span class="linecomment">; Emacs 22+</span>
  (define-key diredp-menu-bar-subdir-menu [compare-directories]
    '(menu-item "<span class="quote">Compare Directories...</span>" dired-compare-directories
      :help "<span class="quote">Mark files with different attributes in two Dired buffers</span>")))
(define-key diredp-menu-bar-subdir-menu [create-directory] <span class="linecomment">; Moved from "Immediate".</span>
  '(menu-item "<span class="quote">New Directory...</span>" dired-create-directory :help "<span class="quote">Create a directory</span>"))
(define-key diredp-menu-bar-subdir-menu [separator-dired-on-set] '("<span class="quote">--</span>")) <span class="linecomment">; --------------------</span>

(define-key diredp-menu-bar-subdir-menu [diredp-dired-inserted-subdirs]
  '(menu-item "<span class="quote">Dired Each Inserted Subdir...</span>" diredp-dired-inserted-subdirs
    :enable (cdr dired-subdir-alist)    <span class="linecomment">; First elt is current dir.  Must have at least one more.</span>
    :help "<span class="quote">Open Dired for each of the inserted subdirectories</span>"))
(define-key diredp-menu-bar-subdir-menu [diredp-dired-union-other-window]
  '(menu-item "<span class="quote">Dired Union...</span>" diredp-dired-union-other-window
    :help "<span class="quote">Open Dired for the union of some existing Dired buffers</span>"))
(define-key diredp-menu-bar-subdir-menu [diredp-fileset]
  '(menu-item "<span class="quote">Dired Fileset...</span>" diredp-fileset
    :enable (&gt; emacs-major-version 21) :help "<span class="quote">Open Dired on an Emacs fileset</span>"))
(define-key diredp-menu-bar-subdir-menu [diredp-marked-other-window]
  '(menu-item "<span class="quote">Dired Marked Files in Other Window</span>" diredp-marked-other-window
    :enable (save-excursion (goto-char (point-min))
                            (and (re-search-forward (dired-marker-regexp) nil t)
                                 (re-search-forward (dired-marker-regexp) nil t)))
    :help "<span class="quote">Open Dired on marked files only, in other window</span>"))
(define-key diredp-menu-bar-subdir-menu [diredp-marked]
  '(menu-item "<span class="quote">Dired Marked Files</span>" diredp-marked
    :enable (save-excursion (goto-char (point-min))
                            (and (re-search-forward (dired-marker-regexp) nil t)
                                 (re-search-forward (dired-marker-regexp) nil t)))
    :help "<span class="quote">Open Dired on marked files only</span>"))
(define-key diredp-menu-bar-subdir-menu [dired]
  '(menu-item "<span class="quote">Dired (Filter via Wildcards)...</span>" dired
    :help "<span class="quote">Explore a directory (you can provide wildcards)</span>"))
(define-key diredp-menu-bar-subdir-menu [revert]
  '(menu-item "<span class="quote">Refresh (Sync \& Show All)</span>" revert-buffer :help "<span class="quote">Update directory contents</span>"))


<span class="linecomment">;;; Mouse-3 menu binding.</span>
(define-key dired-mode-map [down-mouse-3] 'diredp-mouse-3-menu)
(define-key dired-mode-map [mouse-3]      'ignore)


<span class="linecomment">;;; Suggested bindings.</span>
<span class="linecomment">;;; (define-key ctl-x-map   "d" 'diredp-dired-files) ; `C-x d'</span>
<span class="linecomment">;;; (define-key ctl-x-4-map "d" 'diredp-dired-files-other-window) ; `C-x 4 d'</span>


<span class="linecomment">;;; Non-menu Dired bindings.</span>

(define-key dired-mode-map [S-down-mouse-1] 'ignore) <span class="linecomment">; (normally `mouse-set-font')</span>
<span class="linecomment">;; `diredp-mouse-mark-region-files' provides Windows-Explorer behavior</span>
<span class="linecomment">;; for selecting (marking) files.</span>
(define-key dired-mode-map [S-mouse-1] 'diredp-mouse-mark-region-files)     <span class="linecomment">; `S-mouse-1'</span>
(define-key dired-mode-map [mouse-2] 'dired-mouse-find-file-other-window)   <span class="linecomment">; `mouse-2'</span>
(define-key dired-mode-map [S-down-mouse-2] 'diredp-mouse-find-file)        <span class="linecomment">; `S-mouse-2'</span>
(define-key dired-mode-map [S-mouse-2] 'ignore)
(define-key dired-mode-map [M-mouse-2] 'diredp-mouse-find-file-other-frame) <span class="linecomment">; `M-mouse-2'</span>

<span class="linecomment">;; On Windows, bind more.</span>
(eval-after-load "<span class="quote">w32-browser</span>"
  '(progn
    (define-key dired-mode-map [(control return)] 'dired-w32explore)        <span class="linecomment">; `C-RET'</span>
    (define-key dired-mode-map [(meta return)] 'dired-w32-browser)          <span class="linecomment">; `M-RET'</span>
    (define-key dired-mode-map [mouse-2] 'dired-mouse-w32-browser)))        <span class="linecomment">; `mouse-2'</span>

(define-key dired-mode-map "<span class="quote">=</span>"       'diredp-ediff)
<span class="linecomment">;; This replaces the `dired-x.el' binding of `dired-mark-extension'.</span>
(define-key dired-mode-map "<span class="quote">*.</span>"      'diredp-mark/unmark-extension)                 <span class="linecomment">; `* .'</span>
(define-key dired-mode-map [(control meta ?*)] 'diredp-marked-other-window)         <span class="linecomment">; `C-M-*'</span>
(define-key dired-mode-map "<span class="quote">\M-b</span>"    'diredp-do-bookmark)                           <span class="linecomment">; `M-b'</span>
(define-key dired-mode-map "<span class="quote">\C-\M-b</span>" 'diredp-set-bookmark-file-bookmark-for-marked) <span class="linecomment">; `C-M-b'</span>
(define-key dired-mode-map [(control meta shift ?b)]                    <span class="linecomment">; `C-M-B' (aka `C-M-S-b')</span>
  'diredp-do-bookmark-in-bookmark-file)
(define-key dired-mode-map "<span class="quote">\M-g</span>"    'diredp-do-grep)                               <span class="linecomment">; `M-g'</span>
(when (fboundp 'mkhtml-dired-files)
  (define-key dired-mode-map "<span class="quote">\M-h</span>"  'mkhtml-dired-files))                          <span class="linecomment">; `M-h'</span>
(define-key dired-mode-map "<span class="quote">U</span>"       'dired-unmark-all-marks)                       <span class="linecomment">; `U'</span>
(substitute-key-definition 'describe-mode 'diredp-describe-mode                    <span class="linecomment">; `h', `C-h m'</span>
                           dired-mode-map (current-global-map))

<span class="linecomment">;; Tags - same keys as in `*Bookmark List*'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; NOTE: If this changes then need to update `dired-sort-menu+.el' to reflect the changes.</span>
<span class="linecomment">;;</span>
(define-key dired-mode-map "<span class="quote">T</span>"       nil) <span class="linecomment">; For Emacs20</span>
(define-key dired-mode-map "<span class="quote">T+</span>"      'diredp-tag-this-file)                <span class="linecomment">; `T +'</span>
(define-key dired-mode-map "<span class="quote">T-</span>"      'diredp-untag-this-file)              <span class="linecomment">; `T -'</span>
(define-key dired-mode-map "<span class="quote">T0</span>"      'diredp-remove-all-tags-this-file)    <span class="linecomment">; `T 0'</span>
(define-key dired-mode-map "<span class="quote">Tc</span>"      'diredp-copy-tags-this-file)          <span class="linecomment">; `T c'</span>
(define-key dired-mode-map "<span class="quote">Tp</span>"      'diredp-paste-add-tags-this-file)     <span class="linecomment">; `T p'</span>
(define-key dired-mode-map "<span class="quote">Tq</span>"      'diredp-paste-replace-tags-this-file) <span class="linecomment">; `T q'</span>
(define-key dired-mode-map "<span class="quote">Tv</span>"      'diredp-set-tag-value-this-file)      <span class="linecomment">; `T v'</span>
(define-key dired-mode-map "<span class="quote">T\M-w</span>"   'diredp-copy-tags-this-file)          <span class="linecomment">; `T M-w'</span>
(define-key dired-mode-map "<span class="quote">T\C-y</span>"   'diredp-paste-add-tags-this-file)     <span class="linecomment">; `T C-y'</span>
(define-key dired-mode-map "<span class="quote">T&gt;+</span>"     'diredp-do-tag)                       <span class="linecomment">; `T &gt; +'</span>
(define-key dired-mode-map "<span class="quote">T&gt;-</span>"     'diredp-do-untag)                     <span class="linecomment">; `T &gt; -'</span>
(define-key dired-mode-map "<span class="quote">T&gt;0</span>"     'diredp-do-remove-all-tags)           <span class="linecomment">; `T &gt; 0'</span>
(define-key dired-mode-map "<span class="quote">T&gt;p</span>"     'diredp-do-paste-add-tags)            <span class="linecomment">; `T &gt; p'</span>
(define-key dired-mode-map "<span class="quote">T&gt;q</span>"     'diredp-do-paste-replace-tags)        <span class="linecomment">; `T &gt; q'</span>
(define-key dired-mode-map "<span class="quote">T&gt;v</span>"     'diredp-do-set-tag-value)             <span class="linecomment">; `T &gt; v'</span>
(define-key dired-mode-map "<span class="quote">T&gt;\C-y</span>"  'diredp-do-paste-add-tags)            <span class="linecomment">; `T &gt; C-y'</span>
(define-key dired-mode-map "<span class="quote">Tm%</span>"     'diredp-mark-files-tagged-regexp)     <span class="linecomment">; `T m %'</span>
(define-key dired-mode-map "<span class="quote">Tm*</span>"     'diredp-mark-files-tagged-all)        <span class="linecomment">; `T m *'</span>
(define-key dired-mode-map "<span class="quote">Tm+</span>"     'diredp-mark-files-tagged-some)       <span class="linecomment">; `T m +'</span>
(define-key dired-mode-map "<span class="quote">Tm~*</span>"    'diredp-mark-files-tagged-not-all)    <span class="linecomment">; `T m ~ *'</span>
(define-key dired-mode-map "<span class="quote">Tm~+</span>"    'diredp-mark-files-tagged-none)       <span class="linecomment">; `T m ~ +'</span>
(define-key dired-mode-map "<span class="quote">Tu%</span>"     'diredp-unmark-files-tagged-regexp)   <span class="linecomment">; `T u %'</span>
(define-key dired-mode-map "<span class="quote">Tu*</span>"     'diredp-unmark-files-tagged-all)      <span class="linecomment">; `T u *'</span>
(define-key dired-mode-map "<span class="quote">Tu+</span>"     'diredp-unmark-files-tagged-some)     <span class="linecomment">; `T u +'</span>
(define-key dired-mode-map "<span class="quote">Tu~*</span>"    'diredp-unmark-files-tagged-not-all)  <span class="linecomment">; `T u ~ *'</span>
(define-key dired-mode-map "<span class="quote">Tu~+</span>"    'diredp-unmark-files-tagged-none)     <span class="linecomment">; `T u ~ +'</span>
<span class="linecomment">;; $$$$$$ (define-key dired-mode-map [(control ?+)] 'diredp-do-tag)</span>
<span class="linecomment">;; $$$$$$ (define-key dired-mode-map [(control ?-)] 'diredp-do-untag)</span>


<span class="linecomment">;; Commands for operating on the current line's file.  When possible,</span>
<span class="linecomment">;; these are lower-case versions of the upper-case commands for operating on</span>
<span class="linecomment">;; the marked files.  (Most of the other corresponding lower-case letters are already</span>
<span class="linecomment">;; defined and cannot be used here.)</span>

<span class="linecomment">;; $$$$$$ (define-key dired-mode-map [(control meta ?+)] 'diredp-tag-this-file)</span>
<span class="linecomment">;; $$$$$$ (define-key dired-mode-map [(control meta ?-)] 'diredp-untag-this-file)</span>
(define-key dired-mode-map "<span class="quote">\r</span>"      'dired-find-file)                      <span class="linecomment">; `RET'</span>
(define-key dired-mode-map (kbd "<span class="quote">C-h RET</span>")        'diredp-describe-file)    <span class="linecomment">; `C-h RET'</span>
(define-key dired-mode-map (kbd "<span class="quote">C-h C-&lt;return&gt;</span>") 'diredp-describe-file)    <span class="linecomment">; `C-h C-RET'</span>
(define-key dired-mode-map "<span class="quote">%c</span>"      'diredp-capitalize)                    <span class="linecomment">; `% c'</span>
(define-key dired-mode-map "<span class="quote">b</span>"       'diredp-byte-compile-this-file)        <span class="linecomment">; `b'</span>
(define-key dired-mode-map [(control shift ?b)] 'diredp-bookmark-this-file) <span class="linecomment">; `C-B'</span>
(define-key dired-mode-map "<span class="quote">\M-c</span>"    'diredp-capitalize-this-file)          <span class="linecomment">; `M-c'</span>
(when (fboundp 'diredp-chgrp-this-file)
  (define-key dired-mode-map [(control meta shift ?g)] 'diredp-chgrp-this-file)) <span class="linecomment">; `C-M-G'</span>
(define-key dired-mode-map "<span class="quote">\M-i</span>"    'diredp-insert-subdirs)                <span class="linecomment">; `M-i'</span>
(define-key dired-mode-map "<span class="quote">\M-l</span>"    'diredp-downcase-this-file)            <span class="linecomment">; `M-l'</span>
(define-key dired-mode-map [(meta shift ?m)] 'diredp-chmod-this-file)       <span class="linecomment">; `M-M'</span>
(define-key dired-mode-map "<span class="quote">\C-o</span>"    'diredp-find-file-other-frame)         <span class="linecomment">; `C-o'</span>
(when (fboundp 'diredp-chown-this-file)
  (define-key dired-mode-map [(meta shift ?o)] 'diredp-chown-this-file))    <span class="linecomment">; `M-O'</span>
(define-key dired-mode-map "<span class="quote">\C-\M-o</span>" 'dired-display-file)                   <span class="linecomment">; `C-M-o' (not `C-o')</span>
(define-key dired-mode-map "<span class="quote">\M-p</span>"    'diredp-print-this-file)               <span class="linecomment">; `M-p'</span>
(define-key dired-mode-map "<span class="quote">r</span>"       'diredp-rename-this-file)              <span class="linecomment">; `r'</span>
(define-key dired-mode-map [(meta shift ?t)] 'diredp-touch-this-file)       <span class="linecomment">; `M-T'</span>
(define-key dired-mode-map [(control meta shift ?t)] 'dired-do-touch)       <span class="linecomment">; `C-M-T'</span>
(define-key dired-mode-map "<span class="quote">\M-u</span>"    'diredp-upcase-this-file)              <span class="linecomment">; `M-u'</span>
(define-key dired-mode-map "<span class="quote">y</span>"       'diredp-relsymlink-this-file)          <span class="linecomment">; `y'</span>
(define-key dired-mode-map "<span class="quote">z</span>"       'diredp-compress-this-file)            <span class="linecomment">; `z'</span>
(when (fboundp 'dired-show-file-type)
  (define-key dired-mode-map "<span class="quote">_</span>"      'dired-show-file-type))               <span class="linecomment">; `_' (underscore)</span>
(substitute-key-definition 'kill-line 'diredp-delete-this-file              <span class="linecomment">; `C-k', `delete'</span>
                           dired-mode-map (current-global-map))


<span class="linecomment">;; Commands that handle marked below, recursively.</span>
<span class="linecomment">;; Use `M-+' as a prefix key for all such commands.</span>

(define-prefix-command 'diredp-recursive-map)
(define-key dired-mode-map "<span class="quote">\M-+</span>"  diredp-recursive-map) <span class="linecomment">; `M-+'</span>

(when (&gt; emacs-major-version 22)
  (define-key diredp-recursive-map "<span class="quote">:d</span>"        'diredp-do-decrypt-recursive)            <span class="linecomment">; `: d'</span>
  (define-key diredp-recursive-map "<span class="quote">:e</span>"        'diredp-do-encrypt-recursive)            <span class="linecomment">; `: e'</span>
  (define-key diredp-recursive-map "<span class="quote">:s</span>"        'diredp-do-sign-recursive)               <span class="linecomment">; `: s'</span>
  (define-key diredp-recursive-map "<span class="quote">:v</span>"        'diredp-do-verify-recursive)             <span class="linecomment">; `: v'</span>
  )
(define-key diredp-recursive-map "<span class="quote">%c</span>"          'diredp-capitalize-recursive)            <span class="linecomment">; `% c'</span>
(define-key diredp-recursive-map "<span class="quote">%l</span>"          'diredp-downcase-recursive)              <span class="linecomment">; `% l'</span>
(define-key diredp-recursive-map "<span class="quote">%u</span>"          'diredp-upcase-recursive)                <span class="linecomment">; `% u'</span>
(define-key diredp-recursive-map "<span class="quote">!</span>"           'diredp-do-shell-command-recursive)      <span class="linecomment">; `!'</span>
(define-key diredp-recursive-map (kbd "<span class="quote">C-M-*</span>") 'diredp-marked-recursive-other-window)   <span class="linecomment">; `C-M-*'</span>
(define-key diredp-recursive-map "<span class="quote">A</span>"           'diredp-do-search-recursive)             <span class="linecomment">; `A'</span>
(define-key diredp-recursive-map "<span class="quote">\M-b</span>"        'diredp-do-bookmark-recursive)           <span class="linecomment">; `M-b'</span>
(define-key diredp-recursive-map (kbd "<span class="quote">C-M-b</span>")                                          <span class="linecomment">; `C-M-b'</span>
  'diredp-set-bookmark-file-bookmark-for-marked-recursive)
(define-key diredp-recursive-map [(control meta shift ?b)]                              <span class="linecomment">; `C-M-B'</span>
  'diredp-do-bookmark-in-bookmark-file-recursive)
(define-key diredp-recursive-map "<span class="quote">C</span>"           'diredp-do-copy-recursive)               <span class="linecomment">; `C'</span>
(define-key diredp-recursive-map "<span class="quote">F</span>"           'diredp-do-find-marked-files-recursive)  <span class="linecomment">; `F'</span>
(when (fboundp 'diredp-do-chgrp-recursive)
  (define-key diredp-recursive-map "<span class="quote">G</span>"         'diredp-do-chgrp-recursive))             <span class="linecomment">; `G'</span>
(define-key diredp-recursive-map "<span class="quote">\M-g</span>"        'diredp-do-grep-recursive)               <span class="linecomment">; `M-g'</span>
(define-key diredp-recursive-map "<span class="quote">H</span>"           'diredp-do-hardlink-recursive)           <span class="linecomment">; `H'</span>
(define-key diredp-recursive-map "<span class="quote">\M-i</span>"        'diredp-insert-subdirs-recursive)        <span class="linecomment">; `M-i'</span>
(define-key diredp-recursive-map "<span class="quote">l</span>"           'diredp-list-marked-recursive)           <span class="linecomment">; `l'</span>
(define-key diredp-recursive-map "<span class="quote">M</span>"           'diredp-do-chmod-recursive)              <span class="linecomment">; `M'</span>
(when (fboundp 'diredp-do-chown-recursive)
  (define-key diredp-recursive-map "<span class="quote">O</span>"         'diredp-do-chown-recursive))             <span class="linecomment">; `O'</span>
(define-key diredp-recursive-map "<span class="quote">P</span>"           'diredp-do-print-recursive)              <span class="linecomment">; `P'</span>
(define-key diredp-recursive-map "<span class="quote">Q</span>"         'diredp-do-query-replace-regexp-recursive) <span class="linecomment">; `Q'</span>
(define-key diredp-recursive-map "<span class="quote">R</span>"           'diredp-do-move-recursive)               <span class="linecomment">; `R'</span>
(define-key diredp-recursive-map "<span class="quote">S</span>"           'diredp-do-symlink-recursive)            <span class="linecomment">; `S'</span>
(define-key diredp-recursive-map (kbd "<span class="quote">M-s a C-s</span>")                                <span class="linecomment">; `M-s a C-s'</span>
  'diredp-do-isearch-recursive)
(define-key diredp-recursive-map (kbd "<span class="quote">M-s a C-M-s</span>")                              <span class="linecomment">; `M-s a C-M-s'</span>
  'diredp-do-isearch-regexp-recursive)
(define-key diredp-recursive-map [(control meta shift ?t)] 'diredp-do-touch-recursive)  <span class="linecomment">; `C-M-T'</span>
(define-key diredp-recursive-map "<span class="quote">\C-tc</span>"   'diredp-image-dired-comment-files-recursive) <span class="linecomment">; `C-t c'</span>
(define-key diredp-recursive-map "<span class="quote">\C-td</span>"  'diredp-image-dired-display-thumbs-recursive) <span class="linecomment">; `C-t d'</span>
(define-key diredp-recursive-map "<span class="quote">\C-tr</span>"      'diredp-image-dired-delete-tag-recursive) <span class="linecomment">; `C-t r'</span>
(define-key diredp-recursive-map "<span class="quote">\C-tt</span>"       'diredp-image-dired-tag-files-recursive) <span class="linecomment">; `C-t t'</span>
(define-key diredp-recursive-map "<span class="quote">\M-w</span>"        'diredp-copy-filename-as-kill-recursive) <span class="linecomment">; `M-w'</span>
(define-key diredp-recursive-map "<span class="quote">Y</span>"           'diredp-do-relsymlink-recursive)         <span class="linecomment">; `Y'</span>


<span class="linecomment">;; Undefine some bindings that would try to modify a Dired buffer.  Their key sequences will</span>
<span class="linecomment">;; then appear to the user as available for local (Dired) definition.</span>
(when (fboundp 'undefine-killer-commands) (undefine-killer-commands dired-mode-map))


(defgroup Dired-Plus nil
  "<span class="quote">Various enhancements to Dired.</span>"
  :prefix "<span class="quote">diredp-</span>" :group 'dired
  :link `(url-link :tag "<span class="quote">Send Bug Report</span>"
          ,(concat "<span class="quote">mailto:</span>" "<span class="quote">drew.adams</span>" "<span class="quote">@</span>" "<span class="quote">oracle</span>" "<span class="quote">.com?subject=\
dired+.el bug: \
&body=Describe bug here, starting with `emacs -q'.  \
Don't forget to mention your Emacs and library versions.</span>"))
  :link '(url-link :tag "<span class="quote">Other Libraries by Drew</span>"
          "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/DrewsElispLibraries</span>")
  :link '(url-link :tag "<span class="quote">Download</span>"
          "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/dired+.el</span>")
  :link '(url-link :tag "<span class="quote">Description</span>"
          "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/DiredPlus</span>")
  :link '(emacs-commentary-link :tag "<span class="quote">Commentary</span>" "<span class="quote">dired+</span>"))

 
<span class="linecomment">;;; Face Definitions</span>

<span class="linecomment">;;; Miscellaneous faces.</span>
(defface diredp-display-msg
    '((((background dark)) (:foreground "<span class="quote">Yellow</span>"))
      (t                   (:foreground "<span class="quote">Blue</span>")))
  "<span class="quote">*Face used for message display.</span>"
  :group 'Dired-Plus)
(defvar diredp-display-msg 'diredp-display-msg)

<span class="linecomment">;;; Faces used to fontify buffer when using second level of fontifying.</span>
(defface diredp-dir-heading
    '((((background dark)) (:foreground "<span class="quote">Yellow</span>" :background "<span class="quote">#00003F3F3434</span>")) <span class="linecomment">; ~ dark green</span>
      (t                   (:foreground "<span class="quote">Blue</span>" :background "<span class="quote">Pink</span>")))
  "<span class="quote">*Face used for directory headings in dired buffers.</span>"
  :group 'Dired-Plus :group 'font-lock-highlighting-faces)
(defvar diredp-dir-heading 'diredp-dir-heading)

(defface diredp-deletion
    '((t (:foreground "<span class="quote">Yellow</span>" :background "<span class="quote">Red</span>")))
  "<span class="quote">*Face used for deletion flags (D) in dired buffers.</span>"
  :group 'Dired-Plus :group 'font-lock-highlighting-faces)
(defvar diredp-deletion 'diredp-deletion)

(defface diredp-deletion-file-name
    '((t (:foreground "<span class="quote">Red</span>")))
  "<span class="quote">*Face used for names of deleted files in dired buffers.</span>"
  :group 'Dired-Plus :group 'font-lock-highlighting-faces)
(defvar diredp-deletion-file-name 'diredp-deletion-file-name)

(defface diredp-flag-mark
    '((((background dark)) (:foreground "<span class="quote">Blue</span>" :background "<span class="quote">#7575D4D41D1D</span>")) <span class="linecomment">; ~ olive green</span>
      (t                   (:foreground "<span class="quote">Yellow</span>" :background "<span class="quote">Blueviolet</span>")))
  "<span class="quote">*Face used for flags and marks (except D) in dired buffers.</span>"
  :group 'Dired-Plus :group 'font-lock-highlighting-faces)
(defvar diredp-flag-mark 'diredp-flag-mark)

(defface diredp-flag-mark-line
    '((((background dark)) (:background "<span class="quote">#787831311414</span>")) <span class="linecomment">; ~ dark red brown</span>
      (t                   (:background "<span class="quote">Skyblue</span>")))
  "<span class="quote">*Face used for flagged and marked lines in dired buffers.</span>"
  :group 'Dired-Plus :group 'font-lock-highlighting-faces)
(defvar diredp-flag-mark-line 'diredp-flag-mark-line)

(defface diredp-file-suffix
    '((((background dark)) (:foreground "<span class="quote">#7474FFFF7474</span>")) <span class="linecomment">; ~ light green</span>
      (t                   (:foreground "<span class="quote">DarkMagenta</span>")))
  "<span class="quote">*Face used for file suffixes in dired buffers.</span>"
  :group 'Dired-Plus :group 'font-lock-highlighting-faces)
(defvar diredp-file-suffix 'diredp-file-suffix)

(defface diredp-number
    '((((background dark)) (:foreground "<span class="quote">#FFFFFFFF7474</span>")) <span class="linecomment">; ~ light yellow</span>
      (t                   (:foreground "<span class="quote">DarkBlue</span>")))
  "<span class="quote">*Face used for numerical fields in dired buffers.
In particular, inode number, number of hard links, and file size.</span>"
  :group 'Dired-Plus :group 'font-lock-highlighting-faces)
(defvar diredp-number 'diredp-number)

(defface diredp-symlink
    '((((background dark)) (:foreground "<span class="quote">#00007373FFFF</span>")) <span class="linecomment">; ~ blue</span>
      (t                   (:foreground "<span class="quote">DarkOrange</span>")))
  "<span class="quote">*Face used for symbolic links in dired buffers.</span>"
  :group 'Dired-Plus :group 'font-lock-highlighting-faces)
(defvar diredp-symlink 'diredp-symlink)

(defface diredp-date-time
    '((((background dark)) (:foreground "<span class="quote">#74749A9AF7F7</span>")) <span class="linecomment">; ~ med blue</span>
      (t                   (:foreground "<span class="quote">DarkGoldenrod4</span>")))
  "<span class="quote">*Face used for date and time in dired buffers.</span>"
  :group 'Dired-Plus :group 'font-lock-highlighting-faces)
(defvar diredp-date-time 'diredp-date-time)

(defface diredp-file-name
    '((((background dark)) (:foreground "<span class="quote">Yellow</span>"))
      (t                   (:foreground "<span class="quote">Blue</span>")))
  "<span class="quote">*Face used for file names (without suffixes) in dired buffers.</span>"
  :group 'Dired-Plus :group 'font-lock-highlighting-faces)
(defvar diredp-file-name 'diredp-file-name)

(defface diredp-ignored-file-name
    '(<span class="linecomment">;; (((background dark)) (:foreground "#FFFF921F921F")) ; ~ salmon</span>
      <span class="linecomment">;; (((background dark)) (:foreground "#A71F5F645F64")) ; ~ dark salmon</span>
      (((background dark)) (:foreground "<span class="quote">#C29D6F156F15</span>")) <span class="linecomment">; ~ salmon</span>
      (t                   (:foreground "<span class="quote">#00006DE06DE0</span>")))                  <span class="linecomment">; ~ dark cyan</span>
  "<span class="quote">*Face used for ignored file names  in dired buffers.</span>"
  :group 'Dired-Plus :group 'font-lock-highlighting-faces)
(defvar diredp-ignored-file-name 'diredp-ignored-file-name)

(defface diredp-compressed-file-suffix
    '((((background dark)) (:foreground "<span class="quote">Blue</span>"))
      (t                   (:foreground "<span class="quote">Yellow</span>")))
  "<span class="quote">*Face used for compressed file suffixes in dired buffers.</span>"
  :group 'Dired-Plus :group 'font-lock-highlighting-faces)
(defvar diredp-compressed-file-suffix 'diredp-compressed-file-suffix)

<span class="linecomment">;; For this to show up, you need `F' among the options in `dired-listing-switches'.</span>
<span class="linecomment">;; For example, I use "-alF" for `dired-listing-switches'.</span>
(defface diredp-executable-tag
    '((t (:foreground "<span class="quote">Red</span>")))
  "<span class="quote">*Face used for executable tag (*) on file names in dired buffers.</span>"
  :group 'Dired-Plus :group 'font-lock-highlighting-faces)
(defvar diredp-executable-tag 'diredp-executable-tag)

(defface diredp-dir-priv
    '((((background dark))
       (:foreground "<span class="quote">#7474FFFFFFFF</span>" :background "<span class="quote">#2C2C2C2C2C2C</span>")) <span class="linecomment">; ~ cyan, dark gray</span>
      (t (:foreground "<span class="quote">DarkRed</span>" :background "<span class="quote">LightGray</span>")))
  "<span class="quote">*Face used for directory privilege indicator (d) in dired buffers.</span>"
  :group 'Dired-Plus :group 'font-lock-highlighting-faces)
(defvar diredp-dir-priv 'diredp-dir-priv)

(defface diredp-exec-priv
    '((((background dark)) (:background "<span class="quote">#4F4F3B3B2121</span>")) <span class="linecomment">; ~ dark brown</span>
      (t                   (:background "<span class="quote">LightSteelBlue</span>")))
  "<span class="quote">*Face used for execute privilege indicator (x) in dired buffers.</span>"
  :group 'Dired-Plus :group 'font-lock-highlighting-faces)
(defvar diredp-exec-priv 'diredp-exec-priv)

(defface diredp-other-priv
    '((((background dark)) (:background "<span class="quote">#111117175555</span>")) <span class="linecomment">; ~ dark blue</span>
      (t                   (:background "<span class="quote">PaleGoldenrod</span>")))
  "<span class="quote">*Face used for l,s,S,t,T privilege indicators in dired buffers.</span>"
  :group 'Dired-Plus :group 'font-lock-highlighting-faces)
(defvar diredp-other-priv 'diredp-other-priv)

(defface diredp-write-priv
    '((((background dark)) (:background "<span class="quote">#25258F8F2929</span>")) <span class="linecomment">; ~ dark green</span>
      (t                   (:background "<span class="quote">Orchid</span>")))
  "<span class="quote">*Face used for write privilege indicator (w) in dired buffers.</span>"
  :group 'Dired-Plus :group 'font-lock-highlighting-faces)
(defvar diredp-write-priv 'diredp-write-priv)

(defface diredp-read-priv
    '((((background dark)) (:background "<span class="quote">#999932325555</span>")) <span class="linecomment">; ~ burgundy / dark magenta</span>
      (t                   (:background "<span class="quote">MediumAquamarine</span>")))
  "<span class="quote">*Face used for read privilege indicator (w) in dired buffers.</span>"
  :group 'Dired-Plus :group 'font-lock-highlighting-faces)
(defvar diredp-read-priv 'diredp-read-priv)

(defface diredp-no-priv
    '((((background dark)) (:background "<span class="quote">#2C2C2C2C2C2C</span>")) <span class="linecomment">; ~ dark gray</span>
      (t                   (:background "<span class="quote">LightGray</span>")))
  "<span class="quote">*Face used for no privilege indicator (-) in dired buffers.</span>"
  :group 'Dired-Plus :group 'font-lock-highlighting-faces)
(defvar diredp-no-priv 'diredp-no-priv)

(defface diredp-rare-priv
    '((((background dark)) (:foreground "<span class="quote">Green</span>" :background "<span class="quote">#FFFF00008080</span>")) <span class="linecomment">; ~ hot pink</span>
      (t                   (:foreground "<span class="quote">Magenta</span>" :background "<span class="quote">SpringGreen</span>")))
  "<span class="quote">*Face used for rare privilege indicators (b,c,s,m,p,S) in dired buffers.</span>"
  :group 'Dired-Plus :group 'font-lock-highlighting-faces)
(defvar diredp-rare-priv 'diredp-rare-priv)

(defface diredp-link-priv
    '((((background dark)) (:foreground "<span class="quote">#00007373FFFF</span>")) <span class="linecomment">; ~ blue</span>
      (t                   (:foreground "<span class="quote">DarkOrange</span>")))
  "<span class="quote">*Face used for link privilege indicator (l) in dired buffers.</span>"
  :group 'Dired-Plus :group 'font-lock-highlighting-faces)
(defvar diredp-link-priv 'diredp-link-priv)

<span class="linecomment">;; Fix Emacs 20 recognition of fields up through file name when size is expressed using `k' etc.</span>
(when (and (&lt; emacs-major-version 21)  (not (boundp 'diredp-loaded-p))
           dired-move-to-filename-regexp <span class="linecomment">; These last two checks are just in case.</span>
           (eq (aref dired-move-to-filename-regexp 7) ?\  ))
  (setq dired-move-to-filename-regexp  (concat "<span class="quote">[0-9][BkKMGTPEZY]?</span>"
                                               (substring dired-move-to-filename-regexp 7))))

<span class="linecomment">;;; Define second level of fontifying.</span>
(defvar diredp-font-lock-keywords-1
  (list
   '("<span class="quote">^  \\(.+:\\)$</span>" 1 diredp-dir-heading) <span class="linecomment">; Directory headers</span>
   '("<span class="quote">^  wildcard.*$</span>" 0 'default)       <span class="linecomment">; Override others, e.g. `l' for `diredp-other-priv'.</span>
   '("<span class="quote">^  (No match).*$</span>" 0 'default)     <span class="linecomment">; Override others, e.g. `t' for `diredp-other-priv'.</span>
   '("<span class="quote">[^ .]\\.\\([^. /]+\\)$</span>" 1 diredp-file-suffix) <span class="linecomment">; Suffix</span>
   '("<span class="quote">\\([^ ]+\\) -&gt; [^ ]+$</span>" 1 diredp-symlink) <span class="linecomment">; Symbolic links</span>

   <span class="linecomment">;; 1) Date/time and 2) filename w/o suffix.</span>
   <span class="linecomment">;;    This is a bear, and it is fragile - Emacs can change `dired-move-to-filename-regexp'.</span>
   (if (or (not (fboundp 'version&lt;)) (version&lt; emacs-version "<span class="quote">23.2</span>"))
       (list dired-move-to-filename-regexp
             (list 1 'diredp-date-time t t) <span class="linecomment">; Date/time</span>
             (list "<span class="quote">\\(.+\\)$</span>" nil nil (list 0 diredp-file-name 'keep t))) <span class="linecomment">; Filename</span>
     (list dired-move-to-filename-regexp
           (list 7 'diredp-date-time t t) <span class="linecomment">; Date/time, locale (western or eastern)</span>
           (list 2 'diredp-date-time t t) <span class="linecomment">; Date/time, ISO</span>
           (list "<span class="quote">\\(.+\\)$</span>" nil nil (list 0 diredp-file-name 'keep t)))) <span class="linecomment">; Filename</span>

   <span class="linecomment">;; Files to ignore</span>
   (list (concat "<span class="quote">^  \\(.*\\(</span>" (concat (mapconcat 'regexp-quote
                                                  (or (and (boundp 'dired-omit-extensions)
                                                           dired-omit-extensions)
                                                      completion-ignored-extensions)
                                                  "<span class="quote">[*]?\\|</span>")
                                       "<span class="quote">[*]?</span>")        <span class="linecomment">; Allow for executable flag (*).</span>
                 "<span class="quote">\\|\\.\\(g?z\\|Z\\)[*]?\\)\\)$</span>") <span class="linecomment">; Compressed.</span>
         1 diredp-ignored-file-name t)
   '("<span class="quote">[^ .]\\.\\([bg]?[zZ]2?\\)[*]?$</span>" 1 diredp-compressed-file-suffix t) <span class="linecomment">; Compressed (*.z)</span>
   '("<span class="quote">\\([*]\\)$</span>" 1 diredp-executable-tag t) <span class="linecomment">; Executable (*)</span>
   <span class="linecomment">;; Inode, hard-links, & file size (. and , are for the decimal point, depending on locale)</span>
   <span class="linecomment">;; See comment for `directory-listing-before-filename-regexp' in `files.el' or `files+.el'.</span>
   '("<span class="quote">\\(\\([0-9]+\\([.,][0-9]+\\)?\\)[BkKMGTPEZY]? \\)</span>" 1 diredp-number)

   <span class="linecomment">;; Directory names</span>
   (list "<span class="quote">^..\\([0-9]* \\)*d</span>"
         (list dired-move-to-filename-regexp nil nil)
         (list "<span class="quote">\\(.+\\)</span>" nil nil '(0 diredp-dir-priv t t)))
   '("<span class="quote">^..\\([0-9]* \\)*.........\\(x\\)</span>" 2 diredp-exec-priv) <span class="linecomment">;o x</span>
   '("<span class="quote">^..\\([0-9]* \\)*.........\\([lsStT]\\)</span>" 2 diredp-other-priv) <span class="linecomment">; o misc</span>
   '("<span class="quote">^..\\([0-9]* \\)*........\\(w\\)</span>" 2 diredp-write-priv) <span class="linecomment">; o w</span>
   '("<span class="quote">^..\\([0-9]* \\)*.......\\(r\\)</span>" 2 diredp-read-priv) <span class="linecomment">; o r</span>
   '("<span class="quote">^..\\([0-9]* \\)*......\\(x\\)</span>" 2 diredp-exec-priv) <span class="linecomment">; g x</span>
   '("<span class="quote">^..\\([0-9]* \\)*....[^0-9].\\([lsStT]\\)</span>" 2 diredp-other-priv) <span class="linecomment">; g misc</span>
   '("<span class="quote">^..\\([0-9]* \\)*.....\\(w\\)</span>" 2 diredp-write-priv) <span class="linecomment">; g w</span>
   '("<span class="quote">^..\\([0-9]* \\)*....\\(r\\)</span>" 2 diredp-read-priv) <span class="linecomment">; g r</span>
   '("<span class="quote">^..\\([0-9]* \\)*...\\(x\\)</span>" 2 diredp-exec-priv) <span class="linecomment">; u x</span>
   '("<span class="quote">^..\\([0-9]* \\)*...\\([lsStT]\\)</span>" 2 diredp-other-priv) <span class="linecomment">; u misc</span>
   '("<span class="quote">^..\\([0-9]* \\)*..\\(w\\)</span>" 2 diredp-write-priv) <span class="linecomment">; u w</span>
   '("<span class="quote">^..\\([0-9]* \\)*.\\(r\\)</span>" 2 diredp-read-priv) <span class="linecomment">; u r</span>
   '("<span class="quote">^..\\([0-9]* \\)*.\\([-rwxlsStT]+\\)</span>" 2 diredp-no-priv keep) <span class="linecomment">;-</span>
   '("<span class="quote">^..\\([0-9]* \\)*\\([bcsmpS]\\)[-rwxlsStT]</span>" 2 diredp-rare-priv) <span class="linecomment">; (rare)</span>
   '("<span class="quote">^..\\([0-9]* \\)*\\(l\\)[-rwxlsStT]</span>" 2 diredp-link-priv) <span class="linecomment">; l</span>
   (list (concat "<span class="quote">^\\([^\n </span>" (char-to-string dired-del-marker) "<span class="quote">].*$\\)</span>")
         1 diredp-flag-mark-line t)     <span class="linecomment">; Flag/mark lines</span>
   (list (concat "<span class="quote">^\\([</span>" (char-to-string dired-del-marker) "<span class="quote">]\\)</span>") <span class="linecomment">; Deletion flags (D)</span>
         '(1 diredp-deletion t)
         '("<span class="quote">.+</span>" (dired-move-to-filename) nil (0 diredp-deletion-file-name t)))
   (list (concat "<span class="quote">^\\([^\n </span>" (char-to-string dired-del-marker) "<span class="quote">]\\)</span>") <span class="linecomment">; Flags, marks (except D)</span>
         1 diredp-flag-mark t)
   ) "<span class="quote">2nd level of Dired highlighting.  See `font-lock-maximum-decoration'.</span>")


<span class="linecomment">;;; Provide for the second level of fontifying.</span>
(add-hook 'dired-mode-hook
          (lambda ()
            (set (make-local-variable 'font-lock-defaults)
                 <span class="linecomment">;; Two levels.  Use 3-element list, since it is standard to have one more</span>
                 <span class="linecomment">;; than the number of levels.  This is necessary for it to work with</span>
                 <span class="linecomment">;; font-menus(-da).el.</span>
                 '((dired-font-lock-keywords
                    dired-font-lock-keywords
                    diredp-font-lock-keywords-1)
                   t nil nil beginning-of-line))
            <span class="linecomment">;; Refresh `font-lock-keywords' from `font-lock-defaults'</span>
            (when (fboundp 'font-lock-refresh-defaults) (font-lock-refresh-defaults))))
 
<span class="linecomment">;;; Function Definitions</span>

<span class="linecomment">;;;###autoload</span>
(defun diredp-dired-files (arg &optional switches) <span class="linecomment">; Not bound</span>
  "<span class="quote">Like `dired', but non-positive prefix arg prompts for files to list.
This is like `dired' unless you use a non-positive prefix arg.
In that case, you are prompted for names of files and directories to
list, and then you are prompted for the name of the Dired buffer that
lists them.  Use `C-g' when you are done entering file names to list.

In all cases, when inputting a file or directory name you can use
shell wildcards.

If you use Icicles, then in Icicle mode the following keys are bound
in the minibuffer during completion (`*' means the key requires
library `Bookmark+'):

  M-|       - Open Dired on the file names matching your input
  C-c +     - Create a new directory
 *C-x a +   - Add tags to the current-candidate file
 *C-x a -   - Remove tags from the current-candidate file
 *C-x m     - Access file bookmarks (not just autofiles)</span>"
  (interactive (diredp-dired-files-interactive-spec "<span class="quote"></span>"))
  (when (consp arg)
    (let ((buf  (dired-find-buffer-nocreate (car arg)))) <span class="linecomment">; Respect file list.</span>
      (when buf (kill-buffer buf))))
  (switch-to-buffer (dired-noselect arg switches)))

<span class="linecomment">;;;###autoload</span>
(defun diredp-dired-files-other-window (arg &optional switches) <span class="linecomment">; Not bound</span>
  "<span class="quote">Same as `diredp-dired-files' except uses another window.</span>"
  (interactive (diredp-dired-files-interactive-spec "<span class="quote">in other window </span>"))
  (when (consp arg)
    (let ((buf  (dired-find-buffer-nocreate (car arg)))) <span class="linecomment">; Respect file list.</span>
      (when buf (kill-buffer buf))))
  (dired-other-window arg switches))

<span class="linecomment">;;;###autoload</span>
(defun diredp-dired-for-files (arg &optional switches) <span class="linecomment">; Not bound</span>
  "<span class="quote">Like `dired', but prompts for the specific files to list.
You are prompted for names of files and directories to list, and then
you are prompted for the name of the Dired buffer that lists them.
Use `C-g' when you are done entering file names to list.

In all cases, when inputting a file or directory name you can use
shell wildcards.

If you use Icicles, then in Icicle mode the following keys are bound
in the minibuffer during completion (`*' means the key requires
library `Bookmark+'):

  M-|       - Open Dired on the file names matching your input
  C-c +     - Create a new directory
 *C-x a +   - Add tags to the current-candidate file
 *C-x a -   - Remove tags from the current-candidate file
 *C-x m     - Access file bookmarks (not just autofiles)</span>"
  (interactive
   (let ((current-prefix-arg  -1))
     (diredp-dired-files-interactive-spec "<span class="quote">in other window </span>")))
  (diredp-dired-files-other-window arg switches))

<span class="linecomment">;;;###autoload</span>
(defun diredp-dired-for-files-other-window (arg &optional switches) <span class="linecomment">; Not bound</span>
  "<span class="quote">Same as `diredp-dired-for-files' except uses another window.</span>"
  (interactive
   (let ((current-prefix-arg  -1))
     (diredp-dired-files-interactive-spec "<span class="quote">in other window </span>")))
  (diredp-dired-files-other-window arg switches))

(defun diredp-dired-files-interactive-spec (str)
  "<span class="quote">`interactive' spec for `diredp-dired-files' commands.
STR is a string appended to the prompt.
With non-negative prefix arg, read switches.
With non-positive prefix arg, read files and dirs to list and then the
 Dired buffer name.  User uses `C-g' when done reading files and dirs.

If you use Icicles, then in Icicle mode the following keys are bound
in the minibuffer during completion (`*' means the key requires
library `Bookmark+'):

  M-|       - Open Dired on the file names matching your input
  C-c +     - Create a new directory
 *C-x a +   - Add tags to the current-candidate file
 *C-x a -   - Remove tags from the current-candidate file
 *C-x m     - Access file bookmarks (not just autofiles)</span>"
  (list
   (unwind-protect
        (let ((icicle-sort-comparer  (or icicle-file-sort <span class="linecomment">; If not reading files then dirs first.</span>
                                         (and (&gt; (prefix-numeric-value current-prefix-arg) 0)
                                              'icicle-dirs-first-p)
                                         icicle-sort-comparer))
              (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
               (lambda (files)
                 (let ((enable-recursive-minibuffers  t))
                   (dired-other-window (cons (read-string "<span class="quote">Dired buffer name: </span>") files))))))
          (when (fboundp 'icicle-bind-file-candidate-keys) (icicle-bind-file-candidate-keys))
          (if (&gt; (prefix-numeric-value current-prefix-arg) 0)
              <span class="linecomment">;; If a dialog box is about to be used, call `read-directory-name' so the dialog</span>
              <span class="linecomment">;; code knows we want directories.  Some dialog boxes can only select directories</span>
              <span class="linecomment">;; or files when popped up, not both.</span>
              (if (and (fboundp 'read-directory-name)  (next-read-file-uses-dialog-p))
                  (read-directory-name (format "<span class="quote">Dired %s(directory): </span>" str) nil
                                       default-directory nil)
                (read-file-name (format "<span class="quote">Dired %s(directory): </span>" str) nil default-directory nil))
            (let ((insert-default-directory  nil)
                  (files                     ())
                  file)
              (while (condition-case nil <span class="linecomment">; Use lax completion, to allow wildcards.</span>
                         (setq file  (read-file-name "<span class="quote">File or dir (C-g when done): </span>"))
                       (quit nil))
                (push file files))
              (cons (read-string "<span class="quote">Dired buffer name: </span>" nil nil default-directory) files))))
     (when (fboundp 'icicle-unbind-file-candidate-keys)
       (icicle-unbind-file-candidate-keys)))
   (and current-prefix-arg  (natnump (prefix-numeric-value current-prefix-arg))
        (read-string "<span class="quote">Dired listing switches: </span>" dired-listing-switches))))

<span class="linecomment">;;;###autoload</span>
(defun diredp-dired-union (dirbufs &optional switches) <span class="linecomment">; Not bound</span>
  "<span class="quote">Create a Dired buffer that is the union of some existing Dired buffers.
With a prefix arg, read `ls' switches.
You are prompted for the Dired buffers.  Use `C-g' when done choosing
them.  Then you are prompted for the name of the new Dired buffer.
Its `default-directory' is the same as the `default-directory' before
invoking the command.

The selected Dired listings are included in the order that you choose
them, and each entry is listed only once in the new Dired buffer.  The
new Dired listing respects the markings, subdirectory insertions, and
hidden subdirectories of the selected Dired listings.

However, in case of conflict between marked or unmarked status for the
same entry, the entry is marked.  Similarly, in case of conflict over
an included subdirectory between it being hidden or shown, it is
hidden, but its contained files are also listed.</span>"
  (interactive (diredp-dired-union-interactive-spec "<span class="quote"></span>"))
  (diredp-dired-union-1 dirbufs switches))

<span class="linecomment">;;;###autoload</span>
(defun diredp-dired-union-other-window (dirbufs &optional switches) <span class="linecomment">; Not bound</span>
  "<span class="quote">Same as `diredp-dired-union' but uses another window.</span>"
  (interactive (diredp-dired-union-interactive-spec "<span class="quote"></span>"))
  (diredp-dired-union-1 dirbufs switches 'OTHER-WINDOW))

<span class="linecomment">;; $$$$$ Maybe I should set `dired-sort-inhibit' to t for now (?),</span>
<span class="linecomment">;; since there is an Emacs bug (at least on Windows) that prevents</span>
<span class="linecomment">;; sorting from working for a Dired buffer with an explicit file list.</span>
(defun diredp-dired-union-1 (dirbufs switches &optional other-window-p)
  "<span class="quote">Helper for `diredp-dired-union(-other-window)'.</span>"
  (let ((files        ())
        (marked       ())
        (subdirs      ())
        (hidden-dirs  ())
        hid-here files-here)
    (dolist (buf  (reverse (cdr dirbufs))) <span class="linecomment">; The car is the new Dired buffer name.</span>
      (with-current-buffer buf
        (unwind-protect
             (progn
               (setq hid-here    (save-excursion (dired-remember-hidden))
                     files-here  (if (consp dired-directory)
                                     (reverse (cdr dired-directory)) <span class="linecomment">; Reverse bc will push.</span>
                                   ()))
               (unless files-here
                 (save-excursion        <span class="linecomment">; This bit is more or less from `dired-toggle-marks'.</span>
                   (goto-char (point-min))
                   (while (not (eobp))
                     (or (looking-at dired-re-dot)
                         (push (dired-get-filename nil 'NO-ERROR-P) files-here))
                     (forward-line 1)))
                 (setq files-here  (delq nil files-here)))
               (dolist (hid-here  hid-here) (push hid-here hidden-dirs))
               (dolist (sub  (cdr (reverse dired-subdir-alist)))
                 (push (list (car sub)) subdirs))
               (dolist (mkd  (dired-remember-marks (point-min) (point-max))) <span class="linecomment">; This unhides.</span>
                 (push (car mkd) marked))
               (dolist (file  files-here)
                 (when (or (not (file-name-absolute-p file)) (not (member file files)))
                   (push file files))))
          (save-excursion               <span class="linecomment">; Hide subdirs that were hidden.</span>
            (dolist (dir  hid-here)  (when (dired-goto-subdir dir) (dired-hide-subdir 1)))))))
    <span class="linecomment">;; (pp-eval-expression '(list (cons 'FILES files) (cons 'MARKED marked)</span>
    <span class="linecomment">;;                            (cons 'SUBDIRS subdirs) (cons 'HIDDEN-SUBDIRS hidden-dirs)))</span>
    (if other-window-p
        (dired-other-window (cons (car dirbufs) files) switches)
      (dired (cons (car dirbufs) files) switches))
    (with-current-buffer (car dirbufs)
      (let ((inhibit-read-only  t))
        (dired-insert-old-subdirs subdirs)
        (dired-mark-remembered          <span class="linecomment">; Don't really need `expand-file-name' - already abs.</span>
         (mapcar (lambda (mf) (cons (expand-file-name mf dired-directory) 42)) marked))
        (save-excursion
          (dolist (dir  hidden-dirs)  (when (dired-goto-subdir dir) (dired-hide-subdir 1))))))))

(defun diredp-dired-union-interactive-spec (str)
  "<span class="quote">`interactive' spec for `diredp-dired-dired' commands.
STR is a string appended to the prompt.
With a prefix arg, read switches.
Read names of Dired buffers to include, and then the new, Dired-union
 buffer name.  User uses `C-g' when done reading Dired buffer names.</span>"
  (list
   (let ((bufs     ())
         dirbufs buf)
     (dolist (dbuf  dired-buffers)
       (when (buffer-live-p (cdr dbuf))
         (push (cons (buffer-name (cdr dbuf)) (car dbuf)) dirbufs)))
     (while (and dirbufs  (condition-case nil
                              (setq buf  (completing-read
                                          "<span class="quote">Dired buffer to include (C-g when done): </span>"
                                          dirbufs nil t nil buffer-name-history
                                          (and dirbufs  (car (assoc (buffer-name) dirbufs)))))
                            (quit nil)))
       (push buf bufs)
       (setq dirbufs  (delete (cons buf (with-current-buffer buf default-directory)) dirbufs)))
     (setq bufs  (nreverse bufs))
     (cons (read-string "<span class="quote">Dired-union buffer name: </span>") bufs))
   (and current-prefix-arg  (read-string "<span class="quote">Dired listing switches: </span>" dired-listing-switches))))

<span class="linecomment">;;;###autoload</span>
(defun diredp-fileset (flset-name)      <span class="linecomment">; Not bound</span>
  "<span class="quote">Open Dired on the files in fileset FLSET-NAME.</span>"
  (interactive
   (list (let ((fd  (or (and (require 'filesets nil t)  filesets-data)
                        (error "<span class="quote">Feature `filesets' not provided</span>"))))
           (completing-read "<span class="quote">Open Dired on fileset: </span>" filesets-data))))
  (let ((flset  (filesets-get-fileset-from-name flset-name))
        (files  ())
        (mode   nil))
    (unless (or (setq mode  (filesets-entry-mode flset)) <span class="linecomment">; ("my-fs" (:files "a" "b"))</span>
                (setq flset  (cons "<span class="quote">dummy</span>" flset) <span class="linecomment">; (:files "a" "b")</span>
                      mode   (filesets-entry-mode flset)))
      (error "<span class="quote">Bad fileset: %S</span>" flset-name))
    (message "<span class="quote">Gathering file names...</span>")
    (dolist (file  (filesets-get-filelist flset mode)) (push file files))
    (dired (cons (generate-new-buffer-name flset-name)
                 (nreverse (mapcar (lambda (file)
                                     (if (file-name-absolute-p file)
                                         (expand-file-name file)
                                       file))
                                   files))))))

<span class="linecomment">;;;###autoload</span>
(defun diredp-dired-this-subdir (&optional tear-off-p msgp)
  "<span class="quote">Open Dired for the subdir at or above point.
If point is not on a subdir line, but is in an inserted subdir
listing, then use that subdir.

With a prefix arg:
 If the subdir is inserted and point is in the inserted listing then
 remove that listing and move to the ordinary subdir line.  In other
 words, when in an inserted listing, a prefix arg tears off the
 inserted subdir to its own Dired buffer.</span>"
  (interactive "<span class="quote">P\np</span>")
  (unless (eq major-mode 'dired-mode)
    (error "<span class="quote">You must be in a Dired buffer to use this command</span>"))
  (let* ((this-dir       default-directory)
         (this-subdir    (diredp-this-subdir))
         (on-dir-line-p  (atom this-subdir)))
    (unless on-dir-line-p               <span class="linecomment">; Subdir header line or non-directory file.</span>
      (setq this-subdir  (car this-subdir)))
    (unless (string= this-subdir this-dir)
      (when tear-off-p
        (unless on-dir-line-p
          (dired-kill-subdir)           <span class="linecomment">; Tear it off.</span>
          (dired-goto-file this-subdir))) <span class="linecomment">; Move to normal subdir line.</span>
      (dired-other-window this-subdir))))

<span class="linecomment">;;;###autoload</span>
(defun diredp-dired-inserted-subdirs (&optional no-show-p msgp)
  "<span class="quote">Open Dired for each of the subdirs inserted in this Dired buffer.
With a prefix arg, create the Dired buffers but do not display them.
Markings and current Dired switches are preserved.</span>"
  (interactive "<span class="quote">P\np</span>")
  (unless (eq major-mode 'dired-mode)
    (error "<span class="quote">You must be in a Dired buffer to use this command</span>"))
  (let ((this-dir    default-directory)
        (this-buff   (current-buffer))
        (this-frame  (selected-frame))
        marked)
    (unwind-protect
         (save-selected-window
           (dolist (entry  dired-subdir-alist)
             (unless (string= (car entry) this-dir)
               (setq marked
                     (with-current-buffer this-buff
                       (dired-remember-marks (dired-get-subdir-min entry)
                                             (dired-get-subdir-max entry))))
               (if (not no-show-p)
                   (dired-other-window (car entry) dired-actual-switches)
                 (dired-noselect (car entry) dired-actual-switches)
                 (when msgp (message "<span class="quote">Dired buffers created but not shown</span>")))
               (set-buffer this-buff)
               (let ((inhibit-read-only  t))
                 (dired-mark-remembered marked))
               (set-buffer-modified-p nil))))
      (select-frame-set-input-focus this-frame))))


<span class="linecomment">;;; Actions on marked files and subdirs, recursively.</span>

(defun diredp-get-files (&optional ignore-marks-p predicate include-dirs-p dont-askp)
  "<span class="quote">Return file names from this Dired buffer and subdirectories, recursively.
The name are those that are marked in the current Dired buffer, or all
files in the directory if none are marked.  Marked subdirectories are
handled recursively in the same way.

If there is some included subdirectory that has a Dired buffer with
marked files, then (unless DONT-ASKP is non-nil) ask the user whether
to use the marked files in Dired buffers, as opposed to using all of
the files in included directories.  To this y-or-n question the user
can hit `l' to see the list of files that will be included (using
`diredp-list-files').

\(Directories in `icicle-ignored-directories' are skipped, if you use
Icicles.  Otherwise, directories in `vc-directory-exclusion-list' are
skipped.)

Non-nil IGNORE-MARKS-P means ignore all Dired markings:
just get all of the files in the current directory.

Non-nil PREDICATE means include only file names for which the
PREDICATE returns non-nil.

Non-nil INCLUDE-DIRS-P means include marked subdirectory names (but
also handle those subdirs recursively, picking up their marked files
and subdirs).

Non-nil DONT-ASKP means do not ask the user whether to use marked
instead of all.  Act as if the user was asked and replied `y'.</span>"
  (let ((askp  (list nil)))             <span class="linecomment">; The cons's car will be set to `t' if need to ask user.</span>
    (if ignore-marks-p
        (diredp-files-within (directory-files default-directory 'FULL diredp-re-no-dot)
                             () nil nil predicate)
      <span class="linecomment">;; Pass FILES and ASKP to `diredp-get-files-for-dir', so we don't have to use them as</span>
      <span class="linecomment">;; free vars there.  But that means that they each need to be a cons cell that we can</span>
      <span class="linecomment">;; modify, so we can get back the updated info.</span>
      (let ((files  (list 'DUMMY)))     <span class="linecomment">; The files picked up will be added to this list.</span>
        (diredp-get-files-for-dir default-directory files askp include-dirs-p)
        (setq files  (cdr files))       <span class="linecomment">; Remove `DUMMY' from the modifed list.</span>
        (if (or dont-askp  (not (car askp))
                (diredp-y-or-n-files-p "<span class="quote">Use marked (instead of all) in subdir Dired buffers? </span>"
                                       files
                                       predicate))
            (if predicate (diredp-remove-if-not predicate files) files)
          (setq files  ())
          (dolist (file  (diredp-marked-here))
            (if (not (file-directory-p file))
                (when (or (not predicate)  (funcall predicate file))
                  (add-to-list 'files file))
              (when include-dirs-p (setq files  (nconc files (list file))))
              (setq files  (nconc files (diredp-files-within
                                         (directory-files file 'FULL diredp-re-no-dot)
                                         () nil include-dirs-p predicate)))))
          (nreverse files))))))

(defun diredp-get-files-for-dir (dir accum askp &optional include-dirs-p)
  "<span class="quote">Return file names for directory DIR and subdirectories, recursively.
Pick up names of all marked files in DIR if it has a Dired buffer, or
all files in DIR if not.  Handle subdirs recursively (only marked
subdirs, if Dired).

ACCUM is an accumulator list: the files picked up in this call are
nconc'd to it.

ASKP is a one-element list, the element indicating whether to ask the
user about respecting Dired markings.  It is set here to `t' if there
is a Dired buffer for DIR.

Non-nil optional arg INCLUDE-DIRS-P means include marked subdirectory
names (but also handle those subdirs recursively).

If there is more than one Dired buffer for DIR then raise an error.</span>"
  (dolist (file  (if (not (dired-buffers-for-dir (expand-file-name dir)))
                     (directory-files dir 'FULL diredp-re-no-dot)
                   (when (cadr (dired-buffers-for-dir (expand-file-name dir)))
                     (error "<span class="quote">More than one Dired buffer for `%s'</span>" dir))
                   (unless (equal dir default-directory) (setcar askp  t))
                   (with-current-buffer (car (dired-buffers-for-dir (expand-file-name dir)))
                     (diredp-marked-here))))
    (if (not (file-directory-p file))
        (setcdr (last accum) (list file))
      (when include-dirs-p (setcdr (last accum) (list file)))
      (diredp-get-files-for-dir file accum askp include-dirs-p))))

(defun diredp-marked-here ()
  "<span class="quote">Marked files and subdirs in this Dired buffer, or all if none are marked.
Directories `.' and `..' are excluded.</span>"
  <span class="linecomment">;; If no file is marked, exclude `(FILENAME)': the unmarked file at cursor.</span>
  <span class="linecomment">;; If there are no marked files as a result, return all files and subdirs in the dir.</span>
  (let ((ff  (condition-case nil        <span class="linecomment">; Ignore error if on `.' or `..' and no file is marked.</span>
                 (dired-get-marked-files nil nil nil 'DISTINGUISH-ONE-MARKED)
               (error nil))))
    (cond ((eq t (car ff))  (cdr ff))   <span class="linecomment">; Single marked</span>
          ((cadr ff)        ff)         <span class="linecomment">; Multiple marked</span>
          (t                (directory-files <span class="linecomment">; None marked</span>
                             default-directory 'FULL diredp-re-no-dot 'NOSORT)))))

(defun diredp-y-or-n-files-p (prompt files &optional predicate)
  "<span class="quote">PROMPT user with a \"y or n\" question about a list of FILES.
Return t if answer is \"y\".  Otherwise, return nil.

Like `y-or-n-p', but the user can also hit `l' to display the list of
files that the confirmation is for, in buffer `*Files'.  When
finished, buffer `*Files*' is killed if it was never shown, or is
hidden and buried otherwise.  Thus, if it was shown then it is still
available to revisit afterward (even if the user quit using `C-g').

PREDICATE is passed to `diredp-list-files', to list only file names
for which it returns non-nil.</span>"
  (let ((answer  'recenter))
    (cond (noninteractive
           (setq prompt  (concat prompt
                                 (and (not (eq ?\   (aref prompt (1- (length prompt)))))  "<span class="quote"> </span>")
                                 "<span class="quote">(y or n; l to show file list) </span>"))
           (let ((temp-prompt  prompt))
             (while (not (memq answer '(act skip)))
               (let ((str  (read-string temp-prompt)))
                 (cond ((member str '("<span class="quote">y</span>" "<span class="quote">Y</span>")) (setq answer  'act))
                       ((member str '("<span class="quote">n</span>" "<span class="quote">N</span>")) (setq answer  'skip))
                       (t (setq temp-prompt  (concat "<span class="quote">Please answer y or n.  </span>" prompt))))))))
          ((if (not (fboundp 'display-popup-menus-p))
               (and window-system  (listp last-nonmenu-event)  use-dialog-box)
             (and (display-popup-menus-p)  (listp last-nonmenu-event)  use-dialog-box))
           (setq answer  (x-popup-dialog t `(,prompt ("<span class="quote">Yes</span>" . act) ("<span class="quote">No</span>" . skip)))))
          (t
           (let ((list-buf        (generate-new-buffer-name "<span class="quote">*Files*</span>"))
                 (list-was-shown  nil))
             (unwind-protect
                  (progn
                    (define-key query-replace-map "<span class="quote">l</span>" 'show)
                    (setq prompt  (concat prompt
                                          (and (eq ?\   (aref prompt (1- (length prompt))))
                                               "<span class="quote"></span>" "<span class="quote"> </span>")
                                          "<span class="quote">(y or n; l to show file list) </span>"))
                    (while (let* ((key  (let ((cursor-in-echo-area  t))
                                          (when minibuffer-auto-raise
                                            (raise-frame (window-frame (minibuffer-window))))
                                          (if (fboundp 'read-key)
                                              (read-key (propertize
                                                         (if (memq answer '(recenter show))
                                                             prompt
                                                           (concat "<span class="quote">Please answer y or n.  </span>"
                                                                   prompt))
                                                         'face 'minibuffer-prompt))
                                            (read-char-exclusive
                                             (if (memq answer '(recenter show))
                                                 prompt
                                               (concat "<span class="quote">Please answer y or n.  </span>" prompt)))))))
                             (setq answer  (lookup-key query-replace-map (vector key) t))
                             (case answer
                               ((skip act)  nil)
                               (recenter    (recenter) t)
                               (show        (diredp-list-files files nil list-buf predicate)
                                            (setq list-was-shown  t)) <span class="linecomment">; Record showing it.</span>
                               (help        (message "<span class="quote">Use `l' to show file list</span>") (sit-for 1))
                               ((exit-prefix quit) (signal 'quit nil) t)
                               (t t)))
                      (ding)
                      (discard-input)))
               (save-window-excursion (pop-to-buffer list-buf)
                                      (condition-case nil <span class="linecomment">; Ignore error if user already deleted.</span>
                                          (if (one-window-p) (delete-frame) (delete-window))
                                        (error nil))
                                      (if list-was-shown
                                          (bury-buffer list-buf)
                                        (kill-buffer list-buf)))
               (define-key query-replace-map "<span class="quote">l</span>" nil)))))
    (let ((ret  (eq answer 'act)))
      (unless noninteractive (message "<span class="quote">%s %s</span>" prompt (if ret "<span class="quote">y</span>" "<span class="quote">n</span>")))
      ret)))

(defun diredp-list-files (files &optional dir bufname predicate)
  "<span class="quote">Display FILES, a list of file names.  Wildcard patterns are expanded.
The files are shown in a new buffer, `*Files*' by default.
Optional arg DIR serves as the default directory for expanding file
 names that are not absolute.  It defaults to `default-directory'.
Optional arg BUFNAME is the name of the buffer for the display.
 It defaults to `*Files*' (or `*Files*&lt;N&gt;' if `*Files*' exists).</span>"
  (with-output-to-temp-buffer (or bufname  (generate-new-buffer-name "<span class="quote">*Files*</span>"))
    (princ "<span class="quote">Files\n-----\n\n</span>")
    (let ((all-files-no-wildcards  ())
          file-alist  file-dir)
      (dolist (file  files)
        (unless (or (string= file "<span class="quote"></span>")   <span class="linecomment">; Ignore empty file names.</span>
                    (and predicate  (not (funcall predicate file))))
          (if (not (string-match "<span class="quote">[[?*]</span>" file))
              (add-to-list 'all-files-no-wildcards (expand-file-name file))
            (setq file-dir    (or (file-name-directory file)  default-directory)
                  file-alist  (directory-files-and-attributes file-dir 'FULL "<span class="quote">[[?*]</span>" 'NOSORT))
            (dolist (ff  file-alist)
              (add-to-list 'all-files-no-wildcards (expand-file-name (car ff) file-dir))))))
      (dolist (fff  (nreverse all-files-no-wildcards))
        (princ fff)
        (terpri)))))

(defvar diredp-files-within-dirs-done ()
  "<span class="quote">Directories already processed by `diredp-files-within'.</span>")


<span class="linecomment">;; Not used in the Dired+ code yet.</span>
(defun diredp-directories-within (&optional directory no-symlinks-p predicate)
  "<span class="quote">List of accessible directories within DIRECTORY.
Directories in `icicle-ignored-directories' are skipped, if you use
Icicles.  Otherwise, directories in `vc-directory-exclusion-list' are
skipped.

Optional arg DIRECTORY defaults to the value of `default-directory'.
Non-nil optional arg NO-SYMLINKS-P means do not follow symbolic links.
Non-nil optional arg PREDICATE must be a function that accepts a
 file-name argument.  Only directories that satisfy PREDICATE are
 included in the result.</span>"
  (unless directory (setq directory  default-directory))
  (let ((dirs  (diredp-files-within (directory-files directory 'FULL diredp-re-no-dot)
                                    () no-symlinks-p 'INCLUDE-DIRS-P
                                    #'file-directory-p)))
    (if predicate (diredp-remove-if-not predicate dirs) dirs)))

<span class="linecomment">;; Args INCLUDE-DIRS-P and PREDICATE are not used in the Dired+ code yet</span>
<span class="linecomment">;; (except in `diredp-directories-within', which also is not used yet).</span>
<span class="linecomment">;;</span>
(defun diredp-files-within (file-list accum &optional no-symlinks-p include-dirs-p predicate)
  "<span class="quote">List of readable files in FILE-LIST, handling directories recursively.
FILE-LIST is a list of file names or a function that returns such.
If a function then invoke it with no args to get the list of files.

Accessible directories in the list of files are processed recursively
to include their files and the files in their subdirectories.  The
directories themselves are not included, unless optional arg
INCLUDE-DIRS-P is non-nil.  (Directories in
`icicle-ignored-directories' are skipped, if you use Icicles.
Otherwise, directories in `vc-directory-exclusion-list' are skipped.)

But if there is a Dired buffer for such a directory, and if FILE-LIST
is a function, then it is invoked in that Dired buffer to return the
list of files to use.  E.g., if FILE-LIST is `dired-get-marked-files'
then only the marked files and subdirectories are included.  If you
have more than one Dired buffer for a directory that is processed
here, then only the first one in `dired-buffers' is used.

The list of files is accumulated in ACCUM, which is used for recursive
calls.

Non-nil optional arg NO-SYMLINKS-P means do not follow symbolic links.

Non-nil optional arg INCLUDE-DIRS-P means include directory names
along with the names of non-directories.

Non-nil optional arg PREDICATE must be a function that accepts a
file-name argument.  Only files (and possibly directories) that
satisfy PREDICATE are included in the result.</span>"
  <span class="linecomment">;; Bind `diredp-files-within-dirs-done' for use as a free var in `diredp-files-within-1'."</span>
  (let ((diredp-files-within-dirs-done  ()))
    (nreverse (diredp-files-within-1 file-list accum no-symlinks-p include-dirs-p predicate))))

<span class="linecomment">;; `diredp-files-within-dirs-done' is free here, bound in `diredp-files-within'.</span>
(defun diredp-files-within-1 (file-list accum no-symlinks-p include-dirs-p predicate)
  "<span class="quote">Helper for `diredp-files-within'.</span>"
  (let ((files  (if (functionp file-list) (funcall file-list) file-list))
        (res    accum)
        file)
    (when (and files  predicate) (setq files  (diredp-remove-if-not predicate files)))
    (while files
      (setq file  (car files))
      (unless (and no-symlinks-p  (file-symlink-p file))
        (if (file-directory-p file)
            <span class="linecomment">;; Skip directory if ignored, already treated, or inaccessible.</span>
            (when (and (not (member (file-name-nondirectory file)
                                    (if (boundp 'icicle-ignored-directories)
                                        icicle-ignored-directories
                                      (and (boundp 'vc-directory-exclusion-list)
                                           vc-directory-exclusion-list))))
                       (not (member (file-truename file) diredp-files-within-dirs-done))
                       (file-accessible-directory-p file))
              (setq res  (diredp-files-within-1
                          (or (and (functionp file-list)
                                   (dired-buffers-for-dir <span class="linecomment">; Removes killed buffers.</span>
                                    (expand-file-name file))
                                   (with-current-buffer
                                       (cdr (assoc (file-name-as-directory file) dired-buffers))
                                     (funcall file-list)))
                              (directory-files file 'FULL diredp-re-no-dot))
                          res
                          no-symlinks-p
                          include-dirs-p
                          predicate))
              (when include-dirs-p (push file res))
              (push (file-truename file) diredp-files-within-dirs-done))
          (when (file-readable-p file) (push file res))))
      (pop files))
    res))

(defun diredp-remove-if-not (pred xs)
  "<span class="quote">A copy of list XS with only elements that satisfy predicate PRED.</span>"
  (let ((result  ()))
    (dolist (x xs) (when (funcall pred x) (push x result)))
    (nreverse result)))

(when (&gt; emacs-major-version 21)        <span class="linecomment">; Emacs 20 has no PREDICATE arg to `read-file-name'.</span>
  (defun diredp-insert-as-subdir (child ancestor &optional in-dired-now-p)
    "<span class="quote">Insert the current Dired dir into a Dired listing of an ancestor dir.
Ancestor means parent, grandparent, etc. at any level.
You are prompted for the ancestor directory.  
The ancestor Dired buffer is selected.

Markings and switches in the current Dired buffer are preserved for
the subdir listing in the ancestor Dired buffer.

Note: If you use Icicles, then you can use
`icicle-dired-insert-as-subdir' instead: it is a multi-command.  It
does the same thing, but it lets you insert any number of descendent
directories into a given ancestor-directory Dired buffer.

Non-interactively:
 Insert CHILD dir into Dired listing for ANCESTOR dir.

 Non-nil optional arg IN-DIRED-NOW-P means to use the current buffer
 as the Dired buffer from which to pick up markings and switches.
 Otherwise, pick them up from a Dired buffer for CHILD, if there is
 exactly one such buffer.</span>"
    (interactive
     (progn (unless (eq major-mode 'dired-mode)
              (error "<span class="quote">You must be in a Dired buffer to use this command</span>"))
            (list default-directory
                  (completing-read
                   "<span class="quote">Insert this dir into ancestor dir: </span>"
                   (mapcar #'list (diredp-ancestor-dirs default-directory)))
                  t)))
    (let ((child-dired-buf  (if in-dired-now-p
                                (current-buffer)
                              (dired-buffers-for-dir (expand-file-name child))))
          (switches         nil)
          (marked           nil))
      (when (consp child-dired-buf)
        (setq child-dired-buf  (and (= 1 (length child-dired-buf))  (car child-dired-buf))))
      (when child-dired-buf
        (with-current-buffer child-dired-buf
          (setq switches  dired-actual-switches
                marked    (dired-remember-marks (point-min) (point-max)))))
      (dired-other-window ancestor)
      (dired-insert-subdir child switches)
      (when marked (let ((inhibit-read-only  t)) (dired-mark-remembered marked)))
      (set-buffer-modified-p nil))))

(defun diredp-ancestor-dirs (dir)
  "<span class="quote">Return a list of the ancestor directories of directory DIR.</span>"
  (mapcar #'file-name-as-directory
          (diredp-maplist (lambda (dd) (mapconcat #'identity (reverse dd) "<span class="quote">/</span>"))
                          (cdr (nreverse (split-string dir "<span class="quote">/</span>" t))))))

(defun diredp-maplist (function list)
  "<span class="quote">Map FUNCTION over LIST and its cdrs.
A simple, recursive version of the classic `maplist'.</span>"
  (and list  (cons (funcall function list) (maplist function (cdr list)))))



<span class="linecomment">;;; Commands operating on marked at all levels below (recursively)</span>

(defun diredp-get-confirmation-recursive ()
  "<span class="quote">Get confirmation from user to act on all files here and below.
Raise an error if not confirmed.
Raise an error first if not in Dired mode.</span>"
  (unless (eq major-mode 'dired-mode)
    (error "<span class="quote">You must be in a Dired buffer to use this command</span>"))
  (unless (y-or-n-p "<span class="quote">Act on ALL files (or all marked if any) in and UNDER this dir? </span>")
    (error "<span class="quote">OK, canceled</span>")))

<span class="linecomment">;;;###autoload</span>
(defun diredp-insert-subdirs (&optional switches) <span class="linecomment">; Bound to `M-i'</span>
  "<span class="quote">Insert the marked subdirectories.
Like using \\&lt;dired-mode-map&gt;`\\[dired-maybe-insert-subdir]' at each marked directory line.</span>"
  (interactive (list (and current-prefix-arg
                          (read-string "<span class="quote">Switches for listing: </span>"
                                       (or (and (boundp 'dired-subdir-switches)
                                                dired-subdir-switches)
                                           dired-actual-switches)))))
  (dolist (subdir  (dired-get-marked-files nil nil #'file-directory-p))
    (dired-maybe-insert-subdir subdir switches)))

<span class="linecomment">;;;###autoload</span>
(defun diredp-insert-subdirs-recursive (&optional ignore-marks-p) <span class="linecomment">; Bound to `M-+ M-i'</span>
  "<span class="quote">Insert the marked subdirs, including those in marked subdirs.
Like `diredp-insert-subdirs', but act recursively on subdirs.
The subdirs inserted are those that are marked in the current Dired
buffer, or all subdirs in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way (their marked
subdirs are inserted...).

With a prefix argument, ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.</span>"
  (interactive (progn (diredp-get-confirmation-recursive) (list current-prefix-arg)))
  (dolist (subdir  (diredp-get-files ignore-marks-p #'file-directory-p 'INCLUDE-SUBDIRS-P))
    (dired-maybe-insert-subdir subdir)))

<span class="linecomment">;;;###autoload</span>
(defun diredp-do-shell-command-recursive (command &optional ignore-marks-p) <span class="linecomment">; Bound to `M-+ !'</span>
  "<span class="quote">Run shell COMMAND on the marked files, including those in marked subdirs.
Like `dired-do-shell-command', but act recursively on subdirs.
The files included are those that are marked in the current Dired
buffer, or all files in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way.

With a prefix argument, ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.</span>"
  (interactive
   (progn (diredp-get-confirmation-recursive)
          (let* ((prompt  "<span class="quote">! on *: </span>")
                 (cmd     (minibuffer-with-setup-hook
                              (lambda ()
                                (set (make-local-variable 'minibuffer-default-add-function)
                                     'minibuffer-default-add-dired-shell-commands))
                            (let ((dired-no-confirm  t))
                              (if (functionp 'dired-guess-shell-command)
                                  <span class="linecomment">;; Guess cmd based only on files marked in current (top) dir.</span>
                                  (dired-guess-shell-command prompt (dired-get-marked-files t))
                                (read-shell-command prompt nil nil))))))
            (list cmd current-prefix-arg))))
  (dired-do-shell-command command nil (diredp-get-files ignore-marks-p)))

<span class="linecomment">;;;###autoload</span>
(defun diredp-do-symlink-recursive (&optional ignore-marks-p) <span class="linecomment">; Bound to `M-+ S'</span>
  "<span class="quote">Make symbolic links to marked files, including those in marked subdirs.
Like `dired-do-symlink', but act recursively on subdirs to pick up the
files to link.

The files included are those that are marked in the current Dired
buffer, or all files in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way.

With a prefix argument, ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.</span>"
  (interactive (progn (diredp-get-confirmation-recursive) (list current-prefix-arg)))
  (diredp-do-create-files-recursive #'make-symbolic-link "<span class="quote">Symlink</span>" ignore-marks-p))

(when (fboundp 'dired-do-relsymlink)
  (defun diredp-do-relsymlink-recursive (&optional ignore-marks-p) <span class="linecomment">; Bound to `M-+ Y'</span>
    "<span class="quote">Relative symlink all marked files, including those in marked subdirs into a dir.
Like `dired-do-relsymlink', but act recursively on subdirs to pick up the
files to link.

The files included are those that are marked in the current Dired
buffer, or all files in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way.

With a prefix argument, ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.

For absolute symlinks, use \\[diredp-do-symlink-recursive].</span>"
    (interactive (progn (diredp-get-confirmation-recursive) (list current-prefix-arg)))
    (diredp-do-create-files-recursive #'dired-make-relative-symlink "<span class="quote">RelSymLink</span>"
                                      ignore-marks-p)))

<span class="linecomment">;;;###autoload</span>
(defun diredp-do-hardlink-recursive (&optional ignore-marks-p) <span class="linecomment">; Bound to `M-+ H'</span>
  "<span class="quote">Add hard links for marked files, including those in marked subdirs.
Like `dired-do-hardlink', but act recursively on subdirs to pick up the
files to link.

The files included are those that are marked in the current Dired
buffer, or all files in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way.

With a prefix argument, ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.</span>"
  (interactive (progn (diredp-get-confirmation-recursive) (list current-prefix-arg)))
  (diredp-do-create-files-recursive #'dired-hardlink "<span class="quote">Hardlink</span>" ignore-marks-p))

<span class="linecomment">;;;###autoload</span>
(defun diredp-do-print-recursive (&optional ignore-marks-p) <span class="linecomment">; Bound to `M-+ P'</span>
  "<span class="quote">Print the marked files, including those in marked subdirs.
Like `dired-do-print', but act recursively on subdirs to pick up the
files to print.

The files included are those that are marked in the current Dired
buffer, or all files in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way.

With a prefix argument, ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.</span>"
  (interactive (progn (diredp-get-confirmation-recursive) (list current-prefix-arg)))
  (let* ((file-list  (diredp-get-files ignore-marks-p))
	 (command    (dired-mark-read-string
                      "<span class="quote">Print %s with: </span>"
                      (mapconcat #'identity (cons lpr-command (if (stringp lpr-switches)
                                                                  (list lpr-switches)
                                                                lpr-switches))
                                 "<span class="quote"> </span>")
                      'print nil file-list)))
    (dired-run-shell-command (dired-shell-stuff-it command file-list nil))))

<span class="linecomment">;;;###autoload</span>
(defun diredp-image-dired-display-thumbs-recursive (&optional ignore-marks-p append do-not-pop)
                                        <span class="linecomment">; Bound to `M-+ C-t d'</span>
  "<span class="quote">Display thumbnails of marked files, including those in marked subdirs.
Like `image-dired-display-thumbs', but act recursively on subdirs.
Optional arguments APPEND and DO-NOT-POP are as for
`image-dired-display-thumbs'.

The files included are those that are marked in the current Dired
buffer, or all files in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way.

With a prefix argument, ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.</span>"
  (interactive (progn (unless (require 'image-dired nil t)
                        (error "<span class="quote">This command requires library `image-dired.el' (Emacs 22+)</span>"))
                      (diredp-get-confirmation-recursive)
                      (list current-prefix-arg)))
  (let ((buf  (image-dired-create-thumbnail-buffer))
        thumb-name  files  dired-buf)
    (setq files      (diredp-get-files ignore-marks-p)
          dired-buf  (current-buffer))
    (with-current-buffer buf
      (let ((inhibit-read-only  t))
        (if append (goto-char (point-max)) (erase-buffer))
        (mapc (lambda (curr-file)
                (setq thumb-name  (image-dired-thumb-name curr-file))
                (if (and (not (file-exists-p thumb-name))
                         (not (= 0 (image-dired-create-thumb curr-file thumb-name))))
                    (message "<span class="quote">Thumb could not be created for file %s</span>" curr-file)
                  (image-dired-insert-thumbnail thumb-name curr-file dired-buf)))
              files))
      (case image-dired-line-up-method
        (dynamic      (image-dired-line-up-dynamic))
        (fixed        (image-dired-line-up))
        (interactive  (image-dired-line-up-interactive))
        (none         nil)
        (t            (image-dired-line-up-dynamic))))
    (if do-not-pop
        (display-buffer image-dired-thumbnail-buffer)
      (pop-to-buffer image-dired-thumbnail-buffer))))

<span class="linecomment">;;;###autoload</span>
(defun diredp-image-dired-tag-files-recursive (&optional ignore-marks-p) <span class="linecomment">; Bound to `M-+ C-t t'</span>
  "<span class="quote">Tag marked file(s) in dired, including those in marked subdirs
Like `image-dired-tag-files', but act recursively on subdirs.
The files included are those that are marked in the current Dired
buffer, or all files in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way.

With a prefix argument, ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.</span>"
  (interactive (progn (unless (require 'image-dired nil t)
                        (error "<span class="quote">This command requires library `image-dired.el' (Emacs 22+)</span>"))
                      (diredp-get-confirmation-recursive)
                      (list current-prefix-arg)))
  (let ((tag  (read-string "<span class="quote">Tags to add (separate tags with a semicolon): </span>")))
    (image-dired-write-tags (mapcar (lambda (x) (cons x tag))
                                    (diredp-get-files ignore-marks-p)))))

<span class="linecomment">;;;###autoload</span>
(defun diredp-image-dired-delete-tag-recursive (&optional ignore-marks-p) <span class="linecomment">; Bound to `M-+ C-t r'</span>
  "<span class="quote">Remove tag for selected file(s), including those in marked subdirs.
Like `image-dired-delete-tag', but act recursively on subdirs.
The files included are those that are marked in the current Dired
buffer, or all files in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way.

With a prefix argument, ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.</span>"
  (interactive (progn (unless (require 'image-dired nil t)
                        (error "<span class="quote">This command requires library `image-dired.el' (Emacs 22+)</span>"))
                      (diredp-get-confirmation-recursive)
                      (list current-prefix-arg)))
  (image-dired-remove-tag (diredp-get-files ignore-marks-p) (read-string "<span class="quote">Tag to remove: </span>")))

<span class="linecomment">;;;###autoload</span>
(defun diredp-image-dired-comment-files-recursive (&optional ignore-marks-p)
                                        <span class="linecomment">; Bound to `M-+ C-t c'</span>
  "<span class="quote">Add comment to marked files in dired, including those in marked subdirs.
Like `image-dired-dired-comment-files' but act recursively on subdirs.
The files included are those that are marked in the current Dired
buffer, or all files in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way.

With a prefix argument, ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.</span>"
  (interactive (progn (unless (require 'image-dired nil t)
                        (error "<span class="quote">This command requires library `image-dired.el' (Emacs 22+)</span>"))
                      (diredp-get-confirmation-recursive)
                      (list current-prefix-arg)))
  (let ((comment  (image-dired-read-comment)))
    (image-dired-write-comments (mapcar (lambda (curr-file) (cons curr-file comment))
                                        (diredp-get-files ignore-marks-p)))))

(when (&gt; emacs-major-version 22)
  (defun diredp-do-decrypt-recursive (&optional ignore-marks-p) <span class="linecomment">; Bound to `M-+ : d'</span>
    "<span class="quote">Decrypt marked files, including those in marked subdirs.
Like `epa-dired-do-decrypt', but act recursively on subdirs to pick up
the files to decrypt.

The files included are those that are marked in the current Dired
buffer, or all files in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way.

With a prefix argument, ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.</span>"
    (interactive (progn (diredp-get-confirmation-recursive) (list current-prefix-arg)))
    (dolist (file  (diredp-get-files ignore-marks-p))
      (epa-decrypt-file (expand-file-name file)))
    (revert-buffer))


  (defun diredp-do-verify-recursive (&optional ignore-marks-p) <span class="linecomment">; Bound to `M-+ : v'</span>
    "<span class="quote">Verify marked files, including those in marked subdirs.
Like `epa-dired-do-verify', but act recursively on subdirs to pick up
the files to verify.

The files included are those that are marked in the current Dired
buffer, or all files in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way.

With a prefix argument, ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.</span>"
    (interactive (progn (diredp-get-confirmation-recursive) (list current-prefix-arg)))
    (dolist (file  (diredp-get-files ignore-marks-p))
      (epa-verify-file (expand-file-name file)))
    (revert-buffer))

  (defun diredp-do-sign-recursive (&optional ignore-marks-p) <span class="linecomment">; Bound to `M-+ : s'</span>
    "<span class="quote">Sign marked files, including those in marked subdirs.
Like `epa-dired-do-sign', but act recursively on subdirs to pick up
the files to sign.

The files included are those that are marked in the current Dired
buffer, or all files in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way.

With a prefix argument, ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.</span>"
    (interactive (progn (diredp-get-confirmation-recursive) (list current-prefix-arg)))
    (dolist (file  (diredp-get-files ignore-marks-p))
      (epa-sign-file (expand-file-name file)
                     (epa-select-keys (epg-make-context) "<span class="quote">Select keys for signing.
If none are selected, the default secret key is used.  </span>")
                     (y-or-n-p "<span class="quote">Make a detached signature? </span>")))
    (revert-buffer))

  (defun diredp-do-encrypt-recursive (&optional ignore-marks-p) <span class="linecomment">; Bound to `M-+ : e'</span>
    "<span class="quote">Encrypt marked files, including those in marked subdirs.
Like `epa-dired-do-encrypt', but act recursively on subdirs to pick up
the files to encrypt.

The files included are those that are marked in the current Dired
buffer, or all files in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way.

With a prefix argument, ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.</span>"
    (interactive (progn (diredp-get-confirmation-recursive) (list current-prefix-arg)))
    (dolist (file  (diredp-get-files ignore-marks-p))
      (epa-encrypt-file (expand-file-name file)
                        (epa-select-keys (epg-make-context) "<span class="quote">Select recipients for encryption.
If none are selected, symmetric encryption is performed.  </span>")))
    (revert-buffer)))

<span class="linecomment">;;;###autoload</span>
(defun diredp-do-bookmark-recursive (&optional ignore-marks-p prefix) <span class="linecomment">; Bound to `M-+ M-b'</span>
  "<span class="quote">Bookmark the marked files, including those in marked subdirs.
Like `diredp-do-bookmark', but act recursively on subdirs.
The files included are those that are marked in the current Dired
buffer, or all files in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way.

With a prefix argument, ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.</span>"
  (interactive (progn (diredp-get-confirmation-recursive)
                      (list current-prefix-arg
                            (and diredp-prompt-for-bookmark-prefix-flag
                                 (read-string "<span class="quote">Prefix for bookmark name: </span>")))))
  (dolist (file  (diredp-get-files ignore-marks-p))
    (diredp-bookmark prefix file 'NO-MSG-P)))

<span class="linecomment">;;;###autoload</span>
(defun diredp-do-bookmark-in-bookmark-file-recursive (bookmark-file <span class="linecomment">; Bound to `M-+ C-M-B')</span>
                                                      &optional prefix ignore-marks-p
                                                      bfile-bookmarkp)
  "<span class="quote">Bookmark files here and below in BOOKMARK-FILE and save BOOKMARK-FILE.
Like `diredp-do-bookmark-in-bookmark-file', but act recursively on
subdirs.  The files included are those that are marked in the current
Dired buffer, or all files in the directory if none are marked.
Marked subdirectories are handled recursively in the same way.

With a prefix argument, ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.</span>"
  (interactive
   (progn (diredp-get-confirmation-recursive)
          (let ((d-r-b-f-args  (diredp-read-bookmark-file-args)))
            (list (car d-r-b-f-args) (cadr d-r-b-f-args) (car (cddr d-r-b-f-args))))))
  (diredp-do-bookmark-in-bookmark-file bookmark-file prefix nil bfile-bookmarkp
                                       (diredp-get-files ignore-marks-p)))

<span class="linecomment">;;;###autoload</span>
(defun diredp-set-bookmark-file-bookmark-for-marked-recursive (bookmark-file
                                                               &optional prefix arg)
                                        <span class="linecomment">; Bound to `M-+ C-M-b'</span>
  "<span class="quote">Bookmark the marked files and create a bookmark-file bookmark for them.
Like `diredp-set-bookmark-file-bookmark-for-marked', but act
recursively on subdirs.

The files included are those that are marked in the current Dired
buffer, or all files in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way.

With a prefix argument, ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.</span>"
  (interactive (progn (diredp-get-confirmation-recursive)
                      (diredp-read-bookmark-file-args)))
  (unless (require 'bookmark+ nil t) (error "<span class="quote">This command requires library `bookmark+.el'</span>"))
  (diredp-do-bookmark-in-bookmark-file-recursive bookmark-file prefix arg
                                                 'CREATE-BOOKMARK-FILE-BOOKMARK))

<span class="linecomment">;;;###autoload</span>
(defun diredp-do-find-marked-files-recursive (&optional ignore-marks-p) <span class="linecomment">; Bound to `M-+ F'</span>
  "<span class="quote">Find marked files simultaneously, including those in marked subdirs.
Like `dired-do-find-marked-files', but act recursively on subdirs.
The files included are those that are marked in the current Dired
buffer, or all files in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way.

With a prefix argument, ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.</span>"
  (interactive (progn (diredp-get-confirmation-recursive) (list current-prefix-arg)))
  (dired-simultaneous-find-file (diredp-get-files ignore-marks-p) nil))

(when (fboundp 'dired-do-isearch-regexp) <span class="linecomment">; Emacs 23+</span>
  (defun diredp-do-isearch-recursive (&optional ignore-marks-p) <span class="linecomment">; Bound to `M-+ M-s a C-s'</span>
    "<span class="quote">Isearch the marked files, including those in marked subdirs.</span>"
    (interactive (progn (diredp-get-confirmation-recursive) (list current-prefix-arg)))
    (multi-isearch-files (diredp-get-files ignore-marks-p)))

  (defun diredp-do-isearch-regexp-recursive (&optional ignore-marks-p) <span class="linecomment">; `M-+ M-s a C-M-s'</span>
    "<span class="quote">Regexp-Isearch the marked files, including those in marked subdirs.</span>"
    (interactive (progn (diredp-get-confirmation-recursive) (list current-prefix-arg)))
    (multi-isearch-files-regexp (diredp-get-files ignore-marks-p))))

(defun diredp-do-search-recursive (regexp &optional ignore-marks-p) <span class="linecomment">; Bound to `M-+ A'</span>
  "<span class="quote">Regexp-search the marked files, including those in marked subdirs.
Stops when a match is found.
To continue searching for the next match, use `\\[tags-loop-continue]'.</span>"
  (interactive (progn (diredp-get-confirmation-recursive)
                      (list (read-string "<span class="quote">Search marked files (regexp): </span>")
                            current-prefix-arg)))
  (tags-search regexp '(diredp-get-files ignore-marks-p)))

<span class="linecomment">;;;###autoload</span>
(defun diredp-do-query-replace-regexp-recursive (from to &optional ignore-marks-p)
                                        <span class="linecomment">; Bound to `M-+ Q'</span>
  "<span class="quote">Do `query-replace-regexp' of FROM with TO, on all marked files.
If you exit (\\[keyboard-quit], RET or q), you can resume the query replace
with the command \\[tags-loop-continue].</span>"
  (interactive
   (let ((common
          (query-replace-read-args
           "<span class="quote">Query replace regexp in marked files</span>" t t)))
     (list (nth 0 common) (nth 1 common) (nth 2 common))))
  (dolist (file (dired-get-marked-files nil nil 'dired-nondirectory-p))
    (let ((buffer (get-file-buffer file)))
      (if (and buffer (with-current-buffer buffer
                        buffer-read-only))
          (error "<span class="quote">File `%s' is visited read-only</span>" file))))
  (tags-query-replace from to nil '(diredp-get-files ignore-marks-p)))

<span class="linecomment">;;;###autoload</span>
(defun diredp-do-grep-recursive (command-args &optional ignore-marks-p) <span class="linecomment">; Bound to `M+ M-g'</span>
  "<span class="quote">Run `grep' on marked files, including those in marked subdirs.
Like `diredp-do-grep', but act recursively on subdirs.
The files included are those that are marked in the current Dired
buffer, or all files in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way.

With a prefix argument, ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.</span>"
  (interactive (progn (diredp-get-confirmation-recursive)
                      (unless (if (&lt; emacs-major-version 22)
                                  grep-command
                                (and grep-command  (or (not grep-use-null-device)
                                                       (eq grep-use-null-device t))))
                        (grep-compute-defaults))
                      (list (diredp-do-grep-1 (diredp-get-files current-prefix-arg))
                            current-prefix-arg)))
  (grep command-args))

<span class="linecomment">;;;###autoload</span>
(defun diredp-marked-recursive (dirname &optional ignore-marked-p) <span class="linecomment">; Not bound to a key</span>
  "<span class="quote">Open Dired on marked files, including those in marked subdirs.
Like `diredp-marked', but act recursively on subdirs.

See `diredp-do-find-marked-files-recursive' for a description of the
files included.  In particular, if no files are marked here or in a
marked subdir, then all files in the directory are included.</span>"
  (interactive (progn (diredp-get-confirmation-recursive)
                      (list (cons (generate-new-buffer-name (buffer-name))
                                  (diredp-get-files current-prefix-arg)))))
  (dired dirname))

<span class="linecomment">;;;###autoload</span>
(defun diredp-marked-recursive-other-window (dirname &optional ignore-marked-p)
                                        <span class="linecomment">; Bound to `M-+ C-M-*'</span>
  "<span class="quote">Same as `diredp-marked-recursive', but uses a different window.</span>"
  (interactive (progn (diredp-get-confirmation-recursive)
                      (list (cons (generate-new-buffer-name (buffer-name))
                                  (diredp-get-files current-prefix-arg)))))
  (dired-other-window dirname))

<span class="linecomment">;;;###autoload</span>
(defun diredp-list-marked-recursive (&optional ignore-marks-p predicate)
  "<span class="quote">List the files marked here and in marked subdirs, recursively.
See `diredp-do-find-marked-files-recursive' for a description of the
files included.  In particular, if no files are marked here or in a
marked subdir, then all files in the directory are included.

Non-interactively, non-nil PREDICATE is a file-name predicate.  List
only the files for which it returns non-nil.</span>"
  (interactive                          <span class="linecomment">; No need for `diredp-get-confirmation-recursive' here.</span>
   (progn (unless (eq major-mode 'dired-mode) (error "<span class="quote">Use this command only in Dired mode</span>"))
          (list current-prefix-arg)))
  (let ((files  (diredp-get-files ignore-marks-p predicate)))
    (diredp-list-files files)))


(when (and (memq system-type '(windows-nt ms-dos))  (fboundp 'w32-browser))
  (defun diredp-multiple-w32-browser-recursive (&optional ignore-marked-p)
    "<span class="quote">Run Windows apps for with marked files, including those in marked subdirs.
Like `dired-multiple-w32-browser', but act recursively on subdirs.

See `diredp-do-find-marked-files-recursive' for a description of the
files included.  In particular, if no files are marked here or in a
marked subdir, then all files in the directory are included.</span>"
    (interactive (progn (diredp-get-confirmation-recursive)
                        (list current-prefix-arg)))
    (let ((files  (diredp-get-files ignore-marked-p)))
      (while files
        (w32-browser (car files))
        (sleep-for w32-browser-wait-time)
        (setq files (cdr files))))))

<span class="linecomment">;;;###autoload</span>
(defun diredp-copy-filename-as-kill-recursive (&optional arg) <span class="linecomment">; Bound to `M-+ M-w'</span>
  "<span class="quote">Copy names of marked files here and in marked subdirs, to `kill-ring'.
The names are separated by a space.

Like `dired-copy-filename-as-kill', but act recursively on subdirs.
\(Do not copy subdir names themselves.)

With no prefix arg, use relative file names.
With a zero prefix arg, use absolute file names.
With a plain prefix arg (`C-u'), use names relative to the current
Dired directory.  (This might contain slashes if in a subdirectory.)

If on a subdir headerline, use absolute subdir name instead - prefix
arg and marked files are ignored in this case.

The files included are those that are marked in the current Dired
buffer, or all files in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way.</span>"
  (interactive                          <span class="linecomment">; No need for `diredp-get-confirmation-recursive' here.</span>
   (progn (unless (eq major-mode 'dired-mode) (error "<span class="quote">Use this command only in Dired mode</span>"))
          (list current-prefix-arg)))
  (let* ((files   (mapcar (cond ((zerop (prefix-numeric-value arg)) #'identity)
                                ((consp arg) (lambda (fn) (concat (dired-current-directory t)
                                                                  (file-name-nondirectory fn))))
                                (t (lambda (fn) (file-name-nondirectory fn))))
                          (diredp-get-files)))
         (string  (mapconcat #'identity files "<span class="quote"> </span>")))
    (if (eq last-command 'kill-region)
        (kill-append string nil)
      (kill-new string))
    (message "<span class="quote">%s</span>" string)))

<span class="linecomment">;;;###autoload</span>
(defun diredp-capitalize-recursive (&optional ignore-marks-p) <span class="linecomment">; Bound to `M-+ % c'</span>
  "<span class="quote">Rename marked files, including in marked subdirs, by capitalizing them.
Like `diredp-capitalize', but act recursively on subdirs.

The files included are those that are marked in the current Dired
buffer, or all files in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way.

With a prefix argument, ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.</span>"
  (interactive (progn (diredp-get-confirmation-recursive) (list current-prefix-arg)))
  (diredp-create-files-non-directory-recursive
   #'dired-rename-file #'capitalize "<span class="quote">Rename by capitalizing:</span>" ignore-marks-p))

<span class="linecomment">;;;###autoload</span>
(defun diredp-upcase-recursive (&optional ignore-marks-p) <span class="linecomment">; Bound to `M-+ % u'</span>
  "<span class="quote">Rename marked files, including in marked subdirs, making them uppercase.
Like `dired-upcase', but act recursively on subdirs.

The files included are those that are marked in the current Dired
buffer, or all files in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way.

With a prefix argument, ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.</span>"
  (interactive (progn (diredp-get-confirmation-recursive) (list current-prefix-arg)))
  (diredp-create-files-non-directory-recursive
   #'dired-rename-file #'upcase "<span class="quote">Rename to uppercase:</span>" ignore-marks-p))

<span class="linecomment">;;;###autoload</span>
(defun diredp-downcase-recursive (&optional ignore-marks-p) <span class="linecomment">; Bound to `M-+ % l'</span>
  "<span class="quote">Rename marked files, including in marked subdirs, making them lowercase.
Like `dired-downcase', but act recursively on subdirs.

The files included are those that are marked in the current Dired
buffer, or all files in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way.

With a prefix argument, ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.</span>"
  (interactive (progn (diredp-get-confirmation-recursive) (list current-prefix-arg)))
  (diredp-create-files-non-directory-recursive
   #'dired-rename-file #'downcase "<span class="quote">Rename to lowercase:</span>" ignore-marks-p))

<span class="linecomment">;;;###autoload</span>
(defun diredp-do-move-recursive (&optional ignore-marks-p) <span class="linecomment">; Bound to `M-+ R'</span>
  "<span class="quote">Move marked files, including in marked subdirs, to a given directory.
Like `dired-do-rename', but act recursively on subdirs to pick up the
files to move.

The files included are those that are marked in the current Dired
buffer, or all files in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way.

This means move the marked files of marked subdirs and their marked
subdirs, etc.  It does not mean move or rename the subdirs themselves
recursively.

With a prefix argument, ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.

Renames any buffers that are visiting the files.

The default suggested for the target directory depends on the value of
`dired-dwim-target', which see.</span>"
  (interactive (progn (diredp-get-confirmation-recursive) (list current-prefix-arg)))
  (diredp-do-create-files-recursive #'dired-rename-file "<span class="quote">Move</span>" ignore-marks-p))

<span class="linecomment">;;;###autoload</span>
(defun diredp-do-copy-recursive (&optional ignore-marks-p) <span class="linecomment">; Bound to `M-+ C'</span>
  "<span class="quote">Copy marked files, including in marked subdirs, to a given directory.
Like `dired-do-copy', but act recursively on subdirs to pick up the
files to copy.

The files included are those that are marked in the current Dired
buffer, or all files in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way.

This means copy the marked files of marked subdirs and their marked
subdirs, etc.  It does not mean copy the subdirs themselves
recursively.

With a prefix argument, ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.

Preserves the last-modified date when copying, unless
`dired-copy-preserve-time' is nil.

The default suggested for the target directory depends on the value of
`dired-dwim-target', which see.

This command copies symbolic links by creating new ones, like UNIX
command `cp -d'.</span>"
  (interactive (progn (diredp-get-confirmation-recursive) (list current-prefix-arg)))
  (let ((dired-recursive-copies  nil))  <span class="linecomment">; Doesn't have to be nil, but let's not go overboard now.</span>
    (diredp-do-create-files-recursive #'dired-copy-file "<span class="quote">Copy</span>" ignore-marks-p)))

(defun diredp-do-create-files-recursive (file-creator operation ignore-marks-p)
  "<span class="quote">Create a new file for each marked file, including those in marked subdirs.
Like `dired-do-create-files', but act recursively on subdirs, and
always keep markings.
Prompts for the target directory, in which to create the files.
FILE-CREATOR OPERATION is as in `dired-create-files'.
Non-nil IGNORE-MARKS-P means ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.</span>"
  (lexical-let* ((fn-list     (diredp-get-files ignore-marks-p))
                 (target-dir  (dired-dwim-target-directory))
                 (defaults    (and (fboundp 'dired-dwim-target-defaults) <span class="linecomment">; Emacs 23+</span>
                                   (dired-dwim-target-defaults fn-list target-dir)))
                 (target      (expand-file-name
                               (if (fboundp 'minibuffer-with-setup-hook) <span class="linecomment">; Emacs 22+</span>
                                   (minibuffer-with-setup-hook
                                    (lambda ()
                                      (set (make-local-variable 'minibuffer-default-add-function)
                                           nil)
                                      (setq minibuffer-default  defaults))
                                    (funcall (if (fboundp 'read-directory-name)
                                                 #'read-directory-name
                                               #'read-file-name)
                                             (concat operation "<span class="quote"> files to: </span>")
                                             default-directory default-directory))
                                 (funcall (if (fboundp 'read-directory-name)
                                              #'read-directory-name
                                            #'read-file-name)
                                          (concat operation "<span class="quote">files to: </span>")
                                          default-directory default-directory)))))
    (unless (file-directory-p target) (error "<span class="quote">Target is not a directory: `%s'</span>" target))
    (dired-create-files
     file-creator operation fn-list
     #'(lambda (from) (expand-file-name (file-name-nondirectory from) target))
     <span class="linecomment">;; Hard-code `*' marker, or else it will be removed in lower dirs because the code uses</span>
     <span class="linecomment">;; `dired-file-marker', which only works in the current Dired directory.</span>
     ?*)))

(defun diredp-create-files-non-directory-recursive (file-creator basename-constructor
                                                    operation &optional ignore-marks-p)
  "<span class="quote">Apply FILE-CREATOR + BASENAME-CONSTRUCTOR to non-dir part of marked names.
Like `dired-create-files-non-directory', but act recursively on subdirs.

The files acted on are those marked in the current Dired buffer, or
all files in the directory if none are marked.  Marked subdirectories
are handled recursively in the same way.

With non-nil IGNORE-MARKS-P, ignore all marks - include all files in
this Dired buffer and all subdirs, recursively.</span>"
  (let (rename-non-directory-query)
    (dired-create-files
     file-creator
     operation
     (diredp-get-files ignore-marks-p)
     #'(lambda (from)
         (let ((to  (concat (file-name-directory from)
                            (funcall basename-constructor (file-name-nondirectory from)))))
           (and (let ((help-form  (format "<span class="quote">\
Type SPC or `y' to %s one file, DEL or `n' to skip to next,
`!' to %s all remaining matches with no more questions.</span>"
                                          (downcase operation)
                                          (downcase operation))))
                  (dired-query 'rename-non-directory-query (concat operation "<span class="quote"> `%s' to `%s'</span>")
                               (dired-make-relative from) (dired-make-relative to)))
                to)))
     <span class="linecomment">;; Hard-code `*' marker, or else it will be removed in lower dirs because the code uses</span>
     <span class="linecomment">;; `dired-file-marker', which only works in the current Dired directory.</span>
     ?*)))

(defun diredp-do-chxxx-recursive (attribute-name program op-symbol
                                  &optional ignore-marks-p default)
  "<span class="quote">Change attributes of the marked files, including those in marked subdirs.
Refresh their file lines.

Like `dired-do-chxxx', but act recursively on subdirs.  The subdirs
acted on are those that are marked in the current Dired buffer, or all
subdirs in the directory if none are marked.  Marked subdirectories
are handled recursively in the same way.

ATTRIBUTE-NAME is a string describing the attribute to the user.
PROGRAM is the program used to change the attribute.
OP-SYMBOL is the type of operation (for use in `dired-mark-pop-up').
Non-nil IGNORE-MARKS-P means ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.</span>"
  (let* ((this-buff      (current-buffer))
         (files          (diredp-get-files ignore-marks-p))
         (prompt         (concat "<span class="quote">Change </span>" attribute-name "<span class="quote"> of %s to: </span>"))
         (new-attribute  (if (&gt; emacs-major-version 22)
                             (dired-mark-read-string prompt nil op-symbol
                                                     ignore-marks-p files default)
                           (dired-mark-read-string prompt nil op-symbol ignore-marks-p files)))
         (operation      (concat program "<span class="quote"> </span>" new-attribute))
         failures)
    (setq failures  (dired-bunch-files 10000 (function dired-check-process)
                                       (append (list operation program)
                                               (unless (string-equal new-attribute "<span class="quote"></span>")
                                                 (if (equal attribute-name "<span class="quote">Timestamp</span>")
                                                     (list "<span class="quote">-t</span>" new-attribute)
                                                   (list new-attribute)))
                                               (and (string-match "<span class="quote">gnu</span>" system-configuration)
                                                    '("<span class="quote">--</span>"))) <span class="linecomment">; --------------------------------</span>
                                       files))
    (with-current-buffer this-buff
      (diredp-do-redisplay-recursive 'MSGP))
    (when failures (dired-log-summary (format "<span class="quote">%s: error</span>" operation) nil))))

<span class="linecomment">;;;###autoload</span>
(defun diredp-do-chmod-recursive (&optional ignore-marks-p) <span class="linecomment">; Bound to `M-+ M'</span>
  "<span class="quote">Change the mode of the marked files, including those in marked subdirs.
Symbolic modes like `g+w' are allowed.

Note that marked subdirs are not changed.  Their markings are used only
to indicate that some of their files are to be changed.</span>"
  (interactive (progn (diredp-get-confirmation-recursive) (list current-prefix-arg)))
  (let* ((files    (diredp-get-files ignore-marks-p))
         (modestr  (and (stringp (car files))
                        (nth 8 (file-attributes (car files)))))
         (default  (and (stringp modestr)
                        (string-match "<span class="quote">^.\\(...\\)\\(...\\)\\(...\\)$</span>" modestr)
                        (replace-regexp-in-string "<span class="quote">-</span>" "<span class="quote"></span>" (format "<span class="quote">u=%s,g=%s,o=%s</span>"
                                                                 (match-string 1 modestr)
                                                                 (match-string 2 modestr)
                                                                 (match-string 3 modestr)))))
         (modes    (if (&gt; emacs-major-version 22)
                       (dired-mark-read-string
                        "<span class="quote">Change mode of marked files here and below to: </span>" nil 'chmod
                        nil files default)
                     (dired-mark-read-string
                      "<span class="quote">Change mode of marked files here and below to: </span>" nil 'chmod
                      nil files))))
    (when (equal modes "<span class="quote"></span>") (error "<span class="quote">No file mode specified</span>"))
    (dolist (file  files)
      (set-file-modes file (or (and (string-match "<span class="quote">^[0-7]+</span>" modes)
                                    (string-to-number modes 8))
                               (file-modes-symbolic-to-number modes (file-modes file)))))
    (diredp-do-redisplay-recursive 'MSGP)))

(unless (memq system-type '(windows-nt ms-dos))
  (defun diredp-do-chgrp-recursive (&optional ignore-marks-p)
    "<span class="quote">Change the group of the marked (or next ARG) files.</span>"
    (interactive "<span class="quote">P</span>")
    (diredp-do-chxxx-recursive "<span class="quote">Group</span>" "<span class="quote">chgrp</span>" 'chgrp ignore-marks-p)))

(unless (memq system-type '(windows-nt ms-dos))
  (defun diredp-do-chown-recursive (&optional ignore-marks-p)
    "<span class="quote">Change the owner of the marked (or next ARG) files.</span>"
    (interactive "<span class="quote">P</span>")
    (diredp-do-chxxx-recursive "<span class="quote">Owner</span>" dired-chown-program 'chown ignore-marks-p)))

<span class="linecomment">;;;###autoload</span>
(defun diredp-do-touch-recursive (&optional ignore-marks-p)
  "<span class="quote">Change the timestamp of marked files, including those in marked subdirs.
This calls `touch'.  Like `dired-do-touch', but act recursively on
subdirs.  The subdirs inserted are those that are marked in the
current Dired buffer, or all subdirs in the directory if none are
marked.  Marked subdirectories are handled recursively in the same
way.

With a prefix argument, ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.</span>"
  (interactive (progn (diredp-get-confirmation-recursive) (list current-prefix-arg)))
  (diredp-do-chxxx-recursive "<span class="quote">Timestamp</span>" (if (boundp 'dired-touch-program)
                                             dired-touch-program <span class="linecomment">; Emacs 22+</span>
                                           "<span class="quote">touch</span>")
                             'touch
                             ignore-marks-p
                             (format-time-string "<span class="quote">%Y%m%d%H%M.%S</span>" (current-time))))

<span class="linecomment">;;;###autoload</span>
(defun diredp-do-redisplay-recursive (&optional msgp)
  "<span class="quote">Redisplay marked file lines, including those in marked subdirs.
Like `dired-do-redisplay' with no args, but act recursively on
subdirs.</span>"
  (interactive
   (progn (unless (eq major-mode 'dired-mode)
            (error "<span class="quote">You must be in a Dired buffer to use this command</span>"))
          (unless (y-or-n-p "<span class="quote">Act on all marked file lines in and UNDER this dir? </span>")
            (error "<span class="quote">OK, canceled</span>"))
          (list t)))
  (when msgp (message "<span class="quote">Redisplaying...</span>"))
  (dolist (dir  (cons default-directory
                      (diredp-get-files nil #'file-directory-p 'INCLUDE-SUBDIRS 'DONT-ASK)))
    (with-current-buffer (dired-noselect dir)
      <span class="linecomment">;; `message' is much faster than making `dired-map-over-marks' show progress</span>
      (dired-uncache (if (consp dired-directory) (car dired-directory) dired-directory))
      (dired-map-over-marks
       (let ((fname                    (dired-get-filename))
             <span class="linecomment">;; Postpone readin hook till we map over all marked files (Bug#6810).</span>
             (dired-after-readin-hook  nil))
         (message "<span class="quote">Redisplaying... %s</span>" fname)
         (dired-update-file-line fname))
       nil)
      (run-hooks 'dired-after-readin-hook)
      (dired-move-to-filename)))
  (when msgp (message "<span class="quote">Redisplaying...done</span>")))


<span class="linecomment">;;; `diredp-marked(-other-window)' tries to treat SWITCHES, but SWITCHES seems to be ignored</span>
<span class="linecomment">;;; by `dired' when the DIRNAME arg is a cons, at least on MS Windows.  I filed Emacs bug #952</span>
<span class="linecomment">;;; on 2008-09-10, but this doesn't work in Emacs 20, 21, 22, or 23, so I don't know if it will</span>
<span class="linecomment">;;; ever be fixed.  If it is declared a non-bug and it doesn't work on any platforms, then I'll</span>
<span class="linecomment">;;; remove SWITCHES here, alas.</span>

<span class="linecomment">;;;###autoload</span>
(defun diredp-marked (dirname &optional n switches) <span class="linecomment">; Not bound</span>
  "<span class="quote">Open Dired on only the marked files or the next N files.
With a non-zero numeric prefix arg N, use the next abs(N) files.
A plain (`C-u'), zero, or negative prefix arg prompts for listing
switches as in command `dired'.

Note that the marked files can include files in inserted
subdirectories, so the Dired buffer that is opened can contain files
from multiple directories in the same tree.</span>"
  (interactive
   (progn
     (unless (eq major-mode 'dired-mode) (error "<span class="quote">Use this command only in Dired mode</span>"))
     (let ((num  (and current-prefix-arg (atom current-prefix-arg)
                      (not (zerop (prefix-numeric-value current-prefix-arg)))
                      (abs (prefix-numeric-value current-prefix-arg)))))
       (list (cons (generate-new-buffer-name (buffer-name)) (dired-get-marked-files t num))
             num
             (and current-prefix-arg    <span class="linecomment">; Switches</span>
                  (or (consp current-prefix-arg) (&lt; (prefix-numeric-value current-prefix-arg) 0))
                  (read-string "<span class="quote">Dired listing switches: </span>" dired-listing-switches))))))
  (unless (or n (save-excursion (goto-char (point-min))
                                (and (re-search-forward (dired-marker-regexp) nil t)
                                     (re-search-forward (dired-marker-regexp) nil t))))
    (error "<span class="quote">No marked files</span>"))
  (dired dirname switches))

<span class="linecomment">;;;###autoload</span>
(defun diredp-marked-other-window (dirname &optional n switches) <span class="linecomment">; Bound to `C-M-*'</span>
  "<span class="quote">Same as `diredp-marked', but uses a different window.</span>"
  (interactive
   (progn
     (unless (eq major-mode 'dired-mode) (error "<span class="quote">Use this command only in Dired mode</span>"))
     (let ((num  (and current-prefix-arg (atom current-prefix-arg)
                      (not (zerop (prefix-numeric-value current-prefix-arg)))
                      (abs (prefix-numeric-value current-prefix-arg)))))
       (list (cons (generate-new-buffer-name (buffer-name)) (dired-get-marked-files t num))
             num
             (and current-prefix-arg    <span class="linecomment">; Switches</span>
                  (or (consp current-prefix-arg) (&lt; (prefix-numeric-value current-prefix-arg) 0))
                  (read-string "<span class="quote">Dired listing switches: </span>" dired-listing-switches))))))
  (unless (or n (save-excursion (goto-char (point-min))
                                (and (re-search-forward (dired-marker-regexp) nil t)
                                     (re-search-forward (dired-marker-regexp) nil t))))
    (error "<span class="quote">No marked files</span>"))
  (dired-other-window dirname switches))


<span class="linecomment">;; Similar to `dired-mark-extension' in `dired-x.el'.</span>
<span class="linecomment">;; The difference is that this uses prefix arg to unmark, not to determine the mark character.</span>
<span class="linecomment">;;;###autoload</span>
(defun diredp-mark/unmark-extension (extension &optional unmark-p) <span class="linecomment">; Bound to `* .'</span>
  "<span class="quote">Mark all files with a certain EXTENSION for use in later commands.
A `.' is not automatically prepended to the string entered.
Non-nil prefix argument UNMARK-P means unmark instead of mark.</span>"
  <span class="linecomment">;; EXTENSION may also be a list of extensions instead of a single one.</span>
  <span class="linecomment">;; Optional MARKER-CHAR is marker to use.</span>
  (interactive
   (list (dired-read-regexp (concat (if current-prefix-arg "<span class="quote">Unmark</span>" "<span class="quote">Mark</span>")
                                    "<span class="quote">ing extension: </span>"))
         current-prefix-arg))
  (or (listp extension)  (setq extension  (list extension)))
  (dired-mark-files-regexp (concat "<span class="quote">.</span>"<span class="linecomment">;; Do not match names with nothing but an extension</span>
                                   "<span class="quote">\\(</span>"
                                   (mapconcat 'regexp-quote extension "<span class="quote">\\|</span>")
                                   "<span class="quote">\\)$</span>")
                           (and current-prefix-arg ?\040)))

(defun diredp-mark-files-tagged-all/none (tags &optional none-p unmarkp prefix)
  "<span class="quote">Mark or unmark files tagged with all or none of TAGS.
TAGS is a list of strings, the tag names.
NONEP non-nil means mark/unmark files that have none of the TAGS.
UNMARKP non-nil means unmark; nil means mark.
PREFIX non-nil is the prefix of the autofile bookmarks to check.

As a special case, if TAGS is empty, then mark or unmark the files
that have any tags at all, or if NONEP is non-nil then mark or unmark
those that have no tags at all.</span>"
  (let ((dired-marker-char  (if unmarkp ?\040 dired-marker-char)))
    (dired-mark-if (and (not (looking-at dired-re-dot))  (not (eolp))
                        (let* ((fname     (dired-get-filename nil t))
                               (bmk       (and fname (bmkp-get-autofile-bookmark
                                                      fname nil prefix)))
                               (btgs      (and bmk (bmkp-get-tags bmk)))
                               (presentp  nil)
                               (allp      (and btgs
                                               (catch 'diredp-m-f-t-an
                                                 (dolist (tag  tags)
                                                   (setq presentp  (assoc-default
                                                                    tag btgs nil t))
                                                   (unless (if none-p (not presentp) presentp)
                                                     (throw 'diredp-m-f-t-an nil)))
                                                 t))))
                          (if (null tags)
                              (if none-p (not btgs) btgs)
                            allp)))
                   (if none-p "<span class="quote">no-tags-matching file</span>" "<span class="quote">all-tags-matching file</span>"))))

(defun diredp-mark-files-tagged-some/not-all (tags &optional notallp unmarkp prefix)
  "<span class="quote">Mark or unmark files tagged with any or not all of TAGS.
TAGS is a list of strings, the tag names.
NOTALLP non-nil means mark/unmark files that do not have all TAGS.
UNMARKP non-nil means unmark; nil means mark.
PREFIX non-nil is the prefix of the autofile bookmarks to check.

As a special case, if TAGS is empty, then mark or unmark the files
that have any tags at all, or if NOTALLP is non-nil then mark or
unmark those that have no tags at all.</span>"
  (let ((dired-marker-char  (if unmarkp ?\040 dired-marker-char)))
    (dired-mark-if (and (not (looking-at dired-re-dot))  (not (eolp))
                        (let* ((fname     (dired-get-filename nil t))
                               (bmk       (and fname (bmkp-get-autofile-bookmark
                                                      fname nil prefix)))
                               (btgs      (and bmk (bmkp-get-tags bmk)))
                               (presentp  nil)
                               (allp      (and btgs
                                               (catch 'diredp-m-f-t-sna
                                                 (dolist (tag  tags)
                                                   (setq presentp  (assoc-default
                                                                    tag btgs nil t))
                                                   (when (if notallp (not presentp) presentp)
                                                     (throw 'diredp-m-f-t-sna t)))
                                                 nil))))
                          (if (null tags)
                              (if notallp (not btgs) btgs)
                            allp)))
                   (if notallp "<span class="quote">some-tags-not-matching file</span>" "<span class="quote">some-tags-matching file</span>"))))

<span class="linecomment">;;;###autoload</span>
(defun diredp-mark-files-tagged-all (tags &optional none-p prefix) <span class="linecomment">; `T m *'</span>
  "<span class="quote">Mark all files that are tagged with *each* tag in TAGS.
As a special case, if TAGS is empty, then mark the files that have
 any tags at all (i.e., at least one tag).
With a prefix arg, mark all that are *not* tagged with *any* TAGS.
You need library `bookmark+.el' to use this command.</span>"
  (interactive
   (list (and (fboundp 'bmkp-read-tags-completing) (bmkp-read-tags-completing))
         current-prefix-arg
         (and diredp-prompt-for-bookmark-prefix-flag
              (read-string "<span class="quote">Prefix for autofile bookmark names: </span>"))))
  (unless (require 'bookmark+ nil t) (error "<span class="quote">This command requires library `bookmark+.el'</span>"))
  (unless (eq major-mode 'dired-mode)
    (error "<span class="quote">You must be in a Dired buffer to use this command</span>"))
  (diredp-mark-files-tagged-all/none tags none-p nil prefix))

<span class="linecomment">;;;###autoload</span>
(defun diredp-mark-files-tagged-none (tags &optional allp prefix) <span class="linecomment">; `T m ~ +'</span>
  "<span class="quote">Mark all files that are not tagged with *any* tag in TAGS.
As a special case, if TAGS is empty, then mark the files that have
 no tags at all.
With a prefix arg, mark all that are tagged with *each* tag in TAGS.
You need library `bookmark+.el' to use this command.</span>"
  (interactive
   (list (and (fboundp 'bmkp-read-tags-completing) (bmkp-read-tags-completing))
         current-prefix-arg
         (and diredp-prompt-for-bookmark-prefix-flag
              (read-string "<span class="quote">Prefix for autofile bookmark names: </span>"))))
  (unless (require 'bookmark+ nil t) (error "<span class="quote">This command requires library `bookmark+.el'</span>"))
  (unless (eq major-mode 'dired-mode)
    (error "<span class="quote">You must be in a Dired buffer to use this command</span>"))
  (diredp-mark-files-tagged-all/none tags (not allp) nil prefix))

<span class="linecomment">;;;###autoload</span>
(defun diredp-mark-files-tagged-some (tags &optional somenotp prefix) <span class="linecomment">; `T m +'</span>
  "<span class="quote">Mark all files that are tagged with *some* tag in TAGS.
As a special case, if TAGS is empty, then mark the files that have
 any tags at all (i.e., at least one tag).
With a prefix arg, mark all that are *not* tagged with *all* TAGS.
You need library `bookmark+.el' to use this command.</span>"
  (interactive
   (list (and (fboundp 'bmkp-read-tags-completing) (bmkp-read-tags-completing))
         current-prefix-arg
         (and diredp-prompt-for-bookmark-prefix-flag
              (read-string "<span class="quote">Prefix for autofile bookmark names: </span>"))))
  (unless (require 'bookmark+ nil t) (error "<span class="quote">This command requires library `bookmark+.el'</span>"))
  (unless (eq major-mode 'dired-mode)
    (error "<span class="quote">You must be in a Dired buffer to use this command</span>"))
  (diredp-mark-files-tagged-some/not-all tags somenotp nil prefix))

<span class="linecomment">;;;###autoload</span>
(defun diredp-mark-files-tagged-not-all (tags &optional somep prefix) <span class="linecomment">; `T m ~ *'</span>
  "<span class="quote">Mark all files that are not tagged with *all* TAGS.
As a special case, if TAGS is empty, then mark the files that have
 no tags at all.
With a prefix arg, mark all that are tagged with *some* TAGS.
You need library `bookmark+.el' to use this command.</span>"
  (interactive
   (list (and (fboundp 'bmkp-read-tags-completing) (bmkp-read-tags-completing))
         current-prefix-arg
         (and diredp-prompt-for-bookmark-prefix-flag
              (read-string "<span class="quote">Prefix for autofile bookmark names: </span>"))))
  (unless (require 'bookmark+ nil t) (error "<span class="quote">This command requires library `bookmark+.el'</span>"))
  (unless (eq major-mode 'dired-mode)
    (error "<span class="quote">You must be in a Dired buffer to use this command</span>"))
  (diredp-mark-files-tagged-some/not-all tags (not somep) nil prefix))

<span class="linecomment">;;;###autoload</span>
(defun diredp-mark-files-tagged-regexp (regexp &optional notp prefix) <span class="linecomment">; `T m %'</span>
  "<span class="quote">Mark files that have at least one tag that matches REGEXP.
With a prefix arg, mark all that are tagged but have no matching tags.
You need library `bookmark+.el' to use this command.</span>"
  (interactive
   (list (read-string "<span class="quote">Regexp: </span>")
         current-prefix-arg
         (and diredp-prompt-for-bookmark-prefix-flag
              (read-string "<span class="quote">Prefix for autofile bookmark names: </span>"))))
  (unless (require 'bookmark+ nil t) (error "<span class="quote">This command requires library `bookmark+.el'</span>"))
  (unless (eq major-mode 'dired-mode)
    (error "<span class="quote">You must be in a Dired buffer to use this command</span>"))
  (dired-mark-if (and (not (looking-at dired-re-dot))  (not (eolp))
                      (lexical-let* ((fname  (dired-get-filename nil t))
                                     (bmk    (and fname (bmkp-get-autofile-bookmark
                                                         fname nil prefix)))
                                     (btgs   (and bmk (bmkp-get-tags bmk)))
                                     (anyp   (and btgs  (bmkp-some
                                                         #'(lambda (tag)
                                                             (string-match regexp
                                                                           (bmkp-tag-name tag)))
                                                         btgs))))
                        (and btgs (if notp (not anyp) anyp))))
                 "<span class="quote">some-tag-matching-regexp file</span>"))

<span class="linecomment">;;;###autoload</span>
(defun diredp-unmark-files-tagged-regexp (regexp &optional notp prefix) <span class="linecomment">; `T u %'</span>
  "<span class="quote">Unmark files that have at least one tag that matches REGEXP.
With a prefix arg, unmark all that are tagged but have no matching tags.
You need library `bookmark+.el' to use this command.</span>"
  (interactive
   (list (read-string "<span class="quote">Regexp: </span>")
         current-prefix-arg
         (and diredp-prompt-for-bookmark-prefix-flag
              (read-string "<span class="quote">Prefix for autofile bookmark names: </span>"))))
  (unless (require 'bookmark+ nil t) (error "<span class="quote">This command requires library `bookmark+.el'</span>"))
  (unless (eq major-mode 'dired-mode)
    (error "<span class="quote">You must be in a Dired buffer to use this command</span>"))
  (let ((dired-marker-char  ?\040))
    (dired-mark-if (and (not (looking-at dired-re-dot))  (not (eolp))
                        (lexical-let* ((fname  (dired-get-filename nil t))
                                       (bmk    (and fname (bmkp-get-autofile-bookmark
                                                           fname nil prefix)))
                                       (btgs   (and bmk (bmkp-get-tags bmk)))
                                       (anyp   (and btgs (bmkp-some
                                                          #'(lambda (tag)
                                                              (string-match regexp
                                                                            (bmkp-tag-name tag)))
                                                          btgs))))
                          (and btgs (if notp (not anyp) anyp))))
                   "<span class="quote">some-tag-matching-regexp file</span>")))

<span class="linecomment">;;;###autoload</span>
(defun diredp-unmark-files-tagged-all (tags &optional none-p prefix) <span class="linecomment">; `T u *'</span>
  "<span class="quote">Unmark all files that are tagged with *each* tag in TAGS.
As a special case, if TAGS is empty, then unmark the files that have
 any tags at all (i.e., at least one tag).
With a prefix arg, unmark all that are *not* tagged with *any* TAGS.
You need library `bookmark+.el' to use this command.</span>"
  (interactive
   (list (and (fboundp 'bmkp-read-tags-completing) (bmkp-read-tags-completing))
         current-prefix-arg
         (and diredp-prompt-for-bookmark-prefix-flag
              (read-string "<span class="quote">Prefix for autofile bookmark names: </span>"))))
  (unless (require 'bookmark+ nil t) (error "<span class="quote">This command requires library `bookmark+.el'</span>"))
  (unless (eq major-mode 'dired-mode)
    (error "<span class="quote">You must be in a Dired buffer to use this command</span>"))
  (diredp-mark-files-tagged-all/none tags none-p 'UNMARK prefix))

<span class="linecomment">;;;###autoload</span>
(defun diredp-unmark-files-tagged-none (tags &optional allp prefix) <span class="linecomment">; `T u ~ +'</span>
  "<span class="quote">Unmark all files that are *not* tagged with *any* tag in TAGS.
As a special case, if TAGS is empty, then unmark the files that have
 no tags at all.
With a prefix arg, unmark all that are tagged with *each* tag in TAGS.
You need library `bookmark+.el' to use this command.</span>"
  (interactive
   (list (and (fboundp 'bmkp-read-tags-completing) (bmkp-read-tags-completing))
         current-prefix-arg
         (and diredp-prompt-for-bookmark-prefix-flag
              (read-string "<span class="quote">Prefix for autofile bookmark names: </span>"))))
  (unless (require 'bookmark+ nil t) (error "<span class="quote">This command requires library `bookmark+.el'</span>"))
  (unless (eq major-mode 'dired-mode)
    (error "<span class="quote">You must be in a Dired buffer to use this command</span>"))
  (diredp-mark-files-tagged-all/none tags (not allp) 'UNMARK prefix))

<span class="linecomment">;;;###autoload</span>
(defun diredp-unmark-files-tagged-some (tags &optional somenotp prefix) <span class="linecomment">; `T u +'</span>
  "<span class="quote">Unmark all files that are tagged with *some* tag in TAGS.
As a special case, if TAGS is empty, then unmark the files that have
 any tags at all.
With a prefix arg, unmark all that are *not* tagged with *all* TAGS.
You need library `bookmark+.el' to use this command.</span>"
  (interactive
   (list (and (fboundp 'bmkp-read-tags-completing) (bmkp-read-tags-completing))
         current-prefix-arg
         (and diredp-prompt-for-bookmark-prefix-flag
              (read-string "<span class="quote">Prefix for autofile bookmark names: </span>"))))
  (unless (require 'bookmark+ nil t) (error "<span class="quote">This command requires library `bookmark+.el'</span>"))
  (unless (eq major-mode 'dired-mode)
    (error "<span class="quote">You must be in a Dired buffer to use this command</span>"))
  (diredp-mark-files-tagged-some/not-all tags somenotp 'UNMARK prefix))

<span class="linecomment">;;;###autoload</span>
(defun diredp-unmark-files-tagged-not-all (tags &optional somep prefix) <span class="linecomment">; `T u ~ *'</span>
  "<span class="quote">Unmark all files that are *not* tagged with *all* TAGS.
As a special case, if TAGS is empty, then unmark the files that have
 no tags at all.
With a prefix arg, unmark all that are tagged with *some* TAGS.
You need library `bookmark+.el' to use this command.</span>"
  (interactive
   (list (and (fboundp 'bmkp-read-tags-completing) (bmkp-read-tags-completing))
         current-prefix-arg
         (and diredp-prompt-for-bookmark-prefix-flag
              (read-string "<span class="quote">Prefix for autofile bookmark names: </span>"))))
  (unless (require 'bookmark+ nil t) (error "<span class="quote">This command requires library `bookmark+.el'</span>"))
  (unless (eq major-mode 'dired-mode)
    (error "<span class="quote">You must be in a Dired buffer to use this command</span>"))
  (diredp-mark-files-tagged-some/not-all tags (not somep) 'UNMARK prefix))

<span class="linecomment">;;;###autoload</span>
(defun diredp-do-tag (tags &optional prefix arg) <span class="linecomment">; `T &gt; +'</span>
  "<span class="quote">Tag the marked (or the next prefix argument) files.
You need library `bookmark+.el' to use this command.

Hit `RET' to enter each tag, then hit `RET' again after the last tag.
You can use completion to enter each tag.  Completion is lax: you are
not limited to existing tags.

TAGS is a list of strings.  PREFIX is as for `diredp-do-bookmark'.

A prefix argument ARG specifies files to use instead of those marked.
 An integer means use the next ARG files (previous -ARG, if &lt; 0).
 `C-u': Use the current file (whether or not any are marked).
 `C-u C-u': Use all files in Dired, except directories.
 `C-u C-u C-u': Use all files and directories, except `.' and `..'.
 `C-u C-u C-u C-u': Use all files and all directories.</span>"
  (interactive
   (progn (unless (require 'bookmark+ nil t)
            (error "<span class="quote">This command requires library `bookmark+.el'</span>"))
          (unless (eq major-mode 'dired-mode)
            (error "<span class="quote">You must be in a Dired buffer to use this command</span>"))
          (list (bmkp-read-tags-completing)
                (and diredp-prompt-for-bookmark-prefix-flag
                     (read-string "<span class="quote">Prefix for autofile bookmark name: </span>"))
                current-prefix-arg)))
  (dired-map-over-marks-check (lexical-let ((pref  prefix)) #'(lambda () (diredp-tag tags pref)))
                              arg 'tag (diredp-fewer-than-2-files-p arg)))

(defun diredp-tag (tags &optional prefix)
  "<span class="quote">Add tags to the file or directory named on the current line.
You need library `bookmark+.el' to use this function.
The bookmark name is the non-directory portion of the file name,
 prefixed by PREFIX if it is non-nil.
Return nil for success, file name otherwise.</span>"
  (bookmark-maybe-load-default-file)
  (let ((file  (dired-get-file-for-visit))
        failure)
    (condition-case err
        (bmkp-autofile-add-tags file tags nil prefix)
      (error (setq failure  (error-message-string err))))
    (if (not failure)
        nil                             <span class="linecomment">; Return nil for success.</span>
      (dired-log failure)
      (dired-make-relative file))))     <span class="linecomment">; Return file name for failure.</span>

<span class="linecomment">;;;###autoload</span>
(defun diredp-mouse-do-tag (event)      <span class="linecomment">; Not bound</span>
  "<span class="quote">In Dired, add some tags to this file.
You need library `bookmark+.el' to use this command.</span>"
  (interactive "<span class="quote">e</span>")
  (unless (require 'bookmark+ nil t) (error "<span class="quote">This command requires library `bookmark+.el'</span>"))
  (unless (eq major-mode 'dired-mode)
    (error "<span class="quote">You must be in a Dired buffer to use this command</span>"))
  (lexical-let ((mouse-pos         (event-start event))
                (dired-no-confirm  t)
                (prefix            (and diredp-prompt-for-bookmark-prefix-flag
                                        (read-string "<span class="quote">Prefix for bookmark name: </span>"))))
    (select-window (posn-window mouse-pos))
    (goto-char (posn-point mouse-pos))
    (dired-map-over-marks-check #'(lambda () (diredp-tag (bmkp-read-tags-completing) prefix))
                                1 'tag t))
  (dired-previous-line 1))

<span class="linecomment">;;;###autoload</span>
(defun diredp-do-untag (tags &optional prefix arg) <span class="linecomment">; `T &gt; -'</span>
  "<span class="quote">Remove some tags from the marked (or the next prefix arg) files.
You need library `bookmark+.el' to use this command.

Hit `RET' to enter each tag, then hit `RET' again after the last tag.
You can use completion to enter each tag.  Completion is lax: you are
not limited to existing tags.

TAGS is a list of strings.  PREFIX is as for `diredp-do-bookmark'.

A prefix argument ARG specifies files to use instead of those marked.
 An integer means use the next ARG files (previous -ARG, if &lt; 0).
 `C-u': Use the current file (whether or not any are marked).
 `C-u C-u': Use all files in Dired, except directories.
 `C-u C-u C-u': Use all files and directories, except `.' and `..'.
 `C-u C-u C-u C-u': Use all files and all directories.</span>"
  (interactive
   (progn
     (unless (require 'bookmark+ nil t) (error "<span class="quote">This command requires library `bookmark+.el'</span>"))
     (unless (eq major-mode 'dired-mode)
       (error "<span class="quote">You must be in a Dired buffer to use this command</span>"))
     (list (bmkp-read-tags-completing)
           (and diredp-prompt-for-bookmark-prefix-flag
                (read-string "<span class="quote">Prefix for bookmark name: </span>"))
           current-prefix-arg)))
  (dired-map-over-marks-check (lexical-let ((pref  prefix))
                                #'(lambda () (diredp-untag tags pref)))
                              arg 'untag (diredp-fewer-than-2-files-p arg)))

(defun diredp-untag (tags &optional prefix)
  "<span class="quote">Remove some tags from the file or directory named on the current line.
You need library `bookmark+.el' to use this function.
The bookmark name is the non-directory portion of the file name,
 prefixed by PREFIX if it is non-nil.
Return nil for success, file name otherwise.</span>"
  (bookmark-maybe-load-default-file)
  (let ((file  (dired-get-file-for-visit))
        failure)
    (condition-case err
        (bmkp-autofile-remove-tags file tags nil prefix)
      (error (setq failure  (error-message-string err))))
    (if (not failure)
        nil                             <span class="linecomment">; Return nil for success.</span>
      (dired-log failure)
      (dired-make-relative file))))     <span class="linecomment">; Return file name for failure.</span>

<span class="linecomment">;;;###autoload</span>
(defun diredp-mouse-do-untag (event)    <span class="linecomment">; Not bound</span>
  "<span class="quote">In Dired, remove some tags from this file.
You need library `bookmark+.el' to use this command.</span>"
  (interactive "<span class="quote">e</span>")
  (unless (require 'bookmark+ nil t) (error "<span class="quote">This command requires library `bookmark+.el'</span>"))
  (unless (eq major-mode 'dired-mode)
    (error "<span class="quote">You must be in a Dired buffer to use this command</span>"))
  (lexical-let ((mouse-pos         (event-start event))
                (dired-no-confirm  t)
                (prefix            (and diredp-prompt-for-bookmark-prefix-flag
                                        (read-string "<span class="quote">Prefix for bookmark name: </span>"))))
    (select-window (posn-window mouse-pos))
    (goto-char (posn-point mouse-pos))
    (lexical-let* ((bmk   (bmkp-get-autofile-bookmark  (dired-get-filename) nil prefix))
                   (btgs  (and bmk (bmkp-get-tags bmk))))
      (unless btgs (error "<span class="quote">File has no tags to remove</span>"))
      (dired-map-over-marks-check
       #'(lambda () (diredp-untag (bmkp-read-tags-completing btgs) prefix)) 1 'untag t)))
  (dired-previous-line 1))

<span class="linecomment">;;;###autoload</span>
(defun diredp-do-remove-all-tags (&optional prefix arg) <span class="linecomment">; `T &gt; 0'</span>
  "<span class="quote">Remove all tags from the marked (or the next prefix arg) files.
You need library `bookmark+.el' to use this command.

PREFIX is as for `diredp-do-bookmark'.

A prefix argument ARG specifies files to use instead of those marked.
 An integer means use the next ARG files (previous -ARG, if &lt; 0).
 `C-u': Use the current file (whether or not any are marked).
 `C-u C-u': Use all files in Dired, except directories.
 `C-u C-u C-u': Use all files and directories, except `.' and `..'.
 `C-u C-u C-u C-u': Use all files and all directories.</span>"
  (interactive
   (progn
     (unless (require 'bookmark+ nil t) (error "<span class="quote">This command requires library `bookmark+.el'</span>"))
     (unless (eq major-mode 'dired-mode)
       (error "<span class="quote">You must be in a Dired buffer to use this command</span>"))
     (list (and diredp-prompt-for-bookmark-prefix-flag
                (read-string "<span class="quote">Prefix for bookmark name: </span>"))
           current-prefix-arg)))
  (lexical-let ((pref  prefix))
    (dired-map-over-marks-check #'(lambda () (diredp-remove-all-tags pref)) arg 'remove-all-tags
                                (diredp-fewer-than-2-files-p arg))))

(defun diredp-remove-all-tags (&optional prefix)
  "<span class="quote">Remove all tags from the file or directory named on the current line.
You need library `bookmark+.el' to use this function.
The bookmark name is the non-directory portion of the file name,
 prefixed by PREFIX if it is non-nil.
Return nil for success, file name otherwise.</span>"
  (bookmark-maybe-load-default-file)
  (let ((file  (dired-get-file-for-visit))
        failure)
    (condition-case err
        (bmkp-remove-all-tags (bmkp-autofile-set file nil prefix))
      (error (setq failure  (error-message-string err))))
    (if (not failure)
        nil                             <span class="linecomment">; Return nil for success.</span>
      (dired-log failure)
      (dired-make-relative file))))     <span class="linecomment">; Return file name for failure.</span>

<span class="linecomment">;;;###autoload</span>
(defun diredp-mouse-do-remove-all-tags (event) <span class="linecomment">; Not bound</span>
  "<span class="quote">In Dired, remove all tags from the marked (or next prefix arg) files.
You need library `bookmark+.el' to use this command.</span>"
  (interactive "<span class="quote">e</span>")
  (unless (require 'bookmark+ nil t) (error "<span class="quote">This command requires library `bookmark+.el'</span>"))
  (unless (eq major-mode 'dired-mode)
    (error "<span class="quote">You must be in a Dired buffer to use this command</span>"))
  (lexical-let ((mouse-pos         (event-start event))
                (dired-no-confirm  t)
                (prefix            (and diredp-prompt-for-bookmark-prefix-flag
                                        (read-string "<span class="quote">Prefix for bookmark name: </span>"))))
    (select-window (posn-window mouse-pos))
    (goto-char (posn-point mouse-pos))
    (dired-map-over-marks-check #'(lambda () (diredp-remove-all-tags prefix))
                                1 'remove-all-tags t))
  (dired-previous-line 1))

<span class="linecomment">;;;###autoload</span>
(defun diredp-do-paste-add-tags (&optional prefix arg) <span class="linecomment">; `T &gt; p', `T &gt; C-y'</span>
  "<span class="quote">Add previously copied tags to the marked (or next prefix arg) files.
The tags were previously copied from a file to `bmkp-copied-tags'.
You need library `bookmark+.el' to use this command.

A prefix argument ARG specifies files to use instead of those marked.
 An integer means use the next ARG files (previous -ARG, if &lt; 0).
 `C-u': Use the current file (whether or not any are marked).
 `C-u C-u': Use all files in Dired, except directories.
 `C-u C-u C-u': Use all files and directories, except `.' and `..'.
 `C-u C-u C-u C-u': Use all files and all directories.</span>"
  (interactive
   (progn
     (unless (require 'bookmark+ nil t) (error "<span class="quote">This command requires library `bookmark+.el'</span>"))
     (unless (eq major-mode 'dired-mode)
       (error "<span class="quote">You must be in a Dired buffer to use this command</span>"))
     (list (and diredp-prompt-for-bookmark-prefix-flag
                (read-string "<span class="quote">Prefix for autofile bookmark name: </span>"))
           current-prefix-arg)))
  (dired-map-over-marks-check (lexical-let ((pref  prefix))
                                #'(lambda () (diredp-paste-add-tags pref)))
                              arg 'paste-add-tags
                              (diredp-fewer-than-2-files-p arg)))

(defun diredp-paste-add-tags (&optional prefix)
  "<span class="quote">Add previously copied tags to the file or directory on the current line.
The tags were previously copied from a file to `bmkp-copied-tags'.
You need library `bookmark+.el' to use this function.
The bookmark name is the non-directory portion of the file name,
 prefixed by PREFIX if it is non-nil.
Return nil for success, file name otherwise.</span>"
  (bookmark-maybe-load-default-file)
  (let ((file  (dired-get-file-for-visit))
        failure)
    (condition-case err
        (bmkp-autofile-add-tags file bmkp-copied-tags nil prefix)
      (error (setq failure  (error-message-string err))))
    (if (not failure)
        nil                             <span class="linecomment">; Return nil for success.</span>
      (dired-log failure)
      (dired-make-relative file))))     <span class="linecomment">; Return file name for failure.</span>

<span class="linecomment">;;;###autoload</span>
(defun diredp-mouse-do-paste-add-tags (event) <span class="linecomment">; Not bound</span>
  "<span class="quote">In Dired, add previously copied tags to this file.
The tags were previously copied from a file to `bmkp-copied-tags'.
You need library `bookmark+.el' to use this command.</span>"
  (interactive "<span class="quote">e</span>")
  (unless (require 'bookmark+ nil t) (error "<span class="quote">This command requires library `bookmark+.el'</span>"))
  (unless (eq major-mode 'dired-mode)
    (error "<span class="quote">You must be in a Dired buffer to use this command</span>"))
  (lexical-let ((mouse-pos         (event-start event))
                (dired-no-confirm  t)
                (prefix            (and diredp-prompt-for-bookmark-prefix-flag
                                        (read-string "<span class="quote">Prefix for bookmark name: </span>"))))
    (select-window (posn-window mouse-pos))
    (goto-char (posn-point mouse-pos))
    (dired-map-over-marks-check #'(lambda () (diredp-paste-add-tags prefix))
                                1 'paste-add-tags t))
  (dired-previous-line 1))

<span class="linecomment">;;;###autoload</span>
(defun diredp-do-paste-replace-tags (&optional prefix arg) <span class="linecomment">; `T &gt; q'</span>
  "<span class="quote">Replace tags for marked (or next prefix arg) files with copied tags.
The tags were previously copied from a file to `bmkp-copied-tags'.
You need library `bookmark+.el' to use this command.

A prefix argument ARG specifies files to use instead of those marked.
 An integer means use the next ARG files (previous -ARG, if &lt; 0).
 `C-u': Use the current file (whether or not any are marked).
 `C-u C-u': Use all files in Dired, except directories.
 `C-u C-u C-u': Use all files and directories, except `.' and `..'.
 `C-u C-u C-u C-u': Use all files and all directories.</span>"
  (interactive
   (progn
     (unless (require 'bookmark+ nil t) (error "<span class="quote">This command requires library `bookmark+.el'</span>"))
     (unless (eq major-mode 'dired-mode)
       (error "<span class="quote">You must be in a Dired buffer to use this command</span>"))
     (list (and diredp-prompt-for-bookmark-prefix-flag
                (read-string "<span class="quote">Prefix for autofile bookmark name: </span>"))
           current-prefix-arg)))
  (dired-map-over-marks-check (lexical-let ((pref  prefix))
                                #'(lambda () (diredp-paste-replace-tags pref)))
                              arg 'paste-replace-tags (diredp-fewer-than-2-files-p arg)))

(defun diredp-paste-replace-tags (&optional prefix)
  "<span class="quote">Replace tags for this file or dir with tags copied previously.
The tags were previously copied from a file to `bmkp-copied-tags'.
You need library `bookmark+.el' to use this function.
The bookmark name is the non-directory portion of the file name,
 prefixed by PREFIX if it is non-nil.
Return nil for success, file name otherwise.</span>"
  (bookmark-maybe-load-default-file)
  (let ((file  (dired-get-file-for-visit))
        failure)
    (condition-case err
        (progn (bmkp-remove-all-tags (bmkp-autofile-set file nil prefix))
               (bmkp-autofile-add-tags file bmkp-copied-tags nil prefix))
      (error (setq failure  (error-message-string err))))
    (if (not failure)
        nil                             <span class="linecomment">; Return nil for success.</span>
      (dired-log failure)
      (dired-make-relative file))))

<span class="linecomment">;;;###autoload</span>
(defun diredp-mouse-do-paste-replace-tags (event) <span class="linecomment">; Not bound</span>
  "<span class="quote">In Dired, replace tags for this file with tags copied previously.
The tags were previously copied from a file to `bmkp-copied-tags'.
You need library `bookmark+.el' to use this command.</span>"
  (interactive "<span class="quote">e</span>")
  (unless (require 'bookmark+ nil t) (error "<span class="quote">This command requires library `bookmark+.el'</span>"))
  (unless (eq major-mode 'dired-mode)
    (error "<span class="quote">You must be in a Dired buffer to use this command</span>"))
  (lexical-let ((mouse-pos         (event-start event))
                (dired-no-confirm  t)
                (prefix            (and diredp-prompt-for-bookmark-prefix-flag
                                        (read-string "<span class="quote">Prefix for bookmark name: </span>"))))
    (select-window (posn-window mouse-pos))
    (goto-char (posn-point mouse-pos))
    (dired-map-over-marks-check #'(lambda () (diredp-paste-replace-tags prefix))
                                1 'paste-replace-tags t))
  (dired-previous-line 1))

<span class="linecomment">;;;###autoload</span>
(defun diredp-do-set-tag-value (tag value &optional prefix arg) <span class="linecomment">; `T &gt; v'</span>
  "<span class="quote">Set TAG value to VALUE, for the marked (or next prefix arg) files.
This does not change the TAG name.
You need library `bookmark+.el' to use this command.

PREFIX is as for `diredp-do-bookmark'.

A prefix argument ARG specifies files to use instead of those marked.
 An integer means use the next ARG files (previous -ARG, if &lt; 0).
 `C-u': Use the current file (whether or not any are marked).
 `C-u C-u': Use all files in Dired, except directories.
 `C-u C-u C-u': Use all files and directories, except `.' and `..'.
 `C-u C-u C-u C-u': Use all files and all directories.</span>"
  (interactive
   (progn
     (unless (require 'bookmark+ nil t) (error "<span class="quote">This command requires library `bookmark+.el'</span>"))
     (unless (eq major-mode 'dired-mode)
       (error "<span class="quote">You must be in a Dired buffer to use this command</span>"))
     (list (bmkp-read-tag-completing)
           (read (read-string "<span class="quote">Value: </span>"))
           (and diredp-prompt-for-bookmark-prefix-flag
                (read-string "<span class="quote">Prefix for bookmark name: </span>"))
           current-prefix-arg)))
  (dired-map-over-marks-check (lexical-let ((tg    tag)
                                            (val   value)
                                            (pref  prefix))
                                #'(lambda () (diredp-set-tag-value tg val pref)))
                              arg 'set-tag-value (diredp-fewer-than-2-files-p arg)))

(defun diredp-set-tag-value (tag value &optional prefix)
  "<span class="quote">Set TAG value to VALUE for this file or directory.
This does not change the TAG name.
You need library `bookmark+.el' to use this function.
The bookmark name is the non-directory portion of the file name,
 prefixed by PREFIX if it is non-nil.
Return nil for success, file name otherwise.</span>"
  (bookmark-maybe-load-default-file)
  (let ((file  (dired-get-file-for-visit))
        failure)
    (condition-case err
        (bmkp-set-tag-value (bmkp-autofile-set file nil prefix) tag value)
      (error (setq failure  (error-message-string err))))
    (if (not failure)
        nil                             <span class="linecomment">; Return nil for success.</span>
      (dired-log failure)
      (dired-make-relative file))))     <span class="linecomment">; Return file name for failure.</span>

<span class="linecomment">;;;###autoload</span>
(defun diredp-mouse-do-set-tag-value (event) <span class="linecomment">; Not bound</span>
  "<span class="quote">In Dired, set the value of a tag for this file.
This does not change the tag name.
You need library `bookmark+.el' to use this command.</span>"
  (interactive "<span class="quote">e</span>")
  (unless (require 'bookmark+ nil t) (error "<span class="quote">This command requires library `bookmark+.el'</span>"))
  (unless (eq major-mode 'dired-mode)
    (error "<span class="quote">You must be in a Dired buffer to use this command</span>"))
  (lexical-let ((mouse-pos         (event-start event))
                (dired-no-confirm  t)
                (prefix            (and diredp-prompt-for-bookmark-prefix-flag
                                        (read-string "<span class="quote">Prefix for bookmark name: </span>"))))
    (select-window (posn-window mouse-pos))
    (goto-char (posn-point mouse-pos))
    (dired-map-over-marks-check #'(lambda () (diredp-set-tag-value (bmkp-read-tag-completing)
                                                                   (read (read-string "<span class="quote">Value: </span>"))
                                                                   prefix))
                                1 'set-tag-value t))
  (dired-previous-line 1))

<span class="linecomment">;;;###autoload</span>
(defun diredp-do-bookmark (&optional prefix arg) <span class="linecomment">; Bound to `M-b'</span>
  "<span class="quote">Bookmark the marked (or the next prefix argument) files.
Each bookmark name is the non-directory portion of the file name,
 prefixed by PREFIX if it is non-nil.
Interactively, you are prompted for the PREFIX if
 `diredp-prompt-for-bookmark-prefix-flag' is non-nil.
The bookmarked position is the beginning of the file.
If you use library `bookmark+.el' then the bookmark is an autofile.

A prefix argument ARG specifies files to use instead of those marked.
 An integer means use the next ARG files (previous -ARG, if &lt; 0).
 `C-u': Use the current file (whether or not any are marked).
 `C-u C-u': Use all files in Dired, except directories.
 `C-u C-u C-u': Use all files and directories, except `.' and `..'.
 `C-u C-u C-u C-u': Use all files and all directories.</span>"
  (interactive
   (progn (unless (eq major-mode 'dired-mode)
            (error "<span class="quote">You must be in a Dired buffer to use this command</span>"))
          (list (and diredp-prompt-for-bookmark-prefix-flag
                     (read-string "<span class="quote">Prefix for bookmark name: </span>"))
                current-prefix-arg)))
  (dired-map-over-marks-check (lexical-let ((pref  prefix))
                                #'(lambda () (diredp-bookmark pref nil 'NO-MSG-P)))
                              arg 'bookmark (diredp-fewer-than-2-files-p arg)))

<span class="linecomment">;;;###autoload</span>
(defun diredp-mouse-do-bookmark (event) <span class="linecomment">; Not bound</span>
  "<span class="quote">In Dired, bookmark this file.  See `diredp-do-bookmark'.</span>"
  (interactive "<span class="quote">e</span>")
  (lexical-let ((mouse-pos         (event-start event))
                (dired-no-confirm  t)
                (prefix            (and diredp-prompt-for-bookmark-prefix-flag
                                        (read-string "<span class="quote">Prefix for bookmark name: </span>"))))
    (select-window (posn-window mouse-pos))
    (goto-char (posn-point mouse-pos))
    (dired-map-over-marks-check #'(lambda () (diredp-bookmark prefix nil 'NO-MSG-P))
                                nil 'bookmark t))
  (dired-previous-line 1))

(defun diredp-bookmark (&optional prefix file no-msg-p)
  "<span class="quote">Bookmark the file or directory FILE.
If you use library `bookmark+.el' then the bookmark is an autofile.
Return nil for success or the file name otherwise.

The bookmark name is the (non-directory) file name, prefixed by
 optional arg PREFIX (a string) if non-nil.

FILE defaults to the file name on the current Dired line.

Non-nil optional arg NO-MSG-P means do not show progress messages.</span>"
  (bookmark-maybe-load-default-file)
  (let ((fil      (or file  (dired-get-file-for-visit)))
        (failure  nil))
    (condition-case err
        (if (fboundp 'bmkp-autofile-set)
            (bmkp-autofile-set fil nil prefix)
          (let ((bookmark-make-record-function
                 (cond ((and (require 'image nil t) (require 'image-mode nil t)
                             (condition-case nil (image-type fil) (error nil)))
                        <span class="linecomment">;; Last two lines of function are from `image-bookmark-make-record'.</span>
                        <span class="linecomment">;; But don't use that directly, because it uses</span>
                        <span class="linecomment">;; `bookmark-make-record-default', which gets nil for `filename'.</span>

                        <span class="linecomment">;; NEED to keep this code sync'd with `bmkp-make-record-for-target-file'.</span>
                        (lambda ()
                          `((filename   . ,fil)
                            (position   . 0)
                            (image-type . ,(image-type fil))
                            (handler    . image-bookmark-jump))))
                       (t
                        (lambda ()
                          `((filename . ,fil)
                            (position . 0)))))))
            (bookmark-store (concat prefix (file-name-nondirectory fil))
                            (cdr (bookmark-make-record))
                            nil
                            no-msg-p)))
      (error (setq failure  (error-message-string err))))
    (if (not failure)
        nil                             <span class="linecomment">; Return nil for success.</span>
      (if (fboundp 'bmkp-autofile-set)
          (dired-log failure)
        (dired-log "<span class="quote">Failed to create bookmark for `%s':\n%s\n</span>" fil failure))
      (dired-make-relative fil))))      <span class="linecomment">; Return file name for failure.</span>

<span class="linecomment">;;;###autoload</span>
(defun diredp-set-bookmark-file-bookmark-for-marked (bookmark-file <span class="linecomment">; Bound to `C-M-b'</span>
                                                     &optional prefix arg)
  "<span class="quote">Bookmark the marked files and create a bookmark-file bookmark for them.
The bookmarked position is the beginning of the file.
Jumping to the bookmark-file bookmark loads the set of file bookmarks.
You need library `bookmark+.el' to use this command.

Each bookmark name is the non-directory portion of the file name,
 prefixed by PREFIX if it is non-nil.
Interactively, you are prompted for PREFIX if
 `diredp-prompt-for-bookmark-prefix-flag' is non-nil.

A prefix argument ARG specifies files to use instead of those marked.
 An integer means use the next ARG files (previous -ARG, if &lt; 0).
 `C-u': Use the current file (whether or not any are marked).
 `C-u C-u': Use all files in Dired, except directories.
 `C-u C-u C-u': Use all files and directories, except `.' and `..'.
 `C-u C-u C-u C-u': Use all files and all directories.

You are also prompted for the bookmark file, BOOKMARK-FILE.  The
default is `.emacs.bmk' in the current directory, but you can enter
any file name, anywhere.

The marked-file bookmarks are added to file BOOKMARK-FILE, but this
command does not make BOOKMARK-FILE the current bookmark file.  To
make it current, just jump to the bookmark-file bookmark created by
this command.  That bookmark (which bookmarks BOOKMARK-FILE) is
defined in that current bookmark file.

Example:

 Bookmark file `~/.emacs.bmk' is current before invoking this command.
 The current (Dired) directory is `/foo/bar'.
 The marked files are bookmarked in the (possibly new) bookmark file
   `/foo/bar/.emacs.bmk'.
 The bookmarks for the marked files have names prefixed by `FOOBAR '.
 The name of the bookmark-file bookmark is `Foobar Files'.
 Bookmark `Foobar Files' is itself in bookmark file `~/.emacs.bmk'.
 Bookmark file `~/.emacs.bmk' is current after invoking this command.

You are prompted for the name of the bookmark-file bookmark, the
BOOKMARK-FILE for the marked-file bookmarks, and a PREFIX string for
each of the marked-file bookmarks.

See also command `diredp-do-bookmark-in-bookmark-file'.</span>"
  (interactive (diredp-read-bookmark-file-args))
  (unless (require 'bookmark+ nil t) (error "<span class="quote">This command requires library `bookmark+.el'</span>"))
  (diredp-do-bookmark-in-bookmark-file bookmark-file prefix arg 'CREATE-BOOKMARK-FILE-BOOKMARK))

<span class="linecomment">;;;###autoload</span>
(defun diredp-do-bookmark-in-bookmark-file (bookmark-file <span class="linecomment">; Bound to `C-M-S-b' (`C-M-B')</span>
                                            &optional prefix arg bfile-bookmarkp files)
  "<span class="quote">Bookmark files in BOOKMARK-FILE and save BOOKMARK-FILE.
The files bookmarked are the marked files, by default.
The bookmarked position is the beginning of the file.
You are prompted for BOOKMARK-FILE.  The default is `.emacs.bmk' in
the current directory, but you can enter any file name, anywhere.
You need library `bookmark+.el' to use this command.

The marked files are bookmarked in file BOOKMARK-FILE, but this
command does not make BOOKMARK-FILE the current bookmark file.  To
make it current, use `\\[bmkp-switch-bookmark-file]' (`bmkp-switch-bookmark-file').

Each bookmark name is the non-directory portion of the file name,
 prefixed by PREFIX if it is non-nil.
Interactively, you are prompted for PREFIX if
 `diredp-prompt-for-bookmark-prefix-flag' is non-nil.

Interactively, a prefix argument ARG specifies the files to use
instead of those marked.

 An integer means use the next ARG files (previous -ARG, if &lt; 0).
 `C-u': Use the current file (whether or not any are marked).
 `C-u C-u': Use all files in Dired, except directories.
 `C-u C-u C-u': Use all files and directories, except `.' and `..'.
 `C-u C-u C-u C-u': Use all files and all directories.

See also command `diredp-set-bookmark-file-bookmark-for-marked'.

Non-interactively:

 * Non-nil BFILE-BOOKMARKP means create a bookmark-file bookmark for
   BOOKMARK-FILE.
 * Non-nil FILES is the list of files to bookmark.</span>"
  (interactive (diredp-read-bookmark-file-args))
  (unless (require 'bookmark+ nil t) (error "<span class="quote">This command requires library `bookmark+.el'</span>"))
  (let ((bfile-exists-p  (file-readable-p bookmark-file)))
    (unless bfile-exists-p (bmkp-empty-file bookmark-file))
    (unless bmkp-current-bookmark-file (setq bmkp-current-bookmark-file  bookmark-default-file))
    (let ((old-bmkp-current-bookmark-file  bmkp-current-bookmark-file))
      (unwind-protect
           (progn (bmkp-switch-bookmark-file bookmark-file) <span class="linecomment">; Changes `*-current-bookmark-file'.</span>
                  (if files
                      (dolist (file  files)  (diredp-bookmark prefix file 'NO-MSG-P))
                    (dired-map-over-marks-check
                     (lexical-let ((pref  prefix))
                       #'(lambda () (diredp-bookmark pref nil 'NO-MSG-P)))
                     arg 'bookmark (diredp-fewer-than-2-files-p arg)))
                  (bookmark-save)
                  (unless bfile-exists-p (revert-buffer)))
        (unless (bmkp-same-file-p old-bmkp-current-bookmark-file  bmkp-current-bookmark-file)
          (bmkp-switch-bookmark-file old-bmkp-current-bookmark-file 'NO-MSG))))
    (when bfile-bookmarkp (bmkp-set-bookmark-file-bookmark bookmark-file))))

(defun diredp-read-bookmark-file-args ()
  "<span class="quote">Read args for `diredp-do-bookmark-in-bookmark-file' and similar.</span>"
  (unless (require 'bookmark+ nil t) (error "<span class="quote">This command requires library `bookmark+.el'</span>"))
  (unless (eq major-mode 'dired-mode)
    (error "<span class="quote">You must be in a Dired buffer to use this command</span>"))
  (list (let* ((insert-default-directory  t)
               (bmk-file                  (expand-file-name
                                           (read-file-name
                                            "<span class="quote">Use bookmark file (default is in CURRENT dir): </span>" nil
                                            (if (or (&gt; emacs-major-version 23)
                                                    (and (= emacs-major-version 23)
                                                         (&gt; emacs-minor-version 1)))
                                                (list "<span class="quote">.emacs.bmk</span>"
                                                      bookmark-default-file)
                                              "<span class="quote">.emacs.bmk</span>")))))
          bmk-file)
        (and diredp-prompt-for-bookmark-prefix-flag
             (read-string "<span class="quote">Prefix for autofile bookmark names: </span>"))
        current-prefix-arg))


<span class="linecomment">;; REPLACE ORIGINAL in `dired.el'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Allows for consp `dired-directory' too.</span>
<span class="linecomment">;;</span>
(defun dired-buffers-for-dir (dir &optional file)
  "<span class="quote">Return a list of buffers that dired DIR (top level or in-situ subdir).
If FILE is non-nil, include only those whose wildcard pattern (if any)
matches FILE.
The list is in reverse order of buffer creation, most recent last.
As a side effect, killed dired buffers for DIR are removed from
`dired-buffers'.</span>"
  (setq dir (file-name-as-directory dir))
  (let (result buf)
    (dolist (elt  dired-buffers)
      (setq buf  (cdr elt))
      (cond ((null (buffer-name buf))   <span class="linecomment">; Buffer is killed - clean up.</span>
             (setq dired-buffers  (delq elt dired-buffers)))
            ((dired-in-this-tree dir (car elt))
             (with-current-buffer buf
               (and (assoc dir dired-subdir-alist)
                    (or (null file)
                        (if (stringp dired-directory)
                            <span class="linecomment">;; Allow for consp `dired-directory' too.</span>
                            (let ((wildcards  (file-name-nondirectory
                                               (if (consp dired-directory)
                                                   (car dired-directory)
                                                 dired-directory))))
                              (or (= 0 (length wildcards))
                                  (string-match (dired-glob-regexp wildcards) file)))
                          (member (expand-file-name file dir) (cdr dired-directory))))
                    (setq result  (cons buf result)))))))
    result))


<span class="linecomment">;; These functions let you use the file on the current line as the default.</span>
<span class="linecomment">;; They are useful only in Emacs 22 or later.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; However, if you use library `files+.el', you need not use these commands explicitly,</span>
<span class="linecomment">;; because that library redefines `find-file-read-args' to do the same thing, in Dired mode.</span>
<span class="linecomment">;; These are provided here in case you want to bind them directly - for example, in case your</span>
<span class="linecomment">;; code does not use `find-file-read-args'.</span>
<span class="linecomment">;;</span>
(when (fboundp 'dired-get-file-for-visit) <span class="linecomment">; Defined in Emacs 22.</span>
  (defun diredp-find-a-file (filename &optional wildcards) <span class="linecomment">; Not bound</span>
    "<span class="quote">`find-file', but use file on current line as default (`M-n').</span>"
    (interactive (diredp-find-a-file-read-args "<span class="quote">Find file: </span>" nil))
    (find-file filename wildcards))

  (defun diredp-find-a-file-other-frame (filename &optional wildcards) <span class="linecomment">; Not bound</span>
    "<span class="quote">`find-file-other-frame', but use file under cursor as default (`M-n').</span>"
    (interactive (diredp-find-a-file-read-args "<span class="quote">Find file: </span>" nil))
    (find-file-other-frame filename wildcards))

  (defun diredp-find-a-file-other-window (filename &optional wildcards) <span class="linecomment">; Not bound</span>
    "<span class="quote">`find-file-other-window', but use file under cursor as default (`M-n').</span>"
    (interactive (diredp-find-a-file-read-args "<span class="quote">Find file: </span>" nil))
    (find-file-other-window filename wildcards))

  (defun diredp-find-a-file-read-args (prompt mustmatch) <span class="linecomment">; Not bound</span>
    (list (lexical-let ((find-file-default  (abbreviate-file-name (dired-get-file-for-visit))))
            (minibuffer-with-setup-hook #'(lambda ()
                                            (setq minibuffer-default  find-file-default))
                                        (read-file-name prompt nil default-directory mustmatch)))
          t)))

<span class="linecomment">;; Define these for Emacs 20 and 21.</span>
(unless (fboundp 'dired-get-file-for-visit) <span class="linecomment">; Defined in Emacs 22.</span>
  (defun dired-get-file-for-visit () <span class="linecomment">; Not bound</span>
    "<span class="quote">Get the current line's file name, with an error if file does not exist.</span>"
    (interactive)
    <span class="linecomment">;; We pass t for second arg so that we don't get error for `.' and `..'.</span>
    (let ((raw  (dired-get-filename nil t))
          file-name)
      (unless raw (error "<span class="quote">No file on this line</span>"))
      (setq file-name  (file-name-sans-versions raw t))
      (if (file-exists-p file-name)
          file-name
        (if (file-symlink-p file-name)
            (error "<span class="quote">File is a symlink to a nonexistent target</span>")
          (error "<span class="quote">File no longer exists; type `g' to update Dired buffer</span>")))))

  (defun dired-find-alternate-file () <span class="linecomment">; Not bound</span>
    "<span class="quote">In Dired, visit this file or directory instead of the dired buffer.</span>"
    (interactive)
    (set-buffer-modified-p nil)
    (find-alternate-file (dired-get-file-for-visit))))

<span class="linecomment">;;;###autoload</span>
(defun diredp-find-file-reuse-dir-buffer () <span class="linecomment">; Not bound</span>
  "<span class="quote">Like `dired-find-file', but reuse Dired buffers.
Unlike `dired-find-alternate-file' this does not use
`find-alternate-file' if the target is not a directory.</span>"
  (interactive)
  (set-buffer-modified-p nil)
  (let ((file  (dired-get-file-for-visit)))
    (if (file-directory-p file) (find-alternate-file file) (find-file file))))

<span class="linecomment">;;;###autoload</span>
(defun diredp-mouse-find-file-reuse-dir-buffer (event) <span class="linecomment">; Not bound</span>
  "<span class="quote">Like `diredp-mouse-find-file', but reuse Dired buffers.
Unlike `dired-find-alternate-file' this does not use
`find-alternate-file' if the target is not a directory.</span>"
  (interactive "<span class="quote">e</span>")
  (let (file)
    (with-current-buffer (window-buffer (posn-window (event-end event)))
      (save-excursion (goto-char (posn-point (event-end event)))
                      (setq file  (dired-get-file-for-visit))))
    (select-window (posn-window (event-end event)))
    (if (file-directory-p file)
        (find-alternate-file (file-name-sans-versions file t))
      (find-file (file-name-sans-versions file t)))))

<span class="linecomment">;;;###autoload</span>
(defalias 'toggle-diredp-find-file-reuse-dir 'diredp-toggle-find-file-reuse-dir)
<span class="linecomment">;;;###autoload</span>
(defun diredp-toggle-find-file-reuse-dir (force-p) <span class="linecomment">; Not bound</span>
  "<span class="quote">Toggle whether Dired `find-file' commands reuse directories.
A prefix arg specifies directly whether or not to reuse.
 If its numeric value is non-negative then reuse; else do not reuse.

To set the behavior as a preference (default behavior), put this in
your ~/.emacs, where VALUE is 1 to reuse or -1 to not reuse:

 (diredp-toggle-find-file-reuse-dir VALUE)</span>"
  (interactive "<span class="quote">P</span>")
  (if force-p                           <span class="linecomment">; Force.</span>
      (if (natnump (prefix-numeric-value force-p))
          (diredp-make-find-file-keys-reuse-dirs)
        (diredp-make-find-file-keys-not-reuse-dirs))
    (if (where-is-internal 'dired-find-file dired-mode-map 'ascii)
        (diredp-make-find-file-keys-reuse-dirs)
      (diredp-make-find-file-keys-not-reuse-dirs))))

(defun diredp-make-find-file-keys-reuse-dirs ()
  "<span class="quote">Make find-file keys reuse Dired buffers.</span>"
  (substitute-key-definition 'dired-find-file 'diredp-find-file-reuse-dir-buffer dired-mode-map)
  (substitute-key-definition 'diredp-mouse-find-file
                             'diredp-mouse-find-file-reuse-dir-buffer dired-mode-map)
  <span class="linecomment">;; These commands are defined in `w32-browser.el' (for use with MS Windows).</span>
  (substitute-key-definition 'dired-w32-browser
                             'dired-w32-browser-reuse-dir-buffer dired-mode-map)
  (substitute-key-definition 'dired-mouse-w32-browser
                             'dired-mouse-w32-browser-reuse-dir-buffer dired-mode-map)
  (message "<span class="quote">Reusing Dired buffers is now ON</span>"))

(defun diredp-make-find-file-keys-not-reuse-dirs ()
  "<span class="quote">Make find-file keys not reuse Dired buffers (i.e. act normally).</span>"
  (substitute-key-definition 'diredp-find-file-reuse-dir-buffer 'dired-find-file dired-mode-map)
  (substitute-key-definition 'diredp-mouse-find-file-reuse-dir-buffer
                             'diredp-mouse-find-file dired-mode-map)
  <span class="linecomment">;; These commands are defined in `w32-browser.el' (for use with MS Windows).</span>
  (substitute-key-definition 'dired-w32-browser-reuse-dir-buffer
                             'dired-w32-browser dired-mode-map)
  (substitute-key-definition 'dired-mouse-w32-browser-reuse-dir-buffer
                             'dired-mouse-w32-browser dired-mode-map)
  (message "<span class="quote">Reusing Dired buffers is now OFF</span>"))

<span class="linecomment">;;;###autoload</span>
(defun diredp-omit-marked ()            <span class="linecomment">; Not bound</span>
  "<span class="quote">Omit lines of marked files.  Return the number of lines omitted.</span>"
  (interactive)
  (let ((old-modified-p  (buffer-modified-p))
        count)
    (when (interactive-p) (message "<span class="quote">Omitting marked lines...</span>"))
    (setq count  (dired-do-kill-lines nil "<span class="quote">Omitted %d line%s.</span>"))
    (set-buffer-modified-p old-modified-p) <span class="linecomment">; So no `%*' appear in mode-line.</span>
    count))

<span class="linecomment">;; `dired-do-toggle' was renamed to `dired-toggle-marks' after Emacs 20.</span>
<span class="linecomment">;; That's why we aliased it to `dired-toggle-marks' at the top of the file.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;###autoload</span>
(defun diredp-omit-unmarked ()          <span class="linecomment">; Not bound</span>
  "<span class="quote">Omit lines of unmarked files.  Return the number of lines omitted.</span>"
  (interactive)
  (let ((old-modified-p  (buffer-modified-p))
        count)
    (dired-do-toggle)
    (message "<span class="quote">Omitting unmarked lines...</span>")
    (setq count  (diredp-omit-marked))
    (dired-do-toggle)                   <span class="linecomment">; Marks all except `.', `..'</span>
    (set-buffer-modified-p old-modified-p) <span class="linecomment">; So no `%*' appear in mode-line.</span>
    count))

<span class="linecomment">;;;###autoload</span>
(defun diredp-ediff (file2)             <span class="linecomment">; Bound to `='</span>
  "<span class="quote">Compare file at cursor with file FILE2 using `ediff'.
FILE2 defaults to the file at the cursor as well.  If you enter just a
directory name for FILE2, then the file at the cursor is compared with
a file of the same name in that directory.  FILE2 is the second file
given to `ediff'; the file at the cursor is the first.</span>"
  (interactive
   (progn
     (require 'ediff)
     (list (ediff-read-file-name        <span class="linecomment">; In `ediff.el'.</span>
            (format "<span class="quote">Compare %s with</span>" (dired-get-filename t))
            (dired-current-directory) (dired-get-filename)))))
  (ediff-files (dired-get-filename) file2)) <span class="linecomment">; In `ediff.el'.</span>


(defun diredp-fewer-than-2-files-p (arg)
  "<span class="quote">Return non-nil iff fewer than two files are to be treated by dired.
More precisely, return non-nil iff ARG is nil and fewer than two
files are marked, or ARG is -1, 0 or 1.</span>"
  (if arg
      (and (integerp arg) (&lt; (abs arg) 2)) <span class="linecomment">; Next or previous file (or none).</span>
    (not (save-excursion                <span class="linecomment">; Fewer than two marked files.</span>
           (goto-char (point-min))
           (re-search-forward (dired-marker-regexp) nil t 2)))))


<span class="linecomment">;; REPLACE ORIGINAL in `dired-aux.el'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 1. Redisplay only if at most one file is being treated.</span>
<span class="linecomment">;; 2. Doc string reflects Dired+'s version of `dired-map-over-marks-check'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;###autoload</span>
(defun dired-do-compress (&optional arg) <span class="linecomment">; Bound to `Z'</span>
  "<span class="quote">Compress or uncompress marked (or next prefix argument) files.
A prefix argument ARG specifies files to use instead of marked.
 An integer means use the next ARG files (previous -ARG, if &lt; 0).
 `C-u': Use the current file (whether or not any are marked).
 `C-u C-u': Use all files in Dired, except directories.
 `C-u C-u C-u': Use all files and directories, except `.' and `..'.
 `C-u C-u C-u C-u': Use all files and all directories.</span>"
  (interactive "<span class="quote">P</span>")
  (dired-map-over-marks-check #'dired-compress arg 'compress (diredp-fewer-than-2-files-p arg)))


<span class="linecomment">;; REPLACE ORIGINAL in `dired-aux.el'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 1. Redisplay only if at most one file is being treated.</span>
<span class="linecomment">;; 2. Doc string reflects Dired+'s version of `dired-map-over-marks-check'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;###autoload</span>
(defun dired-do-byte-compile (&optional arg) <span class="linecomment">; Bound to `B'</span>
  "<span class="quote">Byte compile marked (or next prefix argument) Emacs Lisp files.
A prefix argument ARG specifies files to use instead of marked.
 An integer means use the next ARG files (previous -ARG, if &lt; 0).
 `C-u': Use the current file (whether or not any are marked).
 `C-u C-u': Use all files in Dired, except directories.
 `C-u C-u C-u': Use all files and directories, except `.' and `..'.
 `C-u C-u C-u C-u': Use all files and all directories.</span>"
  (interactive "<span class="quote">P</span>")
  (dired-map-over-marks-check #'dired-byte-compile arg 'byte-compile
                              (diredp-fewer-than-2-files-p arg)))


<span class="linecomment">;; REPLACE ORIGINAL in `dired-aux.el'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 1. Redisplay only if at most one file is being treated.</span>
<span class="linecomment">;; 2. Doc string reflects Dired+'s version of `dired-map-over-marks-check'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;###autoload</span>
(defun dired-do-load (&optional arg)    <span class="linecomment">; Bound to `L'</span>
  "<span class="quote">Load the marked (or next prefix argument) Emacs Lisp files.
A prefix argument ARG specifies files to use instead of marked.
 An integer means use the next ARG files (previous -ARG, if &lt; 0).
 `C-u': Use the current file (whether or not any are marked).
 `C-u C-u': Use all files in Dired, except directories.
 `C-u C-u C-u': Use all files and directories, except `.' and `..'.
 `C-u C-u C-u C-u': Use all files and all directories.</span>"
  (interactive "<span class="quote">P</span>")
  (dired-map-over-marks-check #'dired-load arg 'load (diredp-fewer-than-2-files-p arg)))

(defun diredp-do-grep (command-args)    <span class="linecomment">; Bound to `M-g'</span>
  "<span class="quote">Run `grep' on marked (or next prefix arg) files.
A prefix argument behaves according to the ARG argument of
`dired-get-marked-files'.  In particular, `C-u C-u' operates on all
files in the Dired buffer.</span>"
  (interactive (progn (unless (if (&lt; emacs-major-version 22)
                                  grep-command
                                (and grep-command  (or (not grep-use-null-device)
                                                       (eq grep-use-null-device t))))
                        (grep-compute-defaults))
                      (list (diredp-do-grep-1))))
  (grep command-args))

<span class="linecomment">;; Optional arg FILES is no longer used.  It was used in `diredp-do-grep' before the</span>
<span class="linecomment">;; new `dired-get-marked-files'.</span>
(defun diredp-do-grep-1 (&optional files)
  "<span class="quote">Helper function for `diredp-do-grep'.
Non-nil optional arg FILES are the files to grep, overriding the files
choice described for `diredp-do-grep'.</span>"
  (let ((default  (and (fboundp 'grep-default-command) (grep-default-command))))
    (read-from-minibuffer
     "<span class="quote">grep &lt;pattern&gt; &lt;files&gt; :  </span>"
     (let ((up-to-files  (concat grep-command "<span class="quote">   </span>")))
       (cons (concat up-to-files
                     (mapconcat #'identity
                                (or files
                                    (mapcar 'shell-quote-argument
                                            (dired-get-marked-files nil current-prefix-arg)))
                                "<span class="quote"> </span>"))
             (- (length up-to-files) 2)))
     nil nil 'grep-history default)))

(when (memq system-type '(windows-nt ms-dos))
  (define-derived-mode diredp-w32-drives-mode fundamental-mode "<span class="quote">Drives</span>"
    "<span class="quote">Open Dired for an MS Windows drive (local or remote).</span>"
    (setq buffer-read-only  t)))

<span class="linecomment">;; The next two commands were originally taken from Emacs Wiki, page WThirtyTwoBrowseNetDrives:</span>
<span class="linecomment">;; http://www.emacswiki.org/emacs/WThirtyTwoBrowseNetDrives.  They are referred to there as</span>
<span class="linecomment">;; commands `show-net-connections' and `netdir'.  I am hoping that the contributor (anonymous)</span>
<span class="linecomment">;; does not mind my adapting them and including them in Dired+.</span>

(when (memq system-type '(windows-nt ms-dos))
  (defun diredp-w32-list-mapped-drives () <span class="linecomment">; Not bound</span>
    "<span class="quote">List network connection information for shared MS Windows resources.
This just invokes the Windows `NET USE' command.</span>"
    (interactive)
    (shell-command "<span class="quote">net use</span>")
    (display-buffer "<span class="quote">*Shell Command Output*</span>")))

(when (memq system-type '(windows-nt ms-dos))
  (defun diredp-w32-drives (&optional other-window-p) <span class="linecomment">; Not bound</span>
    "<span class="quote">Visit a list of MS Windows drives for use by Dired.
With a prefix argument use another window for the list.
In the list, use `mouse-2' or `RET' to open Dired for a given drive.

The drives listed are the remote drives currently available, as
determined by the Windows command `NET USE', plus the local drives
specified by option `diredp-w32-local-drives', which you can
customize.

Note: When you are in Dired at the root of a drive (e.g. directory
      `c:/'), command `dired-up-directory' invokes this command.
      So you can use `\\[dired-up-directory]' to go up to the list of drives.</span>"
    (interactive "<span class="quote">P</span>")
    (require 'widget)
    (let ((drive              (copy-sequence diredp-w32-local-drives))
          (inhibit-read-only  t))
      (with-temp-buffer
        (insert (shell-command-to-string "<span class="quote">net use</span>"))
        (goto-char (point-min))
        (while (re-search-forward "<span class="quote">[A-Z]: +\\\\\\\\[^ ]+</span>" nil t nil)
          (setq drive  (cons (split-string (match-string 0)) drive))))
      (if other-window-p
          (pop-to-buffer "<span class="quote">*Windows Drives*</span>")
        (switch-to-buffer "<span class="quote">*Windows Drives*</span>"))
      (erase-buffer)
      (widget-minor-mode 1)
      (dolist (drv  (sort drive (lambda (a b) (string-lessp (car a) (car b)))))
        (lexical-let ((drv  drv))
          (widget-create 'push-button
                         :notify (lambda (widget &rest ignore) (dired (car drv)))
                         (concat (car drv) "<span class="quote">  </span>" (cadr drv))))
        (widget-insert "<span class="quote">\n</span>"))
      (goto-char (point-min))
      (diredp-w32-drives-mode))))

<span class="linecomment">;; $$$$$$ NO LONGER USED.  Was used in `dired-do-grep(-1)' before new `dired-get-marked-files'.</span>
(defun diredp-all-files ()
  "<span class="quote">List of all files shown in current Dired buffer.
Directories are not included.</span>"
  (let ((pos    (make-marker))
        (files  ())
        file)
    (save-excursion
      (goto-char (point-min)) (beginning-of-line)
      (while (not (eobp))
        (beginning-of-line)
        (while (and (not (eobp))  (dired-between-files))  (forward-line 1))
        (save-excursion (forward-line 1) (move-marker pos (1+ (point))))
        (setq file  (dired-get-filename nil t)) <span class="linecomment">; Non-nil second arg means "also . and ..".</span>
        (when file                      <span class="linecomment">; Remove directory portion if in same directory.</span>
          (setq file  (dired-get-filename (dired-in-this-tree file default-directory) t)))
        (unless (or (not file) (file-directory-p file))  (push file files))
        (goto-char pos))
      (move-marker pos nil))
    (setq files  (sort files (if (and (featurep 'ls-lisp)
                                      (not (symbol-value 'ls-lisp-use-insert-directory-program)))
                                 'ls-lisp-string-lessp
                               (if case-fold-search
                                   (lambda (s1 s2) (string-lessp (upcase s1) (upcase s2)))
                                 'string-lessp))))))


<span class="linecomment">;; REPLACE ORIGINAL in `dired-aux.el'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 1. Use `diredp-this-subdir' instead of `dired-get-filename'.</span>
<span class="linecomment">;; 2. If on a subdir listing header line or a non-dir file in a subdir listing, go to</span>
<span class="linecomment">;;    the line for the subdirectory in the parent directory listing.</span>
<span class="linecomment">;; 3. Fit one-window frame after inserting subdir.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;###autoload</span>
(defun dired-maybe-insert-subdir (dirname &optional switches no-error-if-not-dir-p)
                                        <span class="linecomment">; Bound to `i'</span>
  "<span class="quote">Move to Dired subdirectory line or subdirectory listing.
This bounces you back and forth between a subdirectory line and its
inserted listing header line.  Using it on a non-directory line in a
subdirectory listing acts the same as using it on the subdirectory
header line.

* If on a subdirectory line, then go to the subdirectory's listing,
  creating it if not yet present.

* If on a subdirectory listing header line or a non-directory file in
  a subdirectory listing, then go to the line for the subdirectory in
  the parent directory listing.

* If on a non-directory file in the top Dired directory listing, do
  nothing.

Subdirectories are listed in the same position as for `ls -lR' output.

With a prefix arg, you can edit the `ls' switches used for this
listing.  Add `R' to the switches to expand the directory tree under a
subdirectory.

Dired remembers the switches you specify with a prefix arg, so
reverting the buffer does not reset them.  However, you might
sometimes need to reset some subdirectory switches after a
`dired-undo'.  You can reset all subdirectory switches to the
default value using \\&lt;dired-mode-map&gt;\\[dired-reset-subdir-switches].  See \
Info node
`(emacs)Subdir switches' for more details.</span>"
  (interactive (list (diredp-this-subdir)
                     (and current-prefix-arg
                          (read-string "<span class="quote">Switches for listing: </span>"
                                       (or (and (boundp 'dired-subdir-switches)
                                                dired-subdir-switches)
                                           dired-actual-switches)))))
  (let ((opoint    (point))
        (filename  dirname))
    (cond ((consp filename)             <span class="linecomment">; Subdir header line or non-directory file.</span>
           (setq filename  (car filename))
           (if (assoc filename dired-subdir-alist)
               (dired-goto-file filename) <span class="linecomment">;  Subdir header line.</span>
             (dired-insert-subdir (substring (file-name-directory filename) 0 -1))))
          (t
           <span class="linecomment">;; We don't need a marker for opoint as the subdir is always</span>
           <span class="linecomment">;; inserted *after* opoint.</span>
           (setq dirname  (file-name-as-directory dirname))
           (or (and (not switches)  (dired-goto-subdir dirname))
               (dired-insert-subdir dirname switches no-error-if-not-dir-p))
           <span class="linecomment">;; Push mark so that it's easy to go back.  Do this after the</span>
           <span class="linecomment">;; insertion message so that the user sees the `Mark set' message.</span>
           (push-mark opoint)
           (when (and (get-buffer-window (current-buffer)) <span class="linecomment">; Fit one-window frame.</span>
                      (fboundp 'fit-frame-if-one-window))
             (fit-frame-if-one-window))))))

(defun diredp-this-subdir ()
  "<span class="quote">This line's filename, if directory, or `dired-current-directory' list.
If on a directory line, then return the directory name.
Else return a singleton list of a directory name, which is as follows:
  If on a subdirectory header line (either of the two lines), then use
  that subdirectory name.  Else use the parent directory name.</span>"
  (or (let ((file  (dired-get-filename nil t)))
        (and file (file-directory-p file)
             (not (member (file-relative-name file (file-name-directory
                                                    (directory-file-name file)))
                          '("<span class="quote">.</span>" "<span class="quote">..</span>" "<span class="quote">./</span>" "<span class="quote">../</span>")))
             file))
      (list (dired-current-directory))))


<span class="linecomment">;; REPLACE ORIGINAL in `dired-x.el'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Fix the `interactive' spec.  This is the Emacs 24+ version, provided for earlier versions.</span>
<span class="linecomment">;;</span>
(unless (&gt; emacs-major-version 23)
  (defun dired-mark-unmarked-files (regexp msg &optional unflag-p localp)
    "<span class="quote">Mark unmarked files matching REGEXP, displaying MSG.
REGEXP is matched against the entire file name.  When called
interactively, prompt for REGEXP.
With prefix argument, unflag all those files.

Non-interactively:
 Returns t if any work was done, nil otherwise.
 Optional fourth argument LOCALP is as in `dired-get-filename'.</span>"
    (interactive
     (list (dired-read-regexp
            "<span class="quote">Mark unmarked files matching regexp (default all): </span>")
           nil current-prefix-arg nil))
    (let ((dired-marker-char (if unflag-p ?\   dired-marker-char)))
      (dired-mark-if
       (and
        <span class="linecomment">;; not already marked</span>
        (looking-at "<span class="quote"> </span>")
        <span class="linecomment">;; uninteresting</span>
        (let ((fn (dired-get-filename localp t)))
          (and fn (string-match regexp fn))))
       msg))))


<span class="linecomment">;;; VISIT ALL MARKED FILES SIMULTANEOUSLY.</span>

<span class="linecomment">;;; Brief Description:</span>
<span class="linecomment">;;;</span>
<span class="linecomment">;;; `dired-do-find-marked-files' is bound to `F' by dired-x.el.</span>
<span class="linecomment">;;;</span>
<span class="linecomment">;;; * Use `dired-get-marked-files' to collect the marked files in the current</span>
<span class="linecomment">;;;   Dired Buffer into a list of filenames `FILE-LIST'.</span>
<span class="linecomment">;;;</span>
<span class="linecomment">;;; * Pass FILE-LIST to `dired-simultaneous-find-file' all with</span>
<span class="linecomment">;;;   `dired-do-find-marked-files''s prefix argument OPTION.</span>
<span class="linecomment">;;;</span>
<span class="linecomment">;;; * `dired-simultaneous-find-file' runs through FILE-LIST decrementing the</span>
<span class="linecomment">;;;   list each time.</span>
<span class="linecomment">;;;</span>
<span class="linecomment">;;; * If OPTION and `pop-up-frames' are both nil, then calculate the</span>
<span class="linecomment">;;; `size' of the window for each file by dividing the `window-height'</span>
<span class="linecomment">;;; by length of FILE-LIST.  Thus, `size' is cognizant of the</span>
<span class="linecomment">;;; window-configuration.</span>
<span class="linecomment">;;;</span>
<span class="linecomment">;;; * If `size' is too small abort, otherwise run `find-file' on each element</span>
<span class="linecomment">;;;   of FILE-LIST giving each a window of height `size'.</span>


<span class="linecomment">;; REPLACE ORIGINAL in `dired-x.el'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 1. Call `dired-get-marked-files' with original ARG, to get its multi-C-u behavior.</span>
<span class="linecomment">;; 2. Doc string updated to reflect change to `dired-simultaneous-find-file'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;###autoload</span>
(defun dired-do-find-marked-files (&optional arg) <span class="linecomment">; Bound to `F'</span>
  "<span class="quote">Find marked files, displaying all of them simultaneously.
With a prefix ARG &gt;= 0, just find files but do not select them.

If no prefix ARG, and variable `pop-up-frames' is non-nil, or
if prefix ARG &lt; 0, then each file is displayed in a separate frame.

Otherwise (no prefix ARG and nil `pop-up-frames'), the current window
is split across all marked files, as evenly as possible.  Remaining
lines go to the bottom-most window.  The number of files that can be
displayed this way is restricted by the height of the current window
and `window-min-height'.

A prefix argument also behaves according to the ARG argument of
`dired-get-marked-files'.  In particular, `C-u C-u' operates on all
files in the Dired buffer.

To keep the Dired buffer displayed, type \\[split-window-vertically] first.
To display just the marked files, type \\[delete-other-windows] first.</span>"
  (interactive "<span class="quote">P</span>")
  (dired-simultaneous-find-file (dired-get-marked-files nil arg)
                                (and arg (prefix-numeric-value arg))))


<span class="linecomment">;; REPLACE ORIGINAL in `dired-x.el'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Use separate frames instead of windows if `pop-up-frames' is non-nil,</span>
<span class="linecomment">;; or if prefix arg is negative.</span>
<span class="linecomment">;;</span>
(defun dired-simultaneous-find-file (file-list option)
  "<span class="quote">Visit all files in list FILE-LIST and display them simultaneously.

With non-nil OPTION &gt;= 0, the files are found but not selected.

If `pop-up-frames' is non-nil or OPTION &lt; 0, use a separate frame
for each file.

Otherwise, the current window is split across all files in
FILE-LIST, as evenly as possible.  Remaining lines go to the
bottom-most window.  The number of files that can be displayed
this way is restricted by the height of the current window and
the variable `window-min-height'.</span>"
  <span class="linecomment">;; This is not interactive because it is usually too clumsy to</span>
  <span class="linecomment">;; specify FILE-LIST interactively unless via dired.</span>
  (let (size)
    (cond ((and option (natnump option))
           (while file-list (find-file-noselect (car file-list)) (pop file-list)))
          ((or pop-up-frames option)
           (while file-list (find-file-other-frame (car file-list)) (pop file-list)))
          (t
           (setq size  (/ (window-height) (length file-list)))
           (when (&gt; window-min-height size)
             (error "<span class="quote">Too many files to visit simultaneously.  Try C-u prefix.</span>"))
           (find-file (car file-list))
           (pop file-list)
           (while file-list
             <span class="linecomment">;; Vertically split off a window of desired size. Upper window will have SIZE lines.</span>
             <span class="linecomment">;; Select lower (larger) window.  We split it again.</span>
             (select-window (split-window nil size))
             (find-file (car file-list))
             (pop file-list))))))


<span class="linecomment">;;;;;; REPLACE ORIGINAL in both `dired.el' and `dired-x.el':</span>
<span class="linecomment">;;;;;;</span>
<span class="linecomment">;;;;;; 1. This incorporates the `dired-x.el' change to the `dired.el'</span>
<span class="linecomment">;;;;;;    definition.  This version works with or without using dired-x.</span>
<span class="linecomment">;;;;;;    The `dired-x.el' version respects the var `dired-find-subdir'.</span>
<span class="linecomment">;;;;;;    When `dired-find-subdir' is non-nil, this version is the same</span>
<span class="linecomment">;;;;;;    as the `dired-x.el' version, except that a bug is corrected:</span>
<span class="linecomment">;;;;;;    Whenever the argument to `dired-find-buffer-nocreate' is a cons,</span>
<span class="linecomment">;;;;;;    the call to `dired-buffers-for-dir' gave a wrong type error.</span>
<span class="linecomment">;;;;;;    This has been avoided by not respecting `dired-find-subdir'</span>
<span class="linecomment">;;;;;;    whenever `dired-find-buffer-nocreate' is a cons.</span>
<span class="linecomment">;;;;;;    For the case when `dired-find-subdir' is nil, see #2, below.</span>
<span class="linecomment">;;;;;;</span>
<span class="linecomment">;;;;;; 2. Unless `dired-find-subdir' is bound and non-nil:</span>
<span class="linecomment">;;;;;;    If both DIRNAME and `dired-directory' are conses, then only</span>
<span class="linecomment">;;;;;;    compare their cars (directories), not their explicit file lists</span>
<span class="linecomment">;;;;;;    too.  If equal, then update `dired-directory's file list to that</span>
<span class="linecomment">;;;;;;    of DIRNAME.</span>
<span class="linecomment">;;;;;;</span>
<span class="linecomment">;;;;;;    This prevents `dired-internal-noselect' (which is currently</span>
<span class="linecomment">;;;;;;    `dired-find-buffer-nocreate's only caller) from creating a new</span>
<span class="linecomment">;;;;;;    buffer in this case whenever a different set of files is present</span>
<span class="linecomment">;;;;;;    in the cdr of DIRNAME and DIRNAME represents the same buffer as</span>
<span class="linecomment">;;;;;;    `dired-directory'.</span>
<span class="linecomment">;;;;;;</span>
<span class="linecomment">;;;;;;    If only one of DIRNAME and `dired-directory' is a cons, then</span>
<span class="linecomment">;;;;;;    this returns nil.</span>
<span class="linecomment">;;;;;;;###autoload</span>
<span class="linecomment">;;;;(defun dired-find-buffer-nocreate (dirname &optional mode)</span>
<span class="linecomment">;;;;  (let ((atomic-dirname-p (atom dirname)))</span>
<span class="linecomment">;;;;    (if (and (boundp 'dired-find-subdir) dired-find-subdir atomic-dirname-p)</span>
<span class="linecomment">;;;;        ;; This is the `dired-x.el' change:</span>
<span class="linecomment">;;;;        (let* ((cur-buf (current-buffer))</span>
<span class="linecomment">;;;;               (buffers (nreverse (dired-buffers-for-dir dirname)))</span>
<span class="linecomment">;;;;               (cur-buf-matches (and (memq cur-buf buffers)</span>
<span class="linecomment">;;;;                                     ;; Files list (wildcards) must match, too:</span>
<span class="linecomment">;;;;                                     (equal dired-directory dirname))))</span>
<span class="linecomment">;;;;          (setq buffers  (delq cur-buf buffers)) ; Avoid using same buffer---</span>
<span class="linecomment">;;;;          (or (car (sort buffers (function dired-buffer-more-recently-used-p)))</span>
<span class="linecomment">;;;;              (and cur-buf-matches cur-buf))) ; ---unless no other possibility.</span>
<span class="linecomment">;;;;      ;; Comment from `dired.el':</span>
<span class="linecomment">;;;;      ;;  This differs from `dired-buffers-for-dir' in that it doesn't consider</span>
<span class="linecomment">;;;;      ;;  subdirs of `default-directory' and searches for the first match only.</span>
<span class="linecomment">;;;;      (let ((blist dired-buffers)       ; was (buffer-list)</span>
<span class="linecomment">;;;;            found)</span>
<span class="linecomment">;;;;        (or mode (setq mode  'dired-mode))</span>
<span class="linecomment">;;;;        (while blist</span>
<span class="linecomment">;;;;          (if (null (buffer-name (cdr (car blist))))</span>
<span class="linecomment">;;;;              (setq blist  (cdr blist))</span>
<span class="linecomment">;;;;            (save-excursion</span>
<span class="linecomment">;;;;              (set-buffer (cdr (car blist)))</span>
<span class="linecomment">;;;;              (if (not (and (eq major-mode mode)</span>
<span class="linecomment">;;;;                            ;; DIRNAME and `dired-directory' have the same dir,</span>
<span class="linecomment">;;;;                            ;; and if either of them has an explicit file list,</span>
<span class="linecomment">;;;;                            ;; then both of them do.  In that case, update</span>
<span class="linecomment">;;;;                            ;; `dired-directory's file list from DIRNAME.</span>
<span class="linecomment">;;;;                            (if atomic-dirname-p</span>
<span class="linecomment">;;;;                                (and (atom dired-directory) ; Both are atoms.</span>
<span class="linecomment">;;;;                                     (string= (file-truename dirname)</span>
<span class="linecomment">;;;;                                              (file-truename dired-directory)))</span>
<span class="linecomment">;;;;                              (and (consp dired-directory) ; Both are conses.</span>
<span class="linecomment">;;;;                                   (string=</span>
<span class="linecomment">;;;;                                    (file-truename (car dirname))</span>
<span class="linecomment">;;;;                                    (file-truename (car dired-directory)))</span>
<span class="linecomment">;;;;                                   ;; Update `dired-directory's file list.</span>
<span class="linecomment">;;;;                                   (setq dired-directory  dirname)))))</span>
<span class="linecomment">;;;;                  (setq blist  (cdr blist))</span>
<span class="linecomment">;;;;                (setq found  (cdr (car blist)))</span>
<span class="linecomment">;;;;                (setq blist  nil)))))</span>
<span class="linecomment">;;;;        found))))</span>


<span class="linecomment">;; REPLACE ORIGINAL in `dired.el'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 1. Put `mouse-face' on whole line, not just file name.</span>
<span class="linecomment">;; 2. Add text property `dired-filename' to the file name (only).</span>
<span class="linecomment">;;</span>
(defun dired-insert-set-properties (beg end)
  "<span class="quote">Highlight entire dired line upon mouseover.
Add text property `dired-filename' to the file name.</span>"
  (let ((inhibit-field-text-motion  t)) <span class="linecomment">; Just in case.</span>
    (save-excursion
      (goto-char beg)
      (while (&lt; (point) end)
        (condition-case nil
            (when (dired-move-to-filename)
              (add-text-properties (line-beginning-position) (line-end-position)
                                   '(mouse-face highlight
                                     help-echo "<span class="quote">mouse-2: visit this file in other window</span>"))
              (put-text-property (point) (save-excursion (dired-move-to-end-of-filename) (point))
                                 'dired-filename t))
          (error nil))
        (forward-line 1)))))


<span class="linecomment">;; REPLACE ORIGINAL in `dired.el'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Reset `mode-line-process' to nil.</span>
<span class="linecomment">;;</span>
(when (&lt; emacs-major-version 21)
  (or (fboundp 'old-dired-revert) (fset 'old-dired-revert (symbol-function 'dired-revert)))
  (defun dired-revert (&optional arg noconfirm)
    (setq mode-line-process  nil)        <span class="linecomment">; Set by, e.g., `find-dired'.</span>
    (old-dired-revert arg noconfirm)))


<span class="linecomment">;; REPLACE ORIGINAL in `dired.el'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; If at root on a Windows drive, go up to a list of available drives.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;###autoload</span>
(defun dired-up-directory (&optional other-window) <span class="linecomment">; Bound to `^'</span>
  "<span class="quote">Run Dired on parent directory of current directory.
Find the parent directory either in this buffer or another buffer.
Creates a buffer if necessary.

On MS Windows, if you already at the root directory, invoke
`diredp-w32-drives' to visit a navigable list of Windows drives.</span>"
  (interactive "<span class="quote">P</span>")
  (let* ((dir  (dired-current-directory))
         (up   (file-name-directory (directory-file-name dir))))
    (or (dired-goto-file (directory-file-name dir))
        <span class="linecomment">;; Only try dired-goto-subdir if buffer has more than one dir.</span>
        (and (cdr dired-subdir-alist)  (dired-goto-subdir up))
        (progn (if other-window (dired-other-window up) (dired up))
               (dired-goto-file dir))
        (and (memq system-type '(windows-nt ms-dos))  (diredp-w32-drives)))))


<span class="linecomment">;; REPLACE ORIGINAL in `dired.el'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Test also ./ and ../, in addition to . and .., for error "Cannot operate on `.' or `..'".</span>
<span class="linecomment">;;</span>
(defun dired-get-filename (&optional localp no-error-if-not-filep)
  "<span class="quote">In Dired, return name of file mentioned on this line.
Value returned normally includes the directory name.
Optional arg LOCALP with value `no-dir' means don't include directory
name in result.  A value of `verbatim' means to return the name exactly as
it occurs in the buffer, and a value of t means construct name relative to
`default-directory', which still may contain slashes if in a subdirectory.

Non-nil optional arg NO-ERROR-IF-NOT-FILEP means treat `.' and `..' as
regular filenames and return nil if no filename on this line.
Otherwise, an error occurs in these cases.</span>"
  (let (case-fold-search file p1 p2 already-absolute)
    (save-excursion (when (setq p1  (dired-move-to-filename (not no-error-if-not-filep)))
                      (setq p2  (dired-move-to-end-of-filename no-error-if-not-filep))))
    <span class="linecomment">;; nil if no file on this line but `no-error-if-not-filep' is t:</span>
    (when (setq file  (and p1 p2 (buffer-substring p1 p2)))
      <span class="linecomment">;; Get rid of the mouse-face property that file names have.</span>
      (set-text-properties 0 (length file) nil file)

      <span class="linecomment">;; Unquote names quoted by `ls' or by `dired-insert-directory'.</span>
      <span class="linecomment">;; Prior to Emacs 23.3, this code was written using `read' (see commented code below),</span>
      <span class="linecomment">;; because that is faster than substituting \007 (4 chars) -&gt; ^G (1 char) etc. in a loop.</span>
      <span class="linecomment">;; Unfortunately, that implementation required hacks such as dealing with filenames</span>
      <span class="linecomment">;; with quotation marks in their names.</span>
      (while (string-match (if (&gt; emacs-major-version 21)
                               "<span class="quote">\\(?:[^\\]\\|\\`\\)\\(\"\\)</span>" <span class="linecomment">; Shy group: Emacs 22+.</span>
                             "<span class="quote">\\([^\\]\\|\\`\\)\\(\"\\)</span>")
                           file)
        (setq file (replace-match "<span class="quote">\\\"</span>" nil t file 1)))

      <span class="linecomment">;; $$$ This was the code for that unquoting prior to Emacs 23.3:</span>
      <span class="linecomment">;; (setq file  (read (concat "\"" ; Some `ls -b' do not escape quotes.  But GNU `ls' is OK.</span>
      <span class="linecomment">;;                           (or (dired-string-replace-match</span>
      <span class="linecomment">;;                                "\\([^\\]\\|\\`\\)\"" file "\\1\\\\\"" nil t)</span>
      <span class="linecomment">;;                               file)</span>
      <span class="linecomment">;;                           "\"")))</span>

      <span class="linecomment">;; This sexp was added by Emacs 24, to fix bug #10469:</span>
      <span class="linecomment">;; Unescape any spaces escaped by `ls -b'.</span>
      <span class="linecomment">;; Other `-b' quotes, such as \t and \n, work transparently.</span>
      (when (dired-switches-escape-p dired-actual-switches)
        (let ((start 0)
              (rep "<span class="quote"></span>")
              (shift -1))
          (when (eq localp 'verbatim)  (setq rep    "<span class="quote">\\\\</span>"
                                             shift  +1))
          (while (string-match "<span class="quote">\\(\\\\\\) </span>" file start)
            (setq file   (replace-match rep nil t file 1)
                  start  (+ shift (match-end 0))))))

      <span class="linecomment">;; $$$ This sexp was added by Emacs 23.3.</span>
      (when (memq system-type '(windows-nt ms-dos))
        (save-match-data
          (let ((start  0))
            (while (string-match "<span class="quote">\\\\</span>" file start)
              (aset file (match-beginning 0) ?/)
              (setq start  (match-end 0))))))

      <span class="linecomment">;; $$$ This sexp was added by Emacs 23.3.</span>
      <span class="linecomment">;; Hence we don't need to worry about converting `\\' back to `\'.</span>
      (setq file (read (concat "<span class="quote">\"</span>" file "<span class="quote">\"</span>")))

      <span class="linecomment">;; Above `read' returns a unibyte string if FILE contains eight-bit-control/graphic chars.</span>
      (when (and (fboundp 'string-to-multibyte) <span class="linecomment">; Emacs 22</span>
                 enable-multibyte-characters (not (multibyte-string-p file)))
        (setq file  (string-to-multibyte file))))
    (and file (file-name-absolute-p file)
         <span class="linecomment">;; A relative file name can start with ~.  Do not treat it as absolute in this context.</span>
         (not (eq (aref file 0) ?~))
         (setq already-absolute  t))
    (cond ((null file) nil)
          ((eq localp 'verbatim) file)
          <span class="linecomment">;; This is the essential Dired+ change: Added ./ and ../, not just . and ..</span>
          ((and (not no-error-if-not-filep)
                (member file '("<span class="quote">.</span>" "<span class="quote">..</span>" "<span class="quote">./</span>" "<span class="quote">../</span>")))
           (error "<span class="quote">Cannot operate on `.' or `..'</span>"))
          ((and (eq localp 'no-dir)  already-absolute)
           (file-name-nondirectory file))
          (already-absolute
           (let ((handler  (find-file-name-handler file nil)))
             <span class="linecomment">;; check for safe-magic property so that we won't</span>
             <span class="linecomment">;; put /: for names that don't really need them.</span>
             <span class="linecomment">;; For instance, .gz files when auto-compression-mode is on.</span>
             (if (and handler  (not (get handler 'safe-magic)))
                 (concat "<span class="quote">/:</span>" file)
               file)))
          ((eq localp 'no-dir) file)
          ((equal (dired-current-directory) "<span class="quote">/</span>")
           (setq file  (concat (dired-current-directory localp) file))
           (let ((handler  (find-file-name-handler file nil)))
             <span class="linecomment">;; check for safe-magic property so that we won't</span>
             <span class="linecomment">;; put /: for names that don't really need them.</span>
             <span class="linecomment">;; For instance, .gz files when auto-compression-mode is on.</span>
             (if (and handler (not (get handler 'safe-magic)))
                 (concat "<span class="quote">/:</span>" file)
               file)))
          (t
           (concat (dired-current-directory localp) file)))))


<span class="linecomment">;; REPLACE ORIGINAL in `dired.el'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 1. Fixes Emacs bug #7126: Did not work with arbitrary file list (cons arg to `dired').</span>
<span class="linecomment">;; 2. Remove `/' from directory name before comparing with BASE.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;###autoload</span>
(defun dired-goto-file (file)           <span class="linecomment">; Bound to `j'</span>
  "<span class="quote">Go to line describing file FILE in this dired buffer.</span>"
  <span class="linecomment">;; Return value of point on success, else nil.</span>
  <span class="linecomment">;; FILE must be an absolute file name.</span>
  <span class="linecomment">;; Loses if FILE contains control chars like "\007" for which ls</span>
  <span class="linecomment">;; either inserts "?" or "\\007" into the buffer, so we won't find</span>
  <span class="linecomment">;; it in the buffer.</span>
  (interactive
   (prog1                               <span class="linecomment">; Let push-mark display its message</span>
       (list (expand-file-name (read-file-name "<span class="quote">Goto file: </span>" (dired-current-directory))))
     (push-mark)))
  (setq file  (directory-file-name file)) <span class="linecomment">; does no harm if no directory</span>
  (let ((found  nil)
        case-fold-search dir)
    (setq dir  (or (file-name-directory file) (error "<span class="quote">File name `%s' is not absolute</span>" file)))

    <span class="linecomment">;; Dired+: Added this sexp.</span>
    (save-excursion
      (goto-char (point-min))
      (let ((search-string  (replace-regexp-in-string "<span class="quote">\^m</span>" "<span class="quote">\\^m</span>" file nil t))
            (here           nil))
        (setq search-string  (replace-regexp-in-string "<span class="quote">\\\\</span>" "<span class="quote">\\\\</span>" search-string nil t))

        <span class="linecomment">;; Escape whitespace.  Added per Emacs 24 addition in `unless' code below:</span>
        (when (and (dired-switches-escape-p dired-actual-switches)
                   (string-match "<span class="quote">[ \t\n]</span>" search-string))
          <span class="linecomment">;; FIXME: fix this for all possible file names (embedded control chars etc).</span>
          <span class="linecomment">;;        Need to escape everything that `ls -b' escapes.</span>
          (setq search-string  (replace-regexp-in-string "<span class="quote"> </span>" "<span class="quote">\\ </span>"  search-string nil t)
                search-string  (replace-regexp-in-string "<span class="quote">\t</span>" "<span class="quote">\\t</span>" search-string nil t)
                search-string  (replace-regexp-in-string "<span class="quote">\n</span>" "<span class="quote">\\n</span>" search-string nil t)))

        <span class="linecomment">;; Use HERE to ensure we do not keep searching for a directory entry.</span>
        (while (and (not (eobp))  (not found)  (not (equal here (point))))
          (setq here  (point))
          (if (search-forward (concat "<span class="quote"> </span>" search-string) nil 'NO-ERROR)
              <span class="linecomment">;; Must move to filename since an (actually correct) match could have been</span>
              <span class="linecomment">;; elsewhere on the line (e.g. "-" would match somewhere in permission bits).</span>
              (setq found  (dired-move-to-filename))
            <span class="linecomment">;; If this isn't the right line, move forward to avoid trying this line again.</span>
            (forward-line 1)))))

    (unless found
      (save-excursion
        <span class="linecomment">;; The difficulty here is to get the result of dired-goto-subdir without really</span>
        <span class="linecomment">;; calling it if we don't have any subdirs.</span>
        (if (if (string= dir (expand-file-name default-directory))
                (goto-char (point-min))
              (and (cdr dired-subdir-alist)  (dired-goto-subdir dir)))
            (let ((base      (file-name-nondirectory file))
                  (boundary  (dired-subdir-max))
                  search-string)
              (setq search-string  (replace-regexp-in-string "<span class="quote">\^m</span>" "<span class="quote">\\^m</span>" base nil t)
                    search-string  (replace-regexp-in-string "<span class="quote">\\\\</span>" "<span class="quote">\\\\</span>" search-string nil t))

              <span class="linecomment">;; Escape whitespace.  Sexp added by Emacs 24:</span>
              (when (and (dired-switches-escape-p dired-actual-switches)
                         (string-match "<span class="quote">[ \t\n]</span>" search-string))
                <span class="linecomment">;; FIXME: fix this for all possible file names (embedded control chars etc).</span>
                <span class="linecomment">;;        Need to escape everything that `ls -b' escapes.</span>
                (setq search-string  (replace-regexp-in-string "<span class="quote"> </span>" "<span class="quote">\\ </span>" search-string nil t)
                      search-string  (replace-regexp-in-string "<span class="quote">\t</span>" "<span class="quote">\\t</span>" search-string nil t)
                      search-string  (replace-regexp-in-string "<span class="quote">\n</span>" "<span class="quote">\\n</span>" search-string nil t)))

              (while (and (not found)
                          <span class="linecomment">;; Filenames are preceded by SPC.  This makes the search faster</span>
                          <span class="linecomment">;; (e.g. for the filename "-"!).</span>
                          (search-forward (concat "<span class="quote"> </span>" search-string) boundary 'move))
                <span class="linecomment">;; Dired+: Remove / from filename, then compare with BASE.</span>
                <span class="linecomment">;; Match could have BASE just as initial substring or</span>
                <span class="linecomment">;; or in permission bits or date or not be a proper filename at all.</span>
                (if (and (dired-get-filename 'no-dir t)
                         (equal base (directory-file-name (dired-get-filename 'no-dir t))))
                    <span class="linecomment">;; Must move to filename since an (actually correct) match could have been</span>
                    <span class="linecomment">;; elsewhere on the line (e.g. "-" would match somewhere in permission bits).</span>
                    (setq found  (dired-move-to-filename))
                  <span class="linecomment">;; If this is not the right line, move forward to avoid trying this line again.</span>
                  (forward-line 1)))))))
    (and found (goto-char found))))     <span class="linecomment">; Return value of point.</span>


<span class="linecomment">;; REPLACE ORIGINAL in `dired.el':</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 1. Display a message to warn that flagged, not marked, files will be deleted.</span>
<span class="linecomment">;; 2. Use `diredp-internal-do-deletions', so it works with all Emacs versions.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;###autoload</span>
(defun dired-do-flagged-delete (&optional no-msg) <span class="linecomment">; Bound to `x'</span>
  "<span class="quote">In Dired, delete the files flagged for deletion.
NOTE: This deletes flagged, not marked, files.
If arg NO-MSG is non-nil, no message is displayed.

User option `dired-recursive-deletes' controls whether deletion of
non-empty directories is allowed.</span>"
  (interactive)
  (unless no-msg
    (ding)
    (message "<span class="quote">NOTE: Deletion of files flagged `%c' (not those marked `%c')</span>"
             dired-del-marker dired-marker-char)
    <span class="linecomment">;; Too slow/annoying, but without it the message is never seen: (sit-for 2)</span>
    )
  (let* ((dired-marker-char  dired-del-marker)
         (regexp             (dired-marker-regexp))
         case-fold-search)
    (if (save-excursion (goto-char (point-min)) (re-search-forward regexp nil t))
        (diredp-internal-do-deletions
         <span class="linecomment">;; This cannot move point since last arg is nil.</span>
         (dired-map-over-marks (cons (dired-get-filename) (point)) nil)
         nil
         'USE-TRASH-CAN)                <span class="linecomment">; This arg is for Emacs 24+ only.</span>
      (unless no-msg (message "<span class="quote">(No deletions requested.)</span>")))))


<span class="linecomment">;; REPLACE ORIGINAL in `dired.el':</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 1. Display a message to warn that marked, not flagged, files will be deleted.</span>
<span class="linecomment">;; 2. Use `diredp-internal-do-deletions', so it works with all Emacs versions.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;###autoload</span>
(defun dired-do-delete (&optional arg)  <span class="linecomment">; Bound to `D'</span>
  "<span class="quote">Delete all marked (or next ARG) files.
NOTE: This deletes marked, not flagged, files.
`dired-recursive-deletes' controls whether deletion of
non-empty directories is allowed.</span>"
  (interactive "<span class="quote">P</span>")
  <span class="linecomment">;; This is more consistent with the file-marking feature than</span>
  <span class="linecomment">;; `dired-do-flagged-delete'.  But it can be confusing to the user,</span>
  <span class="linecomment">;; especially since this is usually bound to `D', which is also the</span>
  <span class="linecomment">;; `dired-del-marker'.  So offer this warning message:</span>
  (unless arg
    (ding)
    (message "<span class="quote">NOTE: Deletion of files marked `%c' (not those flagged `%c').</span>"
             dired-marker-char dired-del-marker))
  (diredp-internal-do-deletions
   <span class="linecomment">;; This can move point if ARG is an integer.</span>
   (dired-map-over-marks (cons (dired-get-filename) (point)) arg)
   arg
   'USE-TRASH-CAN))                     <span class="linecomment">; This arg is for Emacs 24+ only.</span>

(defun diredp-internal-do-deletions (l arg &optional trash)
  "<span class="quote">`dired-internal-do-deletions', but for any Emacs version.</span>"
  (if (&gt; emacs-major-version 23)
      (dired-internal-do-deletions l arg trash)
    (dired-internal-do-deletions l arg)))


<span class="linecomment">;; REPLACE ORIGINAL in `dired.el':</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Put window point at bob.  Fixes bug #12281.</span>
<span class="linecomment">;;</span>
(when (&gt; emacs-major-version 22)
  (defun dired-pop-to-buffer (buf)
  "<span class="quote">Pop up buffer BUF in a way suitable for Dired.</span>"
  (let ((split-window-preferred-function
         (lambda (window)
           (or (and (let ((split-height-threshold 0))
                      (window-splittable-p (selected-window)))
                    <span class="linecomment">;; Try to split the selected window vertically if</span>
                    <span class="linecomment">;; that's possible.  (Bug#1806)</span>
                    (if (fboundp 'split-window-below)
                        (split-window-below)
                      (split-window-vertically)))
               <span class="linecomment">;; Otherwise, try to split WINDOW sensibly.</span>
               (split-window-sensibly window))))
        pop-up-frames)
    (pop-to-buffer (get-buffer-create buf)))
  (set-window-start (selected-window) (point-min))
  <span class="linecomment">;; If dired-shrink-to-fit is t, make its window fit its contents.</span>
  (when dired-shrink-to-fit
    <span class="linecomment">;; Try to not delete window when we want to display less than</span>
    <span class="linecomment">;; `window-min-height' lines.</span>
    (fit-window-to-buffer (get-buffer-window buf) nil 1))))


<span class="linecomment">;; REPLACE ORIGINAL in `dired.el':</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 1. Delete the window or frame popped up, afterward, and bury its buffer.</span>
<span class="linecomment">;;    Fixes Emacs bug #7533.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 2, If buffer is shown in a separate frame, do not show a menu bar for that frame.</span>
<span class="linecomment">;;</span>
(defun dired-mark-pop-up (bufname op-symbol files function &rest args)
  "<span class="quote">Return FUNCTION's result on ARGS after showing which files are marked.
Displays the file names in a buffer named BUFNAME;
 nil gives \" *Marked Files*\".
This uses function `dired-pop-to-buffer' to do that.

FUNCTION should not manipulate files, just read input
 (an argument or confirmation).
The window is not shown if there is just one file or
 OP-SYMBOL is a member of the list in `dired-no-confirm'.
FILES is the list of marked files.  It can also be (t FILENAME)
in the case of one marked file, to distinguish that from using
just the current file.</span>"
  (or bufname (setq bufname  "<span class="quote"> *Marked Files*</span>"))
  (let (result)
    (if (or (eq dired-no-confirm t)
            (memq op-symbol dired-no-confirm)
            <span class="linecomment">;; If FILES defaulted to the current line's file.</span>
            (= (length files) 1))
        (setq result  (apply function args))
      (with-current-buffer (get-buffer-create bufname)
        (erase-buffer)
        <span class="linecomment">;; Handle (t FILE) just like (FILE), here.</span>
        <span class="linecomment">;; That value is used (only in some cases), to mean</span>
        <span class="linecomment">;; just one file that was marked, rather than the current line file.</span>
        (dired-format-columns-of-files (if (eq (car files) t) (cdr files) files))
        (remove-text-properties (point-min) (point-max)
                                '(mouse-face nil help-echo nil)))
      (unwind-protect
           (save-window-excursion
             <span class="linecomment">;; Do not show menu bar, if buffer is popped up in a separate frame.</span>
             (let ((special-display-frame-alist  (cons '(menu-bar-lines . 0)
                                                       special-display-frame-alist))
                   (default-frame-alist          (cons '(menu-bar-lines . 0)
                                                       default-frame-alist)))
               (dired-pop-to-buffer bufname))
             (setq result  (apply function args)))
        (save-excursion
          (condition-case nil           <span class="linecomment">; Ignore error if user already deleted window.</span>
              (progn
                (select-window (get-buffer-window bufname 0))
                (if (one-window-p) (delete-frame) (delete-window)))
            (error nil)))
        (bury-buffer bufname)))
    result))


<span class="linecomment">;; REPLACE ORIGINAL in `dired.el':</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Push REGEXP onto `regexp-search-ring'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;###autoload</span>
(defun dired-mark-files-regexp (regexp &optional marker-char)
  "<span class="quote">Mark all files matching REGEXP for use in later commands.
A prefix argument means to unmark them instead.
`.' and `..' are never marked.

REGEXP is an Emacs regexp, not a shell wildcard.  Thus, use `\\.o$' for
object files--just `.o' will mark more than you might think.

REGEXP is added to `regexp-search-ring', for regexp search.</span>"
  (interactive
   (list (dired-read-regexp (concat (if current-prefix-arg "<span class="quote">Unmark</span>" "<span class="quote">Mark</span>")
				    "<span class="quote"> files (regexp): </span>"))
	 (if current-prefix-arg ?\040)))
  (add-to-list 'regexp-search-ring regexp) <span class="linecomment">; Add REGEXP to `regexp-search-ring.</span>
  (let ((dired-marker-char (or marker-char dired-marker-char)))
    (dired-mark-if
     (and (not (looking-at dired-re-dot))
	  (not (eolp))			<span class="linecomment">; empty line</span>
	  (let ((fn (dired-get-filename t t)))
	    (and fn (string-match regexp fn))))
     "<span class="quote">matching file</span>")))

<span class="linecomment">;;;###autoload</span>
(defun diredp-capitalize (&optional arg) <span class="linecomment">; Bound to `% c'</span>
  "<span class="quote">Rename all marked (or next ARG) files by capitalizing them.
Makes the first char of the name uppercase and the others lowercase.</span>"
  (interactive "<span class="quote">P</span>")
  (dired-rename-non-directory #'capitalize "<span class="quote">Rename by capitalizing:</span>" arg))


<span class="linecomment">;;; Versions of `dired-do-*' commands for just this line's file.</span>
<span class="linecomment">;;;###autoload</span>
(defun diredp-delete-this-file ()       <span class="linecomment">; Bound to `C-k', `delete'</span>
  "<span class="quote">In Dired, delete the file on the cursor line, upon confirmation.</span>"
  (interactive) (dired-do-delete 1))

<span class="linecomment">;;;###autoload</span>
(defun diredp-capitalize-this-file ()   <span class="linecomment">; Bound to `M-c'</span>
  "<span class="quote">In Dired, rename the file on the cursor line by capitalizing it.
Makes the first char of the name uppercase and the others lowercase.</span>"
  (interactive) (diredp-capitalize 1))

<span class="linecomment">;;;###autoload</span>
(defun diredp-downcase-this-file ()     <span class="linecomment">; Bound to `M-l'</span>
  "<span class="quote">In Dired, rename the file on the cursor line to lower case.</span>"
  (interactive) (dired-downcase 1))

<span class="linecomment">;;;###autoload</span>
(defun diredp-upcase-this-file ()       <span class="linecomment">; Bound to `M-u'</span>
  "<span class="quote">In Dired, rename the file on the cursor line to upper case.</span>"
  (interactive) (dired-upcase 1))

<span class="linecomment">;;;###autoload</span>
(defun diredp-rename-this-file ()       <span class="linecomment">; Bound to `r'</span>
  "<span class="quote">In Dired, rename the file on the cursor line.</span>"
  (interactive)
  (let ((use-file-dialog  nil))
    (dired-do-rename 1)))

<span class="linecomment">;;;###autoload</span>
(defun diredp-copy-this-file ()         <span class="linecomment">; Not bound</span>
  "<span class="quote">In Dired, copy the file on the cursor line.</span>"
  (interactive)
  (let ((use-file-dialog  nil))
    (dired-do-copy 1)))

<span class="linecomment">;;;###autoload</span>
(defun diredp-relsymlink-this-file ()   <span class="linecomment">; Bound to `y'</span>
  "<span class="quote">In Dired, make a relative symbolic link to file on cursor line.</span>"
  (interactive)
  (let ((use-file-dialog  nil))
    (and (fboundp 'dired-do-relsymlink) (dired-do-relsymlink 1))))

<span class="linecomment">;;;###autoload</span>
(defun diredp-symlink-this-file ()      <span class="linecomment">; Not bound</span>
  "<span class="quote">In Dired, make a symbolic link to the file on the cursor line.</span>"
  (interactive)
  (let ((use-file-dialog  nil))
    (dired-do-symlink 1)))

<span class="linecomment">;;;###autoload</span>
(defun diredp-hardlink-this-file ()     <span class="linecomment">; Not bound</span>
  "<span class="quote">In Dired, add a name (hard link) to the file on the cursor line.</span>"
  (interactive)
  (let ((use-file-dialog  nil))
    (dired-do-hardlink 1)))

<span class="linecomment">;;;###autoload</span>
(defun diredp-print-this-file ()        <span class="linecomment">; Bound to `M-p'</span>
  "<span class="quote">In Dired, print the file on the cursor line.</span>"
  (interactive) (dired-do-print 1))

<span class="linecomment">;;;###autoload</span>
(defun diredp-grep-this-file ()         <span class="linecomment">; Not bound</span>
  "<span class="quote">In Dired, grep the file on the cursor line.</span>"
  (interactive)
  (unless (and grep-command (or (&lt; emacs-major-version 22)  (not grep-use-null-device)
                                (eq grep-use-null-device t)))
    (grep-compute-defaults))
  (grep (diredp-do-grep-1 (list (dired-get-filename t)))))

<span class="linecomment">;;;###autoload</span>
(defun diredp-compress-this-file ()     <span class="linecomment">; Bound to `z'</span>
  "<span class="quote">In Dired, compress or uncompress the file on the cursor line.</span>"
  (interactive) (dired-do-compress 1))

<span class="linecomment">;;;###autoload</span>
(defun diredp-shell-command-this-file (command) <span class="linecomment">; Not bound</span>
  "<span class="quote">In Dired, run a shell COMMAND on the file on the cursor line.</span>"
  (interactive
   (list (dired-read-shell-command (concat "<span class="quote">! on </span>" "<span class="quote">%s: </span>") 1 (list (dired-get-filename t)))))
  (dired-do-shell-command command 1))

<span class="linecomment">;;;###autoload</span>
(defun diredp-bookmark-this-file (&optional prefix) <span class="linecomment">; Bound to `C-B' (`C-S-b')</span>
  "<span class="quote">In Dired, bookmark the file on the cursor line.
See `diredp-do-bookmark'.</span>"
  (interactive (progn (unless (eq major-mode 'dired-mode)
                        (error "<span class="quote">You must be in a Dired buffer to use this command</span>"))
                      (list (and diredp-prompt-for-bookmark-prefix-flag
                                 (read-string "<span class="quote">Prefix for bookmark name: </span>")))))
  (diredp-do-bookmark prefix 1))

<span class="linecomment">;;;###autoload</span>
(defun diredp-tag-this-file (tags &optional prefix) <span class="linecomment">; Bound to `T +'</span>
  "<span class="quote">In Dired, add some tags to the file on the cursor line.
You need library `bookmark+.el' to use this command.</span>"
  (interactive (progn (unless (require 'bookmark+ nil t)
                        (error "<span class="quote">This command requires library `bookmark+.el'</span>"))
                      (unless (eq major-mode 'dired-mode)
                        (error "<span class="quote">You must be in a Dired buffer to use this command</span>"))
                      (list (bmkp-read-tags-completing)
                            (and diredp-prompt-for-bookmark-prefix-flag
                                 (read-string "<span class="quote">Prefix for bookmark name: </span>")))))
  (diredp-do-tag tags prefix 1))

<span class="linecomment">;;;###autoload</span>
(defun diredp-untag-this-file (tags &optional prefix arg) <span class="linecomment">; Bound to `T -'</span>
  "<span class="quote">In Dired, remove some tags from the file on the cursor line.
With a prefix arg, remove all tags from the file.
You need library `bookmark+.el' to use this command.</span>"
  (interactive (progn (unless (require 'bookmark+ nil t)
                        (error "<span class="quote">This command requires library `bookmark+.el'</span>"))
                      (unless (eq major-mode 'dired-mode)
                        (error "<span class="quote">You must be in a Dired buffer to use this command</span>"))
                      (let* ((pref  (and diredp-prompt-for-bookmark-prefix-flag
                                         (read-string "<span class="quote">Prefix for bookmark name: </span>")))
                             (bmk   (bmkp-get-autofile-bookmark (dired-get-filename) nil pref))
                             (btgs  (and bmk (bmkp-get-tags bmk))))
                        (unless btgs (error "<span class="quote">File has no tags to remove</span>"))
                        (list (if current-prefix-arg btgs (bmkp-read-tags-completing btgs))
                              pref
                              current-prefix-arg))))
  (diredp-do-untag tags prefix 1))

<span class="linecomment">;;;###autoload</span>
(defun diredp-remove-all-tags-this-file (&optional prefix msgp) <span class="linecomment">; Bound to `T 0'</span>
  "<span class="quote">In Dired, remove all tags from this file.
You need library `bookmark+.el' to use this command.</span>"
  (interactive (progn (unless (require 'bookmark+ nil t)
                        (error "<span class="quote">This command requires library `bookmark+.el'</span>"))
                      (unless (eq major-mode 'dired-mode)
                        (error "<span class="quote">You must be in a Dired buffer to use this command</span>"))
                      (list (and diredp-prompt-for-bookmark-prefix-flag
                                 (read-string "<span class="quote">Prefix for bookmark name: </span>"))
                            'MSG)))
  (bookmark-maybe-load-default-file)
  (diredp-do-remove-all-tags prefix 1))

<span class="linecomment">;;;###autoload</span>
(defun diredp-paste-add-tags-this-file (&optional prefix msgp) <span class="linecomment">; Bound to `T p', `T C-y'</span>
  "<span class="quote">In Dired, add previously copied tags to this file.
See `diredp-paste-add-tags'.
You need library `bookmark+.el' to use this command.</span>"
  (interactive (progn (unless (require 'bookmark+ nil t)
                        (error "<span class="quote">This command requires library `bookmark+.el'</span>"))
                      (unless (eq major-mode 'dired-mode)
                        (error "<span class="quote">You must be in a Dired buffer to use this command</span>"))
                      (list (and diredp-prompt-for-bookmark-prefix-flag
                                 (read-string "<span class="quote">Prefix for bookmark name: </span>"))
                            'MSG)))
  (bookmark-maybe-load-default-file)
  (diredp-do-paste-add-tags prefix 1))

<span class="linecomment">;;;###autoload</span>
(defun diredp-paste-replace-tags-this-file (&optional prefix msgp) <span class="linecomment">; Bound to `T q'</span>
  "<span class="quote">In Dired, replace tags for this file with previously copied tags.
See `diredp-paste-replace-tags'.
You need library `bookmark+.el' to use this command.</span>"
  (interactive (progn (unless (require 'bookmark+ nil t)
                        (error "<span class="quote">This command requires library `bookmark+.el'</span>"))
                      (unless (eq major-mode 'dired-mode)
                        (error "<span class="quote">You must be in a Dired buffer to use this command</span>"))
                      (list (and diredp-prompt-for-bookmark-prefix-flag
                                 (read-string "<span class="quote">Prefix for bookmark name: </span>"))
                            'MSG)))
  (bookmark-maybe-load-default-file)
  (diredp-do-paste-add-tags prefix 1))

<span class="linecomment">;;;###autoload</span>
(defun diredp-set-tag-value-this-file (tag value &optional prefix msgp) <span class="linecomment">; Bound to `T v'</span>
  "<span class="quote">In Dired, Set value of TAG to VALUE for this file.
See `diredp-set-tag-value'.
You need library `bookmark+.el' to use this command.</span>"
  (interactive (progn (unless (require 'bookmark+ nil t)
                        (error "<span class="quote">This command requires library `bookmark+.el'</span>"))
                      (unless (eq major-mode 'dired-mode)
                        (error "<span class="quote">You must be in a Dired buffer to use this command</span>"))
                      (list (bmkp-read-tag-completing)
                            (read (read-string "<span class="quote">Value: </span>"))
                            (and diredp-prompt-for-bookmark-prefix-flag
                                 (read-string "<span class="quote">Prefix for bookmark name: </span>"))
                            'MSG)))
  (bookmark-maybe-load-default-file)
  (diredp-do-set-tag-value tag value prefix 1))

<span class="linecomment">;;;###autoload</span>
(defun diredp-copy-tags-this-file (&optional prefix msgp) <span class="linecomment">; Bound to `T c', `T M-w'</span>
  "<span class="quote">In Dired, copy the tags from this file, so you can paste them to another.
See `diredp-copy-tags'.
You need library `bookmark+.el' to use this command.</span>"
  (interactive (progn (unless (require 'bookmark+ nil t)
                        (error "<span class="quote">This command requires library `bookmark+.el'</span>"))
                      (unless (eq major-mode 'dired-mode)
                        (error "<span class="quote">You must be in a Dired buffer to use this command</span>"))
                      (list (and diredp-prompt-for-bookmark-prefix-flag
                                 (read-string "<span class="quote">Prefix for bookmark name: </span>"))
                            'MSG)))
  (bookmark-maybe-load-default-file)
  (let ((bmk  (bmkp-get-autofile-bookmark  (dired-get-filename) nil prefix)))
    (and bmk  (bmkp-copy-tags bmk msgp))))

<span class="linecomment">;;;###autoload</span>
(defun diredp-mouse-copy-tags (event)   <span class="linecomment">; Not bound</span>
  "<span class="quote">In Dired, copy the tags from this file, so you can paste them to another.
You need library `bookmark+.el' to use this command.</span>"
  (interactive "<span class="quote">e</span>")
  (let ((mouse-pos         (event-start event))
        (dired-no-confirm  t)
        (prefix            (and diredp-prompt-for-bookmark-prefix-flag
                                (read-string "<span class="quote">Prefix for bookmark name: </span>"))))
    (select-window (posn-window mouse-pos))
    (goto-char (posn-point mouse-pos))
    (diredp-copy-tags-this-file prefix 'MSG))
  (dired-previous-line 1))

<span class="linecomment">;;;###autoload</span>
(defun diredp-describe-file (&optional internal-form-p) <span class="linecomment">; Bound to `C-h RET', `C-h C-RET'</span>
  "<span class="quote">In Dired, describe this file or directory.
You need library `help-fns+.el' to use this command.
If the file has an autofile bookmark and you use library `Bookmark+',
then show also the bookmark information (tags etc.).  In this case, a
prefix arg shows the internal form of the bookmark.</span>"
  (interactive "<span class="quote">P</span>")
  (unless (fboundp 'describe-file)
    (error "<span class="quote">This command needs `describe-file' from library `help-fns+.el'</span>"))
  (describe-file (dired-get-filename nil t) internal-form-p))

<span class="linecomment">;;;###autoload</span>
(defun diredp-mouse-describe-file (event &optional internal-form-p) <span class="linecomment">; Not bound</span>
  "<span class="quote">Describe the clicked file.
You need library `help-fns+.el' to use this command.
If the file has an autofile bookmark and you use library `Bookmark+',
then show also the bookmark information (tags etc.).  In this case, a
prefix arg shows the internal form of the bookmark.</span>"
  (interactive "<span class="quote">e\nP</span>")
  (unless (fboundp 'describe-file)
    (error "<span class="quote">This command needs `describe-file' from library `help-fns+.el'</span>"))
  (let (file)
    (with-current-buffer (window-buffer (posn-window (event-end event)))
      (save-excursion
        (goto-char (posn-point (event-end event)))
        (setq file (dired-get-filename nil t))))
    (describe-file file internal-form-p)))

<span class="linecomment">;;;###autoload</span>
(defun diredp-byte-compile-this-file () <span class="linecomment">; Bound to `b'</span>
  "<span class="quote">In Dired, byte compile the (Lisp source) file on the cursor line.</span>"
  (interactive) (dired-do-byte-compile 1))

<span class="linecomment">;;;###autoload</span>
(defun diredp-load-this-file ()         <span class="linecomment">; Not bound</span>
  "<span class="quote">In Dired, load the file on the cursor line.</span>"
  (interactive) (dired-do-load 1))

<span class="linecomment">;;;###autoload</span>
(defun diredp-chmod-this-file ()        <span class="linecomment">; Bound to `M-m'</span>
  "<span class="quote">In Dired, change the mode of the file on the cursor line.</span>"
  (interactive) (dired-do-chmod 1))

(unless (memq system-type '(windows-nt ms-dos))
  (defun diredp-chgrp-this-file ()      <span class="linecomment">; Not bound</span>
    "<span class="quote">In Dired, change the group of the file on the cursor line.</span>"
    (interactive) (dired-do-chgrp 1)))

(unless (memq system-type '(windows-nt ms-dos))
  (defun diredp-chown-this-file ()      <span class="linecomment">; Not bound</span>
    "<span class="quote">In Dired, change the owner of the file on the cursor line.</span>"
    (interactive) (dired-do-chown 1)))

(when (fboundp 'dired-do-touch)
  (defun diredp-touch-this-file ()        <span class="linecomment">; Not bound</span>
    "<span class="quote">In Dired, `touch' (change the timestamp of) the file on the cursor line.</span>"
    (interactive) (dired-do-touch 1)))


<span class="linecomment">;; REPLACE ORIGINAL in `dired-x.el'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 1. Variable (symbol) `s' -&gt; `blks'.</span>
<span class="linecomment">;; 2. Fixes to remove leading space from `uid' and allow `.' in `gid'.</span>
<span class="linecomment">;; 3. Cleaned up doc string and code a bit.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;###autoload</span>
(defun dired-mark-sexp (predicate &optional unmark-p) <span class="linecomment">; Bound to `M-(', `* ('</span>
  "<span class="quote">Mark files for which PREDICATE returns non-nil.
With non-nil prefix arg UNMARK-P, unmark those files instead.

PREDICATE is a lisp sexp that can refer to the following variables:

    `mode'   [string]  file permission bits, e.g. \"-rw-r--r--\"
    `nlink'  [integer] number of links to file
    `size'   [integer] file size in bytes
    `uid'    [string]  owner
    `gid'    [string]  group (If the gid is not displayed by `ls',
                       this will still be set (to the same as uid))
    `time'   [string]  the time that `ls' displays, e.g. \"Feb 12 14:17\"
    `name'   [string]  the name of the file
    `sym'    [string]  if file is a symbolic link, the linked-to name,
                       else \"\"
    `inode'  [integer] the inode of the file (only for `ls -i' output)
    `blks'   [integer] the size of the file for `ls -s' output
                       (ususally in blocks or, with `-k', in Kbytes)
Examples:
  Mark zero-length files: `(equal 0 size)'
  Mark files last modified on Feb 2: `(string-match \"Feb  2\" time)'
  Mark uncompiled Emacs Lisp files (`.el' file without a `.elc' file):
     First, dired just the source files: `dired *.el'.
     Then, use \\[dired-mark-sexp] with this sexp:
          (not (file-exists-p (concat name \"c\")))</span>"

  <span class="linecomment">;; Using `sym' = "", instead of nil, for non-linked files avoids the trap of</span>
  <span class="linecomment">;; (string-match "foo" sym) into which a user would soon fall.</span>
  <span class="linecomment">;; Use `equal' instead of `=' in the example, as it works on integers and strings.</span>
  (interactive "<span class="quote">xVars: inode,blks,mode,nlink,uid,gid,size,time,name,sym -&gt; \nP</span>")
  (message "<span class="quote">%s</span>" predicate)
  (let ((dired-marker-char  (if unmark-p ?\040 dired-marker-char))
        (inode              nil)
        (blks               ())
        mode nlink uid gid size time name sym)
    (dired-mark-if
     (save-excursion
       (and
        <span class="linecomment">;; Sets vars INODE BLKS MODE NLINK UID GID SIZE TIME NAME and SYM</span>
        <span class="linecomment">;; according to current file line.  Returns `t' for success, nil if</span>
        <span class="linecomment">;; there is no file line.  Upon success, these vars are set, to either</span>
        <span class="linecomment">;; nil or the appropriate value, so they need not be initialized.</span>
        <span class="linecomment">;; Moves point within the current line.</span>
        (dired-move-to-filename)
        (let ((mode-len             10) <span class="linecomment">; Length of mode string.</span>
              <span class="linecomment">;; As in `dired.el', but with subexpressions \1=inode, \2=blks:</span>
              (dired-re-inode-size  "<span class="quote">\\s *\\([0-9]*\\)\\s *\\([0-9]*\\) ?</span>")
              pos)
          (beginning-of-line)
          (forward-char 2)
          (when (looking-at dired-re-inode-size)
            (goto-char (match-end 0))
            (setq inode  (string-to-number (buffer-substring (match-beginning 1) (match-end 1)))
                  blks   (string-to-number (buffer-substring (match-beginning 2)
                                                             (match-end 2)))))
          (setq mode  (buffer-substring (point) (+ mode-len (point))))
          (forward-char mode-len)
          (setq nlink  (read (current-buffer)))
          (forward-char 1)              <span class="linecomment">; Fix: skip space.</span>
          <span class="linecomment">;; Karsten Wenger &lt;kw@cis.uni-muenchen.de&gt; fixed uid.</span>
          (setq uid  (buffer-substring (+ (point) 1) (progn (forward-word 1) (point))))
          (re-search-forward
           (if (&lt; emacs-major-version 20)
               "<span class="quote">\\(Jan\\|Feb\\|Mar\\|Apr\\|May\\|Jun\\|Jul\\|Aug\\|Sep\\|Oct\\|Nov\\|Dec\\)</span>"
             dired-move-to-filename-regexp))
          (goto-char (match-beginning 1))
          (forward-char -1)
          (setq size  (string-to-number (buffer-substring (save-excursion (backward-word 1)
                                                                          (setq pos  (point)))
                                                          (point))))
          (goto-char pos)
          (backward-word 1)
          <span class="linecomment">;; if no gid is displayed, gid will be set to uid</span>
          <span class="linecomment">;; but user will then not reference it anyway in PREDICATE.</span>
          (setq gid   (buffer-substring (save-excursion (forward-word 1) (point)) (point))
                time  (buffer-substring (match-beginning 1) (1- (dired-move-to-filename)))
                name  (buffer-substring (point) (or (dired-move-to-end-of-filename t) (point)))
                sym   (if (looking-at "<span class="quote"> -&gt; </span>")
                          (buffer-substring (progn (forward-char 4) (point))
                                            (line-end-position))
                        "<span class="quote"></span>")))
        (eval predicate)))
     (format "<span class="quote">'%s file</span>" predicate))))

(defun diredp-this-file-marked-p (&optional mark-char)
  "<span class="quote">Return non-nil if the file on this line is marked.
Optional arg MARK-CHAR is the type of mark to check.
 If nil, then if the file has any mark, including `D', it is marked.</span>"
  (and (dired-get-filename t t)
       (save-excursion (beginning-of-line)
                       (if mark-char
                           (looking-at (concat "<span class="quote">^</span>" (char-to-string mark-char)))
                         (not (looking-at "<span class="quote">^ </span>"))))))

(defun diredp-this-file-unmarked-p (&optional mark-char)
  "<span class="quote">Return non-nil if the file on this line is unmarked.
Optional arg MARK-CHAR is the type of mark to check.
 If nil, then if the file has no mark, including `D', it is unmarked.
 If non-nil, then it is unmarked for MARK-CHAR if it has no mark or
 it has any mark except MARK-CHAR.</span>"
  (and (dired-get-filename t t)
       (save-excursion (beginning-of-line)
                       (if mark-char
                           (not (looking-at (concat "<span class="quote">^</span>" (char-to-string mark-char))))
                         (looking-at "<span class="quote">^ </span>")))))

<span class="linecomment">;;;###autoload</span>
(defun diredp-mark-region-files (&optional unmark-p) <span class="linecomment">; Not bound</span>
  "<span class="quote">Mark all of the files in the current region (if it is active).
With non-nil prefix arg, unmark them instead.</span>"
  (interactive "<span class="quote">P</span>")
  (let ((beg                        (min (point) (mark)))
        (end                        (max (point) (mark)))
        (inhibit-field-text-motion  t)) <span class="linecomment">; Just in case.</span>
    (setq beg  (save-excursion (goto-char beg) (line-beginning-position))
          end  (save-excursion (goto-char end) (line-end-position)))
    (let ((dired-marker-char  (if unmark-p ?\040 dired-marker-char)))
      (dired-mark-if (and (&lt;= (point) end) (&gt;= (point) beg) (diredp-this-file-unmarked-p))
                     "<span class="quote">region file</span>"))))

<span class="linecomment">;;;###autoload</span>
(defun diredp-unmark-region-files (&optional mark-p) <span class="linecomment">; Not bound</span>
  "<span class="quote">Unmark all of the files in the current region (if it is active).
With non-nil prefix arg, mark them instead.</span>"
  (interactive "<span class="quote">P</span>")
  (let ((beg                        (min (point) (mark)))
        (end                        (max (point) (mark)))
        (inhibit-field-text-motion  t)) <span class="linecomment">; Just in case.</span>
    (setq beg  (save-excursion (goto-char beg) (line-beginning-position))
          end  (save-excursion (goto-char end) (line-end-position)))
    (let ((dired-marker-char  (if mark-p dired-marker-char ?\040)))
      (dired-mark-if (and (&lt;= (point) end) (&gt;= (point) beg) (diredp-this-file-marked-p))
                     "<span class="quote">region file</span>"))))

<span class="linecomment">;;;###autoload</span>
(defun diredp-flag-region-files-for-deletion () <span class="linecomment">; Not bound</span>
  "<span class="quote">Flag all of the files in the current region (if it is active) for deletion.</span>"
  (interactive)
  (let ((beg                        (min (point) (mark)))
        (end                        (max (point) (mark)))
        (inhibit-field-text-motion  t)) <span class="linecomment">; Just in case.</span>
    (setq beg  (save-excursion (goto-char beg) (line-beginning-position))
          end  (save-excursion (goto-char end) (line-end-position)))
    (let ((dired-marker-char  dired-del-marker))
      (dired-mark-if (and (&lt;= (point) end) (&gt;= (point) beg) (diredp-this-file-unmarked-p ?\D))
                     "<span class="quote">region file</span>"))))

<span class="linecomment">;;;###autoload</span>
(defun diredp-toggle-marks-in-region (start end) <span class="linecomment">; Not bound</span>
  "<span class="quote">Toggle marks in the region.</span>"
  (interactive "<span class="quote">r</span>")
  (save-excursion
    (save-restriction
      (if (not (fboundp 'dired-toggle-marks))
          <span class="linecomment">;; Pre-Emacs 22.  Use bol, eol.  If details hidden, show first.</span>
          (let ((details-hidden-p  (and (boundp 'dired-details-state)
                                        (eq 'hidden dired-details-state))))
            (widen)
            (when details-hidden-p (dired-details-show))
            (goto-char start)
            (setq start  (line-beginning-position))
            (goto-char end)
            (setq end    (line-end-position))
            (narrow-to-region start end)
            (dired-do-toggle)
            (when details-hidden-p (dired-details-hide)))
        (narrow-to-region start end)
        (dired-toggle-marks))))
  (when (and (get-buffer-window (current-buffer)) (fboundp 'fit-frame-if-one-window))
    (fit-frame-if-one-window)))


<span class="linecomment">;;; Mouse 3 menu.</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;</span>

(defvar diredp-file-line-overlay nil)

<span class="linecomment">;;;###autoload</span>
(defun diredp-mouse-3-menu (event)      <span class="linecomment">; Bound to `mouse-3'</span>
  "<span class="quote">Dired pop-up `mouse-3' menu, for files in selection or current line.</span>"
  (interactive "<span class="quote">e</span>")
  (if (not (and (fboundp 'mouse3-dired-use-menu)
                transient-mark-mode mark-active (not (eq (mark) (point)))))
      <span class="linecomment">;; No `mouse3.el' or no region.</span>
      (if (and transient-mark-mode mark-active (not (eq (mark) (point))))
          <span class="linecomment">;; Region</span>
          (let ((reg-choice  (x-popup-menu
                              event
                              (list "<span class="quote">Files in Region</span>"
                                    (list "<span class="quote"></span>"
                                          '("<span class="quote">Mark</span>" . diredp-mark-region-files)
                                          '("<span class="quote">Unmark</span>" . diredp-unmark-region-files)
                                          '("<span class="quote">Toggle Marked/Unmarked</span>" .
                                            diredp-toggle-marks-in-region)
                                          '("<span class="quote">Flag for Deletion</span>" .
                                            diredp-flag-region-files-for-deletion))))))
            (when reg-choice (call-interactively reg-choice)))
        <span class="linecomment">;; Single file/dir (no region).</span>
        (let ((mouse-pos                  (event-start event))
              <span class="linecomment">;; Do not use `save-excursion', because some commands will move point on purpose.</span>
              <span class="linecomment">;; Just save original point and return to it unless MOVEP is set to non-nil.</span>
              (opoint                     (point))
              (movep                      nil)
              (inhibit-field-text-motion  t) <span class="linecomment">; Just in case.</span>
              choice bol  eol  file/dir-name)
          (with-current-buffer (window-buffer (posn-window mouse-pos))
            (goto-char (posn-point mouse-pos))
            (setq bol  (line-beginning-position)
                  eol  (line-end-position))
            (unwind-protect
                 (progn
                   (if diredp-file-line-overlay <span class="linecomment">; Don't re-create if exists.</span>
                       (move-overlay diredp-file-line-overlay bol eol (current-buffer))
                     (setq diredp-file-line-overlay  (make-overlay bol eol))
                     (overlay-put diredp-file-line-overlay 'face 'region))
                   (setq file/dir-name  (and (not (eobp)) (dired-get-filename nil t)))
                   (when file/dir-name
                     (sit-for 0)
                     (let ((map
                            (easy-menu-create-menu
                             "<span class="quote">This File</span>"
                             <span class="linecomment">;; Stuff from `Mark' menu.</span>
                             `(
                               ("<span class="quote">Bookmark</span>" :visible (featurep 'bookmark+)
                                ["<span class="quote">Bookmark...</span>" diredp-bookmark-this-file]
                                ["<span class="quote">Tag...</span>" diredp-tag-this-file
                                 :visible (featurep 'bookmark+)]
                                ["<span class="quote">Untag...</span>" diredp-untag-this-file
                                 :visible (featurep 'bookmark+)]
                                ["<span class="quote">Remove All Tags</span>" diredp-remove-all-tags-this-file
                                 :visible (featurep 'bookmark+)]
                                ["<span class="quote">Copy Tags</span>" diredp-copy-tags-this-file
                                 :visible (featurep 'bookmark+)]
                                ["<span class="quote">Paste Tags (Add)</span>" diredp-paste-add-tags-this-file
                                 :visible (featurep 'bookmark+)]
                                ["<span class="quote">Paste Tags (Replace)</span>" diredp-paste-replace-tags-this-file
                                 :visible (featurep 'bookmark+)]
                                ["<span class="quote">Set Tag Value...</span>" diredp-set-tag-value-this-file
                                 :visible (featurep 'bookmark+)]
                                )
                               ["<span class="quote">Describe</span>" diredp-describe-file]
                               ["<span class="quote">Mark</span>"  dired-mark
                                :visible (not (eql (dired-file-marker file/dir-name)
                                               dired-marker-char))]
                               ["<span class="quote">Unmark</span>" dired-unmark
                                :visible (dired-file-marker file/dir-name)]
                               ["<span class="quote">Flag for Deletion</span>" dired-flag-file-deletion
                                :visible (not (eql (dired-file-marker file/dir-name)
                                               dired-del-marker))]
                               ["<span class="quote">Delete...</span>" diredp-delete-this-file]
                               "<span class="quote">--</span>"     <span class="linecomment">; ------------------------------------------------------</span>
                               <span class="linecomment">;; Stuff from `Single' / `Multiple' menus.</span>
                               ["<span class="quote">Open</span>" dired-find-file]
                               ["<span class="quote">Open in Other Window</span>" dired-find-file-other-window]
                               ["<span class="quote">Open in Other Frame</span>" diredp-find-file-other-frame]
                               ["<span class="quote">Open Associated Windows App</span>" dired-w32-browser
                                :visible (featurep 'w32-browser)]
                               ["<span class="quote">Open in Windows Explorer</span>" dired-w32explore
                                :visible (featurep 'w32-browser)]
                               ["<span class="quote">View (Read Only)</span>" dired-view-file]
                               ["<span class="quote">--</span>" 'ignore <span class="linecomment">; -------------------------------------------------</span>
                                :visible (or (atom (diredp-this-subdir)) <span class="linecomment">; Subdir line.</span>
                                          (not (equal (dired-current-directory) <span class="linecomment">; Not top.</span>
                                                default-directory)))]
                               ["<span class="quote">Insert This Subdir</span>"
                                (lambda () (interactive)
                                        (call-interactively #'dired-maybe-insert-subdir)
                                        (setq movep  t))
                                :visible (and (atom (diredp-this-subdir))
                                          (not (assoc (file-name-as-directory
                                                       (diredp-this-subdir))
                                                dired-subdir-alist)))
                                :enable (atom (diredp-this-subdir))]
                               ["<span class="quote">Go To Inserted Subdir</span>"
                                (lambda () (interactive)
                                        (call-interactively #'dired-maybe-insert-subdir)
                                        (setq movep  t))
                                :visible (and (atom (diredp-this-subdir))
                                          (assoc (file-name-as-directory (diredp-this-subdir))
                                           dired-subdir-alist))
                                :enable (atom (diredp-this-subdir))
                                :keys "<span class="quote">i</span>"]
                               ["<span class="quote">Remove This Inserted Subdir</span>" dired-kill-subdir
                                :visible (not (equal (dired-current-directory)
                                               default-directory))] <span class="linecomment">; In subdir, not top.</span>
                               ["<span class="quote">Dired This Inserted Subdir (Tear Off)</span>"
                                (lambda () (interactive) (diredp-dired-this-subdir t))
                                :visible (not (equal (dired-current-directory)
                                               default-directory))] <span class="linecomment">; In subdir, not top.</span>
                               "<span class="quote">--</span>"     <span class="linecomment">; ------------------------------------------------------</span>
                               ["<span class="quote">Compare...</span>" diredp-ediff]
                               ["<span class="quote">Diff...</span>" dired-diff]
                               ["<span class="quote">Diff with Backup</span>" dired-backup-diff]

                               ["<span class="quote">Bookmark...</span>" diredp-bookmark-this-file
                                :visible (not (featurep 'bookmark+))]
                               "<span class="quote">--</span>"     <span class="linecomment">; ------------------------------------------------------</span>
                               ["<span class="quote">Copy to...</span>" diredp-copy-this-file]
                               ["<span class="quote">Rename to...</span>" diredp-rename-this-file]
                               ["<span class="quote">Capitalize</span>" diredp-capitalize-this-file]
                               ["<span class="quote">Upcase</span>" diredp-upcase-this-file]
                               ["<span class="quote">Downcase</span>" diredp-downcase-this-file]
                               "<span class="quote">--</span>"     <span class="linecomment">; ------------------------------------------------------</span>
                               ["<span class="quote">Symlink to (Relative)...</span>" diredp-relsymlink-this-file
                                :visible (fboundp 'dired-do-relsymlink)] <span class="linecomment">; In `dired-x.el'.</span>
                               ["<span class="quote">Symlink to...</span>" diredp-symlink-this-file]
                               ["<span class="quote">Hardlink to...</span>" diredp-hardlink-this-file]
                               "<span class="quote">--</span>"     <span class="linecomment">; ------------------------------------------------------</span>
                               ["<span class="quote">Shell Command...</span>" diredp-shell-command-this-file]
                               ["<span class="quote">Print...</span>" diredp-print-this-file]
                               ["<span class="quote">Grep</span>" diredp-grep-this-file]
                               ["<span class="quote">Compress/Uncompress</span>" diredp-compress-this-file]
                               ["<span class="quote">Byte-Compile</span>" diredp-byte-compile-this-file]
                               ["<span class="quote">Load</span>" diredp-load-this-file]
                               "<span class="quote">--</span>"     <span class="linecomment">; ------------------------------------------------------</span>
                               ["<span class="quote">Change Timestamp...</span>" diredp-touch-this-file]
                               ["<span class="quote">Change Mode...</span>" diredp-chmod-this-file]
                               ["<span class="quote">Change Group...</span>" diredp-chgrp-this-file
                                :visible (fboundp 'diredp-chgrp-this-file)]
                               ["<span class="quote">Change Owner...</span>" diredp-chown-this-file
                                :visible (fboundp 'diredp-chown-this-file)]))))
                       (when diredp-file-line-overlay
                         (delete-overlay diredp-file-line-overlay))
                       (setq choice  (x-popup-menu event map))
                       (when choice
                         (call-interactively (lookup-key map (apply 'vector choice)))))))
              (unless movep (goto-char opoint))))))
    <span class="linecomment">;; `mouse3.el' and active region.</span>
    (unless (eq mouse3-dired-function 'mouse3-dired-use-menu)
      (funcall #'mouse3-dired-use-menu)
      (revert-buffer))
    (let ((last-command  'mouse-save-then-kill))
      (mouse-save-then-kill event 'IGNORE))))


<span class="linecomment">;; REPLACE ORIGINAL in `dired.el' for Emacs 20.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Allow `.' and `..', by using non-nil second arg to `dired-get-filename'.</span>
<span class="linecomment">;;</span>
(when (&lt; emacs-major-version 21)
  (defun dired-find-file ()             <span class="linecomment">; Bound to `e', `RET'</span>
    "<span class="quote">In Dired, visit the file or directory named on this line.</span>"
    (interactive)
    (let* ((dgf-result  (or (dired-get-filename nil t) (error "<span class="quote">No file on this line</span>")))
           (file-name   (file-name-sans-versions dgf-result t)))
      (if (file-exists-p file-name)
          (find-file file-name)
        (if (file-symlink-p file-name)
            (error "<span class="quote">File is a symlink to a nonexistent target</span>")
          (error "<span class="quote">File no longer exists; type `g' to update Dired buffer</span>"))))))

<span class="linecomment">;;;###autoload</span>
(defun diredp-find-file-other-frame ()  <span class="linecomment">; Bound to `C-o'</span>
  "<span class="quote">In Dired, visit this file or directory in another frame.</span>"
  (interactive)
  (find-file-other-frame (file-name-sans-versions (dired-get-filename nil t) t)))

<span class="linecomment">;;;###autoload</span>
(defun diredp-mouse-find-file-other-frame (event) <span class="linecomment">; Bound to `M-mouse-2'</span>
  "<span class="quote">In Dired, visit file or directory clicked on in another frame.</span>"
  (interactive "<span class="quote">e</span>")
  (let ((pop-up-frames  t)) (dired-mouse-find-file-other-window event)))


<span class="linecomment">;; REPLACE ORIGINAL in `dired.el'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Allow `.' and `..', by using non-nil second arg to `dired-get-filename'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;###autoload</span>
(defun dired-mouse-find-file-other-window (event) <span class="linecomment">; Bound to `mouse-2'</span>
  "<span class="quote">In Dired, visit the file or directory name you click on.</span>"
  (interactive "<span class="quote">e</span>")
  (let (file)
    (with-current-buffer (window-buffer (posn-window (event-end event)))
      (save-excursion (goto-char (posn-point (event-end event)))
                      (setq file  (dired-get-filename nil t))))
    (select-window (posn-window (event-end event)))
    (find-file-other-window (file-name-sans-versions file t))))

<span class="linecomment">;; But be aware that `dired-sort-menu.el' binds `S-mouse-2' to `dired-sort-menu-popup'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;###autoload</span>
(defun diredp-mouse-find-file (event)   <span class="linecomment">; Bound to `S-mouse-2'</span>
  "<span class="quote">Replace dired in its window by this file or directory.</span>"
  (interactive "<span class="quote">e</span>")
  (let (file)
    (with-current-buffer (window-buffer (posn-window (event-end event)))
      (save-excursion (goto-char (posn-point (event-end event)))
                      (setq file  (dired-get-filename nil t))))
    (select-window (posn-window (event-end event)))
    (find-file (file-name-sans-versions file t))))

<span class="linecomment">;;;###autoload</span>
(defun diredp-mouse-view-file (event)   <span class="linecomment">; Not bound</span>
  "<span class="quote">Examine this file in view mode, returning to dired when done.
When file is a directory, show it in this buffer if it is inserted;
otherwise, display it in another buffer.</span>"
  (interactive "<span class="quote">e</span>")
  (let (file)
    (with-current-buffer (window-buffer (posn-window (event-end event)))
      (save-excursion (goto-char (posn-point (event-end event)))
                      (setq file  (dired-get-filename nil t))))
    (select-window (posn-window (event-end event)))
    (if (file-directory-p file)
        (or (and (cdr dired-subdir-alist) (dired-goto-subdir file))  (dired file))
      (view-file file))))               <span class="linecomment">; In `view.el'.</span>

<span class="linecomment">;;;###autoload</span>
(defun diredp-mouse-ediff (event)       <span class="linecomment">; Not bound</span>
  "<span class="quote">Compare this file (pointed by mouse) with file FILE2 using `ediff'.
FILE2 defaults to this file as well.  If you enter just a directory
name for FILE2, then this file is compared with a file of the same
name in that directory.  FILE2 is the second file given to `ediff';
this file is the first given to it.</span>"
  (interactive "<span class="quote">e</span>")
  (require 'ediff)
  (let ((mouse-pos  (event-start event)))
    (select-window (posn-window mouse-pos))
    (goto-char (posn-point mouse-pos))
    (call-interactively 'diredp-ediff)))

<span class="linecomment">;;;###autoload</span>
(defun diredp-mouse-diff (event &optional switches) <span class="linecomment">; Not bound</span>
  "<span class="quote">Compare this file (pointed by mouse) with file FILE2 using `diff'.
FILE2 defaults to the file at the mark.  This file is the first file
given to `diff'.  With prefix arg, prompt for second arg SWITCHES,
which are options for `diff'.</span>"
  (interactive "<span class="quote">e</span>")
  (let ((default    (and (mark t)  (save-excursion (goto-char (mark t))
                                                   (dired-get-filename t t))))
        (mouse-pos  (event-start event)))
    (require 'diff)
    (select-window (posn-window mouse-pos))
    (goto-char (posn-point mouse-pos))
    (let ((file2  (read-file-name (format "<span class="quote">Diff %s with: %s</span>"
                                          (dired-get-filename t)
                                          (if default (concat "<span class="quote">(default </span>" default "<span class="quote">) </span>") "<span class="quote"></span>"))
                                  (dired-current-directory) default t)))
      (setq switches  (and current-prefix-arg
                           (if (fboundp 'icicle-read-string-completing)
                               (icicle-read-string-completing
                                "<span class="quote">Options for diff: </span>"
                                (if (stringp diff-switches)
                                    diff-switches
                                  (mapconcat 'identity diff-switches "<span class="quote"> </span>"))
                                (lambda (c) (string-match "<span class="quote">switches</span>" (symbol-name c))))
                             (read-string "<span class="quote">Options for diff: </span>"
                                          (if (stringp diff-switches)
                                              diff-switches
                                            (mapconcat 'identity diff-switches "<span class="quote"> </span>"))))))
      (diff file2 (dired-get-filename t) switches))))

<span class="linecomment">;;;###autoload</span>
(defun diredp-mouse-backup-diff (event) <span class="linecomment">; Not bound</span>
  "<span class="quote">Diff this file with its backup file or vice versa.
Use the latest backup, if there are several numerical backups.
If this file is a backup, diff it with its original.
The backup file is the first file given to `diff'.
With prefix arg, prompt for SWITCHES which are the options for `diff'.</span>"
  (interactive "<span class="quote">e</span>")
  (let ((switches   (and current-prefix-arg
                         (if (fboundp 'icicle-read-string-completing)
                             (icicle-read-string-completing
                              "<span class="quote">Options for diff: </span>"
                              (if (stringp diff-switches)
                                  diff-switches
                                (mapconcat 'identity diff-switches "<span class="quote"> </span>"))
                              (lambda (c) (string-match "<span class="quote">switches</span>" (symbol-name c))))
                           (read-string "<span class="quote">Options for diff: </span>"
                                        (if (stringp diff-switches)
                                            diff-switches
                                          (mapconcat #'identity diff-switches "<span class="quote"> </span>"))))))
        (mouse-pos  (event-start event)))
    (select-window (posn-window mouse-pos))
    (goto-char (posn-point mouse-pos))
    (diff-backup (dired-get-filename) switches)))

<span class="linecomment">;;;###autoload</span>
(defun diredp-mouse-mark (event)        <span class="linecomment">; Not bound</span>
  "<span class="quote">In Dired, mark this file.
If on a subdir headerline, mark all its files except `.' and `..'.

Use \\[dired-unmark-all-files] to remove all marks,
and \\[dired-unmark] on a subdir to remove the marks in this subdir.</span>"
  (interactive "<span class="quote">e</span>")
  (let ((mouse-pos  (event-start event)))
    (select-window (posn-window mouse-pos))
    (goto-char (posn-point mouse-pos)))
  (if (and (cdr dired-subdir-alist) (dired-get-subdir))
      (save-excursion (dired-mark-subdir-files))
    (let (buffer-read-only)
      (dired-repeat-over-lines 1 #'(lambda () (delete-char 1) (insert dired-marker-char)))
      (dired-previous-line 1))))

<span class="linecomment">;;;###autoload</span>
(defun diredp-mouse-unmark (event)      <span class="linecomment">; Not bound</span>
  "<span class="quote">In Dired, unmark this file.
If looking at a subdir, unmark all its files except `.' and `..'.</span>"
  (interactive "<span class="quote">e</span>")
  (let ((mouse-pos  (event-start event)))
    (select-window (posn-window mouse-pos))
    (goto-char (posn-point mouse-pos)))
  (let ((dired-marker-char  ?\040)) (dired-mark nil))
  (dired-previous-line 1))

<span class="linecomment">;;; This can be bound to [C-down-mouse-1] to give behavior similar to Windows Explorer.</span>
<span class="linecomment">;;; However, Emacs generally uses [C-down-mouse-1] for `mouse-buffer-menu'.</span>
<span class="linecomment">;;;###autoload</span>
(defun diredp-mouse-mark/unmark (event) <span class="linecomment">; Not bound</span>
  "<span class="quote">Mark/unmark file or directory at mouse EVENT.</span>"
  (interactive "<span class="quote">e</span>")
  (let* ((mouse-pos                  (event-start event))
         (inhibit-field-text-motion  t) <span class="linecomment">; Just in case.</span>
         (file/dir-name              (with-current-buffer (window-buffer (posn-window mouse-pos))
                                       (save-excursion
                                         (goto-char (posn-point mouse-pos))
                                         (and (not (eobp)) (dired-get-filename nil t))))))
    <span class="linecomment">;; Return nil iff not on a file or directory name.</span>
    (and file/dir-name (cond ((dired-file-marker file/dir-name)
                              (diredp-mouse-unmark event)
                              (message "<span class="quote">Unmarked: %s</span>" file/dir-name))
                             (t
                              (diredp-mouse-mark event)
                              (message "<span class="quote">Marked: %s</span>" file/dir-name))))))

<span class="linecomment">;; This can be bound to [S-mouse-1] to give behavior similar to Windows Explorer.</span>
<span class="linecomment">;; If you do that, consider binding `diredp-mouse-mark/unmark' to `C-mouse-1'.</span>
<span class="linecomment">;; Alternatively, just bind `diredp-mouse-mark/unmark-mark-region-files' to [S-mouse-1].</span>
<span class="linecomment">;;;###autoload</span>
(defun diredp-mouse-mark-region-files (event) <span class="linecomment">; Bound to `S-mouse-1'</span>
  "<span class="quote">Mark files between point and the mouse.</span>"
  (interactive "<span class="quote">e</span>")
  (call-interactively 'mouse-save-then-kill)
  (diredp-mark-region-files))

<span class="linecomment">;; This can be bound to [S-mouse-1] to give behavior similar to Windows Explorer.</span>
<span class="linecomment">;; If you don't bind `diredp-mouse-mark/unmark' to, for instance, `C-mouse-1', then</span>
<span class="linecomment">;; Consider binding this to [S-mouse-1].</span>
<span class="linecomment">;;;###autoload</span>
(defun diredp-mouse-mark/unmark-mark-region-files (event) <span class="linecomment">; Not bound</span>
  "<span class="quote">Mark/unmark file or mark files in region.
If the file the cursor is on is marked, then mark all files between it
 and the line clicked (included).
Otherwise (cursor's file is unmarked):
 If the file clicked is marked, then unmark it.
 If it is unmarked, then mark it.</span>"
  (interactive "<span class="quote">e</span>")
  (let ((mouse-pos  (event-start event)))
    <span class="linecomment">;; If same click same line as cursor, or cursor's line is marked,</span>
    <span class="linecomment">;; Then toggle the clicked line's mark.</span>
    <span class="linecomment">;; Else mark all files in region between point and clicked line (included).</span>
    (if (or (eq (count-lines (point-min) (posn-point mouse-pos))
              (count-lines (point-min) (point)))
            (equal dired-marker-char (dired-file-marker (dired-get-filename nil t))))
        (diredp-mouse-mark/unmark event)
      (call-interactively 'mouse-save-then-kill)
      (diredp-mark-region-files))))

<span class="linecomment">;;;###autoload</span>
(defun diredp-mouse-flag-file-deletion (event) <span class="linecomment">; Not bound</span>
  "<span class="quote">In Dired, flag this file for deletion.
If on a subdir headerline, mark all its files except `.' and `..'.</span>"
  (interactive "<span class="quote">e</span>")
  (let ((mouse-pos  (event-start event)))
    (select-window (posn-window mouse-pos))
    (goto-char (posn-point mouse-pos)))
  (let ((dired-marker-char  dired-del-marker)) (dired-mark 1))
  (dired-previous-line 1))

<span class="linecomment">;;;###autoload</span>
(defun diredp-mouse-do-copy (event)     <span class="linecomment">; Not bound</span>
  "<span class="quote">In Dired, copy this file.
This normally preserves the last-modified date when copying.</span>"
  (interactive "<span class="quote">e</span>")
  (let ((mouse-pos  (event-start event)))
    (select-window (posn-window mouse-pos))
    (goto-char (posn-point mouse-pos)))
  (dired-do-create-files 'copy #'dired-copy-file (if dired-copy-preserve-time "<span class="quote">Copy [-p]</span>" "<span class="quote">Copy</span>")
                         1 dired-keep-marker-copy))

<span class="linecomment">;;;###autoload</span>
(defun diredp-mouse-do-rename (event)   <span class="linecomment">; Not bound</span>
  "<span class="quote">In Dired, rename this file.</span>"
  (interactive "<span class="quote">e</span>")
  (let ((mouse-pos  (event-start event)))
    (select-window (posn-window mouse-pos))
    (goto-char (posn-point mouse-pos)))
  (dired-do-create-files 'move #'dired-rename-file "<span class="quote">Move</span>" 1 dired-keep-marker-rename "<span class="quote">Rename</span>"))

<span class="linecomment">;;;###autoload</span>
(defun diredp-mouse-upcase (event)      <span class="linecomment">; Not bound</span>
  "<span class="quote">In Dired, rename this file to upper case.</span>"
  (interactive "<span class="quote">e</span>")
  (let ((mouse-pos  (event-start event)))
    (select-window (posn-window mouse-pos))
    (goto-char (posn-point mouse-pos)))
  (dired-rename-non-directory #'upcase "<span class="quote">Rename to uppercase:</span>" nil))

<span class="linecomment">;;;###autoload</span>
(defun diredp-mouse-downcase (event)    <span class="linecomment">; Not bound</span>
  "<span class="quote">In Dired, rename this file to lower case.</span>"
  (interactive "<span class="quote">e</span>")
  (let ((mouse-pos  (event-start event)))
    (select-window (posn-window mouse-pos))
    (goto-char (posn-point mouse-pos)))
  (dired-rename-non-directory #'downcase "<span class="quote">Rename to lowercase:</span>" nil))

<span class="linecomment">;;;###autoload</span>
(defun diredp-mouse-do-delete (event)   <span class="linecomment">; Not bound</span>
  "<span class="quote">In Dired, delete this file, upon confirmation.</span>"
  (interactive "<span class="quote">e</span>")
  (let ((mouse-pos  (event-start event)))
    (select-window (posn-window mouse-pos))
    (goto-char (posn-point mouse-pos)))
  (diredp-internal-do-deletions (dired-map-over-marks (cons (dired-get-filename)
                                                            (point)) 1)
                                1
                                'USE-TRASH-CAN) <span class="linecomment">; This arg is for Emacs 24+ only.</span>
  (dired-previous-line 1))

<span class="linecomment">;;;###autoload</span>
(defun diredp-mouse-do-shell-command (event) <span class="linecomment">; Not bound</span>
  "<span class="quote">Run a shell COMMAND on this file.
If there is output, it goes to a separate buffer.

No automatic redisplay of dired buffers is attempted, as there's no
telling what files the command may have changed.  Type
\\[dired-do-redisplay] to redisplay.

The shell command has the top level directory as working directory, so
output files usually are created there instead of in a subdir.</span>"
  <span class="linecomment">;;Functions dired-run-shell-command and dired-shell-stuff-it do the</span>
  <span class="linecomment">;;actual work and can be redefined for customization.</span>
  (interactive "<span class="quote">e</span>")
  (lexical-let ((mouse-pos  (event-start event))
                (command    (dired-read-shell-command "<span class="quote">! on %s: </span>" nil
                                                      (dired-get-marked-files t nil))))
    (select-window (posn-window mouse-pos))
    (goto-char (posn-point mouse-pos))
    (dired-bunch-files (- 10000 (length command))
                       #'(lambda (&rest files)
                           (dired-run-shell-command (dired-shell-stuff-it command files t 1)))
                       nil
                       (dired-get-marked-files t 1))))

<span class="linecomment">;;;###autoload</span>
(defun diredp-mouse-do-symlink (event)  <span class="linecomment">; Not bound</span>
  "<span class="quote">Make symbolic link to this file.</span>"
  (interactive "<span class="quote">e</span>")
  (let ((mouse-pos  (event-start event)))
    (select-window (posn-window mouse-pos))
    (goto-char (posn-point mouse-pos)))
  (dired-do-create-files 'symlink #'make-symbolic-link "<span class="quote">Symlink</span>" 1 dired-keep-marker-symlink))

<span class="linecomment">;;;###autoload</span>
(defun diredp-mouse-do-hardlink (event) <span class="linecomment">; Not bound</span>
  "<span class="quote">Make hard link (alias) to this file.</span>"
  (interactive "<span class="quote">e</span>")
  (let ((mouse-pos  (event-start event)))
    (select-window (posn-window mouse-pos))
    (goto-char (posn-point mouse-pos)))
  (dired-do-create-files 'hardlink #'add-name-to-file "<span class="quote">Hardlink</span>" 1 dired-keep-marker-hardlink))

<span class="linecomment">;;;###autoload</span>
(defun diredp-mouse-do-print (event)    <span class="linecomment">; Not bound</span>
  "<span class="quote">Print this file.
Uses the shell command coming from variables `lpr-command' and
`lpr-switches' as default.</span>"
  (interactive "<span class="quote">e</span>")
  (let ((mouse-pos  (event-start event)))
    (select-window (posn-window mouse-pos))
    (goto-char (posn-point mouse-pos)))
  (let* ((file     (dired-get-filename))
         (command  (dired-mark-read-string "<span class="quote">Print %s with: </span>"
                                           (apply 'concat lpr-command "<span class="quote"> </span>" lpr-switches)
                                           'print 1 (list file))))
    (dired-run-shell-command (dired-shell-stuff-it command (list file) nil))))

<span class="linecomment">;;;###autoload</span>
(defun diredp-mouse-do-grep (event)     <span class="linecomment">; Not bound</span>
  "<span class="quote">Run grep against this file.</span>"
  (interactive "<span class="quote">e</span>")
  (let ((mouse-pos  (event-start event)))
    (select-window (posn-window mouse-pos))
    (goto-char (posn-point mouse-pos)))
  (unless grep-command (grep-compute-defaults))
  (grep (diredp-do-grep-1 (list (dired-get-filename t)))))

<span class="linecomment">;;;###autoload</span>
(defun diredp-mouse-do-compress (event) <span class="linecomment">; Not bound</span>
  "<span class="quote">Compress or uncompress this file.</span>"
  (interactive "<span class="quote">e</span>")
  (let ((mouse-pos         (event-start event))
        (dired-no-confirm  t))
    (select-window (posn-window mouse-pos))
    (goto-char (posn-point mouse-pos))
    (dired-map-over-marks-check #'dired-compress 1 'compress t))
  (dired-previous-line 1))

<span class="linecomment">;;;###autoload</span>
(defun diredp-mouse-do-byte-compile (event) <span class="linecomment">; Not bound</span>
  "<span class="quote">Byte compile this file.</span>"
  (interactive "<span class="quote">e</span>")
  (let ((mouse-pos         (event-start event))
        (dired-no-confirm  t))
    (select-window (posn-window mouse-pos))
    (goto-char (posn-point mouse-pos))
    (dired-map-over-marks-check #'dired-byte-compile 1 'byte-compile t))
  (dired-previous-line 1))

<span class="linecomment">;;;###autoload</span>
(defun diredp-mouse-do-load (event)     <span class="linecomment">; Not bound</span>
  "<span class="quote">Load this Emacs Lisp file.</span>"
  (interactive "<span class="quote">e</span>")
  (let ((mouse-pos         (event-start event))
        (dired-no-confirm  t))
    (select-window (posn-window mouse-pos))
    (goto-char (posn-point mouse-pos))
    (dired-map-over-marks-check #'dired-load 1 'load t))
  (dired-previous-line 1))

<span class="linecomment">;;;###autoload</span>
(defun diredp-mouse-do-chmod (event)    <span class="linecomment">; Not bound</span>
  "<span class="quote">Change the mode of this file.
This calls chmod, so symbolic modes like `g+w' are allowed.</span>"
  (interactive "<span class="quote">e</span>")
  (let ((mouse-pos  (event-start event)))
    (select-window (posn-window mouse-pos))
    (goto-char (posn-point mouse-pos)))
  (dired-do-chxxx "<span class="quote">Mode</span>" "<span class="quote">chmod</span>" 'chmod 1)
  (dired-previous-line 1))

(unless (memq system-type '(windows-nt ms-dos))
  (defun diredp-mouse-do-chgrp (event)  <span class="linecomment">; Not bound</span>
    "<span class="quote">Change the group of this file.</span>"
    (interactive "<span class="quote">e</span>")
    (let ((mouse-pos  (event-start event)))
      (select-window (posn-window mouse-pos))
      (goto-char (posn-point mouse-pos)))
    (dired-do-chxxx "<span class="quote">Group</span>" "<span class="quote">chgrp</span>" 'chgrp 1)
    (dired-previous-line 1)))

(unless (memq system-type '(windows-nt ms-dos))
  (defun diredp-mouse-do-chown (event)  <span class="linecomment">; Not bound</span>
    "<span class="quote">Change the owner of this file.</span>"
    (interactive "<span class="quote">e</span>")
    (let ((mouse-pos  (event-start event)))
      (select-window (posn-window mouse-pos))
      (goto-char (posn-point mouse-pos)))
    (dired-do-chxxx "<span class="quote">Owner</span>" dired-chown-program 'chown 1)
    (dired-previous-line 1)))


<span class="linecomment">;;; Dired+ Help</span>

<span class="linecomment">;;;###autoload</span>
(defun diredp-describe-mode (&optional buffer)
  "<span class="quote">Describe Dired mode, including Dired+ features.
This is `describe-mode' plus a description of Dired+ features.
For just the latter, use \\&lt;dired-mode-map&gt;`\\[diredp-dired-plus-help]'.</span>"
  (interactive "<span class="quote">@</span>")
  (unless (eq major-mode 'dired-mode)
    (error "<span class="quote">Use `diredp-dired-plus-help' if you want information about Dired+</span>"))
  (with-current-buffer (or buffer (current-buffer)) (describe-mode))
  (with-current-buffer (get-buffer-create "<span class="quote">*Help*</span>")
    (save-excursion
      (goto-char (point-min))
      (diredp-dired-plus-help-link)
      (let ((buffer-read-only  nil)) (insert "<span class="quote">\n</span>"))
      (when (re-search-forward "<span class="quote">Keybindings:\nkey\\s-+binding\n---\\s-+-------</span>" nil t)
        (goto-char (match-beginning 0))
        (let ((buffer-read-only  nil))
          (insert "<span class="quote">\f\n</span>")
          (diredp-dired-plus-description+links)
          (insert "<span class="quote">\f\n</span>"))))))

<span class="linecomment">;;;###autoload</span>
(defun diredp-dired-plus-help ()
  "<span class="quote">Describe Dired+.</span>"
  (interactive "<span class="quote">@</span>")
  (with-output-to-temp-buffer "<span class="quote">*Help*</span>" (diredp-dired-plus-description+links)))

(defun diredp-dired-plus-description+links ()
  "<span class="quote">Insert Dired+ help text in `*Help*'.</span>"
  (with-current-buffer (get-buffer-create "<span class="quote">*Help*</span>")
    (let ((buffer-read-only  nil))
      (save-restriction
        (narrow-to-region (point) (point))
        (diredp-dired-plus-help-link)
        (insert (diredp-dired-plus-description))
        (goto-char (point-max))
        (insert "<span class="quote">\n</span>")
        (diredp-dired-plus-help-link)))))

(when (and (&gt; emacs-major-version 21)
           (require 'help-mode nil t) (get 'help-xref 'button-category-symbol)) <span class="linecomment">; `button.el'</span>
  (define-button-type 'diredp-help-button
      :supertype 'help-xref
      'help-function #'(lambda () (browse-url "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/DiredPlus</span>"))
      'help-echo
      (purecopy "<span class="quote">mouse-2, RET: Dired+ documentation on the Emacs Wiki (requires \
Internet access)</span>")))

(defun diredp-dired-plus-help-link ()
  "<span class="quote">Add Web link for Dired+ help, and reminder about sending bug report.</span>"
  <span class="linecomment">;; Don't bother to do this for Emacs 21.3.  Its `help-insert-xref-button' is different.</span>
  (when (and (&gt; emacs-major-version 21)
             (require 'help-mode nil t) (fboundp 'help-insert-xref-button)) <span class="linecomment">; `help-mode.el'.</span>
    (let ((buffer-read-only  nil))
      (help-insert-xref-button "<span class="quote">[Dired+ Help on the Web]</span>" 'diredp-help-button)
      (insert (substitute-command-keys
               "<span class="quote">\t\tSend a Dired+ bug report:\n\t\t\t\t\t`\\[diredp-send-bug-report]'\n</span>")))))

(defun diredp-dired-plus-description ()
  "<span class="quote">Dired+ description.</span>"
  (substitute-command-keys
   (concat
    "<span class="quote">\\&lt;dired-mode-map&gt;\
              Dired+ Features
              ---------------

Most keys listed here are in addition to those for vanilla Dired.

Menus
-----

Many Dired+ actions are available from the menu-bar menus and the
`mouse-3' context menu.  This may include commands shown here as not
being bound to keys (i.e., listed as `M-x ...').

General
-------

* \\[diredp-toggle-find-file-reuse-dir]\t- Toggle reuse of directories
</span>"
    (and (fboundp 'diredp-w32-drives)
         "<span class="quote">* \\[diredp-w32-drives]\t\t- Go up to a list of MS Windows drives
</span>")

"<span class="quote">
* \\[diredp-marked-other-window]\t\t\t\t- Open Dired on marked
* \\[diredp-fileset]\t\t- Open Dired on files in a fileset
* \\[diredp-dired-for-files]\t- Open Dired on specific files
* \\[diredp-dired-union]\t- Create union of some Dired buffers
* \\[diredp-dired-inserted-subdirs]\t- Dired each inserted subdir

Mouse
-----

* \\[diredp-mouse-3-menu]\t- Context-sensitive menu
</span>"

    (and (where-is-internal 'diredp-mouse-describe-file dired-mode-map)
         "<span class="quote">* \\[diredp-mouse-describe-file]\t- Describe this
</span>")

    "<span class="quote">* \\[diredp-mouse-mark-region-files]\t\t- Mark all in region
</span>"

    (and (where-is-internal 'diredp-mouse-find-file dired-mode-map)
         "<span class="quote">* \\[diredp-mouse-find-file]\t- Open in this window
</span>")
    (and (where-is-internal 'diredp-mouse-find-file-reuse-dir-buffer dired-mode-map)
         "<span class="quote">* \\[diredp-mouse-find-file-reuse-dir-buffer]\t- Open in this window
</span>")

    (and (where-is-internal 'dired-mouse-find-file-other-window dired-mode-map)
         "<span class="quote">* \\[dired-mouse-find-file-other-window]\t\t- Open in another window
</span>")

    "<span class="quote">* \\[diredp-mouse-find-file-other-frame]\t\t- Open in another frame
</span>"

    (and (fboundp 'dired-mouse-w32-browser) <span class="linecomment">; In `w32-browser.el'.</span>
         (where-is-internal 'dired-mouse-w32-browser dired-mode-map)
         "<span class="quote">* \\[dired-mouse-w32-browser]\t- MS Windows `Open' action
</span>")

    (and (fboundp 'dired-mouse-w32-browser-reuse-dir-buffer) <span class="linecomment">; In `w32-browser.el'.</span>
         (where-is-internal 'dired-mouse-w32-browser-reuse-dir-buffer dired-mode-map)
         "<span class="quote">* \\[dired-mouse-w32-browser-reuse-dir-buffer]\t- MS Windows `Open' action
</span>")

    "<span class="quote">
Marking
-------

* \\[dired-mark]\t\t- Mark this
* \\[dired-unmark]\t\t- Unmark this
* \\[dired-do-toggle]\t- Toggle marked/unmarked
* \\[dired-mark-sexp]\t\t- Mark all satisfying a predicate
* \\[dired-unmark-all-marks]\t\t- Unmark all
* \\[diredp-mark/unmark-extension]\t\t- Mark/unmark all that have a given extension
* \\[diredp-mark-files-tagged-regexp]\t\t- Mark those with a tag that matches a regexp
* \\[diredp-unmark-files-tagged-regexp]\t\t- Unmark those with a tag that matches a regexp
* \\[diredp-mark-files-tagged-all]\t\t- Mark those with all of the given tags
* \\[diredp-unmark-files-tagged-all]\t\t- Unmark those with all of the given tags
* \\[diredp-mark-files-tagged-some]\t\t- Mark those with some of the given tags
* \\[diredp-unmark-files-tagged-some]\t\t- Unmark those with some of the given tags
* \\[diredp-mark-files-tagged-not-all]\t- Mark those without some of the given tags
* \\[diredp-unmark-files-tagged-not-all]\t- Unmark those without some of the given tags
* \\[diredp-mark-files-tagged-none]\t- Mark those with none of the given tags
* \\[diredp-unmark-files-tagged-none]\t- Unmark those with none of the given tags
</span>"

    "<span class="quote">
Current file/subdir (current line)
----------------------------------

* \\[diredp-describe-file]\t- Describe
* \\[diredp-byte-compile-this-file]\t\t- Byte-compile
* \\[diredp-compress-this-file]\t\t- Compress/uncompress
* \\[diredp-print-this-file]\t\t- Print
* \\[diredp-relsymlink-this-file]\t\t- Create relative symlink
* \\[diredp-delete-this-file]\t\t- Delete (with confirmation)
* \\[diredp-rename-this-file]\t\t- Rename
* \\[diredp-capitalize-this-file]\t\t- Capitalize (rename)
* \\[diredp-upcase-this-file]\t\t- Rename to uppercase
* \\[diredp-downcase-this-file]\t\t- Rename to lowercase
* \\[diredp-ediff]\t\t- Ediff
</span>"
    (and (fboundp 'diredp-tag-this-file) <span class="linecomment">; In `bookmark+-1.el'.</span>
         "<span class="quote">* \\[diredp-tag-this-file]\t\t- Add some tags to this
* \\[diredp-untag-this-file]\t\t- Remove some tags from this
* \\[diredp-remove-all-tags-this-file]\t\t- Remove all tags from this
* \\[diredp-copy-tags-this-file]\t\t- Copy the tags from this
* \\[diredp-paste-add-tags-this-file]\t\t- Paste (add) copied tags to this
* \\[diredp-paste-replace-tags-this-file]\t\t- Paste (replace) tags for this
* \\[diredp-set-tag-value-this-file]\t\t- Set a tag value for this
</span>")

    (and (fboundp 'diredp-bookmark-this-file) <span class="linecomment">; In `bookmark+-1.el'.</span>
         "<span class="quote">* \\[diredp-bookmark-this-file]\t\t- Bookmark
</span>")

    (and (fboundp 'dired-mouse-w32-browser) <span class="linecomment">; In `w32-browser.el'.</span>
         (where-is-internal 'dired-mouse-w32-browser dired-mode-map)
         "<span class="quote">* \\[dired-mouse-w32-browser]\t- MS Windows `Open' action
* \\[dired-w32explore]\t- MS Windows Explorer
</span>")

    (and (fboundp 'dired-mouse-w32-browser-reuse-dir-buffer) <span class="linecomment">; In `w32-browser.el'.</span>
         (where-is-internal 'dired-mouse-w32-browser-reuse-dir-buffer dired-mode-map)
         "<span class="quote">* \\[dired-mouse-w32-browser-reuse-dir-buffer]\t- MS Windows `Open' action
* \\[dired-w32explore]\t- MS Windows Explorer
</span>")

    "<span class="quote">
Marked (or next prefix arg) files & subdirs here
------------------------------------------------

* \\[diredp-insert-subdirs]\t\t- Insert marked subdirectories
* \\[dired-copy-filename-as-kill]\t\t- Copy names for pasting
* \\[dired-do-find-marked-files]\t\t- Visit
* \\[dired-do-copy]\t\t- Copy
* \\[dired-do-rename]\t\t- Rename/move
* \\[diredp-do-grep]\t\t- Run `grep'
* \\[dired-do-search]\t\t- Search
</span>"

    (if (fboundp 'dired-do-query-replace-regexp) <span class="linecomment">; Emacs 22+</span>
         "<span class="quote">* \\[dired-do-query-replace-regexp]\t\t- Query-replace
</span>"
      "<span class="quote">* \\[dired-do-query-replace]\t\t- Query-replace
</span>")

    (and (fboundp 'dired-do-isearch)
         "<span class="quote">* \\[dired-do-isearch]\t- Isearch
* \\[dired-do-isearch-regexp]\t- Regexp isearch
</span>")

    "<span class="quote">* \\[dired-do-shell-command]\t\t- Run shell command
* \\[diredp-marked-other-window]\t\t- Dired
* \\[dired-do-compress]\t\t- Compress
* \\[dired-do-byte-compile]\t\t- Byte-compile
* \\[dired-do-load]\t\t- Load (Emacs Lisp)

* \\[diredp-omit-marked]\t- Omit
* \\[diredp-omit-unmarked]\t- Omit unmarked
</span>"

    (and (fboundp 'diredp-do-tag) <span class="linecomment">; In `bookmark+-1.el'.</span>
         "<span class="quote">
* \\[diredp-do-tag]\t\t- Add some tags to marked
* \\[diredp-do-untag]\t\t- Remove some tags from marked
* \\[diredp-do-remove-all-tags]\t\t- Remove all tags from marked
* \\[diredp-do-paste-add-tags]\t- Paste (add) copied tags to marked
* \\[diredp-do-paste-replace-tags]\t\t- Paste (replace) tags for marked
* \\[diredp-do-set-tag-value]\t\t- Set a tag value for marked
* \\[diredp-mark-files-tagged-regexp]\t\t- Mark those with a tag that matches a regexp
* \\[diredp-mark-files-tagged-all]\t\t- Mark those with all of the given tags
* \\[diredp-mark-files-tagged-some]\t\t- Mark those with some of the given tags
* \\[diredp-mark-files-tagged-not-all]\t- Mark those without some of the given tags
* \\[diredp-mark-files-tagged-none]\t- Mark those with none of the given tags
* \\[diredp-unmark-files-tagged-regexp]\t\t- Unmark those with a tag that matches a regexp
* \\[diredp-unmark-files-tagged-all]\t\t- Unmark those with all of the given tags
* \\[diredp-unmark-files-tagged-some]\t\t- Unmark those with some of the given tags
* \\[diredp-unmark-files-tagged-not-all]\t- Unmark those without some of the given tags
* \\[diredp-unmark-files-tagged-none]\t- Unmark those with none of the given tags
</span>")

    (and (fboundp 'diredp-do-bookmark) <span class="linecomment">; In `bookmark+-1.el'.</span>
         "<span class="quote">
* \\[diredp-do-bookmark]\t\t- Bookmark
* \\[diredp-set-bookmark-file-bookmark-for-marked]\t\t- \
Bookmark and create bookmark-file bookmark
* \\[diredp-do-bookmark-in-bookmark-file]\t- Bookmark in specific bookmark file
</span>")

    (and (fboundp 'dired-multiple-w32-browser) <span class="linecomment">; In `w32-browser.el'.</span>
         "<span class="quote">
* \\[dired-multiple-w32-browser]\t- MS Windows `Open' action
</span>")

    "<span class="quote">
Marked files here and below (in marked subdirs)
-----------------------------------------------

* \\[diredp-insert-subdirs-recursive]\t\t- Insert marked subdirectories
* \\[diredp-copy-filename-as-kill-recursive]\t\t- Copy names for pasting
* \\[diredp-do-find-marked-files-recursive]\t\t\t- Visit
* \\[diredp-do-copy-recursive]\t\t\t- Copy
* \\[diredp-do-move-recursive]\t\t\t- Move
* \\[diredp-do-grep-recursive]\t\t- `grep'
* \\[diredp-do-search-recursive]\t\t\t- Search
* \\[diredp-do-query-replace-regexp-recursive]\t\t\t- Query-replace
* \\[diredp-do-isearch-recursive]\t\t- Isearch
* \\[diredp-do-isearch-regexp-recursive]\t- Regexp isearch
* \\[diredp-do-shell-command-recursive]\t\t\t- Run shell command
* \\[diredp-marked-recursive-other-window]\t\t- Dired
* \\[diredp-list-marked-recursive]\t\t\t- List

* \\[diredp-do-bookmark-recursive]\t\t- Bookmark
* \\[diredp-do-bookmark-in-bookmark-file-recursive]\t\t- Bookmark in bookmark file
* \\[diredp-set-bookmark-file-bookmark-for-marked-recursive]\t\t- Create bookmark-file bookmark
</span>"
    (and (fboundp 'dired-multiple-w32-browser) <span class="linecomment">; In `w32-browser.el'.</span>
         "<span class="quote">
* \\[diredp-multiple-w32-browser-recursive]\t- MS Windows `Open'
</span>")


    (and (fboundp 'diredp-tag-this-file) <span class="linecomment">; In `bookmark+-1.el'.</span>
         "<span class="quote">
Tagging
-------

* \\[diredp-tag-this-file]\t\t- Add some tags to this
* \\[diredp-untag-this-file]\t\t- Remove some tags from this
* \\[diredp-remove-all-tags-this-file]\t\t- Remove all tags from this
* \\[diredp-copy-tags-this-file]\t\t- Copy the tags from this
* \\[diredp-paste-add-tags-this-file]\t\t- Paste (add) copied tags to this
* \\[diredp-paste-replace-tags-this-file]\t\t- Paste (replace) tags for this
* \\[diredp-set-tag-value-this-file]\t\t- Set a tag value for this
* \\[diredp-do-tag]\t\t- Add some tags to marked
* \\[diredp-do-untag]\t\t- Remove some tags from marked
* \\[diredp-do-remove-all-tags]\t\t- Remove all tags from marked
* \\[diredp-do-paste-add-tags]\t- Paste (add) copied tags to marked
* \\[diredp-do-paste-replace-tags]\t\t- Paste (replace) tags for marked
* \\[diredp-do-set-tag-value]\t\t- Set a tag value for marked
* \\[diredp-mark-files-tagged-regexp]\t\t- Mark those with a tag that matches a regexp
* \\[diredp-mark-files-tagged-all]\t\t- Mark those with all of the given tags
* \\[diredp-mark-files-tagged-some]\t\t- Mark those with some of the given tags
* \\[diredp-mark-files-tagged-not-all]\t- Mark those without some of the given tags
* \\[diredp-mark-files-tagged-none]\t- Mark those with none of the given tags
* \\[diredp-unmark-files-tagged-regexp]\t\t- Unmark those with a tag that matches a regexp
* \\[diredp-unmark-files-tagged-all]\t\t- Unmark those with all of the given tags
* \\[diredp-unmark-files-tagged-some]\t\t- Unmark those with some of the given tags
* \\[diredp-unmark-files-tagged-not-all]\t- Unmark those without some of the given tags
* \\[diredp-unmark-files-tagged-none]\t- Unmark those with none of the given tags
</span>")

    (and (fboundp 'diredp-bookmark-this-file) <span class="linecomment">; In `bookmark+-1.el'.</span>
         "<span class="quote">
Bookmarking
-----------

* \\[diredp-bookmark-this-file]\t\t- Bookmark this
* \\[diredp-do-bookmark]\t\t- Bookmark marked
* \\[diredp-set-bookmark-file-bookmark-for-marked]\t\t- \
Bookmark marked and create bookmark-file bookmark
* \\[diredp-do-bookmark-in-bookmark-file]\t- Bookmark marked, in specific bookmark file
</span>")
    )))

(when (&gt; emacs-major-version 21)
  (defun diredp-nb-marked-in-mode-name ()
    "<span class="quote">Add number of marked and flagged lines to mode name in the mode line.
\(Flagged means flagged for deletion.)
If the current line is marked/flagged and there are others
marked/flagged after it then show `N/M', where N is the number
marked/flagged through the current line and M is the total number
marked/flagged.

Also abbreviate `mode-name', using \"Dired/\" instead of \"Dired by\".</span>"
    (let ((mname  (format-mode-line mode-name)))
      (unless (get-text-property 0 'dired+-mode-name mname) <span class="linecomment">; Do it only once.</span>
        (save-match-data
          (setq mode-name
                `(,(propertize (if (string-match "<span class="quote">^[dD]ired \\(by \\)?\\(.*\\)</span>" mname)
                                   (format "<span class="quote">Dired/%s</span>" (match-string 2 mname))
                                 mname)
                               'dired+-mode-name t)
                  (:eval (let* ((dired-marker-char  (if (eq ?D dired-marker-char)
                                                        ?* <span class="linecomment">; `dired-do-flagged-delete' binds it.</span>
                                                      dired-marker-char))
                                (marked-regexp      (dired-marker-regexp))
                                (nb-marked          (count-matches marked-regexp
                                                                   (point-min) (point-max))))
                           (if (not (&gt; nb-marked 0))
                               "<span class="quote"></span>"
                             (propertize
                              (format "<span class="quote"> %s%d%c</span>"
                                      (save-excursion
                                        (forward-line 0)
                                        (if (looking-at (concat marked-regexp "<span class="quote">.*</span>"))
                                            (format "<span class="quote">%d/</span>" (1+ (count-matches
                                                               marked-regexp
                                                               (point-min) (point))))
                                          "<span class="quote"></span>"))
                                      nb-marked dired-marker-char)
                              'face 'diredp-mode-line-marked 'dired+-mode-name t))))
                  (:eval (let* ((flagged-regexp  (let ((dired-marker-char  dired-del-marker))
                                                   (dired-marker-regexp)))
                                (nb-flagged      (count-matches flagged-regexp
                                                                (point-min) (point-max))))
                           (if (not (&gt; nb-flagged 0))
                               "<span class="quote"></span>"
                             (propertize
                              (format "<span class="quote"> %s%dD</span>"
                                      (save-excursion
                                        (forward-line 0)
                                        (if (looking-at (concat flagged-regexp "<span class="quote">.*</span>"))
                                            (format "<span class="quote">%d/</span>" (1+ (count-matches
                                                               flagged-regexp
                                                               (point-min) (point))))
                                          "<span class="quote"></span>"))
                                      nb-flagged)
                              'face 'diredp-mode-line-flagged))))))))))

  (defface diredp-mode-line-marked
      '((((background dark))
         (:foreground "<span class="quote">#6B6BFFFF2C2C</span>")) <span class="linecomment">; a bright green</span>
        (t (:foreground "<span class="quote">DarkViolet</span>")))
    "<span class="quote">*Face for marked number in mode line `mode-name' for Dired buffers.</span>"
    :group 'Dired-Plus :group 'font-lock-highlighting-faces)

  (defface diredp-mode-line-flagged
      '((t (:foreground "<span class="quote">Red</span>")))
    "<span class="quote">*Face for flagged number in mode line `mode-name' for Dired buffers.</span>"
    :group 'Dired-Plus :group 'font-lock-highlighting-faces)


  (add-hook 'dired-after-readin-hook 'diredp-nb-marked-in-mode-name)
  <span class="linecomment">;; This one is needed for `find-dired', because it does not call `dired-readin'.</span>
  (add-hook 'dired-mode-hook         'diredp-nb-marked-in-mode-name))

<span class="linecomment">;;;###autoload</span>
(defun diredp-send-bug-report ()
  "<span class="quote">Send a bug report about a Dired+ problem.</span>"
  (interactive)
  (browse-url (format (concat "<span class="quote">mailto:</span>" "<span class="quote">drew.adams</span>" "<span class="quote">@</span>" "<span class="quote">oracle</span>" "<span class="quote">.com?subject=\
Dired+ bug: \
&body=Describe bug below, using a precise recipe that starts with `emacs -Q' or `emacs -q'.  \
File `dired+.el' has a header `Update #' that you can use to identify it.\
%%0A%%0AEmacs version: %s.</span>")
                      (emacs-version))))

<span class="linecomment">;;;;;;;;;;;;</span>

(setq diredp-loaded-p  t)

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;; dired+.el ends here</span></span></pre></div><div class="wrapper close"></div></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/Glossary">Glossary</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><span class="translation bar"><br />  <a class="translation new" rel="nofollow" href="http://www.emacswiki.org/emacs?action=translate;id=dired+.el;missing=de_es_fr_it_ja_ko_pt_ru_se_zh">Add Translation</a></span><span class="edit bar"><br /> <a class="comment local" href="http://www.emacswiki.org/emacs/Comments_on_dired%2b.el">Comments on dired+.el</a> <a class="edit" accesskey="e" title="Click to edit this page" rel="nofollow" href="http://www.emacswiki.org/emacs?action=edit;id=dired%2b.el">Edit this page</a> <a class="history" rel="nofollow" href="http://www.emacswiki.org/emacs?action=history;id=dired%2b.el">View other revisions</a> <a class="admin" rel="nofollow" href="http://www.emacswiki.org/emacs?action=admin;id=dired%2b.el">Administration</a></span><!-- test --><span class="time"><br /> Last edited 2012-10-06 16:02 UTC by <a class="author" title="from c-71-202-147-44.hsd1.ca.comcast.net" href="http://www.emacswiki.org/emacs/DrewAdams">DrewAdams</a> <a class="diff" rel="nofollow" href="http://www.emacswiki.org/emacs?action=browse;diff=2;id=dired%2b.el">(diff)</a></span><div style="float:right; margin-left:1ex;">
<!-- Creative Commons License -->
<a href="http://creativecommons.org/licenses/GPL/2.0/"><img alt="CC-GNU GPL" style="border:none" src="/pics/cc-GPL-a.png" /></a>
<!-- /Creative Commons License -->
</div>

<!--
<rdf:RDF xmlns="http://web.resource.org/cc/"
 xmlns:dc="http://purl.org/dc/elements/1.1/"
 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<Work rdf:about="">
   <license rdf:resource="http://creativecommons.org/licenses/GPL/2.0/" />
  <dc:type rdf:resource="http://purl.org/dc/dcmitype/Software" />
</Work>

<License rdf:about="http://creativecommons.org/licenses/GPL/2.0/">
   <permits rdf:resource="http://web.resource.org/cc/Reproduction" />
   <permits rdf:resource="http://web.resource.org/cc/Distribution" />
   <requires rdf:resource="http://web.resource.org/cc/Notice" />
   <permits rdf:resource="http://web.resource.org/cc/DerivativeWorks" />
   <requires rdf:resource="http://web.resource.org/cc/ShareAlike" />
   <requires rdf:resource="http://web.resource.org/cc/SourceCode" />
</License>
</rdf:RDF>
-->

<p class="legal">
This work is licensed to you under version 2 of the
<a href="http://www.gnu.org/">GNU</a> <a href="/GPL">General Public License</a>.
Alternatively, you may choose to receive this work under any other
license that grants the right to use, copy, modify, and/or distribute
the work, as long as that license imposes the restriction that
derivative works have to grant the same rights and impose the same
restriction. For example, you may choose to receive this work under
the
<a href="http://www.gnu.org/">GNU</a>
<a href="/FDL">Free Documentation License</a>, the
<a href="http://creativecommons.org/">CreativeCommons</a>
<a href="http://creativecommons.org/licenses/sa/1.0/">ShareAlike</a>
License, the XEmacs manual license, or
<a href="/OLD">similar licenses</a>.
</p>
</div>
</body>
</html>
