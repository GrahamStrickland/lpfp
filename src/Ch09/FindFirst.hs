module Ch09.FindFirst where

findFirstMaybe :: (b -> Bool) -> [b] -> Maybe b
findFirstMaybe p xs = case dropWhile (not . p) xs of
    [] -> Nothing
    (x : _) -> Just x
