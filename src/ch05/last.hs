import GHC.Stack (HasCallStack)

last' :: HasCallStack => [a] -> a 
last' x = head (reverse x)
