{-# OPTIONS_GHC -Wall #-}

module Ch11.SinApprox where

import Graphics.Gnuplot.Simple

type R = Double

approxsin :: R -> R
approxsin x = x - x ** 3 / 6 + x ** 5 / 120 + x ** 7 / 5040

customLabel :: (R, R) -> String -> Attribute
customLabel (x, y) label =
    Custom
        "label"
        [ "\""
            ++ label
            ++ "\""
            ++ " at "
            ++ show x
            ++ ","
            ++ show y
        ]

plotApproxSin :: IO ()
plotApproxSin =
    plotFuncs
        [ Title "Taylor Approximation to Sine Function"
        , XLabel "x"
        , YLabel "y"
        , XRange (-4, 4)
        , EPS "plots/11_4.eps"
        , Key Nothing
        , customLabel (2, 2) "Taylor expansion"
        , customLabel (3, -1) "sin(x)"
        ]
        [-4, -3.99 .. 4]
        [sin, approxsin]
