# bin

A collection of useful scripts.
Each script is summarised below.

Tip: Some of my scripts use "nix-shell shebangs".
You won't need that if you're not using Nix (or you install the pre-requisite packages globally).
So if the script begins with

    #!/usr/bin/env nix-shell
    #! nix-shell -i bash -p blah blah blah

You can replace that with

    #!/usr/bin/sh

## adoc2md ([script](https://github.com/mhwombat/bin/blob/master/adoc2md))

Convert asciidoc syntax to markdown syntax

To convert a file from asciidoc to markdown, we can use asciidoctor to generate docbook syntax,
and then use pandoc to convert the docbook to markdown.
However, that would produce one big markdown file, and the relative paths to images would be incorrect.
Instead, we want to convert each individual asciidoc file to markdown.

If we run asciidoctor in secure mode, it won't process include directives.
Instead, it will convert them to links.
We can then convert those links to include directives (supported by my pandoc-include-plus filter).
There's one catch: the "leveloffset" in the include directives are lost.
To work around this problem, we append the level offset, if any, to the filename, with "@@@" in-between.

Putting it all together, the steps are:
1. Modify the asciidoc to protect the level offset (by appending it to the name of the include file).
2. Use asciidoctor to generate docbook xml.
3. Use pandoc to convert the docbook xml to markdown.
4. Convert any links which originally were asciidoc include directives into markdown include directives.

## all-history ([script](https://github.com/mhwombat/bin/blob/master/all-history))

Display bash history for all sessions.
I keep a separate history file for each bash session.

## amy-bib ([script](https://github.com/mhwombat/bin/blob/master/amy-bib))

Read BibTeX information from paste buffer and put it into my citation management system.
I keep each BibTeX in a separate file.
The name of the file is the BibTeX key.

## amy-bib-gen ([script](https://github.com/mhwombat/bin/blob/master/amy-bib-gen))

Read all BibTeX entries from my citation management system,
creating a single BibTex file.

## amy-prompt.hs ([script](https://github.com/mhwombat/bin/blob/master/amy-prompt.hs))

A work in progress; not currently in use.

## amy-prompt.sh ([script](https://github.com/mhwombat/bin/blob/master/amy-prompt.sh))

Set the colour of the bash prompt according to the current directory.
The colour is chosen based on a checksum of the filepath.
The algorithm usually results in a visually distinct colour for each path.
To use this script, put the following line in your shell configuration file
(e.g., .bashrc).
```
source amy-prompt.sh
```

## amys-launcher ([script](https://github.com/mhwombat/bin/blob/master/amys-launcher))

Themed launcher

## amy-status ([script](https://github.com/mhwombat/bin/blob/master/amy-status))

Experiment with yambar. Not currently in use.

## check-permissions ([script](https://github.com/mhwombat/bin/blob/master/check-permissions))

Debug file permisions

## clean-bib ([script](https://github.com/mhwombat/bin/blob/master/clean-bib))

Clean all ".bib" files in the current directory,
previewing each change before it is made.

## clear-nixos-locks ([script](https://github.com/mhwombat/bin/blob/master/clear-nixos-locks))

You shouldn't need this. I once thought I needed it, but I didn't.

## copyWithRef ([script](https://github.com/mhwombat/bin/blob/master/copyWithRef))

Copies text with some info about where it came from.

## count-files ([script](https://github.com/mhwombat/bin/blob/master/count-files))

`count-files [PATH]..` reports the number of files in each PATH, including
any hidden files and subdirectories. 
The directories themselves are also counted.

Tip: Because of the way glob patterns work, `count-files *` will ignore any
hidden files in the current directory. One workaround is 
`count-files .??* *`

## doi2bib ([script](https://github.com/mhwombat/bin/blob/master/doi2bib))

Fetch the BibTeX information for a DOI.

Example:

   doi2bib 10.1162/artl_a_00074

Requirements: curl

## duplicated-haskell-code ([script](https://github.com/mhwombat/bin/blob/master/duplicated-haskell-code))

A script to find common code between all pairs of Haskell files in the current directory.

## dw ([script](https://github.com/mhwombat/bin/blob/master/dw))

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

## fix-copyright.sh ([script](https://github.com/mhwombat/bin/blob/master/fix-copyright.sh))

Update the copyright date for all Haskell files in and under the current directory.
You will see a preview of all changes before they are made.

## fixit.sh ([script](https://github.com/mhwombat/bin/blob/master/fixit.sh))

A template for making a change to a group of files,
previewing each change before it is made.

## format-zpl ([script](https://github.com/mhwombat/bin/blob/master/format-zpl))

Format text for printing to a label printer using ZPL.

## gen-base16-scheme.py ([script](https://github.com/mhwombat/bin/blob/master/gen-base16-scheme.py))

