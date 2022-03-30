module S05 where

x :: Int
x = 5

lengthOfLists :: [[a]] -> [Int]
lengthOfLists = map length

squareSum :: Double -> Double -> Double
squareSum a b = (a + b) ^ 2
