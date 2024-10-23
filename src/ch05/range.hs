range :: Int -> [Int]
range x = if x >= 0
          then [0..x]
          else [x..0]
