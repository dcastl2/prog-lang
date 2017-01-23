
heron :: Float -> Float -> Float -> Float
heron a b c = let s = ((a+b+c) / 2)
              in sqrt( s * (s-a) * (s-b) * (s-c) )


main = do 
       print (heron 3 4  5)
       print (heron 6 8 10)
