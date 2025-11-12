module Main where

import Ch02Test (ch02Tests)
import Ch05Test (ch05Tests)
import Test.HUnit

main :: IO ()
main = do
    putStrLn "Running LPFP Test Suite..."
    testCounts <-
        runTestTT $
            TestList
                [ ch02Tests
                , ch05Tests
                ]
    putStrLn $ "Tests completed: " ++ show testCounts
    return ()
