add :: (Float, Float) -> (Float, Float) -> (Float, Float)
add (x1,y1) (x2,y2) = (x1+x2, y1+y2)

distance :: (Float, Float) -> (Float, Float) -> Float
distance (x1,y1) (x2,y2) = sqrt((x2-x1)^2 + (y2-y1)^2)

main = do
       let x = (2, 3)
       let y = (5, 4)
       print (distance x y)
       print (add x y)
