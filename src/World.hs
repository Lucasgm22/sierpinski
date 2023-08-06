{-# LANGUAGE TupleSections #-}
module World (
    initialWorld
  , screenHeight
  , screenWidth
  , size
) where

import Data.Array

data Cell = Empty | Filled

type Board = Array (Int, Int) Cell

newtype World = World { worldBoard :: Board }

screenWidth :: Int
screenWidth = 640

screenHeight :: Int
screenHeight = 480

size :: Int
size = 100

initialWorld :: World
initialWorld = World { worldBoard = array indexRange $ map (, Empty) (range indexRange)}
  where
    indexRange = ((0, 0), (size - 1, size - 1))