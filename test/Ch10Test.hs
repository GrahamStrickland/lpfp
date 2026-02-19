module Ch10Test where

import qualified Ch10.BallSpeed as BallSpeed
import qualified Ch10.MagAngles as MagAngles
import qualified Ch10.SimpleVec as SimpleVec
import qualified Ch10.Vec2D as Vec2D
import qualified Ch10.XYProj as XYProj
import Test.HUnit

ch10Tests :: Test
ch10Tests =
    TestLabel "Chapter 10 Tests" $
        TestList
            [testCh10Vec2D, testCh10XYProj, testCh10MagAngles, testCh10BallSpeed]

testCh10Vec2D :: Test
testCh10Vec2D =
    TestLabel "Ch10.Vec2D tests" $
        TestList
            [ TestCase $ assertVec2DApproxEqual "iHat" 1e-12 (Vec2D.vec2D 1 0) Vec2D.iHat
            , TestCase $ assertVec2DApproxEqual "jHat" 1e-12 (Vec2D.vec2D 0 1) Vec2D.jHat
            , TestCase $ assertVec2DApproxEqual "zeroV" 1e-12 (Vec2D.vec2D 0 0) Vec2D.zeroV
            , TestCase $ assertVec2DApproxEqual "negateV" 1e-12 (Vec2D.vec2D (-1) (-2)) (Vec2D.negateV (Vec2D.vec2D 1 2))
            , TestCase $ assertVec2DApproxEqual "^+^" 1e-12 (Vec2D.vec2D 4 6) (Vec2D.vec2D 1 2 Vec2D.^+^ Vec2D.vec2D 3 4)
            , TestCase $ assertVec2DApproxEqual "^-^" 1e-12 (Vec2D.vec2D (-2) (-2)) (Vec2D.vec2D 1 2 Vec2D.^-^ Vec2D.vec2D 3 4)
            , TestCase $ assertVec2DApproxEqual "sumV" 1e-12 (Vec2D.vec2D 4 6) (Vec2D.sumV [Vec2D.vec2D 1 2, Vec2D.vec2D 3 4])
            , TestCase $ assertVec2DApproxEqual "*^" 1e-12 (Vec2D.vec2D 2 4) (2 Vec2D.*^ Vec2D.vec2D 1 2)
            , TestCase $ assertVec2DApproxEqual "^*" 1e-12 (Vec2D.vec2D 2 4) (Vec2D.vec2D 1 2 Vec2D.^* 2)
            , TestCase $ assertDoubleApproxEqual "<.>" 1e-12 11.0 (Vec2D.vec2D 1 2 Vec2D.<.> Vec2D.vec2D 3 4)
            , TestCase $ assertVec2DApproxEqual "^/" 1e-12 (Vec2D.vec2D 1 2) (Vec2D.vec2D 2 4 Vec2D.^/ 2)
            , TestCase $ assertDoubleApproxEqual "magnitude" 1e-12 5.0 (Vec2D.magnitude (Vec2D.vec2D 3 4))
            , TestCase $ assertDoublePairApproxEqual "magAngleFromVec2D" 1e-12 (1.0, 0.0) (Vec2D.magAngleFromVec2D (Vec2D.vec2D 1 0))
            , TestCase $ assertDoublePairApproxEqual "magAngleFromVec2D" 1e-12 (1.0, pi / 2) (Vec2D.magAngleFromVec2D (Vec2D.vec2D 0 1))
            , TestCase $ assertVec2DApproxEqual "vec2DFromMagAngle" 1e-12 (Vec2D.vec2D (-1) 0) (Vec2D.vec2DFromMagAngle (1, pi))
            , TestCase $ assertDoubleApproxEqual "derivative" 1e-12 2.0 (Vec2D.derivative 0.001 (\t -> t * t) 1)
            , TestCase $ assertVec2DApproxEqual "vecDerivative" 1e-12 (Vec2D.vec2D 2 1) (Vec2D.vecDerivative 0.001 (\t -> Vec2D.vec2D (t * t) t) 1)
            , TestCase $ assertDoubleApproxEqual "xCompFunc" 1e-12 1.0 (Vec2D.xCompFunc (\_ -> Vec2D.vec2D 1 2) 0)
            , TestCase $ assertDoubleApproxEqual "yCompFunc" 1e-12 2.0 (Vec2D.yCompFunc (\_ -> Vec2D.vec2D 1 2) 0)
            ]

testCh10XYProj :: Test
testCh10XYProj =
    TestLabel "Ch10.XYProj tests" $
        TestList
            [TestCase $ assertVecApproxEqual "xyProj (vec 6 9 7)" 1e-12 (SimpleVec.vec 6 9 0) (XYProj.xyProj (SimpleVec.vec 6 9 7))]

