trim :: [Char] -> [Char]
trim []                 = []
trim (x:xs) | x == ' '  = trim(xs)
            | otherwise = [x] ++ trim(xs)

main = do

       let u = "foo bar baz"
       putStrLn (trim u)

