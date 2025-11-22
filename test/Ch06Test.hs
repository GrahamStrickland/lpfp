module Ch06Test where

import qualified Ch06.Average as Average
import qualified Ch06.Filter as Filter
import qualified Ch06.Geq as Geq
import qualified Ch06.Map as Map
import qualified Ch06.Predicate as Predicate
import qualified Ch06.Repeat as Repeat
import qualified Ch06.Replicate as Replicate
import qualified Ch06.Squares as Squares
import Test.HUnit

ch06Tests :: Test
ch06Tests =
    TestLabel "Chapter 6 Tests" $
        TestList
            [ testCh06Geq
            , testCh06Predicate
            , testCh06Squares
            , testCh06Repeat
            , testCh06Replicate
            , testCh06Map
            , testCh06Filter
            , testCh06Average
            ]

testCh06Geq :: Test
testCh06Geq =
    TestLabel "Ch06.Geq tests" $
        TestList
            [ TestCase $ assertEqual "Test Geq.greaterThanOrEq7' 10" True (Geq.greaterThanOrEq7' 10)
            , TestCase $ assertEqual "Test Geq.greaterThanOrEq7' 7" True (Geq.greaterThanOrEq7' 7)
            , TestCase $ assertEqual "Test Geq.greaterThanOrEq7' 5" False (Geq.greaterThanOrEq7' 5)
            ]

testCh06Predicate :: Test
testCh06Predicate =
    TestLabel "Ch06.Predicate tests" $
        TestList
            [ TestCase $ assertEqual "Test Predicate.greaterThanOrEq7 10" True (Predicate.greaterThanOrEq7 10)
            , TestCase $ assertEqual "Test Predicate.greaterThanOrEq7 7" True (Predicate.greaterThanOrEq7 7)
            , TestCase $ assertEqual "Test Predicate.greaterThanOrEq7 5" False (Predicate.greaterThanOrEq7 5)
            , TestCase $ assertEqual "Test Predicate.hasMoreThan6Elements \"Hello, world!\"" True (Predicate.hasMoreThan6Elements "Hello, world!")
            , TestCase $ assertEqual "Test Predicate.hasMoreThan6Elements \"Hello\"" False (Predicate.hasMoreThan6Elements "Hello")
            , TestCase $ assertEqual "Test Predicate.hasMoreThan6Elements [1,2,3,4,5,6]" False (Predicate.hasMoreThan6Elements [1, 2, 3, 4, 5, 6])
            , TestCase $ assertEqual "Test Predicate.hasMoreThan6Elements [1,2,3,4,5,6,7]" True (Predicate.hasMoreThan6Elements [1, 2, 3, 4, 5, 6, 7])
            ]

testCh06Squares :: Test
testCh06Squares =
    TestLabel "Ch06.Squares tests" $
        TestList
            [TestCase $ assertEqual "Test take 10 Squares.first1000Squares" [1, 4, 9, 16, 25, 36, 49, 64, 81, 100] (take 10 Squares.first1000Squares)]

testCh06Repeat :: Test
testCh06Repeat =
    TestLabel "Ch06.Repeat tests" $
        TestList
            [TestCase $ assertEqual "Test take 10 (Repeat.repeat' 'x'" "xxxxxxxxxx" (take 10 (Repeat.repeat' 'x'))]

testCh06Replicate :: Test
testCh06Replicate =
    TestLabel "Ch06.Replicate tests" $
        TestList
            [TestCase $ assertEqual "Test Replicate.replicate' 3 'x'" "xxx" (Replicate.replicate' 3 'x')]

testCh06Map :: Test
testCh06Map =
    TestLabel "Ch06.Map tests" $
        TestList
            [TestCase $ assertEqual "Test Map.map' sqrt [1, 4, 9]" [1.0, 2.0, 3.0] (Map.map' sqrt [1, 4, 9])]

testCh06Filter :: Test
testCh06Filter =
    TestLabel "Ch06.Filter tests" $
        TestList
            [TestCase $ assertEqual "Test Filter.filter' (\n -> n < 10) [6, 4, 8, 13, 7]" [6, 4, 8, 7] (Filter.filter' (\n -> n < 10) [6, 4, 8, 13, 7])]

testCh06Average :: Test
testCh06Average =
    TestLabel "Ch06.Average tests" $
        TestList
            [TestCase $ assertEqual "Test Average.average [1.0, 2.0, 3.0]" 2.0 (Average.average [1.0, 2.0, 3.0])]
