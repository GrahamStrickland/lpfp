f :: Double -> Double
f x = x**(1/3)

g :: Double -> Double
g y = exp y + 8**y

h :: Double -> Double
h x = 1 / sqrt ((x - 5)^2 + 16)

gamma :: Double -> Double
gamma beta = 1 / sqrt (1 - beta^2)

bigU :: Double -> Double
bigU x = (1 / (10 + x)) + (1 / (10 - x))

bigL :: Double -> Double
bigL l = sqrt $ l * (l + 1)

bigE :: Double -> Double
bigE x = 1 / abs x ^ 3

bigE2 :: Double -> Double
bigE2 z = 1 / (z^2 + 4)**(3/2)
