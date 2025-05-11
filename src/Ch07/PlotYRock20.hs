module Ch07.PlotYRock20 where

import Graphics.Gnuplot.Simple

type R = Double

yRock :: R -> R -> R
yRock v0 t = v0 * t - 0.5 * 9.8 * t ** 2

yRock20Plot :: IO ()
yRock20Plot =
    plotFunc
        [Key (Just ["noautotitle"])]
        [0, 0.1 .. 4]
        (yRock 20)
