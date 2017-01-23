fib :: Int -> Int
fib 0 = 1
fib 1 = 1
fib n = fib(n-1) + fib(n-2)

fibs :: Int -> [Int]
fibs 1 = [1]
fibs n = fibs(n-1) ++ [ fib(n) ]

main = do print (fibs 10)
