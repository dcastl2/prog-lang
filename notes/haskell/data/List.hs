module List where

data List = Nil
          | List {  key   :: Int,
                    next  :: List
                 }  deriving (Eq)


instance Show List where
 show Nil = ""
 show (List key Nil)  = (show key)
 show (List key next) = concat[
                            (show key),
                            ", ",
                            (show next)
                          ]


insert :: List -> Int -> List
insert  Nil x          = (List x Nil)
insert (List y next) x = if x < y then (List x (List y next))
                         else (List y (insert next x))


sum :: List -> Int
sum Nil             = 0
sum (List x next) = x + (List.sum next)


max :: List -> Int
max (List x Nil)  =  x
max (List x next) | (x > remainder) = x
                  | otherwise       = remainder
                    where remainder = List.max(next)
