module Ch06.IntStrBool where

import Data.Char

intStringBool :: Int -> String -> Bool
intStringBool n cs = case cs of
                [] -> False
                (c:cs) -> ord c == n || intStringBool n cs
