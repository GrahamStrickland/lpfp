module Ch05.GeometricSeries where

series :: Double
series = sum [1.0 / n | n <- [1..100]]
