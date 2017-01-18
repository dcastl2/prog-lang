sum :: Int -> Int
sum n | n==1      = 1
      | otherwise = n+Main.sum(n-1)

main = print (Main.sum 10)
