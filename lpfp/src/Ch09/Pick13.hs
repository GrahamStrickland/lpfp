module Ch09.Pick13 where

type R = Double

pick13 :: [(R,R,R)] -> [(R,R)]
pick13 triples = map (\(x1,_,x3) -> (x1,x3)) triples

pick13' :: [(R,R,R)] -> [(R,R)]
pick13' triples = [(x_1,x_3) | (x_1,_,x_3) <- triples]
