bagFee :: Bool -> Int
bagFee checkingBags = if checkingBags then 100 else 0

bagFee2 :: Bool -> Int
bagFee2 True = 100
bagFee2 False = 0
