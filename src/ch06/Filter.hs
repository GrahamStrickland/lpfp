module Ch06.Filter where

filter' :: (a -> Bool) -> [a] -> [a]
filter' predicate as = [a | a <- as, predicate a]
