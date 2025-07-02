module Ch09.Fibonacci where

fibHelper :: [(Int, Int)]
fibHelper = iterate (\(x, y) -> (if y == 0 then 1 else y, x + y)) (0, 1)

fibonacci :: [Int]
fibonacci = [y | (_,y) <- fibHelper]
