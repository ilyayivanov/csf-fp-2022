module S09 where

type FirstName = String
type LastName = String
type Age = Int
type Height = Double
type Weight = Double
type Patient = (FirstName, LastName, Age, Height, Weight)

firstName :: Patient -> FirstName
firstName (fName, _, _, _, _) = fName

height :: Patient -> Height
height (_, _, _, h, _) = h

p1 :: Patient
p1 = ("Ivan", "Sidorov", 20, 185.6, 80)
p2 = ("Petr", "Sergeev", 21 :: Int, 183.0, 75.0) -- К этому значению также применимы функции fName, height, хотя его тип не объявлен эксплицитно как Patient
