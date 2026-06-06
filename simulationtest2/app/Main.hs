{-# OPTIONS -Wall #-}

module Main (main) where

import Graphics.Gloss

displayMode :: Display
displayMode = InWindow "My Window" (1000, 700) (10, 10)

type State = (Int, [Float])

rate :: Int
rate = 2

initialState :: State
initialState = (0, [])

displayFunc :: State -> Picture
displayFunc (n, ts) =
    translate
        (-450)
        (-300)
        ( scale
            0.15
            0.15
            ( Color
                orange
                ( Text
                    (show n ++ " " ++ show (take 4 ts))
                )
            )
        )

updateFunc :: Float -> State -> State
updateFunc t (n, ts) = (n + 1, t : ts)

main :: IO ()
main = simulate displayMode black rate initialState displayFunc (\_ -> updateFunc)
