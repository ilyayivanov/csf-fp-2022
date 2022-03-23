module S02 where

-- Паттерн-матчинг при помощи case:
sayAmountX n =
    case n of
        1 -> "one"
        2 -> "two"
        x -> "a bunch of " ++ (show x) ++ " size"

-- Если в последнем образце нас не интересует значение аргумента, то можно использовать местозаместитель:
sayAmountGen n =
    case n of
        1 -> "one"
        2 -> "two"
        _ -> "a bunch"

-- Аналогичного эффекта можно достичь путем частичного определения функции на конкретных значениях аргумента:
sayAmount 1 = "one"
sayAmount 2 = "two"
sayAmount _ = "a bunch"

-- Сопоставление аргумента с образцом происходит в том порядке, в котором они определены в исходном коде.
sayAmountR 1 = "one"
sayAmountR 2 = "two"
sayAmountR x = "some value"
sayAmountR 3 = "three"
-- В данном примере определение в 3й строке перекрывает определение в 4й строке.

-- При паттерн-матчинге следует учитывать, что функция должна быть определена на всех возможных комбинациях значений аргументов. Не выполнение этого правила приведет к исключению в программе при вызове функции на том наборе аргументов, на котором она не определена:
sayAmountBad 1 = "one"
sayAmountBad 2 = "two"

s = sayAmountBad 3
-- исключение возникает только в момент вычисления

-- Паттерн-матчинг работает с «разбором» различных структур данных-контейнеров:
getFirst (a, b) = a
getSecond (a, b) = b

-- [] - empty list
getHead (x : xs) = x -- x : xs сопоставляется только с непустым списком!
getHead _ = error "No head for empty list"

getTail (x : xs) = xs
getTail _ = error "No tail for empty list"

isEmpty [] = True
isEmpty _ = False
