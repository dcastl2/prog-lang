module Queue where

data Queue = Nil
           | Queue {  key   :: Int,
                      next  :: Queue
                   }  deriving (Eq)


instance Show Queue where
 show Nil = ""
 show (Queue key next) = concat[
                            "-> [",
                            (show key),
                            "] ",
                            (show next)
                          ]


enqueue :: Queue -> Int -> Queue
enqueue Nil x         = (Queue x Nil)
enqueue (Queue y q) x = (Queue x (Queue y q))


dequeue :: Queue -> (Queue, Int)
dequeue Nil           = (Nil, -1)
dequeue (Queue x Nil) = (Nil, x)
dequeue (Queue x q)   = ( (Queue x (fst p)),  (snd p) )
                        where p = dequeue(q)
