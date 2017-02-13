module Tree where

data Tree = Nil
          | Tree {  key   :: Int,
                    left  :: Tree,
                    right :: Tree
                 }  deriving (Eq)


instance Show Tree where
 show  Nil                = ""
 show (Tree x Nil    Nil) = concat[ "(", (show x), ")" ]
 show (Tree x left   Nil) = concat[ "(", (show x), ")",
                            " l ", (show left), " u" ]
 show (Tree x Nil  right) = concat[ "(", (show x), ")",
                            " r ",   (show right), " u" ]
 show (Tree x left right) = concat[ "[", (show x), "]",
                            " l ",   (show left), 
                            " u r ", (show right),
                            " u" ]


insert :: Tree -> Int -> Tree
insert  Nil  x               = (Tree x Nil Nil)
insert (Tree y left right) x = if (x <= y) then (Tree y (insert left x) right)
                               else             (Tree y left (insert right x))

sum :: Tree -> Int
sum Nil                 = 0
sum (Tree x left right) = x + (Tree.sum left) + (Tree.sum right)
