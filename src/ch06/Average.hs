module Ch06.Average where

type R = Double

average :: [R] -> R
average xs = sum xs / fromIntegral (length xs)
