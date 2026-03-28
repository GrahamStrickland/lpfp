module Ch09.Factorial where

factHelper :: [(Int,Int)]
factHelper = iterate (\(x, y) -> (x + 1, (x + 1) * y)) (0, 1) 

fact :: Int -> Int
fact n = [y | (_,y) <- factHelper] !! n
