{-# OPTIONS -Wall #-}

module Ch14.Newton2 where

import Graphics.Gnuplot.Simple

type R = Double

type Mass     = R
type Time     = R
type Position = R
type Velocity = R
type Force    = R

antiDerivative :: R -> R -> (R -> R) -> (R -> R)
antiDerivative dt v0 a t = v0 + integral dt a 0 t

integral :: R -> (R -> R) -> R -> R -> R
integral dt f a b
    = sum [f t * dt | t <- [a+dt/2, a+3*dt/2 .. b - dt/2]]

-- velocityCF :: Mass -> Velocity -> [Force] -> (Time -> Velocity)
velocityCF :: Mass
           -> Velocity          -- initial velocity
           -> [Force]           -- list of forces
           -> Time -> Velocity  -- velocity function
velocityCF m v0 fs
    = let fNet = sum fs         -- net force
          a0   = fNet / m       -- Newton's second law
          v t  = v0 + a0 * t    -- constant acceleration eqn
      in v

positionCF :: Mass
           -> Position          -- initial position
           -> Velocity          -- initial velocity
           -> [Force]           -- list of forces
           -> Time -> Position  -- position function
positionCF m x0 v0 fs
    = let fNet = sum fs
          a0   = fNet / m
          x t  = x0 + v0 * t + a0*t**2 / 2
      in x

carGraph :: IO ()
carGraph
    = plotFunc [Title "Car on an air track"
               ,XLabel "Time (s)"
               ,YLabel "Velocity of Car (m/s)"
               ,EPS "plots/CarVelocity.eps"
               ,Key Nothing
               ] [0..4 :: Time] (velocityCF 0.1 0.6 [0.04, -0.08])

velocityFt :: R                 -- dt for integral
           -> Mass
           -> Velocity          -- initial velocity
           -> [Time -> Force]   -- list of force functions
           -> Time -> Velocity  -- velocity function
velocityFt dt m v0 fs
    = let fNet t = sum [f t | f <- fs]
          a t = fNet t / m
      in antiDerivative dt v0 a

positionFt :: R                 -- dt for integral
           -> Mass
           -> Position          -- initial position
           -> Velocity          -- initial velocity
           -> [Time -> Force]   -- list of force functions
           -> Time -> Position  -- position function
positionFt dt m x0 v0 fs
    = antiDerivative dt x0 (velocityFt dt m v0 fs)

pedalCoast :: Time -> Force
pedalCoast t
    = let tCycle = 20
          nComplete :: Int
          nComplete = truncate (t / tCycle)
          remainder = t - fromIntegral nComplete * tCycle
      in if remainder < 10
        then 10
        else 0

childGraph :: IO ()
childGraph
    = plotFunc [Title "Child pedaling then coasting"
               ,XLabel "Time (s)"
               ,YLabel "Position of Bike (m)"
               ,EPS "plots/ChildPosition.eps"
               ,Key Nothing
               ] [0..40 :: R] (positionFt 0.1 20 0 0 [pedalCoast])
