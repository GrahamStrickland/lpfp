{-# OPTIONS -Wall #-}

module Ch14.Newton2 where

import Graphics.Gnuplot.Simple

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

type R = Double

type Mass     = R
type Time     = R
type Position = R
type Velocity = R
type Force    = R

