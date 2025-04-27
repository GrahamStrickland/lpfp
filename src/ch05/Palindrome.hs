module LPFP where
import Distribution.Simple.Utils

palindrome :: String -> Bool
palindrome s = reverse (lowercase s) == lowercase s 
