module Tree where

data Tree = Nil
          | Tree {  key   :: Int,
                    left  :: Tree,
                    right :: Tree
                 }  deriving (Eq)


instance Show Tree where
 show Nil = ""
 show (Tree x left right) = concat[
                            (show x),
                            " {",
                            (show left), 
                            " ",
                            (show right),
                            "}"
                          ]

sum :: Tree -> Int
--sum (Tree x left  Nil ) = x + (Tree.sum left) 
--sum (Tree x Nil  right) = x + (Tree.sum right) 
sum Nil                 = 0
sum (Tree x left right) = x + (Tree.sum left) + (Tree.sum right)
