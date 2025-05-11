module Ch07.SinPlot where

import Graphics.Gnuplot.Simple

type R = Double

sinFunc :: R -> R
sinFunc = sin

sinPlot :: IO ()
sinPlot =
    plotFunc
        [Key (Just ["noautotitle"])]
        [-10, -9.9 .. 10]
        sinFunc
