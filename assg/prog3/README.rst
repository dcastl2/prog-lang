Homework 3
==========

**Note**: you must provide a ``Makefile`` and a ``run.sh`` script for this
assignment [-32].



1. Higher-order derivatives.
     [16] Implement the function ``dx :: (Float -> Float) -> (Float -> Float)``
     which accepts a function and returns its derivative as a function. Also
     write ``ddx :: (Float -> Float) -> Int -> (Float -> Float)`` which accepts
     a function and an integer (call it *n*) and retuns the nth derivative of
     that function.  Note that the return type should be a function.  Call this
     ``derivative.hs``.


2. Implementing higher-order functions.
     [16[ Implement the functions ``map :: (a -> a) -> [a] -> [a]`` and
     ``filter :: (a -> Bool) -> [a] -> [a]`` from scratch in HAskell.  Also
     implement ``multimap :: (a -> [a]) -> [a] -> [[a]]`` which applies
     mappings for functions that return lists.  Call this ``multimap.hs``.


3. Pedigrees using logic programming.
     [16] Write a Prolog rule set defining mother, father, brother, sister,
     grandmother, grandfather, aunt, uncle, neice, nephew, and cousin in terms
     of parent, sibling, male and female.  Call this ``pedigree.pl``.


4. Lists in a logic programming language.
     [16] Learn about lists in Prolog, then write a Prolog program with
     functions ``rrotate(P, N, Q)`` which accepts a list ``P`` and number
     ``N`` and defines ``Q`` as the right-rotation by ``N`` elements of
     ``P``. Write also a similar function ``lrotate(P, N, Q)``.  Call this
     ``rotate.pl``.


5. Computational translations of Cartesian functions to polar coordinates.
     [32] Write a function ``r :: (Float -> Float) -> (Float -> Float)``
     which accepts a function (call it *y(x)*), and translates it to a
     polar-coordinate function (call it *r(t)*, where *t* is the angle theta).
     Since you only have access to *t* and *y(x)* in this function, you will
     have to use the Newton-Raphson method to find the particular *x* and *y*
     values corresponding to *t*.  Once you have these you can obtain a value
     for *r*.  Call this ``polar.hs``.


6. Using lexers for symmetric block-cipher encryption.
     [32] Use ``lex`` to create a symmetric block cipher algorithm for
     encrypting plain text.  The input will take the form:

     ::

       <input> -> [encrypt] [<password>] <text>
                | [decrypt] [<password>] <text>

     The encryption will proceed as follows.  Let n be the length of the
     password, m be the length of the plain text.  Then also let ``char
     rrotate(char x, char y)`` return the right-rotation of alphabetic
     character ``x`` by ``y-'a'+1``.  For example ``rrotate('d', 'b')`` would
     be ``f``, which is ``d`` rotated by 2 units.  Then the ciphertext is
     obtained from the plaintext as follows:

     .. code:: cpp

       i = 0;
       for (j=0; j<m; j++) 
           if (isalpha(plaintext[j])) {
             ciphertext[j] = rrotate(plaintext[j], password[i]);
             i = (i + 1) % n;
           }
           else ciphertext[j] = plaintext[j];

     That is, the password is applied in blocks to the plaintext.  All
     non-alphanumeric characters are skipped.  If ``[encrypt]`` is lexed, the
     program should encrypt by means of ``rrotate``, otherwise it should
     decrypt using ``lrotate``.   Call this ``cipher.lex``.



7. An interpreter for the language brainfuck (BF).
     [32] Write an interpreter for BF in pure C which accepts BF codes 1
     megabyte in size, allocates 1 kilobyte of memory, and uses a 1 kilobyte
     stack to hold information about brackets.  It should conform to the
     language specifications given here:

       https://en.wikipedia.org/wiki/Brainfuck
     
     Note that brackets can be nested.  The interpreter should accept an
     optional command-line argument, that is the name of a file to interpret.
     If no command-line argument is given, it should accept commands from
     stdin.  Call this ``bf.c``.

     I am aware that there are many such interpreters on-line, and I expect
     that you will view them.  So a few extensions to the language should
     be introduced. Your interpreter should also support the following
     commands:

      * ``;`` should accept a string from stdin, similar to ``,`` does
        for characters.  It does not change the tape pointer.

      * ``:`` should print a string to stdout, similar to ``.`` does
        for characters.  It  should print all characters until a null
        terminator, ``0x0``, is encountered.

      * ``()`` should place into memory whatever text is between the
        parentheses.  Therefor ``(hello)`` will place the string ``hello``
        in the tape starting from the current tape pointer position. It
        should also be able to distinguish numbers given in hex format,
        so ``(0x2A)`` will put 42 at the current position rather than the
        string ``0x2A``.


8. Code executability in documents using regular expression substitutions.
     [32] Early in my graduate career, I wrote a component for a larger
     framework that could execute arbitrary code embedded in documents, then
     substitute the results back into the document.  The code could be
     referenced in an arbitrary order and serialized once parsed.

     Write such a code in Python, which can match statements of the form:
     ``<statement> -> {% (<letter>) <python_code> %}`` using regular
     expressions (use Python's ``re`` module).  The ``<letter>`` is a lowercase
     alphabetic letter.  The ``<python_code>`` itself should be executed in the
     order indicated by the alphabetic letters.  For example, running the code
     on the following:

     ::

       The number {% (c) print x %} is a random number between 1 and 6
       inclusive. If we multiply it by 2, we get {% (d) print 2*x %}.

       What's interesting is that the statements may appear out of order in the
       document. {% (a) import random %} Thus I might generate the random
       number in a location in the document well after referencing it. 
       {% (b) x = random.randint(1,6) %}.  
       
     would produce:

     ::

       The number 3 is a random number between 1 and 6 inclusive. If we
       multiply it by 2, we get 6.

       What's interesting is that the statements may appear out of order in the
       document. Thus I might generate the random number in a location in the
       document well after referencing it. 
      
     The statements are executed in-order:

        ::

             import random
             x = random.randint(1,6)
             print x
             print 2*x

     You will need to use the ``exec`` function in Python.  To get the output
     back, you will need to redirect output to your own stream.  Your program
     should accept a filename as a command-line argument to operate on.  Call
     it ``doxecute.py``.

