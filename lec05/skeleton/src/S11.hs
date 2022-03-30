module S11 where

data Student = Stdnt String String String Int Int String
std1 = Stdnt "Antonov" "Petr" "Vyacheslavovich" 102973 2 "2.2"

-- Часто конструктору типа и конструктору данных для типа-произведения присваивают одинаковые имена:
data Vehicle = Vehicle String String Double Int
