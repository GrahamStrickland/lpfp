module Ch10.UniformCircularMotion where

import Ch10.SimpleVec

rUCM :: R -> R -> R -> Vec
rUCM omega r t = r *^ vec (cos (omega * t)) (sin (omega * t)) 0

vUCM :: R -> R -> R -> Vec
vUCM omega r t = (omega * r) *^ vec (-(sin (omega * t))) (cos (omega * t)) 0

aUCM :: R -> R -> R -> Vec
aUCM omega r t = ((-(omega ** 2)) * r) *^ vec (cos (omega * t)) (sin (omega * t)) 0
