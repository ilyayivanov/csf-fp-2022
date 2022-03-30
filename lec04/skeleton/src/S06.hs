module S06 where

-- map
-- Применение преобразования к каждому элементу списка. Результат – список из элементов, соответствующих результатам преобразований.
m1 = map snd [(1, 'a'), (2, 'b'), (3, 'c')]
m2 = map reverse ["abc", "d", "defghi"]
m3 = map ("a " ++) ["train","plane","boat"]

-- filter
-- Отбрасывание элементов списка, не удовлетворяющих предикату
f1 = filter odd [1 .. 10]
f2 = filter (\s -> head s == 'b') ["angle", "bread", "square", "ball"]

-- foldl
-- Свертка слева
fld1 = foldl (+) 0 [1,2,3,4]

sumOfSquares xs = foldl (+) 0 (map (^2) xs)

-- Сравнение foldl и foldr:
fld2 = foldl (-) 0 [1, 2, 3, 4]
fld3 = foldr (-) 0 [1, 2, 3, 4]
