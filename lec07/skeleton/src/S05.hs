module S05 where

-- Пример помещения функции в контекст:
functorPlus = (6 +) <$> Just 5
applicativePlus = pure (6 +) <*> Just 5
