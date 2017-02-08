Semantics
=========

Operational Semantics
---------------------

Operational semantics is interested in execution of the code.  At its highest
level, it is concerned with the result of the computation.  This is called
**natural operational semantics**.  At its lowest level, it is concerned with
state changes the program undergoes as each statement is executed.  This is
called **structural operational semantics**.  Operational semantics involves
finding an intermediate language to clearly express the constructs of the
higher language.

::

  for (i=0; i<=n; i++)              i=0
      sum += i;                     loop:
                                    if i<=n:
                                       goto end
                                    sum = sum + i
                                    i = i + 1
                                    goto loop
                                    end:
                                       return sum
                                      

Consider, for example, a C-style for-loop.  The operational semantics for this
code may be expressed in an intermediate language using goto and if statements.
A virtual machine, or a human reader, then executes the code and produces the
result.  This exposes the step-by-step process of computing the result, hence
it is called *operational semantics*.  Above is a specific case; however the
semantics may be generalized, as below:

::

  for (init; cond; upd)             init 
      body                          loop:
  outside                           if cond:
                                       goto end
                                    body         
                                    upd      
                                    goto loop
                                    end:
                                       outside

Denotational Semantics
----------------------

**Denotational semantics** is a rigorous formal method for describing programs.
It is called denotational semantics because it provides a specification for
entities within programs.  The specification consists of a mathematical object
and a function for mapping the language entity onto the mathematical object.
Denotational semantics is not concerned with step-by-step computation as
operational semantics is. 

All functions have a domain and range, and the mapping functions are no
exception. In denotational semantics, the domain is called the **syntactic
domain**, and the range is called the **semantic domain**.

::

  <bin> -> '0' 
         | '1' 
         | <bin> '0' 
         | <bin> '1'


                       <bin>
                      /     \ 
                   <bin>    '0'
                  /     \
                <bin>   '1'
                  |
                 '1'


Consider the above grammar for parsing binary numbers and the parse tree for
the binary number ``110``. Denotational semantics can be used to evaluate
``110`` as an integer value. 

::

  M('0') = 0
  M('1') = 1
  M(<bin> '0') = 2 * M(<bin>)
  M(<bin> '1') = 2 * M(<bin>) + 1

In the above example, the syntactic objects are mapped to the set of natural
numbers.  For example ``'0'`` indicates the binary number, but the function
``M('0')`` maps this to the decimal 0.  The parse tree above can be decorated
with applications of the denotational semantics rules.


Axiomatic Semantics
-------------------

**Axiomatic semantics** specifies what can be proven about a program. It is
used for program verification and semantics specification.  There is no model
of the state of a machine.  In each axiomatic semantic proof, there is a
precondition, a statement, and a postcondition, such that the pre- and
post-conditions must hold true.  These specify the meaning of a statement.

An **assertion** is a logical expression on variables in a program which must
hold true.  There are two types: **preconditions**, which must hold true before
execution of a statement, and **postconditions**, which must hold true
following execution.  

For programs in which the postconditions are given, the precondition can be
calculated. For example, consider the following statement and postcondition:

::

  y = 2 * x + 4  {y > 10}

To find the precondition, we substitute the RHS of the statement into the LHS
of the postcondition.  That is, we use algebra to find the inequality for x
which must hold true for the postcondition to hold true once the statement
has finished executing.

::

  2 * x + 4 > 10
  2 * x > 6
  x > 3

Thus the semantics of the statement may be specified as follows.  Axiomatic
semantics for a statement are generally given in the form ``{P} S {Q}``, where
``P`` is the precondition, ``S`` is the statement, and ``Q`` is the
postcondition.  This particular notation is called a **Hoare triple**.  Note
that ``x > 3`` is not the strongest possible precondition.  ``x > 4`` would
also guarantee the postcondition.  It is the **weakest precondition** because
it is the least restrictive precondition that guarantees the postcondition.

::

  {x > 3}  y = 2 * x + 4  {y > 10}

Proofs of programs are done by specifying the program statements and a
postcondition which must hold be end of program execution.  Proofs often
proceed such that the precondition of statement n is the postcondition of
statement n-1.  The preconditions of statements are calculated backwards
through the program until the beginning.  If these preconditions hold,
the program has been proven correct.

