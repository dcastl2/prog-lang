function integer fib (integer n):
  if n == 0 or n == 1:
    return 1
  otherwise:
    return fib(n-1) + fib(n-2)

call fib(5)
