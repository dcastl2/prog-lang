integral :: (Float -> Float) -> Float -> Float -> Float -> Float
integral f d a b = if a >= b then 0
                   else (f a) + (integral f (f a) (a + d) b)

f :: Float -> Float
f x = x**2

main = do print (integral f 0.01 0.0 1.0)
