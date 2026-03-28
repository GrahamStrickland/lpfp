module Ch09.TVPairs where

type R = Double

tvUpdate :: (R,R) -> (R,R)
tvUpdate (t,v) = (t + 1, v + 5)

tvPairs :: [(R,R)]
tvPairs = iterate tvUpdate (0,0)
