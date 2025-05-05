module Ch06.TrapezoidalRule where

type R = Double

trapSingle :: R -> (R -> R) -> R -> R
trapSingle dt fn x =
    let dx = dt / 4
     in sum [f * dx | f <- [0.5 * fn x, fn (x + dx), fn (x + 2 * dx), fn (x + 3 * dx), 0.5 * fn (x + 4 * dx)]]

trapIntegrate :: Int        -- # of trapezoids n
              -> (R -> R)   -- function f
              -> R          -- lower limit a
              -> R          -- upper limit b
              -> R          -- result
trapIntegrate n f a b =
    let dt = (b - a) / fromIntegral n
     in sum [trapSingle dt f t | t <- [a, a + dt .. b - dt]]


calcTrapIntegrateErr :: Int        -- start value
                     -> (R -> R)   -- function f
                     -> R          -- lower limit a
                     -> R          -- upper limit b
                     -> R          -- tolerance
                     -> Int        -- result
calcTrapIntegrateErr n f a b eps = 
    if abs (trapIntegrate (n + 1) f a b) - (trapIntegrate n f a b) < eps
        then n + 1
        else calcTrapIntegrateErr (n + 1) f a b eps
