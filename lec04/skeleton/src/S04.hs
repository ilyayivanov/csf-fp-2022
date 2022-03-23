module S04 where

-- Неоптимальная реализация подсчета n-го члена последовательности Фибоначчи без использования хвостовой рекурсии (последний оператор в вычсилении – сложение, а не вызов самой рекурсивной функции):
fibonacci 1 = 1
fibonacci 2 = 1
fibonacci n = fibonacci n + fibonacci (n - 1)

-- Чтобы сделать реализацию оптимальной, нужно использовать аккумуляторы:
fibonacciImpr n =
    helper n 0 1
    where
        helper n acc1 acc2
            | n == 0 = acc1
            | n == 1 = acc2
            | otherwise = helper (n - 1) acc2 (acc1 + acc2)
