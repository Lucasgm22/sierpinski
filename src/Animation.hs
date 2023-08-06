module Animation (
    animateWorld
) where
import World
import Data.Array
import System.Random
import Data.Bifunctor
import Control.Composition

animateWorld:: Float -> World -> World
animateWorld _ world = World {
    worldBoard = board // [(nextP, vertexRand)]
  , seed = nextSeed
  , pointP = nextP
}
  where
    (i, nextSeed) = randomR (0, 2) (seed world)
    nextP = middlePoint (vertexes !! i) (pointP world)
    vertexRand = toEnum i
    board = worldBoard world

middlePoint :: (Int, Int) -> (Int, Int) -> (Int, Int)
middlePoint a b = (`div` 2) +> bimap (fst a +) (snd a +) b
