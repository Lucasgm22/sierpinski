module Main (main) where

import Graphics.Gloss

import World
import Logic
import Rendering
import Animation
import System.Random (newStdGen)

window :: Display
window = InWindow "Sierpinski Triangle" (screenWidth, screenHeight) (100, 100)

backgroundColor :: Color
backgroundColor = makeColor 0 0 0 255

fps :: Int
fps = 120


main :: IO ()
main = do
    g <- newStdGen
    play window backgroundColor fps (initialWorld g) worldAsPicture transformWorld animateWorld