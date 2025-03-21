type R = Double

type Time = R
type Position = R
type Velocity = R
type Acceleration = R

type Integration = (R -> R) -- function
                 -> R       -- lower limit
                 -> R       -- upper limit
                 -> R       -- result

integral :: R -> Integration
integral dt f a b
    = sum [f t * dt | t <- [a+dt/2, a+3*dt/2 .. b - dt/2]]

type AntiDerivative = R         -- initial value
                    -> (R -> R) -- function
                    -> (R -> R) -- antiderivative of function

antiDerivative :: R -> AntiDerivative
antiDerivative dt v0 a t = v0 + integral dt a 0 t

velFromAcc :: R                         -- dt
           -> Velocity                  -- initial velocity
           -> (Time -> Acceleration)    -- acceleration function
           -> (Time -> Velocity)        -- velocity function
velFromAcc dt v0 a t = antiDerivative dt v0 a t

posFromVel :: R                     -- dt
           -> Position              -- initial position
           -> (Time -> Velocity)    -- velocity function
           -> (Time -> Position)    -- position function
posFromVel = antiDerivative

integralN :: Int -> Integration
integralN n f a b
    = let dt = (b - a) / fromIntegral n
      in integral dt f a b

integralN' :: Int -> Integration
integralN' n f a b
    = integral ((b - a) / fromIntegral n) f a b
