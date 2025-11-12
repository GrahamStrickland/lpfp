module Ch05Test where

import Test.HUnit
import qualified Ch05.Factorial as Factorial
import qualified Ch05.Null as Null
import qualified Ch05.Last as Last
import qualified Ch05.Range as Range

ch05Tests :: Test
ch05Tests = TestLabel "Chapter 5 Tests" $ TestList
    [ testCh05Range
    , testCh05Null
    , testCh05Last
    , testCh05Factorial
    ]

testCh05Range :: Test
testCh05Range =
    TestLabel "Ch05.Range tests" $
        TestList
            [ TestCase $ assertEqual "Test Range.range (-4)" [-4, -3, -2, -1, 0] (Range.range (-4))
            , TestCase $ assertEqual "Test Range.range 2" [0, 1, 2] (Range.range 2)
            , TestCase $ assertEqual "Test Range.range 0" [0] (Range.range 0)
            ]

testCh05Null :: Test
testCh05Null =
    TestLabel "Ch05.Null tests" $
        TestList
            [ TestCase $ assertEqual "Test Null.null' []" True (Null.null' [])
            , TestCase $ assertEqual "Test Null.null' [1, 2, 3]" False (Null.null' [1, 2, 3])
            , TestCase $ assertEqual "Test Null.null' [1 ..]" False (Null.null' [1 ..])
            ]

testCh05Last :: Test
testCh05Last =
    TestLabel "Ch05.Last tests" $
        TestList
            [ TestCase $ assertEqual "Test Last.last' [1, 2, 3]" 3 (Last.last' [1, 2, 3])
            , TestCase $ assertEqual "Test Last.last' [\"check\", \"mate\"]" "mate" (Last.last' ["check", "mate"])
            ]

testCh05Factorial :: Test
testCh05Factorial =
    TestLabel "Ch05.Factorial tests" $
        TestList
            [ TestCase $ assertEqual "Test Factorial.fact 0" 1 (Factorial.fact 1)
            , TestCase $ assertEqual "Test Factorial.fact 2" 2 (Factorial.fact 2)
            , TestCase $ assertEqual "Test Factorial.fact 3" 6 (Factorial.fact 3)
            , TestCase $ assertEqual "Test Factorial.fact 4" 24 (Factorial.fact 4)
            , TestCase $ assertEqual "Test Factorial.fact 5" 120 (Factorial.fact 5)
            ]
