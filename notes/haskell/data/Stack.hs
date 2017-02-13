module Stack where

data Stack = Nil
           | Stack {  key   :: Int,
                      next  :: Stack
                   }  deriving (Eq)


instance Show Stack where
 show Nil = ""
 show (Stack key Nil)  = concat["[ ", (show key), " ]"]
 show (Stack key next) = concat[
                            "[ ",
                            (show key),
                            " ]\n",
                            (show next)
                          ]

peek :: Stack -> Int
peek  Nil           = -1 
peek (Stack x next) =  x

pop :: Stack -> (Stack, Int)
pop  Nil        = (Nil, -1)
pop (Stack x s) = (s,    x)

push :: Stack -> Int -> Stack
push  Nil        x = (Stack x     Nil    )
push (Stack y s) x = (Stack x (Stack y s))
