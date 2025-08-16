module Ch10.Speed where

import Ch10.SimpleVec
import Ch10.Kinematics3D

speedCA :: Velocity -> Acceleration -> Time -> R
speedCA v0 a = (\t -> magnitude (velocityCA v0 a t))