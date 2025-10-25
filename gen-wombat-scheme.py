#!/usr/bin/env nix-shell
#!nix-shell -p python3 -i python3
#: Generate a colour scheme using the "wombat-themer" architecture
#: (see http://www.chriskempson.com/projects/base16/).
#:
#: Examples:
#:
#:     gen-wombat-scheme.py ff00ff
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

def prettyHLS(h, l, s):
    fmtStr = "HLS {} {} {}"
    return fmtStr.format(int(h*360), int(l*100), int(s*100))

def colourInfo(h, l, s):
    '''Given a colour, generate a dictionary entry for it with the information we want.
    The hIndex field will be used to assign colours to colour names.
    Since red can be either a very high or a very low hue value, we use the hIndex to
    effectively start at orange, rather than halfway between red.'''
    return { "hls": (h, l, s), "rgbHex": hls2rgbhex(h, l, s), "hlsStr": prettyHLS(h, l, s),
              "hIndex": (h + 15) % 1}

def generateTextColours(h, n):
    '''Generate n new colours based on the input hue, designed for foregrounds and backgrounds.
    The generated colours will all have the given hue, but will be less saturated,
    and the luminosities will be evenly distributed around the colour wheel.'''
    delta=1/(n-1) # include endpoint
    s = 0.05
    return [(h,i*delta,s) for i in range(n)]

def complement(h):
    '''Return the complementary hue for the input hue.'''
    return ((h + 0.5) % 1)

def generateAccentColours(h, l, s, n):
   '''Generate a list of n colours to use as accents.
   The colours within each half of the list are maximally visually distinct from each other.
   The first element will be the input colour.
   Normally you would use colours from the first half, falling back on the second half
   only when more colours are needed.'''
   cs = varyHues(h, l, s, n)
   # Put every other colour in a different set.
   cs1 = [ cs[i] for i in range(0,n, 2)]
   cs2 = [ cs[i] for i in range(1,n, 2)]
   return cs1 + cs2

def varyHues(h, l, s, n):
    '''Generate n colours, including the input colour.
    The colours will all have the same lightness and saturation, but the hues will be evenly
    distributed around the colour wheel.'''
    delta = 1/n # don't include endpoint; we want to wrap around circle.
    return [((h + i*delta) % 1, l, s) for i in range(n)]

def printYAMLEntry(key, colour):
    if (key != ""):
        rgbHex = colour["rgbHex"]
        hlsStr = colour["hlsStr"]
        print(f"{key}: {rgbHex} # {hlsStr}")

def printYAML(keys, colours):
    for i, colour in enumerate(colours):
        printYAMLEntry(keys[i], colour)

def colourTest(rgbHex):
    (r, g, b) = hex2rgb(rgbHex)
    h, l, s = colorsys.rgb_to_hls(r/255, g/255, b/255)
    print ("RGB", rgbHex, prettyHLS(h, l, s))

numTextColours = 10
numAccentColours = 12 # should be a multiple of two

mainColour = sys.argv[1]
# print("DEBUG mainColour=", mainColour)

themeName = sys.argv[2]
print("system: wombat")
print("name:", themeName)
print("author: Amy de Buitléir")

(r, g, b) = hex2rgb(mainColour)
h, l, s = colorsys.rgb_to_hls(r/255, g/255, b/255)
# print (f"DEBUG original hls is ({h}, {l}, {s})")

textColoursHLS = generateTextColours(complement(h), numTextColours)
textColours = [ colourInfo(h, l, s) for (h, l, s) in textColoursHLS ]
# print("DEBUG: textHLS=", textHLS)

textKeys = [ "greyscale." + str(i) for i in range(numTextColours) ]
printYAML(textKeys, textColours)

printYAMLEntry("hue.black", textColours[0])  # used for by terminal for "black"
printYAMLEntry("hue.white", textColours[-1]) # used for by terminal for "white"

accentColoursHLS = generateAccentColours(h, l, s, numAccentColours)
accentColours = [ colourInfo(h, l, s) for (h, l, s) in accentColoursHLS ]
# print("DEBUG accentColours=", accentColours)

accentColourshIndexOrder = sorted(accentColours, key=lambda d: d["hIndex"])
# print("DEBUG accentColourshIndexOrder=", accentColourshIndexOrder)

terminalColourKeys = [
      "hue.orange",         # h ~ 30
      "hue.yellow",         # h ~ 60
      "",                   # h ~ 90
      "hue.green",          # h ~ 120
      "",                   # h ~ 150
      "hue.cyan",           # h ~ 180
      "",                   # h ~ 210
      "hue.blue",           # h ~ 240
      "",                   # h ~ 270
      "hue.magenta",        # h ~ 300
      "",                   # h ~ 330
      "hue.red",            # h ~ 0 or 360
    ]

printYAML(terminalColourKeys, accentColourshIndexOrder)

preferenceKeys = [ "preference." + str(i) for i in range(numAccentColours) ]
printYAML(preferenceKeys, accentColours)
