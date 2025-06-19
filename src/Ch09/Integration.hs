module Ch09.Integration where

type R = Double

oneStep :: R        -- time step
        -> (R -> R) -- function to integrate
        -> (R,R)    -- current (t,y)
        -> (R,R)    -- updated (t,y)
oneStep dt f (t,y) = let t' = t + dt
                         y' = y + f t * dt
                     in (t', y')

integral' :: R -> Integration
integral' dt f a b
    = snd $ head $ dropWhile (\(t, _) -> t < b) $
      iterate (oneStep dt f) (a + dt/2, 0)

type Integration = (R -> R) -- function
                 -> R       -- lower limit
                 -> R       -- upper limit
                 -> R       -- result

