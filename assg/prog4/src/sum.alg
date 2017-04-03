function integer sum (integer n):
  integer count
  integer accumulator <- 0
  for count from 1 to n in steps of 1:
      accumulator <- accumulator + count
  return accumulator

call sum(10)
