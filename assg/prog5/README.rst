Homework 5
==========

Choose 64 points worth of problems.  **Note to honors students**: you must do
96 points of problems for this assignment. 

**Note**: you must provide a ``Makefile`` and a ``run.sh`` script for this
assignment [-32].



0. Previous problems.
     [?] You may do any problem from Homework 4 that you didn't already do for
     the same amount of credit.


1. A very simple calculator.
     [16] Write an interpreter for a language that can do calculations in the
     same fashion as a hand calculator.  An example input may be ``2 * 2 + 5 /
     3 =`` which would produce the result 3.  Call this ``simple-calc.hs``.


2. ASCII animations.
     [16] You may do this problem again even if you did it before, but
     your animation must be different.
     
     Use the System.Console.ANSI library to draw a colored animation in ASCII.
     You must use at least two colors, and no two consecutive frames in the
     animation should be the same. It must be unique.  Call this
     ``asciimation.hs``.


3. Your own file encryption/decryption program.
     [32] Write a Haskell program which accepts a filename and a password as
     command-line arguments (that is, they should be passed via the command
     line prior to execution, not via stdin after execution).  Using the
     password, the program should apply a block-cipher algorithm to encrypt the
     file.  It should create a new file with a ``.enc`` extension.

     If the program is given the encrypted file, it should first verify the
     password, then decrypt the file.  To support password verification, you
     can pre-pend a hash to the encrypted file.  For this, you will need some
     secure means of hashing the password (any will do).  Call this
     ``encrypt.hs``.


3. A parser and pretty-printer.
     [64] An example of a pseudocode-like language is given in ``dirty.alg``.
     Write a program which can parse this language (that is, create a parse
     tree).  The parser must support assignment statements, for-loops, if-else
     statements, function definitions, and function calls.  The best starting
     point is to write a BNF grammar from the language.
     
     From the parse tree, re-print the code in a neat fashion; also, syntax-
     highlight the code.  Use separate colors for identifiers, special
     characters, reserved words, and comments.  Call this ``parser.<ext>``.
     You may write it any language you choose.  Refer to ``color.h`` for ANSI
     the coloration codes.
 
