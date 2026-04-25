{-# OPTIONS -Wall #-}

module Main (main) where

import Graphics.Gloss

displayMode :: Display
displayMode = InWindow "Axes" (1000, 700) (10, 10)

disk :: Float -> Picture
disk radius = ThickCircle (radius / 2) radius

skyColor :: Color
skyColor = makeColorI 212 255 212 255

skyDarkColor :: Color
skyDarkColor = makeColorI 128 212 212 255

sunColor :: Color
sunColor = makeColorI 255 212 0 255

sunDarkColor :: Color
sunDarkColor = makeColorI 212 128 0 255

oceanLightColor :: Color
oceanLightColor = makeColorI 128 128 255 128

sky :: Picture
sky = Color skyColor $ rectangleSolid 1000 300

ocean :: Picture
ocean = Color oceanLightColor $ rectangleSolid 1000 300

sun :: Picture
sun = Color sunColor (disk 185)

sunHalo :: Picture
sunHalo = Color sunDarkColor (disk 200)

oceanScene :: Picture
oceanScene = Pictures [Translate 0 100 sky, sunHalo, sun, Translate 0 (-200) ocean]

main :: IO ()
main = display displayMode skyDarkColor oceanScene
