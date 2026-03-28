module Ch10.VecIntegral where

import Ch10.SimpleVec

vecIntegral :: R            -- step size dt
            -> (R -> Vec)   -- vector-valued function
            -> R            -- lower limit
            -> R            -- upper limit
            -> Vec          -- result
vecIntegral dt f a b =  
    sumV [f (t * dt) | t <- [a + dt / 2, a + 3 * dt / 2 .. b - dt / 2]]
