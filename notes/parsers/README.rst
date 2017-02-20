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
