module Ch08.TypeClasses where

type R = Double

integral :: R -> (R -> R) -> R -> R -> R
integral dt f a b =
    sum [f t * dt | t <- [a + dt / 2, a + 3 * dt / 2 .. b - dt / 2]]
