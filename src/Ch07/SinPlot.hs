module Ch07.SinPlot where

import Graphics.Gnuplot.Simple

type R = Double

sinFunc :: R -> R
sinFunc x = sin x

sinPlot :: IO ()
sinPlot = plotFunc [] [-10,-9.9..10] sinFunc 
