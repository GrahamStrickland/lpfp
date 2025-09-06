module Ch10.XYProj where

import Ch10.SimpleVec

xyProj :: Vec -> Vec
xyProj v = vec (xComp v) (yComp v) 0
