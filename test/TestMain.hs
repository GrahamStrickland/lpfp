module Main where

import Ch02Test (ch02Tests)
import Ch05Test (ch05Tests)
import Ch06Test (ch06Tests)
import Ch09Test (ch09Tests)
import Ch10Test (ch10Tests)
import Test.HUnit

main :: IO ()
main = do
    putStrLn "Running LPFP Test Suite..."
    testCounts <-
        runTestTT $
            TestList
                [ ch02Tests
                , ch05Tests
                , ch06Tests
                , ch09Tests
                , ch10Tests
                ]
    putStrLn $ "Tests completed: " ++ show testCounts
    return ()
