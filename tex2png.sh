#!/usr/bin/env bash
#: Converts a (La)Tex document to PNG.
#: You might use this, for example, if you want to display a short LaTeX document as an image within an HTML page.
#:
#: Usage example:
#: 
#: ```
#:    tex2png.sh sample.png < sample.tex
#: ```
#: 
#: Your document should use the standalone document class
#: and set `convert=true`.
#: You may wish to override the default margins.
#: Here's a sample minimal LaTeX document that you can use as a starting point.
#: 
#: ```
#:   \documentclass[convert=true,margin=4pt]{standalone}
#:   \begin{document}
#:   \huge
#:   Hello world!
#:   \end{document}
#: ```
#: 
OUTFILE=$(readlink -f $1)
TMPDIR=$(mktemp -d "tex2png_XXXXX")

# echo "OUTFILE=${OUTFILE}"
# echo "TMPDIR=${TMPDIR}"

cd ${TMPDIR}
cat > aaa.tex
#latex -interaction=nonstopmode -shell-escape aaa >aaa.out
#cp aaa.png ${OUTFILE}
pdflatex -interaction=nonstopmode aaa >aaa.out 2>aaa.err
convert -quiet aaa.pdf ${OUTFILE}
cd ..
rm -rf ${TMPDIR}
