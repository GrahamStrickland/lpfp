module Ch05.Cycle where

import GHC.Stack (HasCallStack)

cycle' :: HasCallStack => [a] -> [a]
cycle' xs = concat (repeat xs)
