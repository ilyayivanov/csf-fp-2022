module Shop where

getCoordinates shopNetName district city = [(1, 2), (3, 4)]

magnitCoordinates = getCoordinates "Magnit"

stroginoMagnitCoordinates = magnitCoordinates "Strogino"

trueGetCoords city district shopNetName = [(1, 2), (3, 4)]
