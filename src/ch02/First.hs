module Ch02.First where

-- First Haskell program

-- Here we define a constant
e :: Double
e = exp 1

-- Here we define a function
square :: Double -> Double
square x = x ** 2

cosSq :: Double -> Double
cosSq x = square (cos x)

cosSq' :: Double -> Double
cosSq' x = square $ cos x

cosSq'' :: Double -> Double
cosSq'' x = (square . cos) x

cosSq''' :: Double -> Double
cosSq''' = square . cos
