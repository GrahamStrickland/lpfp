module Ch10.MaxHeight where

import Ch10.SimpleVec
import Ch10.Kinematics3D

zCompProjectilePos :: PosVec -> Velocity -> Time -> R
zCompProjectilePos r0 v0 t = zComp (projectilePos r0 v0 t)

positiveHeightTimes :: PosVec -> Velocity -> [R]
positiveHeightTimes r0 v0 
    = takeWhile (\t -> zCompProjectilePos r0 v0 t > 0) [0,0.1..]

maxHeight :: PosVec -> Velocity -> R
maxHeight r0 v0 
    = maximum [zCompProjectilePos r0 v0 t | t <- positiveHeightTimes r0 v0]
