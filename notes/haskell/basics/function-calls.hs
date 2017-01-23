
isComposite :: Int -> Int -> Bool
isComposite n 1 = False
isComposite n m = if ((mod n m) == 0) then True
                  else (isComposite n (m-1))


isPrime :: Int -> Bool
isPrime n = not (isComposite n (n-1))


main = do 
       print (isPrime 2)
       print (isPrime 3)
       print (isPrime 4)
       print (isPrime 5)
       print (isPrime 6)
