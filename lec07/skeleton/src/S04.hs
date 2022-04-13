module S04 where

-- Пример: вычисление расстояния между двумя точками земного шара по географическим координатам
-- First add a dependency on containers module to import Data.Map:
-- executables:
--   monads-exe:
--     dependencies:
--       - containers

-- Then in the code:

import qualified Data.Map as Map

type LatLong = (Double, Double)

locationDB :: Map.Map String LatLong
locationDB = Map.fromList [
        ("Arkham", (42.6054, -70.7829)),
        ("Innsmouth", (42.8250, -70.8150)),
        ("Carcosa", (29.9714, -90.7694)),
        ("New York", (40.7776, -73.9691))
    ];

-- Для вычисления расстояния между двумя географическими точками используется функция гаверсинус:

toRadians :: Double -> Double
toRadians degrees = degrees * pi / 180
latLongToRads :: LatLong -> (Double,Double)
latLongToRads (lat,long) = (rlat,rlong)
    where
        rlat = toRadians lat
        rlong = toRadians long

haversine :: LatLong -> LatLong -> Double
haversine coords1 coords2 = earthRadius * c
    where
        (rlat1, rlong1) = latLongToRads coords1
        (rlat2,rlong2) = latLongToRads coords2
        dlat = rlat2 - rlat1
        dlong = rlong2 - rlong1
        a = (sin (dlat/2))^2 + cos rlat1 * cos rlat2 * (sin (dlong/2))^2
        c = 2 * atan2 (sqrt a) (sqrt (1-a))
        earthRadius = 3961.0

-- locationDB возвращает сведения о координатах географическо точки по ее названия в виде Maybe:
newYorkCoord = Map.lookup "New York" locationDB
voronezhCoord = Map.lookup "Voronezh" locationDB

-- Координаты находятся в контексте Maybe, поэтому для применения гаверсинуса к ним необходима специальная версия функции:
haversineMaybe :: Maybe LatLong -> Maybe LatLong -> Maybe Double
haversineMaybe Nothing _ = Nothing
haversineMaybe _ Nothing = Nothing
haversineMaybe (Just val1) (Just val2) = Just (haversine val1 val2)

-- Такие специальные версии функций пришлось бы писать для каждой функции, работающей с координатами.
-- Однако Maybe реализует класс Applicative, с помощью которого этого можно избежать:

carcosaCoord = Map.lookup "Carcosa" locationDB

-- Выполним частичное применение гаверсинуса в контексте с помощью функтора:
distFromNewYorkToX = haversine <$> newYorkCoord

-- Получаем каррированную функцию в контексте Maybe, которую затем с помощью аппликатива можно применить к значению в том же контексте:
distFromNewYourToCarcosa = distFromNewYorkToX <*> carcosaCoord

-- Приведенную цепочку можно записать в одну строку:
dist2 = haversine <$> newYorkCoord <*> carcosaCoord

-- Аналогичную технику можно применять для создания данных в контексте:
data User = User {
    name :: String,
    gamerId :: Int,
    score :: Int
};

-- Напомним, что есть два способа создания значений введенного типа:
u1 = User {name = "Tom", gamerId = 1, score = 99}
u2 = User "Mike" 2 85
-- т.е. data-constructor User определяет функцию трех переменных
-- User :: String -> Int -> Int -> User

-- Предположим, что данные пользователей считываются последовательно из базы дынных:
dataFromDB = [
        (Just "Kyle", Just 5, Just 70),
        (Just "Robbie", Just 6, Nothing)
    ];

createUser :: (Maybe String, Maybe Int, Maybe Int) -> Maybe User
createUser (userName, gamerId, score) = User <$> userName <*> gamerId <*> score

users = mapMaybe createUser dataFromDB;
