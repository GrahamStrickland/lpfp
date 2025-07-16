module Ch09.RockTrajectory where

import Graphics.Gnuplot.Simple

type R = Double

yRock15 :: R -> R
yRock15 t = (-9.8) * t ** 2 + 15 * t

vRock15 :: R -> R
vRock15 t = 15 - 9.8 * t

rockTrajectory :: R -> [(R,R,R)]
rockTrajectory t1 = [(t,yRock15 t,vRock15 t) | t <- [0,0.1..t1]]

plot1 :: IO ()
plot1 = plotList [Key (Just ["noautotitle"])] (rockTrajectory 1.0)
