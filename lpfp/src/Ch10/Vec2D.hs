{-# OPTIONS -Wall #-}

module Ch10.Vec2D where

infixl 6 ^+^
infixl 6 ^-^
infixr 7 *^
infixl 7 ^*
infixr 7 ^/
infixr 7 <.>

type R = Double

data Vec2D = Vec2D { xComp :: R -- x component
                   , yComp :: R -- y component
                   } deriving (Eq)

instance Show Vec2D where
    show (Vec2D x y) = "vec " ++ showDouble x ++ " "
                              ++ showDouble y ++ " "

showDouble :: R -> String
showDouble x
    | x < 0     = "(" ++ show x ++ ")"
    | otherwise = show x


-- Form a vector by giving its x, y, and z components.
vec2D :: R -- x component
      -> R -- y component
      -> Vec2D
vec2D = Vec2D

iHat :: Vec2D
iHat = vec2D 1 0 

jHat :: Vec2D
jHat = vec2D 0 1

zeroV :: Vec2D
zeroV = vec2D 0 0

negateV :: Vec2D -> Vec2D
negateV (Vec2D ax ay) = Vec2D (-ax) (-ay)

(^+^) :: Vec2D -> Vec2D -> Vec2D
Vec2D ax ay ^+^ Vec2D bx by = Vec2D (ax+bx) (ay+by)

(^-^) :: Vec2D -> Vec2D -> Vec2D
Vec2D ax ay ^-^ Vec2D bx by = Vec2D (ax-bx) (ay-by)

sumV :: [Vec2D] -> Vec2D
sumV = foldr (^+^) zeroV

(*^)  :: R   -> Vec2D -> Vec2D
c *^ Vec2D ax ay = Vec2D (c*ax) (c*ay)

(^*)  :: Vec2D -> R   -> Vec2D
Vec2D ax ay ^* c = Vec2D (c*ax) (c*ay)

(<.>) :: Vec2D -> Vec2D -> R
Vec2D ax ay <.> Vec2D bx by = ax*bx + ay*by

(^/) :: Vec2D -> R -> Vec2D
Vec2D ax ay ^/ c = Vec2D (ax/c) (ay/c)

magnitude :: Vec2D -> R
magnitude v = sqrt(v <.> v)

type VecDerivative = (R -> Vec2D) -> R -> Vec2D

vecDerivative :: R -> VecDerivative
vecDerivative dt v t = (v (t + dt/2) ^-^ v (t - dt/2)) ^/ dt

xCompFunc :: (R -> Vec2D) -> R -> R
xCompFunc v t = xComp (v t)

yCompFunc :: (R -> Vec2D) -> R -> R
yCompFunc v t = yComp (v t)

type Derivative = (R -> R) -> R -> R

derivative :: R -> Derivative
derivative dt x t = (x (t + dt/2) - x (t - dt/2)) / dt

magAngleFromVec2D :: Vec2D -> (R,R)
magAngleFromVec2D v = (magnitude v, atan2 (yComp v) (xComp v))

vec2DFromMagAngle :: (R,R) -> Vec2D
vec2DFromMagAngle (r, theta) = Vec2D (r * cos theta) (r * sin theta)