In constructing these proofs, we are aided by **inference rules**, which allow
us to infer the truth of one assertion based on the truths of other assertions.
To prove the correctness of a statement, either an inference rule or axiom must
exist for that statement.  The general form of assertions is as follows:

::

   S1, S2, ..., SN
   _______________
          S

Here, ``S1, S2, ..., SN`` is the **antecedent**, and ``S`` is the
**consequent**.  Inferences without antecedents are called **axioms**,
because they may be assumed to be true.

Assignment Statements
---------------------

A certain notation is used for assignment statements.  Suppose ``P`` is the
precondition, ``Q`` is the postcondition, ``x`` is a variable, and ``E`` is the
RHS of an assignment statement.  Then the notation below indicates that ``P``
is computed as ``Q`` with all instances of ``x`` replaced by ``E``.  It is
a form of substitution:

::

  P = Qx->E

For example, if we have the statement and postcondition below, we substitute
the expression on the RHS into the postcondition to algebraically solve for the
inequality in ``x``.

::

  y = 2 * x + 1  {y > 9}

  2 * x + 1 > 9
  2 * x > 8
  x > 4

  {x > 4}  y = 2 * x + 1  {y > 9}


Solving for the precondition, we have the axiomatic semantics for this
statement.  By the above formula for the precondition of an assignment
statement, general axiomatic semantics for assignment statements is 
``{Qx->E} x = E {Q}``.


Rule of Consequence
-------------------

Suppose we were trying to find the precondition for the following, which has a
slightly weaker postcondition:

::

  {x > 4} y = 2 * x + 1  {y > 10}

This is valid, because ``y > 10`` implies ``y > 9``, which is the strongest
possible postcondition for the precondition ``x > 4``.  However to prove it,
we require the **rule of consequence**:

::

  {P} S {Q}, P' => P, Q => Q'
  ___________________________
          {P'} S {Q'}

The symbol ``=>`` means *implies*.  For example ``P'`` implies ``P`` if
whenever ``P'`` is true, ``P`` is true.  The rule of consequence expresses
the notion that postconditions can always be weakened and preconditions
can always be strengthened. 

We have already found that ``{x > 4} y = 2 * x + 1  {y > 10}`` is valid,
so our ``P`` is ``x > 4``, ``S`` is ``y = 2 * x + 1``, and ``Q`` is
``x > 9``.  The Hoare triple in the consequent has precondition
``x > 4``, which is our ``P'``, and postcondition ``x > 10``, which is
``Q'``.  

We must show that ``P' => P`` and ``Q => Q'``.  Clearly ``x > 4`` implies ``x >
4``. Also ``y > 9`` implies ``y > 10``. Putting it all together:

::

  {x > 4} y = 2 * x + 1  {y > 9}, {y > 4} => {y > 4}, {y > 9} => {y > 10}
  _______________________________________________________________________
                   {x > 4} y = 2 * x + 1  {y > 10}


Rule of Sequence
-----------------

The rule of sequence can be expressed as follows:

::

  {P1} S1 {P2}, {P2} S2 {P3}
  __________________________
      {P1} S1, S2 {P3}


Example problem:

::

  y = 3 * x + 1
  x = y + 3
  {x > 10}

Here the postcondition is ``{x > 10}``.  Working out the precondition requires
``{x > 6}``. This provides the postcondition for the statement ``y = 3 * x +
1``.  Working out the precondition here requires as the final postcondition ``x > 1``.
Hence we have the Hoare triple

::

  {x > 1}  y = 3 * x + 1;  x = y + 3  {x > 10}

and the intermediate condition ``{x > 6}``.


Rule of Selection
-----------------

Selection statements take the form ``if B then S1 else S2``.

::
  
  {B and P} S1 {Q}, [(not B) and P] S2 {Q}
  ________________________________________
        {P} if B then S1 else S2 {Q}


Consider the selection structure

::

  if x > 0 then
    y = y + 1
  else 
    y = y + 1

Suppose we have the postcondition ``{y > 0}``. We must then find the
weakest precondition out of the following:

::

  y = y + 1  {y > 0}
  y = y - 1  {y > 0}


