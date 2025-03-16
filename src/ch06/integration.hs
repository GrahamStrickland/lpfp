type R = Double

type Integration = (R -> R) -- function
                 -> R       -- lower limit
                 -> R       -- upper limit
                 -> R       -- result

integral :: R -> Integration
integral dt f a b
    = sum [f t * dt | t <- [a+dt/2, a+3*dt/2 .. b - dt/2]]
