module Ch06.Map where

map' :: (a -> b) -> [a] -> [b]
map' fn as = [fn a | a <- as]
