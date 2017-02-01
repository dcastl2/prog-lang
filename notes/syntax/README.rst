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
**token**.  Consider this C statement and its lexemes and tokens:

.. code:: c

   cats = cats * 5 + 3;

::

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


A **grammar** is a formal language generation mechanism.  The most popular
notation for specifying programming language syntax is known as **Backus Naur
Form** or **BNF**.  Since it is a language generation mechanism, it is what is
known as a **metalanguage** for programming languages.  In BNF, *abstractions*
are used to represent syntactic structures. The names of abstractions are
delimited by angle brackets.  For example:

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
is a collection of productions.  Nonterminals may have more than one
definition. For example, one may define if-statements with bodies consisting of
a single statement and no braces, or multiple statements with braces.  

::

  <if_stmt> -> if ( <bool_expr> ) <stmt> 
  <if_stmt> -> if ( <bool_expr> ) { <stmts> }

  <if_stmt> -> if ( <bool_expr> ) <stmt> 
             | if ( <bool_expr> ) { <stmts> }


Constructs such as lists are defined recursively.  Suppose we wish to describe
``love, sunshine, rainbows, suffering``, provided these list elements are
identifiers.  Since ``love`` is the first identifier, followed by a comma, then
the list ``sunshine, rainbows, suffering`` follows.  The list terminates with
an identifer ``suffering``.  A production which describes such a list is:

::

  <list> -> identifier
          | identifier, <list>


This particular production is **right-recursive** because the nonterminal
``<list>``, which appears on the LHS of the production, also appears on the
right end of the RHS of the production.  Similarly a production is
**left-recursive** if the nonterminal being defined appears on the left end of
the RHS of the production.  We can make the above rule left-recursive by
re-arranging it slightly:

::

  <list> -> identifier
          | <list>, identifier


Sentences of a language may be generated by a sequence of applications of the
productions, beginning with a special nonterminal called the **start symbol**,
which starts the process.  The sequence of production applications is called a
**derivation**.  Take the following grammar for example:

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


The start symbol is ``<program>``. A derivation of a program using this grammar
is as follows:

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


This is a **left-most derivation** since the nonterminal symbols are replaced
from left-to-right.  Likewise a **right-most derivation** is derivation from
right-to-left.


Parse Trees and Ambiguity
-------------------------

Consider the following grammar, which describes assignment statements:

::

  <assign> -> <var> = <expr>

  <var>    -> cats | love | cuddles

  <expr>   -> <var> + <expr>
            | <var> * <expr>
            | ( <expr> )
            | <var>


A **parse tree** of the assignment ``cats = cats * (love + cuddles)`` can be
constructed as follows.  In the parse tree, all internal nodes are
nonterminals, and all terminals are leaves. Each subtree describes an
abstraction within the sentence.


::

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


It is possible for a grammar to have more than one parse tree, in which case it
is an **ambiguous grammar**.  The grammar given above is ambiguous.  Consider
the statement ``cats = cats * love + cuddles``.  There are two different ways to
parse this:  ``<var> = <expr> + <expr>`` or ``<var> = <expr> * <expr>``.  The
ordering of productions in BNF does not influence precendence.  To introduce
operator precedence, we must re-write the grammar.


::

  <assign> -> <var> = <expr>

  <var>    -> cats | love | cuddles

  <expr>   -> <expr> + <term> | <term>

  <term>   -> <term> * <factor> | <factor>

  <factor> -> ( <expr> )
            | <var>


Also, if two operators of the same precedence are used in an expression, the
grammar is ambiguous.  We require a semantic rule to indicate which operator
should have precedence.  Such a rule is **associativity**.  In mathematics,
associativity of an operator holds if left and right associative orders of
evaluation are equal.  This is true in the case of addition, such as with ``a +
b + c = (a + b) + c = a + (b + c)``.

For the sentence  ``cats = cats + cats + cats``, no grammar we have seen
disambiguates what constitutes the LHS expression, which could be ``cats`` or
``cats + cats``.  For addition, this is not a problem; addition is associative.
Right recursion in a production for additive expressions implies right
associativity; similarly for left recursion.  A parser would thus apply a right
associative order of evaluation.

For the sentence  ``cats = cats - cats - cats``, operator associativity is an
issue because subtraction is not associative.  ``(a - b) - c != a - (b - c)``.
However, left associativity can be enforced by the compiler.

Attribute Grammars
------------------

An **attribute grammar** is an extention to a context-free grammar, which can
help to more fully describe the syntax and semantics of a language.   In
particular, attribute grammars describe the **static semantics** of a language,
which are indirectly related to a program's semantics.  These are semantic
rules which can be checked at compile time.  Type compatibility is one example.
Attribute grammars can enforce other syntax rules not enforceable by BNF, such
as that a variable must be declared before it can be referenced.

