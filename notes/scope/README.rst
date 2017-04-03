Scope
=====

The **scope** of a variable is the range of statements in which a variable is
visible.  A variable is **visible** to a statement if it can be referenced in a
statement.  A variable is **local** to a block if it is declared there.  A
variable is **global** if it is visible throughout the whole file.

Scope is spatial; it is over a range of statements.  Lifetime is temporal;
it is how long a variable is bound.

Static scoping
--------------

A language has a **static scope** if the scope of its variables can be
determined prior to execuation (at compile-time).

Languages which have static scoping may have programs with nested subroutines.
In that event, it may be in our interest to determine the scope of the
variables in those programs.  If subroutine A contains subroutine B, then A is
the **static parent** of B.  If subroutine B contains subroutine C, then A is
the **static ancestor** of C.  Note that the same terms are used of trees;
scope can be accommodated with a tree structure.

To find the scope of a variable which is not local, we look to the nearest
static ancestor of the variable.  Consider the following:

 .. code:: c

    void A() {
      int x = 2;
      void B() {
        int x = 3;
        void C() {
          int y = x;
          printf("%d\n", y);
        }
        x = 5;
        C();
        x = 7;
      }
      B();
    }

When ``A`` is called, this code prints 5. This is because the nearest ancestor
of ``C`` is ``B``, and the last value to be assigned to ``x`` prior to the call
to ``C`` was 5.

Some languages allow for new static scopes to be defined mid-execution by means
of **blocks**.  C-based define a new scope for any compound statement, such
as if- or for-statements.

  .. code:: c

     int sum(int n) {
       int s = 0;
       for (int i=1; i<=n; i++)
           s += i;
       return s;
     }

     while (true) {
       int count = 0;
       ...
     }

The *let* and *where* expressions in many functional languages also define new
scopes.  An example in Haskell is given below.  Here, in the where clause, the
scope of s is for the expression given above the where clause.  In the let
clause, the scope is the expression below the let statement.

  .. code:: hs

      heron :: Float -> Float -> Float -> Float
      heron a b c = sqrt( s * (s-a) * (s-b) * (s-c) )
                    where s = ((a+b+c) / 2)

      heron :: Float -> Float -> Float -> Float
      heron a b c = let s = ((a+b+c) / 2)
                    in sqrt( s * (s-a) * (s-b) * (s-c) )

In Scheme, a number of expressions is given followed by some end expression;
the return value of the let statement is the value of the end expression.
Hence the code below would return ``(a+b)/(c-d)``.

  .. code:: scheme

     (LET (
       (top (+ a b))
       (bottom (- c d)))
       (/ top bottom)
     )


Dynamic Scoping
---------------

An alternative to static scoping is **dynamic scoping**, in which the scope
of a variable must be determined at run-time.  Consider the example:

  .. code:: c

     void A() {
       void C() {
         int y = x;
       }
       int x = 5;
       C();
     }

In such a case, with dynamic scoping, the scope of ``x`` extends to ``C``.
Then consider the following case, in which ``B`` calls ``C``, and ``A``
instead calls ``B``.

  .. code:: c

     void A() {
       void B() {
         int x = 2;
         C();
       }
       void C() {
         int y = x;
       }
       int x = 5;
       B();
     }

Now, the value of ``x`` referenced in the function ``C`` is 2; and the ``x``
referenced is that of function ``B``.  Much as static scoping has the notion of
a static parent, which is its encapsulating subroutine, dynamic scoping has a
dynamic parent, which is its calling function.

With dynamic scoping, it is difficult if not impossible to check type
references to nonlocals statically.  For the above situation, it is difficult
to know which ``x`` is referenced; and possible for the type of ``x`` to be
different depending on the caller.

Languages which use dynamic scoping may also be more difficult to read, and
may be less consistent than programs which use dynamic scoping.  For that
reason, it is widely less preferred than static scoping.  Nonetheless, it
has the virtue that any variable declared within a caller is also visible
from its stack descendents, and thus does not need to be re-declared.


Referencing Environment
-----------------------

The **referencing environment** is the list of all variables which are visible
at a statement.  It is the union of all locals and all variables of its
ancestor scopes which are visible.  Consider:

.. code:: c

     int z = 3;
     void A() {
       void B() {
         int x = 2;
         C();
       }
       void C() {
         int y = x;     // <-- this statement
       }
       int x = 5;
       B();
     }

At the statement above, the referencing environment consists of the local ``y
(of C)``, the variable ``x (of A)``, and the global ``z``.  The notion of
referencing environment is useful because it allows us to conceptualize
which variables are able to be referenced at any given point in the code.
