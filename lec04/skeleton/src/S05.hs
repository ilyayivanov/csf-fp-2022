module S05 where

-- length (demonstrate in REPL!)
-- Straightforward implementation:
myLength [] = 0
myLength xs = 1 + myLength (tail xs)
-- Implementation without library functions:
myLength2 [] = 0
myLength2 (x : xs) = 1 + myLength2 xs
-- Tail recursive implementation:
myLength3 xs = lengthHlp 0 xs
    where
        lengthHlp acc [] = acc
        lengthHlp acc (x : xs) = lengthHlp (acc + 1) xs

-- take (demonstrate in REPL!)
myTake _ [] = []
myTake 0 _ = []
myTake n (x : xs) = x : rest
    where rest = myTake (n - 1) xs

-- Tail recursive implementation:
myTake2 n xs = reverse $ takeHlp n xs []
    where
        takeHlp 0 _ acc = acc
        takeHlp _ [] acc = acc
        takeHlp n (x : xs) acc = takeHlp (n - 1) xs (x : acc)

-- Is there a way to eliminate reverse in the function above?

-- cycle (demonstrate in REPL!)
-- cycle ties a finite list into a circular one, or equivalently, the infinite repetition of the original list. It is the identity on infinite lists.
-- First attempt – to repeat the first element of the list:
finiteCycle (first : rest) = first : rest ++ [first]

-- To implement real cycle function we need to repeat actions taken in finiteCycle for rest ++ [first] argument:
myCycle (first : rest) = first : myCycle (rest ++ [first])
