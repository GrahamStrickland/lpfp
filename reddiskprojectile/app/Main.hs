{-# OPTIONS -Wall #-}

import Graphics.Gloss

displayMode :: Display
displayMode = InWindow "My Window" (1000, 700) (10, 10)

disk :: Float -> Picture
disk radius = ThickCircle (radius / 2) radius

redDisk :: Picture
redDisk = Color red (disk 25)

projectileMotion :: Float -> Picture
projectileMotion t = Translate (10 * xDisk t) (10 * yDisk t) redDisk

xDisk :: Float -> Float
xDisk t = 10 * t

yDisk :: Float -> Float
yDisk t = 20 * t - 4.9 * t**2

main :: IO ()
main = animate displayMode black projectileMotion

