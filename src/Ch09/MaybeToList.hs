module Ch09.MaybeToList where

maybeToList :: Maybe a -> [a]
maybeToList x = case x of
    Just y -> [y]
    Nothing -> []
