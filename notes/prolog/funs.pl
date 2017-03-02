% Summation from A to B in steps of 1.
sigma(A,A,A).
sigma(A,B,N) :-
  B>A,
  A1 is A+1,
  sigma(A1,B,N1),
  N is A+N1.


% Factorial.
factorial(0,1).
factorial(A,B) :- 
   A > 0, 
   Ax is A - 1,
   factorial(Ax,Bx), 
   B is A * Bx.


% Fibonacci sequence.
fib(0, 0).
fib(1, 1).
fib(X, Y) :- 
   X > 1, 
   X1 is X-1,
   X2 is X-2,
   fib(X1, Y1),
   fib(X2, Y2),
   Y is Y1 + Y2.


golden(1, 1).
golden(X, Y) :-
  X1 is X-1,
  G is golden(X1),
  Y is 1.0 + 1.0 / (1.0 + G).


%use_module(library(clpfd)).
%
%isprime(N) :-
%  \+ iscomposite(N).
%
%iscomposite(N) :-
%  N #= A*B,
%  [A,B] ins 2..sup.



