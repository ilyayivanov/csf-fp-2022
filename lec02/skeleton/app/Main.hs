module Main where

import Lib

main :: IO ()
main = someFunc

simple x = x

calcChange owed given =
    if given > owed
    then given - owed
    else 0

calcChangeImproved owed given =
    if change > 0 && val == 1
    then change
    else 0
    where
        change = given - owed
        val = 1

pSumSquareOrSquareSum x y =
    let sumSquare = (x ^ 2 + y ^ 2)
        squareSum = (x+ y) ^ 2
    in
        if sumSquare > squareSum
            then sumSquare
            else squareSum

ifEven n doThis =
    if even n
        then doThis n
        else n
