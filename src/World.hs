{-# LANGUAGE TupleSections #-}
module World (
    initialWorld
  , screenHeight
  , screenWidth
  , cellHeight
  , cellWidth
  , size
  , vertexes
  , indexRange
  , World(..)
  , Board
  , Cell(..)
) where

import Data.Array
import System.Random (StdGen)

data Cell = Empty | Filled deriving (Eq, Show)

type Board = Array (Int, Int) Cell

data World = World {   
    worldBoard :: Board 
  , seed :: StdGen
  , pointP :: (Int, Int)
}

cellWidth :: Float
cellWidth = fromIntegral screenWidth / fromIntegral size

cellHeight :: Float
cellHeight = fromIntegral screenHeight / fromIntegral size

screenWidth :: Int
screenWidth = 640

screenHeight :: Int
screenHeight = 640

size :: Int
size = 501

a :: (Int, Int)
a = (size - 1, (size - 1) `div` 2)

b :: (Int, Int)
b = (0, 0)

c :: (Int, Int)
c = (0, size - 1)

vertexes :: [(Int, Int)]
vertexes = [a, b, c]


indexRange :: ((Int, Int), (Int, Int))
indexRange = ((0, 0), (size - 1, size - 1))

initialWorldBoard :: Array (Int, Int) Cell
initialWorldBoard = array indexRange (map (, Empty) (range indexRange)) // [(a, Filled), (b, Filled), (c, Filled)]


initialWorld :: StdGen -> World
initialWorld g = World { 
    worldBoard = initialWorldBoard
  , seed = g
  , pointP = ((size - 1) `div` 2, (size - 1) `div` 2)
}
    