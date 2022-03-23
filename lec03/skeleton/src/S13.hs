module S13 where

-- Рекурсивная функция, вычисляющая наибольший общий делитель:
myGCD a b =
    if remainder == 0
        then b
        else myGCD b remainder
    where remainder = a `mod` b
