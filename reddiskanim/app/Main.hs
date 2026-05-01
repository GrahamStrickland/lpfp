{-# OPTIONS -Wall #-}

import Graphics.Gloss

displayMode :: Display
displayMode = InWindow "My Window" (1000, 700) (10, 10)

disk :: Float -> Picture
disk radius = ThickCircle (radius / 2) radius

redDisk :: Picture
redDisk = Color red (disk 25)

ellipticalMotion :: Float -> Picture
ellipticalMotion t = Translate (300 * cos t) (200 * sin t) redDisk

main :: IO ()
main = animate displayMode black ellipticalMotion
