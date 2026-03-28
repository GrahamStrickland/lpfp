module Ch02Test where

import Test.HUnit
import qualified Ch02.First as First
import qualified Ch02.SinDeg as SinDeg

ch02Tests :: Test
ch02Tests = TestLabel "Chapter 2 Tests" $ TestList
    [ testCh02First
    , testCh02SinDeg
    ]

testCh02First :: Test
testCh02First =
    TestLabel "Ch02.First tests" $
        TestList
            [ TestCase $ assertEqual "Test First.square 4" 1 (First.square 1)
            , TestCase $ assertEqual "Test First.square 2" 4 (First.square 2)
            , TestCase $ assertEqual "Test First.square -3" 9 (First.square (-3))
            , TestCase $ assertEqual "Test First.cosSq 0" 1 (First.cosSq 0)
            , TestCase $ assertEqual "Test First.cosSq pi" 1 (First.cosSq pi)
            , TestCase $ assertEqual "Test First.cosSq' 0" 1 (First.cosSq' 0)
            , TestCase $ assertEqual "Test First.cosSq' pi" 1 (First.cosSq' pi)
            , TestCase $ assertEqual "Test First.cosSq'' 1" 1 (First.cosSq'' 0)
            , TestCase $ assertEqual "Test First.cosSq'' pi" 1 (First.cosSq'' pi)
            , TestCase $ assertEqual "Test First.cosSq''' 0" 1 (First.cosSq''' 0)
            , TestCase $ assertEqual "Test First.cosSq''' pi" 1 (First.cosSq''' pi)
            ]

testCh02SinDeg :: Test
testCh02SinDeg =
    TestLabel "Ch02.SinDeg tests" $
        TestList
            [ TestCase $ assertEqual "Test SinDeg.sinDeg 90" 1 (SinDeg.sinDeg 90)
            , TestCase $ assertEqual "Test SinDeg.sinDeg -90" (-1) (SinDeg.sinDeg (-90))
            ]
