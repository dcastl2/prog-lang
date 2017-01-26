main = do

       let x = [1, 2, 3, 4, 5]

       print (foldl (+) 0 x)
       print (foldr (+) 0 x)

       print (foldl (*) 1 x)
       print (foldr (*) 1 x)

       print (foldl (-) 1 x)
       print (foldr (-) 1 x)

       print (foldl (/) 1 x)
       print (foldr (/) 1 x)
