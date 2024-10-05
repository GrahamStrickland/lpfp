averageVelocity :: Time -> Time -> PositionFunction -> Velocity
averageVelocity t0 t1 x = (x t1 - x t0) / (t1 - t0)

averageVelocity2 :: Time -> TimeInterval -> PositionFunction -> Velocity
averageVelocity2 t dt x = (x (t + dt / 2) - x (t - dt / 2)) / dt

type R = Double

type Time = R

type TimeInterval = R

type Position = R

type Velocity = R

type PositionFunction = Time -> Position

type VelocityFunction = Time -> Velocity

type Derivative = (R -> R) -> R -> R

derivative :: R -> Derivative
derivative dt x t = (x (t + dt / 2) - x (t - dt / 2)) / dt

carPosition :: Time -> Position
carPosition t = cos t

carVelocity :: Time -> Velocity
carVelocity = derivative 0.01 carPosition

carVelocity' :: Time -> Velocity
carVelocity' t = derivative 0.01 carPosition t

carVelocityAnalytic :: Time -> Velocity
carVelocityAnalytic t = -sin t

velFromPos ::
  R -> -- dt
  (Time -> Position) -> -- position function
  (Time -> Velocity) -- velocity function
velFromPos dt x = derivative dt x

positionCV :: Position -> Velocity -> Time -> Position
positionCV x0 v0 t = v0 * t + x0

type Acceleration = R

accFromVel ::
  R -> -- dt
  (Time -> Velocity) -> -- velocity function
  (Time -> Acceleration) -- acceleration function
accFromVel = derivative

velocityCA :: Velocity -> Acceleration -> Time -> Velocity
velocityCA v0 a0 t = a0 * t + v0

positionCA :: Position -> Velocity -> Acceleration -> Time -> Position
positionCA x0 v0 a0 t = a0 * t ** 2 / 2 + v0 * t + x0

err :: (R -> R) -> (R -> R) -> R -> R -> R
err f df t a = abs ((derivative a f t - df t) / df t)

pos1 :: Time -> Position
pos1 t =
  if t < 0
    then 0
    else 5 * t ** 2

vel1Analytic :: Time -> Velocity
vel1Analytic t =
  if t < 0
    then 0
    else 10 * t

acc1Analytic :: Time -> Acceleration
acc1Analytic t =
  if t < 0
    then 0
    else 10

vel1Numerical :: Time -> Velocity
vel1Numerical t = derivative 0.01 pos1 t

acc1Numerical :: Time -> Acceleration
acc1Numerical t = derivative 0.01 vel1Numerical t
