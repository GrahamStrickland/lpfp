module Ch06.Repeat where

repeat' :: a -> [a]
repeat' = iterate id
