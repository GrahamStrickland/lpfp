sndItem :: [a] -> a
sndItem ys = if length ys == 0 
           then error "Empty list has no second element"
           else (if length ys== 1 
                then error "1-item list has no 2nd item."
                else ys !! 1)
