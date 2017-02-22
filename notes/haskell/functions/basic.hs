g :: (Float -> Float) -> Float -> Float
g f x = (f x) + 1.0

f :: Float -> Float
f x = x**2

main = do print (g f 2)
