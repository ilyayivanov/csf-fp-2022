module S12 where

-- Примеры варежений-типов:
data Sum1 = Sum11 | Sum12 | Sum13
data Sum2 = Sum21 | Sum22
data Sum3 = Sum31 | Sum32 | Sum33 | Sum34
data ProdOfSum = ProdOfSum Sum1 Sum2 Sum3
data Prod1 = Prd1 Int Bool Double
data Prod2 = Prd2 String (Bool, Double)
data SumOfProd = Dat1 | Dat2 Prod1 String | Dat3 String Prod2

-- В данном случае эти выражения представляют собой сущности более высокого порядка, чем выражения над значениями

-- Реальный пример составного алгебраического типа с вложенной структурой – тип крови:
data RhType = Pos | Neg
data ABOType = A | B | AB | O
data BloodType = BloodType ABOType RhType

-- Пример со списком – пользовательским типом с параметром:
data CustomList a = Nil | Cons a (CustomList a) -- Рекурсивное определени типа

l1 :: CustomList Int
l1 = Cons 1 (Cons 2 (Cons 3 (Cons 4 Nil)))
l2 :: CustomList Int
l2 = Cons 1 $ Cons 2 $ Cons 3 $ Cons 4 Nil

-- Сопоставление с образцом работает в том числе и для пользовательских алгебраических типов:
cHead :: CustomList a -> a
cHead Nil = error "Empty list"
cHead (Cons x tail) = x

cTakeRev :: Int -> CustomList a -> CustomList a
cTakeRev n list = helper n list Nil
    where
        helper 0 _ acc = acc
        helper _ Nil acc = acc
        helper m (Cons x tail) acc = helper (m - 1) tail (Cons x acc)

-- Бинарное дерево:
data BTree a = Empty | Leaf a | Node a (BTree a) (BTree a)
b1 :: BTree Int
b1 = Node 10 (Node 6 (Node 3 Empty (Leaf 5)) (Leaf 8)) (Leaf 16)

depth :: BTree a -> Int
depth Empty = 0
depth (Leaf n) = 1
depth (Node x l r) = 1 + max (depth l) (depth r)
