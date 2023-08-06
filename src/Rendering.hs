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

filledCellsOfBoard :: Board -> Picture
filledCellsOfBoard board = cellsOfBoard board Filled filledCell

pictureFilledCellOfBoard :: Board -> Picture
pictureFilledCellOfBoard board = color white (filledCellsOfBoard board)

worldAsPicture :: World -> Picture
worldAsPicture world = translate (fromIntegral screenWidth * (-0.5))
                                 (fromIntegral screenWidth * (-0.5))
                                 frame
    where frame = pictureFilledCellOfBoard (worldBoard world)