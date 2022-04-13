module S02 where

-- Веб-реквест сущности, который может закончиться неудачей:
data Entity = Entity {
    entityId :: Int,
    name :: String
  } deriving (Show)

requestEntity :: Int -> Maybe Entity
requestEntity id =
  if even id
    then
      Just Entity {
            entityId = id,
            name = "Some Entity"
          }
    else Nothing

-- Педположим есть список идентификаторов, по которому необходимо получить соответствующий список сущностей:
ids = [1 .. 20]
maybeEntities = map requestEntity ids

-- Для "распаковки" списка можно использовать фильтрацию и дополнительные преобразования списка:
justEntities = filter isJust maybeEntities;
entities = map fromJust justEntities

-- Однако существует стандартная функция mapMaybe, выполняющая необходимые преобразования:
entities2 = mapMaybe requestEntity ids
