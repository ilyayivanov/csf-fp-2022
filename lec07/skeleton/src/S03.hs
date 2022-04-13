module S03 where

-- Пример фукнтора – список. В качестве оператора <$> выступает функция map.

-- Возьмем предыдущий пример с Entity и предположим, есть представление этого типа в виде
data EntityView = EntityView {
    entityViewId :: Int,
    entityViewName :: String
} deriving (Show)

-- Тогда для преобразования списка из Entity в список из EntityView можно использовать функтор:
toEntityView :: Entity -> EntityView
toEntityView entity = EntityView {
    entityViewId = entityId entity,
    entityViewName = entityName entity
}

entityViews = toEntityView <$> entities
