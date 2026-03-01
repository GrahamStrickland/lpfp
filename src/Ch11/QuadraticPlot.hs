{-# OPTIONS_GHC -Wall #-}

module Ch11.QuadraticPlot where

import Graphics.Gnuplot.Simple

type R = Double

xRange :: [R]
xRange = [-3.0, -2.9 .. 3.0]

plotQuadratic :: IO ()
plotQuadratic =
    plotFunc
        [ Title "Quadratic Curve"
        , XLabel "x"
        , YLabel "y"
        , XRange (-3.0,3.0)
        , EPS "plots/11_1.eps"
        , Key Nothing
        ]
        xRange
        (\x -> x ** 2)
