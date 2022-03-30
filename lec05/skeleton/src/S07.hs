module S07 where

message = "Number " ++ show 15
sumRes = 15 + read "33"

fraction1 = 15 + read "0.33" -- Runtime Exception: no parse

fraction2 :: Double
fraction2 = 15 + read "0.33"
