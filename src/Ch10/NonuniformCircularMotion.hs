module Ch10.NonuniformCircularMotion where

import Ch10.Kinematics3D
import Ch10.SimpleVec

rNCM :: (R, R -> R) -> R -> Vec
rNCM (radius, theta) t = radius *^ (cos (theta t) *^ iHat ^+^ sin (theta t) *^ jHat)

aPerpFromPosition :: R -> (R -> Vec) -> R -> Vec
aPerpFromPosition epsilon r t =
    let v = vecDerivative epsilon r
        a = vecDerivative epsilon v
     in aPerp (v t) (a t)

thetaFunc :: Time -> R
thetaFunc t = 0.5 * 3 * t ** 2

radialComponent :: R -> R -> Vec
radialComponent radius t = aPerpFromPosition 0.01 (rNCM (radius, thetaFunc)) t

magRadialComponent :: R -> R -> R
magRadialComponent radius t = magnitude (radialComponent radius t)