Generate a colour scheme using the "base16" architecture
(see http://www.chriskempson.com/projects/base16/).

Examples:

    gen-base16-scheme.py ff00ff
    gen-base16-scheme.py D3E067

Note that the colour you supply may be slightly adjusted by rounding.

## git-summary ([script](https://github.com/mhwombat/bin/blob/master/git-summary))

git-summary - summarize git repos at some path

Ex: `git-summary ~`

Forked from https://github.com/lordadamson/git-summary.
Freely distributed under the MIT license. 2018@MirkoLedda

## graphviz.py ([script](https://github.com/mhwombat/bin/blob/master/graphviz.py))

Pandoc filter to process code blocks with class "graphviz" into
graphviz-generated images.
Needs pygraphviz.

## grimify ([script](https://github.com/mhwombat/bin/blob/master/grimify))


## haskell-same ([script](https://github.com/mhwombat/bin/blob/master/haskell-same))

A quick script to find common code between two Haskell files.

Usage:

  haskell-same FILE1 FILE2

## haskell-sanity ([script](https://github.com/mhwombat/bin/blob/master/haskell-sanity))

Check various things for Haskell development.

## head-tail ([script](https://github.com/mhwombat/bin/blob/master/head-tail))

`head-tail n k` returns the first n rows and the last k rows.
Useful, for example, when you want the header of a file plus the ending.

## htmlify ([script](https://github.com/mhwombat/bin/blob/master/htmlify))

Replaces all line endings with HTML break tags.

## key-help ([script](https://github.com/mhwombat/bin/blob/master/key-help))

Display my current key bindings

## keyhelp ([script](https://github.com/mhwombat/bin/blob/master/keyhelp))

Display my current key bindings

## logic2tex ([script](https://github.com/mhwombat/bin/blob/master/logic2tex))

Convert a logic sentence using unicode characters to Tex (LaTeX)

## ls-theme-demo ([script](https://github.com/mhwombat/bin/blob/master/ls-theme-demo))

Demo of the colour scheme currently used by ls.
You might use this, for example, if you want to test different themes.

## make-readme ([script](https://github.com/mhwombat/bin/blob/master/make-readme))

Creates this file (README.md).

## nix-init-haskell ([script](https://github.com/mhwombat/bin/blob/master/nix-init-haskell))

Set up a directory for Nix+Hskell development.

## pdf2doi ([script](https://github.com/mhwombat/bin/blob/master/pdf2doi))

Extract the DOI from a PDF.

Usage:

   pdf2doi [filename]

If no filename is specified, read from stdin.

Requirements: pdfinfo (install poppler_utils), pdftotext (install xpdf or python's pdftotext).

## pdf2isbn ([script](https://github.com/mhwombat/bin/blob/master/pdf2isbn))

Extract the ISBN from a PDF.

Usage:

   pdf2doi [filename]

If no filename is specified, read from stdin.

Requirements: pdfinfo (install poppler_utils), pdftotext (install xpdf or python's pdftotext).

## preview-themes ([script](https://github.com/mhwombat/bin/blob/master/preview-themes))

Generate previews of all defined colour schemes.

## rename-pdf ([script](https://github.com/mhwombat/bin/blob/master/rename-pdf))

Renames a PDF file according to author and title.

## run-code-inline ([script](https://github.com/mhwombat/bin/blob/master/run-code-inline))

Reads text (e.g., Markdown or Asciidoc) from stdin,
echos it to stdout,
simultaneously running any commands
and inserting the output immediately after the command.
This is useful for writing tutorials and other documentation for software.
Any line that begins with '$' is assumed to be a command.
The commands can launch subshells, subsubshells, and so on...
the result should be the same as if you typed the commands at
a terminal.

For example, the following input

    ~~~
    $ nix run "git+https://codeberg.org/mhwombat/hello-flake"
    ~~~

would result in

    ~~~
    $ nix run "git+https://codeberg.org/mhwombat/hello-flake"
    Hello from your flake!
    ~~~

If you want to run a command without echoing it to the output,
preceed it with '$#' instead of '$'.
If the command generates messages that you don't want to include
in the output, redirect stdin (and perhaps stderr) to `\dev/null`.

By default, bash is used to process commands.
If you want to use a different shell,
make that change in your first command.

One way to invoke this script is

    run-code-inline < INFILE > OUTFILE 2>&1

However, you may have intentionally included commands that fail,
perhaps to discuss the error messages.
In that case, you probably want the error messages to go to stdout
rather than `stderr`, as shown in te example below.

    run-code-inline < INFILE > OUTFILE 2>&1

Known issue: The `exit` command will terminate the entire script.
This is a problem if, for example, you want to launch a subshell,
perform some actions, and then exit to the main shell.

## same ([script](https://github.com/mhwombat/bin/blob/master/same))

A quick script to find common sections between two files.

Usage:

  same [OPTION] FILE1 FILE2

Most options that work with "diff" should also work with "same"

## set-theme ([script](https://github.com/mhwombat/bin/blob/master/set-theme))

Change colour scheme for supported apps.

## snippy ([script](https://github.com/mhwombat/bin/blob/master/snippy))

Select snippets of text (including code) and paste them wherever.

## sway-tree-switcher ([script](https://github.com/mhwombat/bin/blob/master/sway-tree-switcher))

Opens an FZF window containing all windows across all environments.
Focuses the window (switching workpace if required) on selection.

## sync-transform.sh ([script](https://github.com/mhwombat/bin/blob/master/sync-transform.sh))

A template for a script that synchronises two directories,
except that instead of copying files it performs some sort
of transformation.

## tex2png.py ([script](https://github.com/mhwombat/bin/blob/master/tex2png.py))

Pandoc filter to convert code blocks with class "tex2png" into
images.
Requires tex2png.sh.

## tex2png.sh ([script](https://github.com/mhwombat/bin/blob/master/tex2png.sh))

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


## we ([script](https://github.com/mhwombat/bin/blob/master/we))

A wrapper for my favourite editor.

## whe ([script](https://github.com/mhwombat/bin/blob/master/whe))

A quick script to load all of the Haskell source files
and configuration files in the current project
into emacs.

