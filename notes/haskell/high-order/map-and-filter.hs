
isComposite :: Int -> Int -> Bool
isComposite n 1 = False
isComposite n m = if ((mod n m) == 0) then True
                  else (isComposite n (m-1))


isPrime :: Int -> Bool
isPrime 0 = False
isPrime 1 = False
isPrime n = not (isComposite n (n-1))


primes :: Int -> [Int]
primes 0 = []
primes n | (isPrime n) = primes(n-1) ++ [n]
         | otherwise   = primes(n-1) ++ [ ]


main = do 
       print (primes 10)
       print ( map    (isPrime) [1,2,3,4,5,6,7,8,9,10] )
       print ( filter (isPrime) [1,2,3,4,5,6,7,8,9,10] )

-- The filter function takes in a function which accepts a type
-- (of the list to follow) and returns a Bool.  The filter function
-- will return those elements of the list for which the given function
-- returns True.
