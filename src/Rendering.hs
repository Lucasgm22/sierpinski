module Rendering (
    worldAsPicture
) where

import Graphics.Gloss
import World
import Data.Array

filledCell :: Picture
filledCell = rectangleSolid cellWidth cellHeight

snapPictureToCell :: (Integral a, Integral b) => Picture -> (a, b) -> Picture
snapPictureToCell picture (row, column) = translate x y picture
  where x = fromIntegral column * cellWidth + cellWidth * 0.5
        y = fromIntegral row * cellHeight + cellHeight * 0.5

cellsOfBoard :: Board -> Cell -> Picture -> Picture
cellsOfBoard board cell cellPicture =
    pictures
    $ map (snapPictureToCell cellPicture . fst)
    $ filter (\(_, e) -> e == cell)
    $ assocs board

vertexChoiceACellsOfBoard :: Board -> Picture
vertexChoiceACellsOfBoard board = color red $ cellsOfBoard board VertexChoiceA filledCell


vertexChoiceBCellsOfBoard :: Board -> Picture
vertexChoiceBCellsOfBoard board = color green $ cellsOfBoard board VertexChoiceB filledCell


vertexChoiceCellsOfBoard :: Board -> Picture
vertexChoiceCellsOfBoard board =  color blue $ cellsOfBoard board VertexChoiceC filledCell

choosedPointCellOfBoard :: Board -> Picture
choosedPointCellOfBoard board = color white $ cellsOfBoard board ChoosedPoint filledCell

pictureFilledCellOfBoard :: Board -> Picture
pictureFilledCellOfBoard board = pictures [  
                                              vertexChoiceACellsOfBoard board
                                            , vertexChoiceBCellsOfBoard board
                                            , vertexChoiceCellsOfBoard board
                                            , choosedPointCellOfBoard board
                                          ]

worldAsPicture :: World -> Picture
worldAsPicture world = translate (fromIntegral screenWidth * (-0.5))
                                 (fromIntegral screenWidth * (-0.5))
                                 frame
    where frame = pictureFilledCellOfBoard (worldBoard world)