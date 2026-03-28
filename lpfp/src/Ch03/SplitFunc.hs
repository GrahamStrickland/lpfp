module Ch03.SplitFunc where

f :: Double -> Double
f x = if x <= 0.0 then 0.0 else x

bigE :: Double -> Double
bigE r = if r <= 1.0 then r else 1 / r ^ 2
