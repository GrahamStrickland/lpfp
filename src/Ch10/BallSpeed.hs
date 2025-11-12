module Ch10.BallSpeed where

import Graphics.Gnuplot.Simple

import Ch10.Kinematics3D
import Ch10.SimpleVec

gEarth :: Vec
gEarth = negateV (9.8 *^ kHat)

vecFromMagAngleHorizontal :: (R, R) -> Vec
vecFromMagAngleHorizontal (r, theta) = Vec 0 (r * cos theta) (r * sin theta)

vBall :: R -> Vec
vBall t = (vecFromMagAngleHorizontal (25, 52) ^* t) ^+^ (gEarth ^* (0.5 * t ** 2))

speedRateChangeBall :: R -> R
speedRateChangeBall t = speedRateChange (vBall t) gEarth

speedRateChangeBallPlot :: IO ()
speedRateChangeBallPlot =
    plotFunc
        [Key (Just ["noautotitle"])]
        [0, 0.1 .. 4]
        speedRateChangeBall
