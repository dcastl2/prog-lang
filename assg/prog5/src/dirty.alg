function 
integer sum (integer n):
  integer count; integer 
    accumulator <- 
    0;
  for count 
    from 1 
    to n 
    in steps of  1:
accumulator <- accumulator + count;
  return 
    accumulator;

function 
integer 
fib (
  integer n
):
  if n == 0 
   or 
     n == 1:
    return 1;
  otherwise: return fib(n-1) + fib(n-2);


call fib(5);
call sum(10);
