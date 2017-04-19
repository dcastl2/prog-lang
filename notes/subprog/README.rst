Subprograms
===========

Terminology
-----------

A **subprogram** is collection of statements.  There are two types of
subprograms: functions and procedures.  A **function** is a subprogram which
returns a value, whereas a **procedure** is a subprogram which does not return
a value.  Subprograms, by definition, must be called by other programs.  The
calling program is called the **caller**, and the called subprogram is called
the **callee**.

Subprograms have the following properties:

 * There is a single point in the subprogram which program control enters at
 when the subprogram is called.  This point is called the **entry point**, and
 is normally before the first statement of the subprogram.

 * The caller is suspended while callee is **active**, i.e. has begun execution
 and has yet to finish.  This implies that there can only be one subprogram
 running at a time.  To handle the caller suspension, each callee is pushed
 onto a function stack.  The function stack therefore holds in bottom-up order
 all functions in the order in which they where called. 

 * Control returns to caller when callee is finished.  This corresponds to the
 popping off of the callee function from the function stack.


A **subprogram call** is a statement which explicitly requests the execution of
a subprogram.  A **subprogram definition** is the total definition of the
subprogram, including name, return type, parameter list, and collection of
statements to be executed.  

A **subprogram header** is the first part of the subprogram definition, which
includes the name, return type, and parameter list.  If the subprogram is a
function, the header is called the **function signature**.  A **parameter
profile** contains the number, order, and type of its formal parameters.  

The **protocol** of a subprogram is the paramter profile plus the return type
(if a function).  Subprograms can have declarations as well as definitions.  In
the C/C++ languages, function declarations are also called **prototypes**.

A subprogram may have a name or no name (an **anonymous subprogram**).  A
subprogram which has the same name as another in the same referencing
environment is known as an **overloaded subprogram**.   By contrast, a
**generic subprogram** is one whose computation can be done on different data
types in different calls.

In the Python language, functions can be *executed* in a manner similar to
variable initialization statements.  Only when the definitions are encountered
is the function name bound to the function contents.

.. code:: python

  if x > 0:
    def inc(x):
      return x+1


Parameters
----------

There are two ways to make data available to functions: either as nonlocal
variables, or as parameters.  Even functions can be passed as parameters.

The parameters in the subprogram header are called **formal parameters**.
We know these as simply *parameters*.  The paramters in the subprogram
call are known as **actual parameters**.  We also call these *arguments*.

The mapping of actual paramters to formal parameters is typically done by
position, in which case the parameters are called **positional parameters**.
Some languages instead use **keyword parameters**, in which the actual
parameters are specified using keywords, however these are not mutually
exclusive:

.. code:: python
   
   def sum(lo, hi):
     s = 0
     for i in range(lo, hi+1):
       s = s + i
     return s

   print sum(hi=3, lo=10)


Formal parameters can also have default values in certain languages. If no
acual parameter is passed, the default value is assumed.  Formal parameters
with default values are typically listed last, so that in the subprogram call,
the required formal parameters must be supplied (positionally, if not specified
by keyword).

 .. code:: python
   
   def sum(hi, lo=1):
     return (hi*(hi+1))/2 - (lo*(lo-1))/2


Procedures and Functions
------------------------

Functions return values; procedures do not.  

Functions are modeled on mathematical functions in that they accept arguments
and return values.  If a function in a programming language is faithful to the
mathematical model of a function, it produces no **side effects**, or
alterations of data outside of its local variables or return value.  Such a
function is said to be a **pure function**.  A language whose functions are by
design only pure, is known as a **pure language**.

Most languages are impure, since they allow functions to have side effects.
Side effects can include reading from a file (which changes the position
pointer in kernel space), writing to the screen (which manipulates a device),
or manipulating a global variable.  Many of the most useful instructions render
functions impure.  Why is purity then desirable?  One reason is that it lends
to mathematical reasoning about programs; certain proofs for program
correctness may be borrowed from mathematics, and programs do not need to be
checked for "weird" side effects that may influence their results.  In
addition, it ensures that certain optimization tasks, such as factoring a
statement out of a loop, do not produce unintended effects.  

It is also a requirement for **lazy evaluation**, or call-by-need, in which
evaluation of functions or function arguments are delayed for as long as
possible until needed.  It is this lazy evaluation that makes assignments
from infinite lists possible in the Haskell language.

Procedures can alter data in one of two ways.  First, procedures can alter the
values of variables which are visible within the scope of the callee and the
caller.  Second, if the procedure has parameters that allow the transfer of
data back to the caller, the data can be changed.


Parameter passing
-----------------

There are three ways in which paramters can be passed:

  * **in mode**: the subprogram can receive data from the actual parameters, 
    but cannot transmit it to the actual paramters;

  * **out mode**: the subprogram can transmit data to the actual parameters, 
    but cannot receive it from the actual paramters;

  * **inout mode**: the subprogram can both receive and transmit data to the
    actual parameters. 


Likewise, there are two models of how transfers can take place:

  * *By copy*. An actual value is copied, either to the caller or to the
    callee.  When the callee executes, it executes on the copy.  In out mode, 
    the callee copies its local value to the caller's actual paramter.

  * *By reference*. An **access path** is transmitted.  An access path is an 
    indirect means of refering to the data.  Most commonly, a pointer or a 
    reference is passed.


 Following this, there are five distinct paramter passing models:

   * **Pass-by-value**.  The value of the actual parameter is used to
     initialize the corresponding formal parameter, which then acts as
     a local variable for the subprogram.  Pass-by-value is in-mode 
     parameter passing, implemented by copy.  It is fast, but requires
     storage for the formal paramters.

   * **Pass-by-result**.  The subprogram computes a value and stores it
     in the formal parameter, which is then copied back to the actual
     parameter.  It uses out-mode parameter passing, implemented by copy.
     It is fast, but also requires storage for the actual parameter, which
     must be a variable.  Actual parameter collisions are possible with
     pass-by-result.

   * **Pass-by-value-result**.  The value of the actual paramter is
     used to initialize the corresponding formal parameter, which is
     then manipulated by the subprogram and is copied back to the actual
     parameter upon return from the function.  It is sometimes called
     **pass-by-copy**.  It uses inout-mode paramter passing, implemented
     by copy.  It has all the advantages and disadvantages of both
     pass-by-value and pass-by-result.

   * **Pass-by-reference**. This model uses inout-mode parameter passing,
     implemented by passing an access path.  This allows for indirect
     manipulation of data.  It is slower than pass-by-copy because
     indirect addressing is required.  It can also create aliases (different
     names of references to the same data), which can be confusing. 

   * **Pass-by-name**. This model uses inout-mode parameter passing, and
     no specific implementation model (if anything, it is modeled after
     call-by-name in the lambda calculus).  All instances of formal
     paramters are textually substituted by the actual parameter. 


