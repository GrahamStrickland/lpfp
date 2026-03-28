module Ch09.Pairs where

txPairs :: [(R, R)]
txPairs = [(t, yRock30 t) | t <- [0, 0.1 .. 6]]

type R = Double

txPairs' :: [(R, R)]
txPairs' = map (\t -> (t, yRock30 t)) [0, 0.1 .. 6]

yRock30 :: R -> R
yRock30 t = 30 * t - 0.5 * 9.8 * t ** 2

txPairsInAir :: [(R, R)]
txPairsInAir =
    [(t, yRock30 t) | t <- [0, 0.1 .. 20], yRock30 t > 0]

txPairsInAir' :: [(R, R)]
txPairsInAir' =
    map (\t -> (t, yRock30 t)) $
    filter (\t -> yRock30 t > 0) [0, 0.1 .. 20]

txPairsInAir'' :: [(R,R)]
txPairsInAir''
    = filter (\(_t,y) -> y > 0) $
      map (\t -> (t, yRock30 t)) [0,0.1..20]
