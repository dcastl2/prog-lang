Introduction
============

Three approaches to implementing a programming language: compilation,
interpretation, and a hybrid approach.  A hybrid approach normally consists of
some language which is translated into another language, which is then
interpreted.

All three approaches use lexical and syntax analysis.  **Lexical analysis** is
the identification and tokenization of lexemes.  That is, a lexical analyzer
identifies lexemes, and outputs the corresponding token for them.  A lexical
analyzer is also called a **lexer**.

**Syntax analysis** is parsing.  A syntax analyzer creates a parse tree.  As a
secondary feature, a syntax analyzer also determines whether or not sentences
of a language can be parsed and prints a diagnostic error message if they
cannot.  A syntax analyzer is also called a **parser**.

Reasons why these are separate:

 + *Simplicity*. The parser is not bogged down by the low-level details of the
   lexer, so both the lexer and the parser are smaller.

 + *Efficiency*. It is typically more beneficial to optimize the lexer than
   the parser (the lexer scans the whole string).
 
 + *Platform-independence*.  Lexers are somewhat platform-independent, but
   parsers can be platform-dependent. 

There exist tools to create lexers and parsers given a minimalist description
of the language to be lexed and parsed.  A program which creates a lexer given
such a description is called a **lexer generator**, and a program which creates
a parser is called a **parser generator**.


Lexical Analysis
================

Three approaches to building a lexer:

  + Use a lexer generator, such as ``lex``, to create a minimal description of
    the language to be lexed.

  + Design a state transition diagram which describes the token patterns of the
    language, then write a program implementing the diagram.

  + Design a state transition diagram which describes the token patterns of the
    language, then write a table-driven program implementing the diagram.

A **state diagram** is a directed graph, wherein nodes are labelled with state
names, and arrows are literals or tokens to be consumed.  State diagrams for
lexers are called **finite automata**, which can be used to recognize the class
of regular languages.   A **regular language** is a language which can be
described using regular expressions.

By contrast a **context-free language** is a language which can be described
using Backus-Naur Form (that is, in terms of terminals, nonterminals,
productions, and a start symbol).   The set of regular languages is a subset of
the set of context-free languages. 

Because the process of enumerating all possible lexemes for a regular
expression can be time-consuming and tedious, in creating a state diagram we
often label the state transition arrows with tokens instead of lexemes.
However, it is to be understood that a lexeme is being consumed.  In the state
transition diagrams used for lexers, we also define subroutines used to consume
lexemes. 

Examples of regular expressions:

  + ``ab``
  + ``ab*``
  + ``(ab)+``
  + ``ab+``
  + ``a*b*``
  + ``a+b*``


