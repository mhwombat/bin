# bin

A collection of useful scripts.
Each script is summarised below.

Tip: Some of my scripts use "nix-shell shebangs".
You wont need that if youre not using Nix (or you install the pre-requisite packages globally).
So if the script begins with

    #!/usr/bin/env nix-shell
    #! nix-shell -i bash -p blah blah blah

You can replace that with

    #!/usr/bin/sh

## [all-history](https://github.com/mhwombat/bin/blob/master/all-history)

Display bash history for all sessions.
I keep a separate history file for each bash session.

## [amy-bib](https://github.com/mhwombat/bin/blob/master/amy-bib)

Read BibTeX information from paste buffer and put it into my citation management system.
I keep each BibTeX in a separate file.
The name of the file is the BibTeX key.

## [amy-bib-gen](https://github.com/mhwombat/bin/blob/master/amy-bib-gen)

Read all BibTeX entries from my citation management system,
creating a single BibTex file.

## [amy-prompt.hs](https://github.com/mhwombat/bin/blob/master/amy-prompt.hs)

A work in progress; not currently in use.

## [amy-prompt.sh](https://github.com/mhwombat/bin/blob/master/amy-prompt.sh)

Set the colour of the bash prompt according to the current directory.
The colour is chosen based on a checksum of the filepath.
The algorithm usually results in a visually distinct colour for each path.
To use this script, put the following line in your shell configuration file
(e.g., .bashrc).
```
source amy-prompt.sh
```

## [amys-launcher](https://github.com/mhwombat/bin/blob/master/amys-launcher)

Themed launcher

## [amy-status](https://github.com/mhwombat/bin/blob/master/amy-status)

Experiment with yambar. Not currently in use.

## [check-permissions](https://github.com/mhwombat/bin/blob/master/check-permissions)

Debug file permisions

## [clean-bib](https://github.com/mhwombat/bin/blob/master/clean-bib)

Clean all ".bib" files in the current directory,
previewing each change before it is made.

## [clear-nixos-locks](https://github.com/mhwombat/bin/blob/master/clear-nixos-locks)

You shouldn't need this. I once thought I needed it, but I didn't.

## [copyWithRef](https://github.com/mhwombat/bin/blob/master/copyWithRef)

Copies text with some info about where it came from.

## [count-files](https://github.com/mhwombat/bin/blob/master/count-files)

`count-files [PATH]..` reports the number of files in each PATH, including
any hidden files and subdirectories. 
The directories themselves are also counted.

Tip: Because of the way glob patterns work, `count-files *` will ignore any
hidden files in the current directory. One workaround is 
`count-files .??* *`

## [doi2bib](https://github.com/mhwombat/bin/blob/master/doi2bib)

Fetch the BibTeX information for a DOI.

Example:

   doi2bib 10.1162/artl_a_00074

Requirements: curl

## [duplicated-haskell-code](https://github.com/mhwombat/bin/blob/master/duplicated-haskell-code)

A script to find common code between all pairs of Haskell files in the current directory.

## [dw](https://github.com/mhwombat/bin/blob/master/dw)

Sets up, verifies, and maintains links for dotfiles.
For each file listed in ${CONFIG_FILE}, this script will:

1. If the file does not exist, link it to the corresponding file in ${DOTFILE_DIR}.
2. If the file exists and is not a link, move it to ${DOTFILE_DIR}
   and replace it with a symbolic link.
3. If the file exists and is a link, make sure it's linked to the corresponding file
   in ${DOTFILE_DIR}.

This script is idempotent, so you can use it to
set up links for the first time on a new machine,
put additional files under dotfile management (add them to ${CONFIG_FILE} first),
or simply verify that existing links are correct.

## [fix-copyright.sh](https://github.com/mhwombat/bin/blob/master/fix-copyright.sh)

Update the copyright date for all Haskell files in and under the current directory.
You will see a preview of all changes before they are made.

## [fixit.sh](https://github.com/mhwombat/bin/blob/master/fixit.sh)

A template for making a change to a group of files,
previewing each change before it is made.

## [format-zpl](https://github.com/mhwombat/bin/blob/master/format-zpl)

Format text for printing to a label printer using ZPL.

## [gen-base16-scheme.py](https://github.com/mhwombat/bin/blob/master/gen-base16-scheme.py)

