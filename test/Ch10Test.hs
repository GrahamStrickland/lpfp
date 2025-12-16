module Ch10Test where

import qualified Ch10.Vec2D as Vec2D
import Test.HUnit

ch10Tests :: Test
ch10Tests =
    TestLabel "Chapter 10 Tests" $
        TestList
            [testCh10Vec2D]

testCh10Vec2D :: Test
testCh10Vec2D =
    TestLabel "Ch10.Vec2D tests" $
        TestList
            [ TestCase $ assertVecApproxEqual "iHat" 1e-12 (Vec2D.vec2D 1 0) Vec2D.iHat
            , TestCase $ assertVecApproxEqual "jHat" 1e-12 (Vec2D.vec2D 0 1) Vec2D.jHat
            , TestCase $ assertVecApproxEqual "zeroV" 1e-12 (Vec2D.vec2D 0 0) Vec2D.zeroV
            , TestCase $ assertVecApproxEqual "negateV" 1e-12 (Vec2D.vec2D (-1) (-2)) (Vec2D.negateV (Vec2D.vec2D 1 2))
            , TestCase $ assertVecApproxEqual "^+^" 1e-12 (Vec2D.vec2D 4 6) (Vec2D.vec2D 1 2 Vec2D.^+^ Vec2D.vec2D 3 4)
            , TestCase $ assertVecApproxEqual "^-^" 1e-12 (Vec2D.vec2D (-2) (-2)) (Vec2D.vec2D 1 2 Vec2D.^-^ Vec2D.vec2D 3 4)
            , TestCase $ assertVecApproxEqual "sumV" 1e-12 (Vec2D.vec2D 4 6) (Vec2D.sumV [Vec2D.vec2D 1 2, Vec2D.vec2D 3 4])
            , TestCase $ assertVecApproxEqual "*^" 1e-12 (Vec2D.vec2D 2 4) (2 Vec2D.*^ Vec2D.vec2D 1 2)
            , TestCase $ assertVecApproxEqual "^*" 1e-12 (Vec2D.vec2D 2 4) (Vec2D.vec2D 1 2 Vec2D.^* 2)
            , TestCase $ assertDoubleApproxEqual "<.>" 1e-12 11.0 (Vec2D.vec2D 1 2 Vec2D.<.> Vec2D.vec2D 3 4)
            , TestCase $ assertVecApproxEqual "^/" 1e-12 (Vec2D.vec2D 1 2) (Vec2D.vec2D 2 4 Vec2D.^/ 2)
            , TestCase $ assertDoubleApproxEqual "magnitude" 1e-12 5.0 (Vec2D.magnitude (Vec2D.vec2D 3 4))
            , TestCase $ assertTupleApproxEqual "magAngleFromVec2D" 1e-12 (1.0, 0.0) (Vec2D.magAngleFromVec2D (Vec2D.vec2D 1 0))
            , TestCase $ assertTupleApproxEqual "magAngleFromVec2D" 1e-12 (1.0, pi / 2) (Vec2D.magAngleFromVec2D (Vec2D.vec2D 0 1))
            , TestCase $ assertVecApproxEqual "vec2DFromMagAngle" 1e-12 (Vec2D.vec2D (-1) 0) (Vec2D.vec2DFromMagAngle (1, pi))
            , TestCase $ assertDoubleApproxEqual "derivative" 1e-12 2.0 (Vec2D.derivative 0.001 (\t -> t * t) 1)
            , TestCase $ assertVecApproxEqual "vecDerivative" 1e-12 (Vec2D.vec2D 2 1) (Vec2D.vecDerivative 0.001 (\t -> Vec2D.vec2D (t * t) t) 1)
            , TestCase $ assertDoubleApproxEqual "xCompFunc" 1e-12 1.0 (Vec2D.xCompFunc (\_ -> Vec2D.vec2D 1 2) 0)
            , TestCase $ assertDoubleApproxEqual "yCompFunc" 1e-12 2.0 (Vec2D.yCompFunc (\_ -> Vec2D.vec2D 1 2) 0)
            ]

assertVecApproxEqual :: String -> Double -> Vec2D.Vec2D -> Vec2D.Vec2D -> Assertion
assertVecApproxEqual msg epsilon expected actual =
    assertBool (msg ++ "\nexpected: " ++ show expected ++ "\n but got: " ++ show actual) $
        abs (Vec2D.xComp expected - Vec2D.xComp actual) < epsilon
            && abs (Vec2D.yComp expected - Vec2D.yComp actual) < epsilon

assertDoubleApproxEqual :: String -> Double -> Double -> Double -> Assertion
assertDoubleApproxEqual msg epsilon expected actual =
    assertBool (msg ++ "\nexpected: " ++ show expected ++ "\n but got: " ++ show actual) $
        abs (expected - actual) < epsilon

assertTupleApproxEqual :: String -> Double -> (Double, Double) -> (Double, Double) -> Assertion
assertTupleApproxEqual msg epsilon (e1, e2) (a1, a2) =
    assertBool (msg ++ "\nexpected: " ++ show (e1, e2) ++ "\n but got: " ++ show (a1, a2)) $
        abs (e1 - a1) < epsilon && abs (e2 - a2) < epsilon
