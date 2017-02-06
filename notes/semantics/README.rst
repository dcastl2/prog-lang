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
  M(<bin> '0') = 2 * M(<bin>) + 1

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


Rule of Inference
-----------------

Suppose we were trying to find the precondition for the following, which has a
slightly weaker postcondition:

::

  {x > 4} y = 2 * x + 1  {y > 10}

This is valid, because ``y > 10`` implies ``y > 9``, which is the strongest
possible postcondition for the precondition ``x > 4``.  However to prove it,
we require the **rule of inference**:

::

  {P} S {Q}, P' => P, Q => Q'
  ___________________________
          {P'} S {Q'}

The symbol ``=>`` means *implies*.  For example ``P'`` implies ``P`` if
whenever ``P'`` is true, ``P`` is true.  The rule of inference expresses
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
