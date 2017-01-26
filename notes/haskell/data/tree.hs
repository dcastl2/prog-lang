import Tree

main = do

--       let t = (Tree 7 
--                 (Tree 5 
--                    (Tree 2 Nil Nil) 
--                    (Tree 3 Nil Nil) 
--                 )
--                 (Tree 13
--                    (Tree 11 Nil Nil)
--                    (Tree 17 Nil Nil)
--                 )
--              )
--

      let t = (Tree 7 (Tree 5 (Tree 2 Nil Nil) (Tree 3 Nil Nil)) (Tree 11 Nil Nil))

      print t
