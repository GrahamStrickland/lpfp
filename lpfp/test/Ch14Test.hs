module Ch14Test where

import qualified Ch14.Newton2 as Newton2
import Test.HUnit

ch14Tests :: Test
ch14Tests =
  TestLabel "Chapter 14 Tests" $
    TestList
      [testCh14Newton2]

testCh14Newton2 :: Test
testCh14Newton2 =
  TestLabel "Ch14.Newton2 tests" $
    TestList
      [ TestCase $ assertEqual "velocityCF' 0.1 0.6 [0.04, -0.08] 0" 0.6 (Newton2.velocityCF' 0.1 0.6 [0.04, -0.08] 0),
        TestCase $ assertEqual "velocityCF' 0.1 0.6 [0.04, -0.08] 1" 0.2 (Newton2.velocityCF' 0.1 0.6 [0.04, -0.08] 1),
        TestCase $ assertEqual "sumF [sin, cos] 0" (sin 0 + cos 0) (Newton2.sumF [sin, cos] 0),
        TestCase $ assertEqual "sumF [sin, cos] pi" (sin pi + cos pi) (Newton2.sumF [sin, cos] pi),
        TestCase $ assertEqual "positionFv 0.1 70 0 [const 100,fAir 2 1.225 0.6] 0" 0.0 (Newton2.positionFv 0.1 70 0 0 [const 100, Newton2.fAir 2 1.225 0.6] 0),
        TestCase $ assertEqual "positionFv 0.1 70 0 [const 100,fAir 2 1.225 0.6] 1" 0.6417028011495182 (Newton2.positionFv 0.1 70 0 0 [const 100, Newton2.fAir 2 1.225 0.6] 1),
        TestCase $ assertEqual "positionFv 0.1 70 0 [const 100,fAir 2 1.225 0.6] 2" 2.691369821799467 (Newton2.positionFv 0.1 70 0 0 [const 100, Newton2.fAir 2 1.225 0.6] 2),
        TestCase $ assertEqual "bikeVelocity 0" 0.0 (Newton2.bikeVelocity 0),
        TestCase $ assertEqual "bikeVelocity 1" 1.4285714285714286 (Newton2.bikeVelocity 1),
        TestCase $ assertEqual "bikeVelocity 2" 2.835714285714286 (Newton2.bikeVelocity 2)
      ]
