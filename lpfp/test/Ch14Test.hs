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
        TestCase $ assertEqual "sumF [sin, cos] pi" (sin pi + cos pi) (Newton2.sumF [sin, cos] pi)
      ]
