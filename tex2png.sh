#!/usr/bin/env bash
#: Converts a (La)Tex document to PNG.
#: You might use this, for example, if you want to display a short LaTex document as an image within an HTML page.
OUTFILE=$1
TMPDIR=$(mktemp -d "tex2png_XXXXX")

# echo "OUTFILE=${OUTFILE}"
# echo "TMPDIR=${TMPDIR}"

cd ${TMPDIR}
cat > aaa.tex
pdflatex -interaction=nonstopmode aaa >aaa.out 2>aaa.err
convert -quiet aaa.pdf ${OUTFILE}
cd ..
rm -rf ${TMPDIR}
