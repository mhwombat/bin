# bin

Useful scripts.

# amy-bib
Copy BibTeX information and put it into my citation management system.
I keep each BibTeX in a separate file.
The name of the file is the BibTeX key.

# amy-prompt.sh
Set the colour of the bash prompt according to the current directory.

# copyWithRef

# dw
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

# fhs
Find all Haskell source files in the current Stack project.

# firefox
Simple wrapper to invoke Firefox.

# fix-copyright.sh
Update the copyright date for all Haskell files in the current Stack project.
You will see a preview of all changes before they are made.

# fixit.sh
A template for making a change to a group of files,
previewing each change before it is made.

# head-tail

# htmlify
Replaces all line endings with HTML <br/> tags.

# jot

# make-bib
Read all BibTeX entries from my citation management system,
creating a single BibTex file.

# make-readme
Creates this file (README.md).
  grep '#: ' $file | sed 's/^#: //'

# searchHaskell
Search Haskell files for a string.

# snippy
Select snippets of text (including code) and paste them wherever.

# whe
A quick script to load all of the Haskell source files
and configuration files in the current Stack project
into emacs.

