module Ch06.Filter where

filter' :: (a -> Bool) -> [a] -> [a]
filter' pred as = [pred a | a <- as]
