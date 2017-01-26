quicksort :: [Int] -> [Int]
quicksort [] = []
quicksort (x:xs) = quicksort(filter (<=x) xs) 
                        ++ [x] ++ 
                   quicksort(filter (>x)  xs) 

main = do
       let x = [2, 7, 3, 11, 5, 13]
       print (quicksort x)
