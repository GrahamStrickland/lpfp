module Ch03.Heaviside where

stepFunction :: Double -> Double
stepFunction x =
  if x <= 0
    then 0
    else 1
