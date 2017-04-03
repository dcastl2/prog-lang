module Encrypt where 

import Data.Char


base :: Char -> Int 
base c = case generalCategory c of
         LowercaseLetter -> (ord 'a')
         UppercaseLetter -> (ord 'A')
         _               -> 0


numlet :: Char -> Int
numlet c = (ord c) - (base c)


addchar :: Char -> Char -> Char
addchar a b = (chr ((mod ((numlet a) + (numlet b)) 26) + (base a)))


rotate :: Char -> Int -> Char
rotate c n = addchar c (chr ((ord 'a')+n))


sub :: [Char] -> Int -> Char -> [Char]
sub l n c = (take (n) l) ++ [c] ++ (drop (n+1) l)


xencrypt :: [Char] -> Int -> [Char] -> [Char]
xencrypt x n h | n >= (length h) = h
               | otherwise = xencrypt x (n+1) (sub h n c)
                 where c = (rotate (h!!n) (y+(numlet (x!!m))+n))
                       m = (mod n (length x))
                       y | n > 0 = (numlet (h!!(n-1)))
                         | otherwise = 0


encrypt :: [Char] -> [Char]
encrypt x = xencrypt x 0 h
            where h = (take 16 (repeat 'a'))

