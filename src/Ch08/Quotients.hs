module Ch08.Quotients where

quotEqualsDiv :: (Integral a) => a -> a -> Bool
quotEqualsDiv m n = quot m n == div m n

remEqualsMod :: (Integral a) => a -> a -> Bool
remEqualsMod m n = quot m n == div m n

genPairs :: (Integral a) => a -> a -> a -> a -> [(a, a)]
genPairs firstStart secondStart firstLim secondLim = [(m, n) | m <- [firstStart .. firstLim], n <- [secondStart .. secondLim]]

getAllQuotEqualsDiv :: (Integral a) => a -> a -> [Bool]
getAllQuotEqualsDiv numerLim denomLim = [quotEqualsDiv m n | (m, n) <- genPairs (-numerLim) 1 numerLim denomLim]

getAllRemEqualsMod :: (Integral a) => a -> a -> [Bool]
getAllRemEqualsMod numerLim denomLim = [remEqualsDiv m n | (m, n) <- genPairs (-numerLim) 1 numerLim denomLim]
