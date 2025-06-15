module Ch09.Pythag where

type R = Double

pythag :: (R, R) -> R
pythag (x, y) = sqrt (x**2 + y**2)

pythagCurried :: R -> R -> R
pythagCurried x y = sqrt (x**2 + y**2)
