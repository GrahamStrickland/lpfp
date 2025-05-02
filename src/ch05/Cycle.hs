module Ch05.Cycle where

import GHC.Stack (HasCallStack)

cycle' :: forall a. HasCallStack => [a] -> [a]
cycle' xs = concat (repeat xs)
