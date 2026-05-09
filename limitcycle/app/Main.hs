{-# OPTIONS -Wall #-}

module Main (main) where

import Graphics.Gloss

displayMode :: Display
displayMode = InWindow "My Window" (1000, 700) (10, 10)

-- updates per second of real time
rate :: Int
rate = 24

scaleFactor :: Float
scaleFactor = 100

disk :: Float -> Picture
disk radius = ThickCircle (radius / 2) radius

redDisk :: Picture
redDisk = Color red (disk 10)

greenDisk :: Picture
greenDisk = Color green (disk 10)

blueDisk :: Picture
blueDisk = Color blue (disk 10)

type Position = (Float, Float)
type Velocity = (Float, Float)
type State = (Position, Velocity)
type States = ((Position, Velocity), (Position, Velocity), (Position, Velocity))

initialStates :: States
initialStates = (((-1, 1), (5, 0)), ((0.25, 0.25), (0, 10)), ((-2.5, -2.5), (0, 0)))

path :: (Position, Velocity) -> Picture -> Picture
path ((x, y), (_, _)) = Translate (x * scaleFactor) (y * scaleFactor)

displayFunc :: States -> Picture
displayFunc (redPath, greenPath, bluePath) =
    Pictures
        [ path redPath redDisk
        , path greenPath greenDisk
        , path bluePath blueDisk
        ]

updateFunc :: Float -> State -> State
updateFunc dt ((x, y), (vx, vy)) =
    ( (x + vx * dt, y + vy * dt)
    , (y, -((x ** 2 + y ** 2 - 1) * y) - x)
    )

updates :: Float -> States -> States
updates t (redState, greenState, blueState) = (updateFunc t redState, updateFunc t greenState, updateFunc t blueState)

main :: IO ()
main =
    simulate
        displayMode
        black
        rate
        initialStates
        displayFunc
        (\_ -> updates)
