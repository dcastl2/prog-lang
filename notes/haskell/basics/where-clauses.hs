
heron :: Float -> Float -> Float -> Float
heron a b c = sqrt( s * (s-a) * (s-b) * (s-c) )
              where s = ((a+b+c) / 2)


main = do 
       print (heron 3 4  5)
       print (heron 6 8 10)