For ``y = y + 1  {y > 0}`` it is ``{y > -1}``, and for ``y = y - 1  {y > 0}``
it is ``{y > 1}``. The weaker of these two is ``{y > 1}``, since if we allow
only ``{y > -1}``, such as in a ``y`` value of ``0``, we will violate the
postcondition.


Logical Pretest Loops
---------------------

For the case of loops, we seek something called a **loop invariant**, which
is a condition that remains true through subsequent iterations of the loop.
The loop invariant must be true before, during, and after execution of the
loop.

::

           {I and B} S {I}
  ____________________________________
  {I} while B do S end {I and (not B)}


For example, consider the following loop:

::

  while y != x do y = y + 1 end {y = x}

Now we wish to find the precondition, which is the loop invariant.  We seek
something which remains true throughout.

What we can do is successively find the weakest precondition of the loop
postcondition and the loop statement.  We may use a function *wp(statement,
postcondition)* to do so.  Such a function is known as a **predicate
transformer** because it accepts a predicate and statement and returns a
predicate.

::

  wp(y = y + 1, {y = x})     = {y = x - 1}
  wp(y = y + 1, {y = x - 1}) = {y = x - 2}
  ...

Evidently the condition ``{y < x}`` satisfies during iterations of the
loop, but we must combine this with the postcondition ``{y = x}``, which
yields ``{y <= x}``.


Program Proofs
--------------

The proof of a program requires the application of rules backwards from
the post-condition.

::

  {n > 1}
  s = 0
  i = 1
  while i<=n 
  do 
    s = s + i
    i = i + 1 
  end 
  {s = 1+2+...+n}


In this more complicated example of a loop for summation, our postcondition
holds that s should be the sum of numbers 1 to n inclusive.  We seek the loop
invariant.  But first, let us have a look at the loop condition.  ``{B}`` is
``{i <= n}``, therefore ``(not {B})`` is ``{i > n}``.  Consider then

::

  i = i + 1 {i > n}

According to the rule of assignment, on the last iteration the precondition
``{i > n - 1}`` would need to be satisfied, so we have ``{i > n - 1} i = i + 1
{i > n}``.  It can be shown also that ``{i = n} i = i + 1 {i = n + 1}``, and
clearly ``{i = n + 1}``  implies ``{i > n}``.  ``i`` does not appear on the LHS
of any other expression of the loop, so it is safe to conclude that ``{i = n +
1}`` is the strongest postcondition which violates ``{B}``.

Let us examine the compound statement ``s = s + i; i = i + 1`` on the final
iteration of the loop.

::

  s = s + i; i = i + 1 {i = n + 1, s = 1+2+...+n}

From the above, we have

::

  s = s + i; {i = n} i = i + 1 {i > n, s = 1+2+...+n}

Then letting ``{s = 1+2+...+n}`` be also a postcondition for the statement ``s = s +
i``, we can deduce that:

::

  {s = 1+2+...+n-1} s = s + i {i = n}   i = i + 1 {i = n+1, s = 1+2+...+n)   
  {s = 1+2+...+n-2} s = s + i {i = n-1} i = i + 1 {i = n,   s = 1+2+...+n-1)   
  ...

In the first of these we may substitute ``i = n``:

::

  {s = 1+2+...+i-1, i = n - 1} s = s + i {i = n - 1} i = i + 1 {i = n,   s = 1+2+...+i-1)   
  {s = 1+2+...+i-1, i = n - 2} s = s + i {i = n - 2} i = i + 1 {i = n-1, s = 1+2+...+i-1)   
  ...

So it appears our loop invariant is ``{s = 1+2+...+i-1}``. Let us check to see
if it qualifies as a loop precondition:

::

  {s = 0, i = 1} s = s + i {i = 1}  i = i + 1 {i = 2, s = 1+...+i-1)   

Thus the invariant ``s = 1+...+i-1`` holds after, during, and prior to the
loop.  Therefore we have

::

    
        {s = 1+2+...+i-1} s = s + i; i = i + 1 {s = 1+2+...+i-1}
  ____________________________________________________________________________
  {n > 1, s = 0, i = 1} while i<=n do s = s + i; i = i + 1 end {s = 1+2+...+n}
