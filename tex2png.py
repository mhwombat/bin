#!/usr/bin/env python3

"""
Pandoc filter to convert code blocks with class "tex2png" into
images.
"""

import os
import sys
import subprocess
# from subprocess import Popen, PIPE, STDOUT
from pandocfilters import toJSONFilter, Para, Image, get_filename4code, get_caption, get_extension, get_value

def tex2png(key, value, format, _):
    if key == 'CodeBlock':
        [[ident, classes, keyvals], code] = value
        if "tex2png" in classes:
            caption, typef, keyvals = get_caption(keyvals)
            filetype = get_extension(format, "png", html="png", latex="pdf")
            dest = get_filename4code("tex2png", code, filetype)
            abs_dest = os.path.abspath(os.path.expanduser(os.path.expandvars(dest)))

            if not os.path.isfile(dest):
                # sys.stderr.write('DEBUG code="' + code + '"\n')
                p = subprocess.run(["tex2png.sh", abs_dest],
                                   text=True,
                                   input=code)
                sys.stderr.write('Created image ' + dest + '\n')

            return Para([Image([ident, [], keyvals], caption, [dest, typef])])

if __name__ == "__main__":
    toJSONFilter(tex2png)
