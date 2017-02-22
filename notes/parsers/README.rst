Parsing
=======

The primary purpose of parsers is to constrct parse trees for sentences
of a language.  This can be accomplished in two different ways:

  + **Top-down parsing**, in which the tree is built from the root to
    the leaves in pre-order, and

  + **Bottom-up parsing**, in which the tree is built from the leaves
    to the root.

Notational conventions for grammar:

  + Terminals are specified with lowercase letters (a, b, ...)

  + Non-terminals are specified with uppercase letters (A, B, ...)

  + Terminals or non-terminals are specified with uppercase letters 
    near the end of the alphabet (X, Y, ...)

  + Strings of terminals are specified with lowercase letters near the
    end of the alphabet (x, y, ...)

  + Mixed strings are specified with lowercase Greek letters (α,
    β, ...)


Top-Down Parsers
================

A left sentential form, that is a form of a partial left derivation of a
sentence, can be described as xAα, where x is a string of terminals, A is a
non-terminal, and α is a mixed string.  A top-down parser can be described as
an algorithm which given a sentential form of a partial left deriviation finds
the next partial leftmost deriviation.

Suppose the current form is xAα, then if the rules of the language are

::

  A -> aB | cBb | a
  B -> A


The task of the parser is to determine which of the rules to apply; choices
yield xaBα, xcBbα, or xaα.  Normally, top-down parsers decide which part of the
RHS of a rule to apply by looking at the next token of input.  This works well
if the rules are formed such that the rule begins with a non-terminal, but
top-down parsing becomes more complex if rules begin with non-terminals.

Take for example the string ``acab``.  The string is of form ``aB`` since the
rule ``aB`` begins with terminal ``a``.  The next rule must be ``B -> A``, but
then if the remainder of the string is ``cab``, the rule to be applied must be
``A -> cBb``.  Then ``B -> A``; if the remainder of the string is ``a``, we
simply apply the rule ``A -> a``.  Thus we have applied the rules in the
following order, from which we can easily construct a parse tree in pre-order:

::

  A -> aB, B -> A, A -> cBb, B -> A, A -> a

The most common type of top-down parser is a **recursive descent parser**,
which recursively descends into rules based on a BNF grammar of the language.
This is in a class of parsers known as ``LL parsers``. Here the first ``L``
stands for left-to-right scanning of the input. The second ``L`` stands for
left derivation; the parser attempts to construct the sentence by means of left
derivation.  Such parsers may look ahead by a certain number of tokens.  The
most common case is for such a parser to look ahead by one token, in which case
it is known as an ``LL(1) parser``.  Parsers which look ahead by *k* tokens are
known as ``LL(k) parsers``. 

Similarly there exist ``LR parsers`` which scan input left-to-right but obtain
a right derivation of the input.  The most common bottom-up parsers are in the
LR family.


Bottom-Up Parsers
=================

Bottom-up parsers construct a parse tree from the leaves up to the root of the
tree.  The parse order is the line-wise reverse of a right derivation.  The
problem of bottom-up parsing is finding which rule on the RHS of productions
to apply next.

Consider:

::

  S -> aAc
  A -> aA | b

And the string ``aabc``.  A bottom-up parser selects a RHS which appears in
the string.  In this case, that is ``b``.  So ``aabc`` becomes ``aaAc``. 
From there, the parser selects a RHS, that is ``aA``.  So ``aaAc`` becomes
``aAc``.  This matches the RHS of the start symbol.  So we have:

::

  aabc -> aaAc -> aAc -> S


Recursive Descent Problems
==========================

Left Recursion
--------------

LL parsers may fall victim to left recursion. Consider the rule ``A -> A | B``.
In this case, the parser will infinitely recursively descend into the rule
``A``.  This is called **direct left recursion**.  Grammars may also suffer
from indirect left recursion (there exist algorithms to remove such recursion).
This type of left recursion can be eliminated using a process:

1. Group A-rules so that ``A -> Aα1 | Aα2 | ... | β1 | β2 ...``, that is
   so that no ``A`` appears before a ``β``. 

2. Replace the original ``A`` rules with:

::

  A  -> β1A' | β2A' | ...
  A' -> α1A' | α2A' | ... | ε

which results in the same effective grammar but with ``A`` rules removed from
the left side of any RHS of ``A``.  Consider the following grammar:

::

  E -> E + T | T
  T -> T * F | F
  F -> E | (id)

``E`` appears on the left of the RHS of ``E`` and ``T`` appears on the left of
the RHS of ``T``.  If we apply the process, we must find ``α1`` and ``β1`` and
create new rules ``E'`` and ``T'``.  For ``E``, ``α1`` is  ``+ T``, and ``β1``
is ``T``. Plugging this in to the above:

::

  E  -> T E'
  E' -> + T E' | ε

Similarly for ``T``:

::

  T  -> F T'
  T' -> * F T' | ε

There is no left-recursion for ``F``. So the entire grammar becomes 

::

  E  -> T E'
  E' -> + T E' | ε
  T  -> F T'
  T' -> * F T' | ε
  F -> E | (id)


Pairwise Disjointness
---------------------

A recursive descent parser needs to be able to select the rule based on 
the next token of input.  There exists a test of whether or not this
can be done, called the **pairwise disjointness test**.  It involves
computing sets based on the RHS of nonterminals in the grammar.  These
sets are called FIRST, and are computed as follows:

:: 

  FIRST( α ) = { a | α ->* aβ }


Here, the symbol ``->*`` means zero or more derivation steps.  What this means
is, "the set of all such terminal symbols a, such that they can be reached in
zero or more derivation steps from α".  The pairwise disjointness test is
as follows:

::

  FIRST(αi)  ∩  FIRST(αj)  =   ∅

That is to say, for a given nonterminal, no terminal symbol should be reachable
by applying two or more of the RHS rules for that nonterminal.  As an example:

::

  A -> aB | bAb | Bb
  B -> cB | d


``FIRST(A)`` is {``a``}, {``b``}, and {``c``, ``d``}.  No terminal appears in
more than one set, so ``A`` is pairwise disjoint.  But consider


::

  A -> aB | bAb | Bb
  B -> cB | b


``FIRST(A)`` is {``a``}, {``b``}, and {``c``, ``b``}.  Now the nonterminal
``b`` appears in two sets, which means that a recursive descent parser cannot
determine which rule to select based on the nonterminal ``b``.

For simple cases we can remedy this using **left factoring**.  Consider the
grammar

::

  A -> bB | bC
  B -> c
  C -> d

``A`` is not pairwise disjoint, however we can modify the grammar so that it
becomes pairwise disjoint: 

::

  A -> bD
  D -> B | C
  B -> c
  C -> d

Here, we have factored out the terminal ``b`` and introduced a new nonterminal
``D`` which allows recursive descent into rules ``B`` and ``C``.
