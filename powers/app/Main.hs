module Main (main) where

powers :: Int -> Int -> Int -> [Int]
powers b x0 xn = [b ^ e | e <- [x0 .. xn]]

main :: IO ()
main = print (powers 2 0 20)
