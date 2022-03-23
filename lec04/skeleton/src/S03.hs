module S03 where

groupBy3 (-1) = "Minus One !!!"
groupBy3 n
    | n `mod` 3 == 0 = "First group"
    | n `mod` 3 == 1 = "Second group"
    | otherwise = "Third group"

-- Можно использовать постопределение:
avgGrade x
    | y >= 0.9 = 'A'
    | y >= 0.8 = 'B'
    | y >= 0.7 = 'C'
    | y >= 0.59 = 'D'
    | y < 0.59 = 'F'
    where y = x / 100
