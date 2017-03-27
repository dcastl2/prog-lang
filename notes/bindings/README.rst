Names
-----

Names are also known as identifiers.  There are certain rules for every
language governing names.

A **keyword** is a word of a programming language which assumes a special
meaning in a certain context.  A **reserved word** is a word which cannot be
used as a name.  For some languages, all keywords are reserved words.


Variables
---------

A variable can be defined as a sextuple: (name, address, value, type, lifetime,
scope).  

  * The name is simply the variable's identifier, as discussed above.

  * The **address** is also known as the variable's **l-value**, or left-hand
    side value, because it is required of the variable for assignment.  This
    address is the address at which the variable is stored in memory.  If 
    more than two names are used to refer to the same address, these names
    are known as **aliases**.

  * The **value** is also known as the variable's **r-value**, or right-hand
    side value, because it is required of the right-hand side of an 
    assignment.  This is made possible by pointers.

  * The **type** determines the range of values that the variable can store;
    for example, int, float, boolean, etc.


Bindings
--------


A **binding** is an association between an entity and its attribute, such as a
binding between variable and its type, or a variable and its storage location.
The time at which a binding takes place is known as the **binding time**.  For
example, in the C statement:

::

  cats = cats * 5;

The type of ``cats`` is bound at compile time, as is the meaning of the ``+``
operation.  However the meaning of ``5`` and the set of posssible values of
``cats`` is determined at compiler design time.  The value of ``cats`` is
determined at runtime.

Variable bindings
-----------------

A binding is **static** if it occurs before runtime and remains the same
throughout runtime. If a binding is able to change during runtime, it is
called **dynamic**. 

Bindings may be explicit or implicit.  If **explicit** it is explicitly
specified by the programmer, otherwise if it is determined by conventions or by
the context of the program, it is **implicit**.  If it is determined by the
program context, the compiler or interpreter makes what is known as a **type
inference** to determine the type of the variable.

In dynamic type binding, the type of a variable is subject to change.  Type is
determined by the type of the RHS expression in an assignment statement.  The
address may likewise be dynamically bound, since different types require
different storage capacities. 

The main advantage of dynamic type binding is program flexibility.  It is not
necessary to know the types of the data to process before writing the program,
and variable names can be re-used.  The main disadvantage is the overhead of
dynamic type binding.  Also, dynamic type binding may be error-prone, since no
error messages are generated upon type changes.


Lifetime
--------

Taking a certain amount of memory from an available pool of memory for the
purpose of storing a variable is known as **allocation**.  Releasing the memory
back to the pool from an unbound variable is called **deallocation**.  

The **lifetime** of a variable is the amount of time a variable is bound to
a specific location.  Variables are classified based upon lifetimes.  These
are: static, stack-dynamic, explicit heap-dynamic, and implicit heap-dynamic.


Static variables
----------------

**Static variables** are bound to specific locations before program execution
begins and remain until the end of program execution.

The main advantage of the use of static variables is efficiency.  They use
direct addressing, which is faster than the indirect addressing which
dynamically-allocated variables must use.  There is no run-time overhead 
for allocation and deallocation of such variables.

The main disadavantage is reduced flexibility.  A program using only static
variables cannot support recursive subprograms (which require dynamic allocation
on a stack). 

Static variables are **history sensitive**, meaning they retain their values
between re-uses of a subprogram.


Stack-dynamic variables
-----------------------

**Stack-dynamic variables** are those variables whose bindings are created when
their declaration statements are elaborated, but whose types are statically
bound.  **Elaboration** refers to the binding processes which take place during
run-time, when control flow reaches the declaration statement.  Such variables
are deallocated when control flow exits the subprogram.

The main advantage is support for recursive subprograms. The main disadvantage
is the overhead due to allocation and deallocation during run-time, slower
accesses due to indirect addressing, and the fact that subprograms cannot be
history-sensitive. 



Explicit heap-dynamic variables
-------------------------------

**Explicit heap-dynamic variables** are those variables which are allocated on
the heap explicitly.  In C++, which would be any variable which is allocated
using the ``new`` keyword; or in C, any memory allocated with the ``malloc``
family of functions.

The main advantage of such variables is their use in creating more advanced
data structures, such as lists and stacks.  The main disadvantage is the
error-prone nature of pointer usage, cost of referencing variables, and
complexity of the heap storage mechanism.


Implicit heap-dynamic variables
-------------------------------

**Implicit heap-dynamic variables** are bound to heap storage only when they
are assigned values.  This is typical for array initializations.

The advantage of such variables is that they allow for a high degree of
flexibility.  The main disadvantages include the run-time overhead of
maintaining the dynamic attributes of the variable, and the loss of
compiler-generated type error messages.



