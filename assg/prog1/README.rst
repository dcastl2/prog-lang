Homework 1
==========

Select 64 points worth or problems.

**Note**: You must supply a Makefile and a run.sh script with this assignment
so that they may be graded efficiently [-32].  Your Makefile should compile
your code; your run.sh script should run your codes.  Include a clean rule in
your Makefile.  Submit only your sources, Makefile, and run.sh.

All code files must have main functions which clearly and adequately
demonstrate the use of your other function(s).  Your main function should serve
as proof that your other function(s) work.

You are free to write auxiliary functions for any of these.  You will need to
do so for some of them.  You are also free to use any of the functions in
Prelude.  However, you can't make calls library function that do all of the
work for you (like calling Statistics.median from inside your median function).

You can earn +N points of extra credit for submitting the assignment N<=4
days in advance of the due date.


1. Calculating Euler's number.
     [8] Write the function ``euler :: Float`` to calculate Euler's number
     using the infinite series formula for its calculation.  Approximate using
     a finite series, with your final n value of 100.  Call this ``euler.hs``.


2. Calculating pi.
     [8] Write the function ``pi :: Float`` to calculate pi using the
     Nilakantha series.  Use 100 terms of the series. Call this ``pi.hs``.


3. Obtaining the nth prime number.
     [8] Write the function ``prime :: Int -> Int`` which accepts an integer n
     and returns the nth prime number.  Call this ``prime.hs``


4. Determining if a list is sorted.
     [8] Write the function ``sorted :: [Int] -> Bool`` which accepts an
     integer list and returns True if it is in ascending sorted order, False
     otherwise.  Call this ``sorted.hs``.


5. Digit-wise reversal of an integer. 
     [16] Write the function ``reverse :: Int -> Int`` which reverses the
     digits of an integer. For example (reverse 2357) should return 7532.  Call
     this ``reverse.hs``.


6. Finding the median of a list of integers. 
     [16] Write the function ``median :: [Int] -> Int`` to calculate the median
     of an array of integers.  Call this ``median.hs``


7. Finding the dot product of two vectors.
     [16] Write the function ``dot :: [Float] -> [Float] -> Float`` to
     calculate the dot product of two evenly-sized floating-point lists.  Call
     this ``dot.hs``.


8. Obtaining the left-rotations of a list.
     [16] Write the function ``lrotate :: [a] -> Int -> [a]`` to left-rotate a
     list by n elements.  A left rotation is a left shift.  The left-rotation
     of the list [2, 3, 5, 7, 11, 13] by 2 elements is [5, 7, 11, 13, 2, 3].
     Call this ``lrotate.hs``.


9. Generating all permutations of a list.
     [32] Write the function ``permute :: [a] -> [[a]]`` which produces all
     permutations of a list.  The generated permutations do not need to be in
     order.  Call this ``permute.hs``.

