{-# OPTIONS -Wall #-}

import Graphics.Gloss

displayMode :: Display
displayMode = InWindow "My Window" (1000, 700) (10, 10)

disk :: Float -> Picture
disk radius = ThickCircle (radius / 2) radius

redDisk :: Picture
redDisk = Color red (disk 25)

simulationMotion :: Float -> Picture
simulationMotion t = Translate (xDisk t) (yDisk t) redDisk

xDisk :: Float -> Float
xDisk t = 10 * t

yDisk :: Float -> Float
yDisk t = (-5) * t

main :: IO ()
main = animate displayMode black simulationMotion
