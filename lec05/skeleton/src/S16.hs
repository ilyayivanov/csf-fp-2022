module S16 where

type FirstName = String
type LastName = String
type MiddleName = String

data Name = Name FirstName LastName
    | NameWithMiddle FirstName MiddleName LastName

data Gender = Mail | Femail

data RhType = Pos | Neg
data ABOType = A | B | AB | O
data BloodType = BloodType ABOType RhType

data PatientData = PatientData {
    name :: Name,
    gender :: Gender,
    age :: Int,
    pHeight :: Double,
    pWeight :: Double,
    bloodType :: BloodType
}

data PatientDataDesugared = PatientDataDesugared Name Gender Int Double Double BloodType

pd1 = PatientData {
    name = Name "Alice" "Braun",
    gender = Femail,
    age = 25,
    pHeight = 165.3,
    pWeight = 62.0,
    bloodType = BloodType AB Pos
}

n1 = name pd1
h1 = pHeight pd1
