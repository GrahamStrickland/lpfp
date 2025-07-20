module Ch10.MyMaybe where

data MyMaybe a = MyNothing
               | MyJust a
               deriving (Eq,Show)