Generate a colour scheme using the "base16" architecture
(see http://www.chriskempson.com/projects/base16/).

Examples:

    gen-base16-scheme.py ff00ff
    gen-base16-scheme.py D3E067

Note that the colour you supply may be slightly adjusted by rounding.

## [git-summary](https://github.com/mhwombat/bin/blob/master/git-summary)

git-summary - summarize git repos at some path

Ex: `git-summary ~`

Forked from https://github.com/lordadamson/git-summary.
Freely distributed under the MIT license. 2018@MirkoLedda

## [graphviz.py](https://github.com/mhwombat/bin/blob/master/graphviz.py)

Pandoc filter to process code blocks with class "graphviz" into
graphviz-generated images.
Needs pygraphviz.

## [grimify](https://github.com/mhwombat/bin/blob/master/grimify)


## [haskell-same](https://github.com/mhwombat/bin/blob/master/haskell-same)

A quick script to find common code between two Haskell files.

Usage:

  haskell-same FILE1 FILE2

## [haskell-sanity](https://github.com/mhwombat/bin/blob/master/haskell-sanity)

Check various things for Haskell development.

## [head-tail](https://github.com/mhwombat/bin/blob/master/head-tail)

`head-tail n k` returns the first n rows and the last k rows.
Useful, for example, when you want the header of a file plus the ending.

## [htmlify](https://github.com/mhwombat/bin/blob/master/htmlify)

Replaces all line endings with HTML break tags.

## [key-help](https://github.com/mhwombat/bin/blob/master/key-help)

Display my current key bindings

## [keyhelp](https://github.com/mhwombat/bin/blob/master/keyhelp)

Display my current key bindings

## [logic2tex](https://github.com/mhwombat/bin/blob/master/logic2tex)

Convert a logic sentence using unicode characters to Tex (LaTeX)

## [ls-theme-demo](https://github.com/mhwombat/bin/blob/master/ls-theme-demo)

Demo of the colour scheme currently used by ls.
You might use this, for example, if you want to test different themes.

## [make-readme](https://github.com/mhwombat/bin/blob/master/make-readme)

Creates this file (README.md).

## [nix-init-haskell](https://github.com/mhwombat/bin/blob/master/nix-init-haskell)

Set up a directory for Nix+Hskell development.

## [pdf2doi](https://github.com/mhwombat/bin/blob/master/pdf2doi)

Extract the DOI from a PDF.

Usage:

   pdf2doi [filename]

If no filename is specified, read from stdin.

Requirements: pdfinfo (install poppler_utils), pdftotext (install xpdf or python's pdftotext).

## [pdf2isbn](https://github.com/mhwombat/bin/blob/master/pdf2isbn)

Extract the ISBN from a PDF.

Usage:

   pdf2doi [filename]

If no filename is specified, read from stdin.

Requirements: pdfinfo (install poppler_utils), pdftotext (install xpdf or python's pdftotext).

## [preview-themes](https://github.com/mhwombat/bin/blob/master/preview-themes)

Generate previews of all defined colour schemes.

## [rename-pdf](https://github.com/mhwombat/bin/blob/master/rename-pdf)

Renames a PDF file according to author and title.

## [same](https://github.com/mhwombat/bin/blob/master/same)

A quick script to find common sections between two files.

Usage:

  same [OPTION] FILE1 FILE2

Most options that work with "diff" should also work with "same"

## [set-theme](https://github.com/mhwombat/bin/blob/master/set-theme)

Change colour scheme for supported apps.

## [snippy](https://github.com/mhwombat/bin/blob/master/snippy)

Select snippets of text (including code) and paste them wherever.

## [sway-tree-switcher](https://github.com/mhwombat/bin/blob/master/sway-tree-switcher)

Opens an FZF window containing all windows across all environments.
Focuses the window (switching workpace if required) on selection.

## [sync-transform.sh](https://github.com/mhwombat/bin/blob/master/sync-transform.sh)

A template for a script that synchronises two directories,
except that instead of copying files it performs some sort
of transformation.

## [tex2png.py](https://github.com/mhwombat/bin/blob/master/tex2png.py)

Pandoc filter to convert code blocks with class "tex2png" into
images.
Requires tex2png.sh.

## [tex2png.sh](https://github.com/mhwombat/bin/blob/master/tex2png.sh)

Converts a (La)Tex document to PNG.
You might use this, for example, if you want to display a short LaTeX document as an image within an HTML page.

Usage example:

```
   tex2png.sh sample.png < sample.tex
```

Your document should use the standalone document class
and set `convert=true`.
You may wish to override the default margins.
Here's a sample minimal LaTeX document that you can use as a starting point.

```
  \documentclass[convert=true,margin=4pt]{standalone}
  \begin{document}
  \huge
  Hello world!
  \end{document}
```


## [we](https://github.com/mhwombat/bin/blob/master/we)

A wrapper for my favourite editor.

## [whe](https://github.com/mhwombat/bin/blob/master/whe)

A quick script to load all of the Haskell source files
and configuration files in the current project
into emacs.

