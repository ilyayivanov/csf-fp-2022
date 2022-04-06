module S08 where

-- Объявление реализации по умолчанию:
class Describable a where
    describe :: a -> String
    describe x = "<Unknown term>"

-- Наследование реализации по умолчанию:
data Dummy = D1 | D2
instance Describable Dummy

data SixSidedDie = S1 | S2 | S3 | S4 | S5 | S6

-- Пример наследования реализации по умолчанию из стандартной библиотеки:
instance Eq SixSidedDie where
    (==) S1 S1 = True
    (==) S2 S2 = True
    (==) S3 S3 = True
    (==) S4 S4= True
    (==) S5 S5 = True
    (==) S6 S6 = True
    (==) _ _ = False

-- В данном примере унаследована реализация оператора (/=), имеющая вид: (/=) x y = not $ (==) x y

-- Пример наследования реализаций по умолчанию классов с пустым минимальным множеством имплементаций:
data MyNumber = One | Two | Three | Four | Five deriving (Show, Eq, Ord)

-- По умолчанию deriving-синтаксис возможен только для библиотечных классов, обладающих пустым минимальным множеством имплиментаций.
-- Класс Describable обладает пустым минимальным множеством имплементаций, однако для него нельзя использовать deriving-синтаксис, поскольку он не является библиотечным:
-- data Dummy = D1 | D2 deriving Describable -- Ошибка компиляции

-- Добавление директивы {-# LANGUAGE DeriveAnyClass #-} позволяет снять это ограничение.
