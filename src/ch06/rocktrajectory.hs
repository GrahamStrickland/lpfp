type R = Double

yRock :: R -> R -> R
yRock v0 t = (-9.8) * t^2 + v0 * t

vRock :: R -> R -> R
vRock v0 = yRock v0
