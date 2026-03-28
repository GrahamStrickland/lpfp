{-# OPTIONS_GHC -Wall #-}

module Ch11.CosSinPlot where

import Graphics.Gnuplot.Simple

type R = Double

xRange :: [R]
xRange = [0.0, 0.1 .. 10.0]

plotCosSin :: IO ()
plotCosSin =
    plotFuncs
        [ Title "Cosine and sine functions"
        , XLabel "x"
        , YLabel "y"
        , XRange (0, 10)
        , EPS "plots/11_2.eps"
        , Key Nothing
        ]
        xRange
        [cos, sin]
