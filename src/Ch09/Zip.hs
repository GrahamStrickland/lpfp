module Ch09.Zip where

zip' :: ([a], [b]) -> [(a,b)]
zip' = uncurry zip
