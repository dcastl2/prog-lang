main = do
       let x = [ (1,2), (3,4), (4,5) ]
       print (unzip x)
       print (fst (unzip x))
       print (snd (unzip x))
