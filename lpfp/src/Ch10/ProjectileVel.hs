module Ch10.ProjectileVel where

import Ch10.SimpleVec
import Ch10.Kinematics3D

projectileVel :: Velocity -> Time -> Velocity
projectileVel v0 = (\t -> velocityCA v0 (9.81 *^ negateV kHat) t)