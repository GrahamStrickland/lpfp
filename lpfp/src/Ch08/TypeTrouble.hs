module Ch08.TypeTrouble where

import Graphics.Gnuplot.Simple

plot1 = plotFunc [Key (Just ["noautotitle"])] [0, 0.01 .. 10 :: Double] cos
