# bin

A collection of useful scripts.
Each script is summarised below.

## amy-bib
Read BibTeX information from paste buffer and put it into my citation management system.
I keep each BibTeX in a separate file.
The name of the file is the BibTeX key.

## amy-prompt.hs

## amy-prompt.sh
Set the colour of the bash prompt according to the current directory.
The colour is chosen based on a checksum of the filepath.
The algorithm usually results in a visually distinct colour for each path.
To use this script, put the following line in your shell configuration file
(e.g., .bashrc).
```
source amy-prompt.sh
```

## copyWithRef
Copies text with some info about where it came from.

## doi2bib
Fetch the BibTeX information for a DOI.
Example:
   doi2bib 10.1162/artl_a_00074
Requirements: curl

## duplicated-haskell-code
A script to find common code between all pairs of Haskell files in the current directory.

## dw
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

## fix-copyright.sh
Update the copyright date for all Haskell files in and under the current directory.
You will see a preview of all changes before they are made.

## fixit.sh
A template for making a change to a group of files,
previewing each change before it is made.

## format-zpl
Format text for printing to a label printer using ZPL.

## git-summary
git-summary - summarize git repos at some path

Ex: `git-summary ~`

Forked from https://github.com/lordadamson/git-summary.
Freely distributed under the MIT license. 2018@MirkoLedda

## graphviz.py
Pandoc filter to process code blocks with class "graphviz" into
graphviz-generated images.
Needs pygraphviz.

## haskell-same
A quick script to find common code between two Haskell files.

Usage:

  haskell-same FILE1 FILE2

## head-tail
`head-tail n k` returns the first n rows and the last k rows.
Useful, for example, when you want the header of a file plus the ending.

## htmlify
Replaces all line endings with HTML break tags.

## keyhelp
Display my current key bindings

## logic2tex
Convert a logic sentence using unicode characters to Tex (LaTeX)

## make-bib
Read all BibTeX entries from my citation management system,
creating a single BibTex file.

## make-readme
Creates this file (README.md).

## rename-pdf
Renames a PDF file according to author and title.

## same
A quick script to find common sections between two files.

Usage:

  same [OPTION] FILE1 FILE2

Most options that work with "diff" should also work with "same"

## snippy
Select snippets of text (including code) and paste them wherever.

## sync-transform.sh
A template for a script that synchronises two directories,
except that instead of copying files it performs some sort
of transformation.

## tex2png.py
Pandoc filter to convert code blocks with class "tex2png" into
images.
Requires tex2png.sh.

## tex2png.sh
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


## whe
A quick script to load all of the Haskell source files
and configuration files in the current project
into emacs.

