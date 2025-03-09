type R = Double

expList :: R -> [R]
expList x = [(1.0 + x / n) ** n | n <- [1..]]

calcMinErr :: R -> R -> Int
calcMinErr x eps = abs (exp x - expList x)
