Homework 3
==========

Choose 64 points worth of problems.

**Note**: you must provide a ``Makefile`` and a ``run.sh`` script for this
assignment [-32].


1. A syntax highlighter.
     [32] Write a syntax highlighter for the C-like languages, an example of 
     which is given in ``example.c``. To do this, you will effectively have 
     to write a lexer.  Use separate colors for identifiers, special characters,
     reserved words, and comments.  Use the provided ``color.h`` file and
     example ``color.c`` example for outputting in color.  You will only
     need to tokenize the reserved words used in the example file. Call this 
     ``highlighter.c``.


2. Your own **very** simple web browser.
     [32] Prior to 1996 (the invention of CSS), HTML was used to style 
     everything on the web.  In those days, text-mode browsers were a
     computationally inexpensive and viable alternative to graphical browsers. 
     For some sites, they still are (see ``w3m`` on the server.  I use this 
     modern text-mode browser to avoid trackers, malicious JavaScript codes,
     and video ads). 
     
     Write a program to download web pages given URLs using the cURL library,
     then style the output accordingly.  It should accept a URL as a 
     command-line argument.  You must account for font colors, underline, 
     boldface, italic, center, ordered and unordered lists, and tables.  
     To do this, you will effectively have to lex HTML 1.0 and render it for
     ANSI terminals (simply output it to the screen).  You will also need 
     skill in the use of the scan/print or get/put functions.  You can use 
     my ``color.h`` file for achieving font effects and colors on ANSI 
     terminals.  Call this ``uncurl.c``.  You can test it on the following:

       http://cct.lsu.edu/~dcastl2/simple.html


3. Parallel brute-force decryption.
     [32] An example of an encryption algorithm is given in ``Encrypt.hs``.
     This encryption algorithm accepts a plaintext password and returns a hash.
     A hash is given in ``hash.txt``.  You know ahead of time that the 
     password is four characters in length.  Write a program which can perform 
     a brute-force decryption for the target hash in parallel.  Use the
     Control.Parallel module. Call this ``decrypt.hs``.

     Additionally, it is possible to directly decrypt the hash by a thorough
     examination of the encryption algorithm.  If you reverse-engineer the
     encryption algorithm in addition to implementing the brute-force 
     decryption method above, the grader will award you some Fox stickers.  
     You must indicate in your ``run.sh`` script that you have done this.



4. A mini-language for your game.
     [32] If you did Homework 2, Problem 4, then you may extend your game by
     adding a command language and some additional functionality to it.  It 
     should support battles with two or more enemies at the same time, and 
     also the following grammar for the command language, with examples given
     below:

     ::

       <attack_cmd> -> attack [<target>]
       <spell_cmd>  -> cast <spell_name> [on <target>]
       <item_cmd>   -> use <item_name> [on <target>]

       attack goblin1
       cast fire on goblin2
       use potion
       use bomb on all
       cast heal

     The ``[]`` indicates optional parts; if omitted, the action should default
     to a random default target (or self, if appropriate).  To specify targets,
     you will have to provide names for your enemies.  To test these commands, you 
     will have to introduce at least two spells--one with enemy targetting and
     another with self-targetting; and two items, one with enemy and another
     with self-targetting. If you choose to do this problem, use the same names
     for your files as you did for Homework 2.  


5. A literal code translator.
     [64] An example of a pseudocode-like language is given in ``sum.alg``. 
     Write a program which can translate this into C (``sum.c``), Java 
     (``Sum.java``), Python (``sum.py``), and Matlab/Octave (``sum.m``).
     To do this, you will effectively have to write a lexer, then translate
     the lexemes of the pseudocode language into the target languages.  You 
     can choose to write this in any language of your choice.  Call it
     ``babelfish.<ext>``, with the extension depending on your language of 
     choice. (The Babel fish is a fictional fish from the *Hitchhiker's Guide
     to the Galaxy* that can translate all languages.) Also make it work for 
     ``fib.alg``.

     If you do this, set up your ``Makefile`` and ``run.sh`` script so 
     that your ``Makefile`` compiles your translator first, then ``run.sh``
     invokes rules in your ``Makefile`` to compile the generated codes;
     then finally runs the generated codes.  Label everything neatly for
     the grader.


6. A scientific calculator/interpreter.
     [64] Write a scientific calculator in the form of an interpreter; that is, 
     a program which opens a command prompt which can evaluate arbitrarily 
     complex expressions.  It should support plus, minus, multiply, divide, 
     modulus, power, exponent, square-root, n-root, sine, cosine, tangent, 
     arcsine, arccosine, and arctangent.  It must be able to handle nested 
     expressions.  An example of such an expression may be:

      ``2*(7%5) + 3^(sin(2*pi)+pow(2, 3)) - exp(sqrt(atan(2/3)))``

     To accomplish this feat, you will need to parse the expression, thereby
     constructing a parse tree of it.  Then, recursively evaluate the 
     sub-expressions in post-order.  You will need to create a parse tree
     data structure to accommodate your expressions.  Call this ``sci-calc.c``.
     
     This problem is very difficult for your current experience level, but
     it is quite possible to do given what you know now, even without referring
     to the textbook.  This problem will be extendable for HW 5, so if you
     choose to do it, write it in such a fashion that it can be easily
     extended for future use.
     
