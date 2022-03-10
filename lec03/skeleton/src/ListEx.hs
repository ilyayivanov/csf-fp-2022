module ListEx where

emptyList = []
singletonList = 1 : []
multipleElemsList = 1 : singletonList

multElems = 1 : 2 : 3 : 4 : []
multElems2 = 1 : (2 : (3 : (4 : [])))

list1 = [1, 2, 3, 4, 5]
list2 = 1 : 2 : 3 : 4 : 5 : []

list3 = (:) 0 list2

s = "abcdef"
chs = ['a', 'b', 'c', 'd', 'e', 'f']

s2 = 'a' : "bcdef"

list4 = list1 ++ list2

s4 = "abc" ++ "def"

l5 = (1 : 2 : 3 : []) ++ (4 : 5 : 6 : [])

l6 = [(1, 2), (2, 3)] ++ [(0, 0)]

gl1 = [1 .. 10]
gl2 = [0, 5 .. 100]
gl3 = [1, 5 ..]

getMyHead l = head l
infListHead = getMyHead gl3
