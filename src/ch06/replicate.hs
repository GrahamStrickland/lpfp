replicate' :: Int -> a -> [a]
replicate' n x = take n (repeat x)
