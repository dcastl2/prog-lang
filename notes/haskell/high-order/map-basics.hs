main = do
       print ( map (+3)   [1, 2, 3] )
       print ( map (*3)   [1, 2, 3] )
       print ( map ((-)3) [1, 2, 3] )
       print ( map (/0)   [2, 4, 6] )
