type R = Double

springForce5500 :: R -> R
springForce5500 x = -5500 * x

springForce :: R -> R -> R
springForce k x = -k * x
