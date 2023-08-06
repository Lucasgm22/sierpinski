module Logic ( 
    transformWorld
) where


import World
import Graphics.Gloss.Interface.Pure.Game

transformWorld :: Event -> World -> World
transformWorld (EventKey (SpecialKey KeyF5) Down _ _) world = initialWorld (seed world)
transformWorld _ world = world 
