module Ch06Test where

import qualified Ch06.Geq as Geq
import qualified Ch06.Predicate as Predicate
import qualified Ch06.Squares as Squares
import Test.HUnit

ch06Tests :: Test
ch06Tests =
    TestLabel "Chapter 6 Tests" $
        TestList
            [ testCh06Geq
            , testCh06Predicate
            , testCh06Squares
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
