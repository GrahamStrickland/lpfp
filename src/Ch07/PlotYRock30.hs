module Ch07.PlotYRock30 where

import Graphics.Gnuplot.Simple

type R = Double

yRock30 :: R -> R
yRock30 t = 30 * t - 0.5 * 9.8 * t ** 2

yRock30Plot :: IO ()
yRock30Plot =
    plotFunc
        [Key (Just ["noautotitle"])]
        [0, 0.1 .. 6]
        yRock30
