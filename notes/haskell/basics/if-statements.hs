odd :: Int -> Bool
odd n = if (mod n 2) == 0 then False
        else True

main = do 
       print (Main.odd 1)
       print (Main.odd 2)
       print (Main.odd 3)
       print (Main.odd 4)
