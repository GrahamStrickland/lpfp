module Ch09.TripleFunc where

type R = Double

x :: (R,R,R) -> R
x (r, theta, phi) = r * sin theta * cos phi
