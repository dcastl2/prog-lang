module Vector where

data Vector = Vector {
                    x :: Float,
                    y :: Float
                   } deriving (Eq)


instance Show Vector where
 show (Vector x y) = concat[      "<",
                            (show x), 
                                  ",", 
                            (show y),
                                  ">"
                          ]


distance :: Vector -> Vector -> Float
distance (Vector x1 y1) (Vector x2 y2) = sqrt $ (x2 - x1)^2 + (y2 - y1)^2

add :: Vector -> Vector -> Vector
add (Vector x1 y1) (Vector x2 y2) = (Vector (x1+x2) (y1+y2))

subtract :: Vector -> Vector -> Vector
subtract (Vector x1 y1) (Vector x2 y2) = (Vector (x1-x2) (y1-y2))