testCh10MagAngles :: Test
testCh10MagAngles =
    TestLabel "Ch10.MagAngles tests" $
        TestList
            [TestCase $ assertDoubleTripleApproxEqual "magAngles (vec (-1) (-2) (-3))" 1e-12 (3.7416573867739413, 2.5010703409103687, -2.0344439357957027) (MagAngles.magAngles (SimpleVec.vec (-1) (-2) (-3)))]

testCh10BallSpeed :: Test
testCh10BallSpeed =
    TestLabel "Ch10.BallSpeed tests" $
        TestList
            [ TestCase $ assertVecApproxEqual "gEarth" 1e-12 (SimpleVec.vec 0 0 (-9.8)) BallSpeed.gEarth
            , TestCase $ assertDoubleApproxEqual "degreesToRadians 0" 1e-12 0.0 (BallSpeed.degreesToRadians 0)
            , TestCase $ assertDoubleApproxEqual "degreesToRadians 45" 1e-12 (pi / 4) (BallSpeed.degreesToRadians 45)
            , TestCase $ assertDoubleApproxEqual "degreesToRadians 90" 1e-12 (pi / 2) (BallSpeed.degreesToRadians 90)
            , TestCase $ assertDoubleApproxEqual "degreesToRadians 180" 1e-12 pi (BallSpeed.degreesToRadians 180)
            , TestCase $ assertVecApproxEqual "vecFromMagAngleDegreesHorizontal (0, 0)" 1e-12 (SimpleVec.vec 0 0 0) (BallSpeed.vecFromMagAngleDegreesHorizontal (0, 0))
            , TestCase $ assertVecApproxEqual "vecFromMagAngleDegreesHorizontal (1, 45) " 1e-12 (SimpleVec.vec 0 (cos (pi / 4)) (sin (pi / 4))) (BallSpeed.vecFromMagAngleDegreesHorizontal (1, 45))
            , TestCase $ assertVecApproxEqual "vecFromMagAngleDegreesHorizontal (2, 45) " 1e-12 (SimpleVec.vec 0 (2 * cos (pi / 4)) (2 * sin (pi / 4))) (BallSpeed.vecFromMagAngleDegreesHorizontal (2, 45))
            , TestCase $ assertVecApproxEqual "vBall 0" 1e-12 (SimpleVec.vec 0 0 0) (BallSpeed.vBall 0)
            ]

assertVecApproxEqual :: String -> Double -> SimpleVec.Vec -> SimpleVec.Vec -> Assertion
assertVecApproxEqual msg epsilon expected actual =
    assertBool (msg ++ "\nexpected: " ++ show expected ++ "\n but got: " ++ show actual) $
        abs (SimpleVec.xComp expected - SimpleVec.xComp actual) < epsilon
            && abs (SimpleVec.yComp expected - SimpleVec.yComp actual) < epsilon
            && abs (SimpleVec.zComp expected - SimpleVec.zComp actual) < epsilon

assertVec2DApproxEqual :: String -> Double -> Vec2D.Vec2D -> Vec2D.Vec2D -> Assertion
assertVec2DApproxEqual msg epsilon expected actual =
    assertBool (msg ++ "\nexpected: " ++ show expected ++ "\n but got: " ++ show actual) $
        abs (Vec2D.xComp expected - Vec2D.xComp actual) < epsilon
            && abs (Vec2D.yComp expected - Vec2D.yComp actual) < epsilon

assertDoubleApproxEqual :: String -> Double -> Double -> Double -> Assertion
assertDoubleApproxEqual msg epsilon expected actual =
    assertBool (msg ++ "\nexpected: " ++ show expected ++ "\n but got: " ++ show actual) $
        abs (expected - actual) < epsilon

assertDoublePairApproxEqual :: String -> Double -> (Double, Double) -> (Double, Double) -> Assertion
assertDoublePairApproxEqual msg epsilon (e1, e2) (a1, a2) =
    assertBool (msg ++ "\nexpected: " ++ show (e1, e2) ++ "\n but got: " ++ show (a1, a2)) $
        abs (e1 - a1) < epsilon && abs (e2 - a2) < epsilon

assertDoubleTripleApproxEqual :: String -> Double -> (Double, Double, Double) -> (Double, Double, Double) -> Assertion
assertDoubleTripleApproxEqual msg epsilon (e1, e2, e3) (a1, a2, a3) =
    assertBool (msg ++ "\nexpected: " ++ show (e1, e2, e3) ++ "\n but got: " ++ show (a1, a2, a3)) $
        abs (e1 - a1) < epsilon && abs (e2 - a2) < epsilon && abs (e3 - a3) < epsilon
