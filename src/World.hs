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
import System.Random

data Cell = VertexChoiceA | VertexChoiceB | VertexChoiceC | ChoosedPoint | Empty deriving (Eq, Show, Enum)

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

initialWorldBoard :: (Int, Int) -> Array (Int, Int) Cell
initialWorldBoard p = array indexRange (map (, Empty) (range indexRange)) // [
                                                                                  (p, ChoosedPoint)
                                                                                , (a, VertexChoiceA)
                                                                                , (b, VertexChoiceB)
                                                                                , (c, VertexChoiceC)
                                                                              ]


initialWorld :: StdGen -> World
initialWorld g = World { 
    worldBoard = initialWorldBoard p
  , pointP = p
  , seed = nextGen2
} 
  where
    (px, nextGen1) = randomR (0, size - 1) g
    (py, nextGen2) = randomR (0, size - 1) nextGen1
    p = (px, py)

    