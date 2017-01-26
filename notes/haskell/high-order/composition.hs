timestwo :: Int -> Int
timestwo x = x*2

plusone :: Int -> Int
plusone x = x+1

squared :: Int -> Int
squared x = x*x

fun :: Int -> Int
fun = squared . timestwo . plusone 

main = do

       let y = (squared (timestwo (plusone 3)))
       print y

       let y = squared $ timestwo $ plusone 3
       print y -- Function application

       let y = (fun 3)
       print y -- Function composition
