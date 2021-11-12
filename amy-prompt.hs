#! /usr/bin/env nix-shell
#! nix-shell -p "haskellPackages.ghcWithPackages (p: [])"
#! nix-shell -i runghc
#: A work in progress; not currently in use.

import           Data.Char             (ord)
import           Data.List             (foldl')
import           System.Directory      (getCurrentDirectory)
import           System.FilePath.Posix
import           Text.Printf           (printf)

main :: IO ()
main = do
  p <- getCurrentDirectory
  let (r, g, b) = mapDirToColour 127 p
  printf "#%02x%02x%02x" r g b

-- TODO: convert the digits to hex like this
-- printf "%.6X" number
-- Then change the background colour like this (sh/bash code):0.
-- printf

-- We want to convert the path into three numbers, representing the
-- red, blue, and green components of the colour.
-- In general, each colour component can be between 0 and 255 (0xFF).
-- However, we want a dark background colour, so we'll restrict each
-- component to be between @0@ and @n@.
-- We can reframe the problem as generating a 3-digit number in base
-- @n+1@.
-- We'll sum the character values, but to restrict the result to three
-- digits, we'll calculate the sum mod (n+1)^3.
mapDirToColour :: Int -> String -> (Int, Int, Int)
mapDirToColour n s = (r, g, b)
  where base = n+1
        checksum = foldl' sumAndRollover 0 . map ord $ s
        sumAndRollover accum x = (accum + x) `mod` (base^3)
        (rg, b) = checksum `quotRem` base
        (r, g) = rg `quotRem` base


-- nix-shell -p "haskellPackages.ghcWithPackages (p: [p.pandoc])" --run ghci
-- s <- readFile "temp"
-- s <- fmap (head . lines ) $ readFile "temp"
-- printf '\x1b]11;#000000\x1b\\'
-- printf '\x1b]11;#ff0000\x1b\\'
