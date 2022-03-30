module S08 where

makeTriple :: a -> b -> c -> (a, b, c)
makeTriple xa xb xc = (xa, xb, xc)

concats :: [[a]] -> [a]
concats xss = foldl (++) [] xss

concatsImpr :: [[a]] -> [a]
concatsImpr = foldl (++) []
