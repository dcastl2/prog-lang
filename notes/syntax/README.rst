Syntax and Semantics
====================


Definitions
-----------

The **syntax** is the form of expressions, statements, and other language
constructs, and the **semantics** is the meaning of them.  Consider an if-else
statement in the C language.  The syntax of this if-else construct might be
described as follows:

.. code:: c
   
   if (<bool_expr>) {
     <stmts>
   } else {
     <stmts>
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

The abstractions in BNF are called **nonterminal symbols**, while the lexemes
and tokens are called **terminal symbols**.  A BNF description, or **grammar**,
is a collection of productions.

Nonterminals may have more than one definition. For example, one may define
if-statements with bodies consisting of a single statement and no braces,
or multiple statements with braces.  

::

  <if_stmt> -> if ( <bool_expr> ) <stmt> 
  <if_stmt> -> if ( <bool_expr> ) { <stmts> }

  <if_stmt> -> if ( <bool_expr> ) <stmt> 
             | if ( <bool_expr> ) { <stmts> }


Mathematical constructs such as lists are defined recursively:

::

  <list> -> identifier
          | identifier, <list>


A list described by this may be ``love, sunshine, rainbows, suffering``,
provided these list elements are identifiers.  This is because ``love`` is the
first identifier, followed by a comma, then the list ``sunshine, rainbows,
suffering``.  The list terminates because the definition allows for one
identifier to constitute a list, in this case ``suffering``. 


Sentences of a language may be generated by a sequence of applications
of the productions, beginning with a special nonterminal called the
**start symbol**, which starts the process.  The sequence of production
applications is called a **derivation**. 

Take the following grammar for example:

::

  <program> -> begin <stmts> end

  <stmts>   -> <stmt>
             | <stmt>; <stmts>

  <stmt>    -> <var> = <expr>;

  <var>     -> kitties | evil    | cuddles 
             | death   | giggles | life

  <expr>    -> <var> + <var>
             | <var> - <var>
             | <var>


A derivation is as follows:

::

  <program> -> begin <stmts> end
            -> begin <stmt>; <stmts> end
            -> begin <var> = <expr>; <stmts> end
            -> begin kitties = <expr>; <stmts> end
            -> begin kitties = cuddles; <stmts> end
            -> begin kitties = cuddles; <stmt> end
            -> begin kitties = cuddles; <var> = <expr>; end
            -> begin kitties = cuddles; death = <expr>; end
            -> begin kitties = cuddles; death = <var> - <var>; end
            -> begin kitties = cuddles; death = life - <var>; end
            -> begin kitties = cuddles; death = life - kitties; end


Parse Trees
-----------

Consider the following grammar:

::

  <assign> -> <var> + <expr>

  <var>    -> cats | love | cuddles

  <expr>   -> <var> + <expr>
            | <var> * <expr>
            | ( <expr> )
            | <var>


A parse tree of the assignment ``cats = cats * (love + cuddles)`` can be constructed
as follows:


.. raw::

        <assign>
        /      \
     <var>   =  <expr>
       |       /      \
     cats    <var>  *  <expr>
               |      /  |   \ 
              cats   ( <expr> )
                      /     \
                   <var> + <var>
                     |       |
                   love    cuddles


All internal nodes are nonterminals, and all terminals are leaves. Each subtree
describes an abstraction within the sentence.