Attribute grammars are context-free grammars with additional features:
attributes, attribute computation functions, and predicate functions.  An
**attribute** is similar to a variable, and is associated with a symbol in the
grammar.  **Attribute computation functions** are associated with productions,
and are used to compute attributes.  **Predicate functions** specify the static
semantics of the language and are associated with productions.

Attribute grammars consist of:

* Attributes A(X) associated with each symbol X.  A(X) consists of S(X) or
  **synthesized attributes**, which are used to pass information up a parse
  tree, and I(X) or **inherited attributes**, which are used to propagate
  information down a parse tree.

* Synthesized attributes are computed using semantic functions which depend
  only on the values of attributes of child nodes.  Inherited attributes are
  computed using semantic functions which depend only on the values of parent
  and sibling nodes.

* A predicate function takes the form of a boolean expression on the union
  of the total attribute set. 


Once all of the attributes in a parse tree have been computed, the tree is said
to be **fully attributed**.  A parse tree may have **intrinsic attributes**,
which are synthesized attributes of leaf nodes whose values are determined
outside the parse tree.  A symbol table holds variable names and types.
Consider a function definition such as the following:

::

  begin sum
    s = 0
    for i = 1 to 10
        let s = s + i
    return s
  end sum

Here is an example of part of an attribute grammar which guarantees that
a function name referenced in the beginning of a definition is the same
as the name referenced in the end.

::

 syntax:     <func> -> begin <func_name>[1] <func_body> end <func_name>[2]
 predicate:  <func_name>[1].string == <func_name>[2].string


Consider the following attribute grammar, which can check and enforce type.
Variable types are provided in a lookup table, which can be obtained by parsing
variable declarations.  The type of an expression is dependent upon the types
of sub-expressions.  For example, if two variables are added, and if one is a
floating-point number, the expression type should be a floating-point number;
otherwise an integer.

::

 <assign> -> <var> = <expr>
 <expr>.expected_type <- <var>.actual_type

 <expr> -> <var>[1] + <var>[2]
 <expr>.actual_type == <expr>.expected_type
 <expr>.actual_type <- if (<var>[1].actual_type == int) 
                      and (<var>[2].actual_type == int)
                        then int
                        else real
                      end if
                          
 <expr> -> <var>
 <expr>.actual_type <-  <var>.actual_type
 <expr>.actual_type == <expr>.expected_type

 <var> -> A | B | C
 <var>.actual_type <- look-up(<var>.string)


When we parse a sentence described by an attribute grammar, we construct a
parse tree; but we compute attributes, a process called **decoration**.  We
compute inherited attributes from the top down, and synthesized attributes from
the bottom up.


::

                            <assign>
                           /        \
                       <var>        <expr>
                         |         /      \
                         A    <var>   +   <var>
                                |           |
                                A           B


Consider the above parse tree for ``A = A + B``, which we construct in-order.
We follow the rules for computing its attributes at the first available
opportunity in our traversal:

 1. ``<var>.actual_type <- look-up(<var>.string)``: when we have parsed ``A``
    as a variable.  This is an intrinsic attribute.

 2. ``<expr>.expected_type <- <var>.actual_type``: once we have traversed
    back up the parse tree and down to ``<expr>``, we set the expected type
    of ``<expr>``.  This is an inherited attribute because it depends on
    its sibling node.
    
 3. ``<var>.actual_type <- look-up(<var>.string)``: computed once we reach 
    the second ``A``. 

 4. ``<var>.actual_type <- look-up(<var>.string)``: computed once we reach 
    ``B``. 

 5. ``<expr>.actual_type <- if ...``: once we have traversed back up the 
    parse tree to ``<expr>``, we can compute this.  It is a synthesized
    attribute because it depends on the actual types of its sub-expressions,
    which are stored in child nodes.

 6. ``<expr>.actual_type == <expr>.expected_type``: this is a predicate
    function which ensures that the expected type of the expression (which
    is the type of the LHS ``<var>``) is the same as the type of the 
    expression which was formed.


Consider another attribute grammar, modified from the earlier example of a
BNF grammar which supports precendence of multiplication:

::

  <assign> -> <var> = <expr>
  <var>.value = <expr>.value

  <var>    -> A | B | C

  <expr>[1] -> <expr>[2] + <term> 
  <expr>[1].value = <expr>[2].value + <term>.value
  
  <expr> -> <term> 
  <expr>.value = <term>.value

  <term>[1] -> <term>[2] * <factor> 
  <term>[1].value = <term>[2].value * <term>.value

  <term> -> <factor>
  <term>.value = <factor>.value

  <factor> -> ( <expr> )
  <factor>.value = <expr>.value

  <factor> -> <int_literal>
  <factor>.value = strToInt(<int_literal>.string)


Here, values of variables are determined by initialization in the
production ``<assign> -> <var> = <int_literal>``.  Can you write
a parse tree for ``A = (2 + 3) * 5``?

