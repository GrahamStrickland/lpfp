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

fAir :: R   -- drag coefficient
     -> R   -- air density
     -> R   -- cross-sectional area of object
     -> Velocity
     -> Force
fAir drag rho area v = -drag * rho * area * abs v * v / 2

newtonSecondV :: Mass
              -> [Velocity -> Force]    -- list of force functions
              -> Velocity               -- current velocity
              -> R                      -- derivative of velocity
newtonSecondV m fs v0 = sum [f v0 | f <- fs] / m

updateVelocity :: R                     -- time interval dt
               -> Mass
               -> [Velocity -> Force]   -- list of force functions
               -> Velocity              -- current velocity
               -> Velocity              -- new velocity
updateVelocity dt m fs v0
    = v0 + (newtonSecondV m fs v0) * dt

velocityFv :: R                     -- time step
           -> Mass
           -> Velocity              -- initial velocity v(0)
           -> [Velocity -> Force]   -- list of initial force functions
           -> Time -> Velocity      -- velocity function
velocityFv dt m v0 fs t
    = let numSteps = abs $ round (t / dt)
      in iterate (updateVelocity dt m fs) v0 !! numSteps

bikeVelocity :: Time -> Velocity
bikeVelocity = velocityFv 1 70 0 [const 100,fAir 2 1.225 0.6]

bikeGraph :: IO ()
bikeGraph = plotFunc [Title "Bike velocity"
                     ,XLabel "Time (s)"
                     ,YLabel "Velocity of Bike (m/s)"
                     ,EPS "BikeVelocity.eps"
                     ,Key Nothing
                     ] [0,0.5..60] bikeVelocity

newtonSecondTV :: Mass
               -> [(Time,Velocity) -> Force]    -- force funcs
               -> (Time,Velocity)               -- current state
               -> (R,R)                         -- deriv of state
newtonSecondTV m fs (t,v0)
    = let fNet = sum [f (t,v0) | f <- fs]
          acc = fNet / m
      in (1,acc)

updateTV :: R                           -- time interval dt
         -> Mass
         -> [(Time,Velocity) -> Force]  -- list of force funcs
         -> (Time,Velocity)             -- current state
         -> (Time,Velocity)             -- new state
updateTV dt m fs (t,v0)
    = let (dtdt, dvdt) = newtonSecondTV m fs (t,v0)
      in (t  + dtdt * dt
         ,v0 + dvdt * dt)

statesTV :: R                           -- time step
         -> Mass
         -> (Time,Velocity)             -- initial state
         -> [(Time,Velocity) -> Force]  -- list of force funs
         -> [(Time,Velocity)]           -- infinite list of states
statesTV dt m tv0 fs
    = iterate (updateTV dt m fs) tv0

velocityFtv :: R                            -- time step
            -> Mass
            -> (Time,Velocity)              -- initial state
            -> [(Time,Velocity) -> Force]   -- list of force funcs
            -> Time -> Velocity             -- velocity function
velocityFtv dt m tv0 fs t
    = let numSteps = abs $ round (t / dt)
      in snd $ statesTV dt m tv0 fs !! numSteps
