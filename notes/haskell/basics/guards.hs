odd :: Int -> Int
odd n | (mod n 2) == 0 = 0
      | otherwise      = 1

main = do 
       print (Main.odd 1)
       print (Main.odd 2)
       print (Main.odd 3)
       print (Main.odd 4)
