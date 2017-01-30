Syntax and Semantics
====================


Definitions
-----------

The **syntax** is the form of expressions, statements, and other language
constructs, and the **semantics** is the meaning of them.  Consider an if-else
statement in the C language.  The syntax of this if-else construct might be
described as follows:

.. code:: c
   
   if (<boolean_expression>) {
     <statements>
   } else {
     <statements>
   }

The semantics of it may be described as follows.  If ``<boolean_expression>``
is true, we perform the statements where ``<statements>`` appears within braces
of the if-clause.  If ``<boolean_expression>`` is false, we perform the
statements where ``<statements>`` appears in the else clause.

A language is comprised of strings of characters.  These are called
**sentences** or statements.  The smallest units of a language are called
**lexemes**, and consist of literals, operators, and keywords.  Lexemes may be
partitioned into groups.  For example, variable names, methods, classes and so
forth are *identifiers*.  Each lexeme group is represented by a name, or
**token**.  

Consider this C statement:

.. code:: c

   cats = cats * 5 + 3;

Following are the lexemes and tokens of this statement.

  +----------+---------------+
  |  lexemes | tokens        |
  +----------+---------------+
  +----------+---------------+
  |  cats    | identifier    |
  +----------+---------------+
  |  =       | equal_sign    |
  +----------+---------------+
  |  cats    | identifier    |
  +----------+---------------+
  |  *       | mult_operator |
  +----------+---------------+
  |  5       | literal_int   |
  +----------+---------------+
  |  +       | plus_operator |
  +----------+---------------+
  |  3       | literal_int   |
  +----------+---------------+
  |  ;       | semicolon     |
  +----------+---------------+


Language recognition and generation
-----------------------------------


A **language recognizer** can recognize sentences of a language.  Suppose we
have a language L that uses an alphabet of characters S.  To define S we must
use a mechanism R, a recognition device, which could take strings from S and
determine whether or not they are in L.  If R accepts strings from S only if
they are in L, R is a description of L.  *What is the utility of a recognition
device?*

Languages may be defined by recognition or generation.  A **language
generator** is a device that can be used to generate sentences of a lanauge.  A
language generator may be more human-readable than a recognizer, which works by
trial-and-error.  


Grammars
--------


..
  We inherit two particular grammar classes from a noted linguist Noam Chomsky:
  regular and context-free.  Forms of tokens of programming languages can be
  described by regular grammars.  With a few exceptions, context-free grammars
  can describe the syntax of whole languages.  Chomsky was interested in the
  theoretic nature of natural languages, thus his ideas were not applied to
  artificial languages until much later.

..
  A 1959 paper by John Backus described a new formal notation for specifying
  programming language syntax for ALGOL 58; it was then modified by Peter Naur
  the following year for ALGOL 60.  This notation is now referred to as
  **Backus-Naur Form**, or **BNF**.   It is the most popular notation for 
  describing program syntax.

..
  BNF has many similarities to Chomsky's generative device for context-free
  languages called **context-free grammars**. 


A **grammar** is a formal language generation mechanism.

The most popular notation for specifying programming language syntax is known
as **Backus Naur Form** or **BNF**.  Since it is a language generation
mechanism, it is what is known as a **metalanguage** for programming languages.
In BNF, *abstractions* are used to represent syntactic structures. The names of
abstractions are delimited by angle brackets.  For example:

::

  <assign> -> <var> = <expr>

This is known as a rule or **production**, which specifies how the left-hand
side abstraction is defined in terms of the tokens, lexemes, and references to
other abstractions.  In this particular example, an assignment statement is
defined as consisting of a variable then the lexeme ``=`` followed by an
expression.  A sentence whose syntactic structure is described by the rule is
``cats = cats * 5``.


