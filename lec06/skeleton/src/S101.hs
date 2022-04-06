module S10 where

import Data.Semigroup

-- Списки образуют полугруппу по операции конкатенации:
ls1 = [1 .. 5] <> [6 .. 10]

-- Числа образуют полугруппу как по сложению, так и по умножению. Из-за этого возникает неоднозначность. Для ее преодоления существуют стандартные типы Sum и Product в модуле Data.Semigroup:
x1 = Sum 3
y1 = Sum 4
z1 = x1 <> y1
x2 = Product 3
y2 = Product 4
z2 = x2 <> y2

-- Пример неудачной попытки определения пользовательской полугруппы:
data Color = Red | Yellow | Blue | Green | Purple | Orange | Brown deriving (Show, Eq)
instance Semigroup Color where
    (<>) Red Blue = Purple
    (<>) Blue Red = Purple
    (<>) Yellow Blue = Green
    (<>) Blue Yellow = Green
    (<>) Yellow Red = Orange
    (<>) Red Yellow = Orange
    (<>) a b = if a == b
                      then a
                      else Brown

-- В данном примере не работает свойство ассоциативности:
c1 = (Green <> Blue) <> Yellow
c2 = Green <> (Blue <> Yellow)
