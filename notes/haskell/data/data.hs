import List
import Stack
import Queue
import Tree

main = do

      let l = (List 2 (List 3 (List 5 (List 7 List.Nil))))
      putStrLn "==============================================="
      putStrLn "The list: "
      print l
      putStrLn "\nAfter insertion:"
      print (List.insert l 6)
      putStrLn "\nCreating list with insertion:"
      print (List.insert List.Nil 6)
      putStrLn ""

      let s = (Stack 2 (Stack 3 (Stack 5 (Stack 7 Stack.Nil))))
      putStrLn "==============================================="
      putStrLn "The stack: "
      print s
      putStrLn "\nAfter pop:"
      print (fst (pop s))
      putStrLn "\nAfter push:"
      print (push s 1)
      putStrLn "\nCreating with push:"
      print (push Stack.Nil 2)
      putStrLn ""


      let q = (Queue 2 (Queue 3 (Queue 5 (Queue 7 Queue.Nil))))
      putStrLn "==============================================="
      putStrLn "The queue: "
      print q
      putStrLn "\nAfter enqueue:"
      print (enqueue q 1)
      putStrLn "\nAfter dequeue:"
      print (fst (dequeue q))
      putStrLn "\nCreating with enqueue:"
      print (enqueue Queue.Nil 4)
      putStrLn ""


      let t = (Tree 7 (Tree 5 (Tree 2 Tree.Nil Tree.Nil) (Tree 3 Tree.Nil Tree.Nil)) (Tree 11 Tree.Nil Tree.Nil))
      putStrLn "==============================================="
      putStrLn "The tree: "
      print t
      putStrLn "\nAfter insertion: "
      print (Tree.insert t 13)
