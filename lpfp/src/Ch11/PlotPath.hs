{-# OPTIONS_GHC -Wall #-}

module Ch11.PlotPath where

import Graphics.Gnuplot.Simple

type R = Double

ts :: [R]
ts = [0, 0.1 .. 6]

txPairs :: [(R, R)]
txPairs = [(t, 30 * t - 4.9 * t ** 2) | t <- ts]

plotTXPairs :: IO ()
plotTXPairs =
    plotPath
        [ Title "30t - 4.9t^2"
        , XLabel "t (s)"
        , YLabel "x (m)"
        , XRange (0, 6)
        , EPS "plots/11_3.eps"
        , Key Nothing
        ]
        txPairs
