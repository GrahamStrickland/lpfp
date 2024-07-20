averageVelocity :: Time -> Time -> PositionFunction -> Velocity
averageVelocity t0 t1 x = (x t1 - x t0) / (t1 - t0)

averageVelocity2 :: Time -> TimeInterval -> PositionFunction -> Velocity
averageVelocity2 t dt x = (x (t + dt/2) - x (t - dt/2)) / dt

type R = Double

type Time         = R
type TimeInterval = R
type Position     = R
type Velocity     = R

type PositionFunction = Time -> Position
type VelocityFunction = Time -> Velocity

