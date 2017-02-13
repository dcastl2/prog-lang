import Vector

main = do
       let u = (Vector 2 3)
       let v = (Vector 5 4)
       print (add u v)
       print (Vector.subtract u v)
       print (distance u v)
