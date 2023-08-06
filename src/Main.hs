module Main (main) where

import Graphics.Gloss

import World
import Logic
import Rendering
import Animation

window :: Display
window = InWindow "Name of the Window" (screenWidth, screenHeight) (100, 100)

backgroundColor :: Color
backgroundColor = makeColor 0 0 0 255

main :: IO ()
main = play window backgroundColor 30 initialWorld worldAsPicture transformWorld animation