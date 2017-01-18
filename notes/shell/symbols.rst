Special Symbols in BaSH and Their Meanings
==========================================

; - End of Statement
--------------------

* On occasion, you will see a semicolon (``;``) ending a command. It
  is valid syntax, but is typically left off for brevity. 


$ - Environment Variables
-------------------------

* An **environment variable** is a variable which may be used for your
  shell session.  The concept is similar to a local variable in any
  procedural programming language; except it may be used interactively
  on the command-line.

* To declare and initialze an environment variable, you may use the
  following syntax:

  .. code:: sh

    a=4
    echo $a 

    b="kitty"
    echo $b 

    c="hello $b"
    echo $c 

  In the above example, ``a`` is set to the numeric value 4, ``b`` is
  set to the string ``kitty``, and ``c`` is set to the value ``hello kitty``,
  since the value of ``b`` is expanded in the initialization. When outputting
  the values of the variables, and when referring to them outside of 
  initialization, you must preceed them with a ``$`` sign to indicate they
  are variables instead of literals.
  
  All of the above initializations may be preceded by the ``let`` keyword, 
  as in the following:

  .. code:: sh

    let a=4
    let b="kitty"
    let c="hello $b"

  The use of ``let`` allows for the evaluation of arithmetic expressions.
  Contrast the following two:

  .. code:: sh

    a=1+1
    echo $a

    let b=1+1
    echo $b

  In this case, the ``echo $a`` command will output ``1+1`` literally, 
  whereas ``echo $b`` will output ``2`` since the expression was evaluated
  before storing the result in ``b``.


> - Output Redirection
----------------------

* The output redirection operator (``>``) can direct the output of a
  command into a file.  For example:

  .. code:: sh

    ls -al > contents.txt

  This line will take the output of the command ``ls -al``, which is
  a full listing of the current directory's contents, and put it into
  a file called ``contents.txt``.  If there was a file called 
  ``contents.txt`` previously, it will be overwritten.

* There is another version of the output redirection operator (``>>``) 
  which will append the output of a command onto a file.  In this case:

  .. code:: sh

    echo "hello" >> contents.txt

  The word ``hello`` will be appended to the file ``contents.txt``. If
  such a file did not exist beforehand, it will be created prior to
  the append.


\| - Pipe
---------

* You can take the output of one command and run it as input through
  another command using the pipe (``|``) symbol.  Example:

  .. code:: sh

    echo "hello" | rev

  This will output ``olleh``. ``echo "hello"`` would normally print
  out ``hello``, but that output is then **piped** through the command
  ``rev``, which reverses it and outputs the result.

* You can pipe arbirarily many times. Example:

  .. code:: sh

    echo "hello" | rev | rev 

  This will print ``hello``, as it is reversed twice.

* One of the most useful applications of pipe is in searching text which
  is output using the ``grep`` command. For example, the command

  .. code:: sh

    cat solutions.txt | grep "Problem 1"

  takes the content output from ``solutions.txt`` and searches line-wise
  for the string ``Problem 1``, and outputs only those lines on which
  the string ``Problem 1`` exists as a substring.

* The commands text manipulation commands ``awk`` and ``sed`` are at
  their best when used through a pipe.


` - Execute Result
------------------

* When a command is surrounded in backticks (`), it is executed,
  then the result is used in the encompassing command.  For example:

  .. code:: sh

    cmd="echo hello"
    res=`$cmd`
    echo $res

  In this case, ``res`` should hold the value ``hello``, since ``cmd``
  is expanded into ``echo hello`` and executed (since it is surrounded
  in backticks). The result of the command ``echo hello`` is ``hello``,
  which is then stored in the environment variable ``res``.


\\ - Line Continuation
----------------------

* You can split long commands among several lines. This can be useful
  for commands which contain several pipes.  For example:

  .. code:: sh

    disk=`df | grep -v "0%"         \
             | grep "\/"            \
             | awk '{print $5,$6}'  \
             | sed 's/\%//'         \
             | sed 's/^/Disk: /'`

