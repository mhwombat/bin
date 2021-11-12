#!/usr/bin/env python3
#: Generate a colour scheme using the "base16" architecture
#: (see http://www.chriskempson.com/projects/base16/).
#:
#: Examples:
#:
#:     gen-base16-scheme.py ff00ff
#:     gen-base16-scheme.py D3E067
#:
#: Note that the colour you supply may be slightly adjusted by rounding.

import sys
import colorsys

def rgb2hex(r, g, b):
    '''Example: rgb2hex(128, 54, 78)'''
    return f"{r:02x}{g:02x}{b:02x}"

def hex2rgb(s):
    '''Example: hex2rgb('80364e')'''
    return (int(s[0:2],16),int(s[2:4],16),int(s[4:6],16))

def hls2rgbhex(h, l, s):
    (r, g, b) = colorsys.hls_to_rgb(h, l, s)
    return rgb2hex(int(r*255), int(g*255), int(b*255))

def generateLowerColours(h, l):
    '''Generate 8 new colours based on the starting colour, designed for foregrounds and backgrounds.
    The generated colours will all have the same hue as the original colour, but will be less saturated,
    and the luminosities will be evenly distributed around the colour wheel.'''
    ls = [4, 14, 26, 34, 68, 96, 98, 99]
    s = 15/100
    return [(h, l/100, s) for l in ls]

def generateUpperColours(h, l, s):
    '''Generate 8 colours, including the one we started with.
    The colours will all have the same luminosity and saturation, but the hues will be evenly
    distributed around the colour wheel.'''
    hs = generateHues(h)
    return [(h, l, s) for h in hs]

def generateHues(h):
    '''Generate 8 hues, including the one we started with.
    The hues will be evenly distributed around the colour wheel (i.e. across the interval [0,1]).'''
    return [ (h + i/8) % 1 for i in range(8) ]

mainColour = sys.argv[1]
(r, g, b) = hex2rgb(mainColour)

h, l, s = colorsys.rgb_to_hls(r/255, g/255, b/255)
# print ("DEBUG original hls=", int(h*255), int(l*100), int(s*100))

hlss = generateLowerColours(h, l) + generateUpperColours(h, l, s)

# for (h, l, s) in hlss:
#     print ("DEBUG hls=", int(h*255), int(l*100), int(s*100), "rgb=", hls2rgbhex(h, l, s))

colours = [ hls2rgbhex(h, l, s) for (h, l, s) in hlss ]

colours[8] = mainColour # Rounding may have adjusted this, so restore original.
# print("DEBUG: ", colours)

desiredOrder = [0, 1, 2, 3, 4, 5, 6, 7, 12, 15, 8, 10, 13, 9, 11, 14]
labels = [ "base" + "{:02X}".format(i) for i in range(16) ]

reorderedColours = [ colours[desiredOrder[i]] for i in range(16) ]

print("{")

for (label, colour) in zip(labels, reorderedColours):
    print(f'    "{label}": "{colour}",')

print("}")
