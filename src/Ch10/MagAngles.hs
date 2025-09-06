module Ch10.MagAngles where

import Ch10.SimpleVec

magAngles :: Vec -> (R, R, R)
magAngles v =
    ( magnitude v
    , atan2 (sqrt ((xComp v) ** 2 + (yComp v) ** 2)) (zComp v)
    , atan2 (yComp v) (xComp v)
    )
