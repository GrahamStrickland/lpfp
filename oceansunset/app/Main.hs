{-# OPTIONS -Wall #-}

module Main (main) where

import Graphics.Gloss

displayMode :: Display
displayMode = InWindow "Axes" (1000, 700) (10, 10)

disk :: Float -> Picture
disk radius = ThickCircle (radius / 2) radius

skyColor :: Float -> Color
skyColor t = makeColorI (212 - (round t * 2)) (255 - (round t * 2)) 212 255

skyDarkColor :: Color
skyDarkColor = makeColorI 128 212 212 255

sunColor :: Float -> Color
sunColor t = makeColorI 255 212 0 (255 - (round t * 10))

sunDarkColor :: Float -> Color
sunDarkColor t = makeColorI (212 + round t) 128 0 (255 - (round t * 10))

oceanLightColor :: Float -> Color
oceanLightColor t = makeColorI (128 - (round t * 10)) (128 - (round t * 10)) (255 - (round t * 5)) 128

sky :: Float -> Picture
sky t = Color (skyColor t) $ rectangleSolid 1000 (300 - 2 * t)

ocean :: Float -> Picture
ocean t = Color (oceanLightColor t) $ rectangleSolid 1000 300

sun :: Float -> Picture
sun t = Color (sunColor t) (disk 185)

sunHalo :: Float -> Picture
sunHalo t = Color (sunDarkColor t) (disk 200)

oceanScene :: Float -> Picture
oceanScene t =
    Pictures
        [ Translate 0 (100 - t) (sky t)
        , Translate 0 (yDisk t) (sunHalo t)
        , Translate 0 (yDisk t) (sun t)
        , Translate 0 (-200) (ocean t)
        ]

yDisk :: Float -> Float
yDisk t = (-10) * t

main :: IO ()
main = animate displayMode skyDarkColor oceanScene
