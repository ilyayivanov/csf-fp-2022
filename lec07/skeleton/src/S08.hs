module S08 where

-- Оператор >>: работа с монадой IO
echoVerbose :: IO ()
echoVerbose =
    putStrLn "It's a not very useful function demonstrating monad's operators chaining" >>
    putStrLn "Enter a String and we'll echo it!" >>
    getLine >>= putStrLn

main :: IO ()
main = echoVerbose

-- Выполнив stack exec <project-name>-exe, получим приглашение к вводу из функции echoVerbose

-- Еще один пример с IO:
askForName :: IO ()
askForName = putStrLn "What is your name?"

nameStatement :: String -> String
nameStatement name = "Hello, " ++ name ++ "!"

helloName :: IO ()
helloName = askForName >>
    getLine >>=
    (\name -> return (nameStatement name)) >>=
    putStrLn
