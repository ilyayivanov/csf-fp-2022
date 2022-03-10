module Ops where

x = 1
y = 2
z = x + y

func a b = a * b

res1 = func 2 3
res2 = 2 `func` 3

res3 = 2 * 3
res4 = (*) 2 3

twoMultiplyBy = (*) 2

twoMultiplyByV2 = (2 *)

twoMultiplyByV3 = (* 2)

powerOfTwo = (2 ^)

toPowerTwo = (^ 2)
