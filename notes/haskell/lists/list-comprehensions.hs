primes :: [Int]
primes = sieve [2..] 

sieve :: [Int] -> [Int]
sieve (p:xs) = p : sieve [x | x <-xs, (mod x p) > 0]
-- 2 3 4 5 6 7 8 9 10 11 12 13
-- ^   x   x   x    x     x
-- 2 3   5   7   9    11    13
--   ^           x
-- 2 3   5   7        11    13
--       ^
-- ...

main = do

       let y = [x*x | x <- [1..], x*x < 100]
       print (take 8 y) 
       putStrLn ""

       let y = (take 5 primes)
       print y
       putStrLn ""

       -- zip returns a list of 2-tuples from 2 lists
       let f = [ a+b | (a,b) <- zip (1:f) (0:1:f) ]
       print (take 10 f)
       putStrLn ""
       -- 1 1 2 3 5
       -- 0 1 1 2 3 5
       -- ___________
       -- 1 2 3 5 8


       -- mapping function to generated list
       let y = (map (/10.0) [0.0..10.0])
       print (map (sin) y)
       putStrLn ""
