module Ch06.Predicate where

greaterThanOrEq7 :: Int -> Bool
greaterThanOrEq7 n = if n >= 7 then True else False

lt10 :: Int -> Bool
lt10 n = n < 10

hasMoreThan6Elements :: [a] -> Bool
hasMoreThan6Elements xs = length xs > 6
