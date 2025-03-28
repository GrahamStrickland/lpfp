type R = Double

yRock :: R -> R -> R
yRock v0 t = v0 * t - 4.9 * t^2

vRock :: R -> R -> R
vRock v0 t = v0 - 9.8 * t
