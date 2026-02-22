module Ch10.BallSpeed where

import Graphics.Gnuplot.Simple

import Ch10.Kinematics3D
import Ch10.SimpleVec

gEarth :: Vec
gEarth = negateV (9.8 *^ kHat)

degreesToRadians :: R -> R
degreesToRadians x = x * pi / 180

vecFromMagAngleDegreesHorizontal :: (R, R) -> Vec -- (v = magnitude, theta = angle in degrees)
vecFromMagAngleDegreesHorizontal (v, theta) = Vec 0 (v * cos (degreesToRadians theta)) (v * sin (degreesToRadians theta))

vBall :: R -> Vec
vBall t = (vecFromMagAngleDegreesHorizontal (25, 52) ^* t) ^+^ (gEarth ^* (0.5 * t ** 2))

posBallZ :: Time -> R
posBallZ t = zComp (projectilePos (Vec 0 0 0) (vecFromMagAngleDegreesHorizontal (25, 52)) t)

posBallPlot :: IO ()
posBallPlot =
    plotFunc
        [Key (Just ["noautotitle"])]
        [0, 0.1 .. 4]
        posBallZ

speedRateChangeBall :: R -> R
speedRateChangeBall t = speedRateChange (vBall t) gEarth

speedRateChangeBallPlot :: IO ()
speedRateChangeBallPlot =
    plotFunc
        [Key (Just ["noautotitle"])]
        [0, 0.1 .. 4]
        speedRateChangeBall
