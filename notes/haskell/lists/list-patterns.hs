myMaximum :: [Int] -> Int
myMaximum (x:[]) = x
myMaximum (x:xs) = if x > myMaximum(xs) then x
                   else   myMaximum(xs)


main = do print (myMaximum [2, 3, 11, 5, 7])
