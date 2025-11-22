module Ch09Test where

import qualified Ch09.Factorial as Factorial
import qualified Ch09.Fibonacci as Fibonacci
import qualified Ch09.MaybeToList as MaybeToList
import qualified Ch09.Pick13 as Pick13
import qualified Ch09.SafeHead as SafeHead
import qualified Ch09.ToTriple as ToTriple
import qualified Ch09.Zip as Zip
import Test.HUnit

ch09Tests :: Test
ch09Tests =
    TestLabel "Chapter 9 Tests" $
        TestList
            [ testCh09SafeHead
            , testCh09MaybeToList
            , testCh09Zip
            , testCh09Fibonacci
            , testCh09Factorial
            , testCh09Pick13
            , testCh09ToTriple
            ]

testCh09SafeHead :: Test
testCh09SafeHead =
    TestLabel "Ch09.SafeHead tests" $
        TestList
            [ TestCase $ assertEqual "Test SafeHead.headSafe []" (Nothing :: Maybe Int) (SafeHead.headSafe [])
            , TestCase $ assertEqual "Test SafeHead.headSafe [1]" (Just 1) (SafeHead.headSafe [1])
            , TestCase $ assertEqual "Test SafeHead.headSafe [1,2]" (Just 1) (SafeHead.headSafe [1, 2])
            , TestCase $ assertEqual "Test SafeHead.headSafe [1,2,3]" (Just 1) (SafeHead.headSafe [1, 2, 3])
            ]

testCh09MaybeToList :: Test
testCh09MaybeToList =
    TestLabel "Ch09.MaybeToList tests" $
        TestList
            [ TestCase $ assertEqual "Test MaybeToList.maybeToList (Just 1)" [1] (MaybeToList.maybeToList (Just 1))
            , TestCase $ assertEqual "Test MaybeToList.maybeToList Nothing" [] (MaybeToList.maybeToList (Nothing :: Maybe Int))
            ]

testCh09Zip :: Test
testCh09Zip =
    TestLabel "Ch09.Zip tests" $
        TestList
            [ TestCase $ assertEqual "Test Zip.zip' ([1,2,3], [\"Albert\",\"Isaac\",\"James\"])" [(1, "Albert"), (2, "Isaac"), (3, "James")] (Zip.zip' ([1, 2, 3], ["Albert", "Isaac", "James"]))
            ]

testCh09Fibonacci :: Test
testCh09Fibonacci =
    TestLabel "Ch09.Fibonacci tests" $
        TestList
            [ TestCase $ assertEqual "Test take 10 Fibonacci.fibonacci" [1, 1, 2, 3, 5, 8, 13, 21, 34, 55] (take 10 Fibonacci.fibonacci)
            ]

testCh09Factorial :: Test
testCh09Factorial =
    TestLabel "Ch09.Factorial tests" $
        TestList
            [ TestCase $ assertEqual "Test Factorial.fact 0" 1 (Factorial.fact 0)
            , TestCase $ assertEqual "Test Factorial.fact 1" 1 (Factorial.fact 1)
            , TestCase $ assertEqual "Test Factorial.fact 2" 2 (Factorial.fact 2)
            , TestCase $ assertEqual "Test Factorial.fact 3" 6 (Factorial.fact 3)
            , TestCase $ assertEqual "Test Factorial.fact 4" 24 (Factorial.fact 4)
            , TestCase $ assertEqual "Test Factorial.fact 5" 120 (Factorial.fact 5)
            , TestCase $ assertEqual "Test Factorial.fact 6" 720 (Factorial.fact 6)
            , TestCase $ assertEqual "Test Factorial.fact 7" 5040 (Factorial.fact 7)
            , TestCase $ assertEqual "Test Factorial.fact 8" 40320 (Factorial.fact 8)
            , TestCase $ assertEqual "Test Factorial.fact 9" 362880 (Factorial.fact 9)
            ]

testCh09Pick13 :: Test
testCh09Pick13 =
    TestLabel "Ch09.Pick13 tests" $
        TestList
            [ TestCase $ assertEqual "Test take 10 Pick13.pick13 [(1, 2, 3), (2, 4, 6)]" [(1.0, 3.0), (2.0, 6.0)] (Pick13.pick13 [(1, 2, 3), (2, 4, 6)])
            , TestCase $ assertEqual "Test take 10 Pick13.pick13' [(1, 2, 3), (2, 4, 6)]" [(1.0, 3.0), (2.0, 6.0)] (Pick13.pick13' [(1, 2, 3), (2, 4, 6)])
            ]

testCh09ToTriple :: Test
testCh09ToTriple =
    TestLabel "Ch09.ToTriple tests" $
        TestList
            [ TestCase $ assertEqual "Test ToTriple.toTriple ((3, 4), 5)" (3, 4, 5) (ToTriple.toTriple ((3, 4), 5))
            ]
