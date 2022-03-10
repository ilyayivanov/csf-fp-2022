module S18 where

import Data.List

author = ("Will", "Kurt")
name = fst author
lastName = snd author

names = [("Ian", "Curtis"),
    ("Bernard","Sumner"),
    ("Peter", "Hook"),
    ("Stephen","Morris")]

namesSorted = sort names

compareLastNames name1 name2 =
    if lastName1 > lastName2
        then GT
        else if lastName1 < lastName2
                then LT
                else EQ
    where
        lastName1 = snd name1
        lastName2 = snd name2

sortedNames = sortBy compareLastNames names
