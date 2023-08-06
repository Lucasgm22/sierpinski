{-# LANGUAGE TupleSections #-}
module World (
    initialWorld
  , screenHeight
  , screenWidth
  , cellHeight
  , cellWidth
  , size
  , World
  , worldBoard
  , Board
  , Cell(..)
) where

import Data.Array

data Cell = Empty | Filled deriving (Eq, Show)

type Board = Array (Int, Int) Cell 

newtype World = World { worldBoard :: Board }

cellWidth :: Float
cellWidth = fromIntegral screenWidth / fromIntegral size

cellHeight :: Float
cellHeight = fromIntegral screenHeight / fromIntegral size

screenWidth :: Int
screenWidth = 640

screenHeight :: Int
screenHeight = 640

size :: Int
size = 100

initialWorld :: World
initialWorld = World { worldBoard = (array indexRange $ map (, Empty) (range indexRange)) // [ ((0, 0), Filled), ((1, 1), Filled) ]
                     }
  where
    indexRange = ((0, 0), (size - 1, size - 1))