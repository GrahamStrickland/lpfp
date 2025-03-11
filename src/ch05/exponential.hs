type R = Double

expList :: R -> [R]
expList x = [(1.0 + x / n) ** n | n <- [1 ..]]

expErr :: R -> R -> R
expErr x approx = abs (exp x - approx)

listExpErr :: [R] -> R -> [R]
listExpErr es x = [expErr x e | e <- es]

withinTolerance :: [R] -> R -> Bool
withinTolerance xs eps = last xs < eps

calcMinExpErr :: Int -> R -> R -> Int
calcMinExpErr n x eps =
  if withinTolerance (take n (listExpErr (expList x) x)) eps
    then n
    else calcMinExpErr (n + 1) x eps
