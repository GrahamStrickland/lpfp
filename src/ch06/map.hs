map' :: (a -> b) -> [a] -> [b]
map' fn as = [fn a | a <- as]
