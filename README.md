# bin

A collection of useful scripts.
Each script is summarised below.

## amy-bib
Copy BibTeX information and put it into my citation management system.
I keep each BibTeX in a separate file.
The name of the file is the BibTeX key.

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

## fhs
Find all Haskell source files in the current Stack project.

## fix-copyright.sh
Update the copyright date for all Haskell files in and under the current directory.
You will see a preview of all changes before they are made.

## fixit.sh
A template for making a change to a group of files,
previewing each change before it is made.

## git-summary
git-summary - summarize git repos at some path

Ex: `git-summary ~`

Forked from https://github.com/lordadamson/git-summary.
Freely distributed under the MIT license. 2018@MirkoLedda

## graphviz.py
Pandoc filter to process code blocks with class "graphviz" into
graphviz-generated images.
Needs pygraphviz.

## head-tail
`head-tail n k` returns the first n rows and the last k rows.
Useful, for example, when you want the header of a file plus the ending.

## htmlify
Replaces all line endings with HTML break tags.

## logic2tex
Convert a logic sentence using unicode characters to Tex (LaTeX)

## make-bib
Read all BibTeX entries from my citation management system,
creating a single BibTex file.

## make-readme
Creates this file (README.md).

## searchHaskell
Search Haskell files for a string.

## snippy
Select snippets of text (including code) and paste them wherever.

## tex2png.py
Pandoc filter to convert code blocks with class "tex2png" into
images.
Requires tex2png.sh.

## tex2png.sh
Converts a (La)Tex document to PNG.
You might use this, for example, if you want to display a short LaTex document as an image within an HTML page.

## whe
A quick script to load all of the Haskell source files
and configuration files in the current project
into emacs.

