module Ch09.SafeHead where

headSafe :: [a] -> Maybe a
headSafe ys = case ys of
    [] -> Nothing
    (x : _) -> Just x
