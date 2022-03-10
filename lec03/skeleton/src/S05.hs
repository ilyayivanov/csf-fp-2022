module S05 where

ifEven f n =
    if even n
        then f n
        else n
inc n = n + 1
double n = n * 2
square n = n ^ 2

ifEvenInc n = ifEven inc n
ifEvenDouble n = ifEven double n
ifEvenSquare n = ifEven square n

buildIfEven f = (\x -> ifEven f x)

ifEvenInc2 = buildIfEven inc
ifEvenDouble2 = buildIfEven double
ifEvenSquare2 = buildIfEven square

buildIfEven2 f = ifEven f

buildIfEven3 = ifEven

ifEvenInc3 = ifEven inc
ifEvenDouble3 = ifEven double
ifEvenSquare3 = ifEven square
