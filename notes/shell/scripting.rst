Shell scripts
-------------

Normally, a shell script ends in a ``.sh`` extension, and its permissions are
set to be executable.  To create a new script:

  .. code:: sh

     touch example.sh
     chmod 755 example.sh

This will create a new script called ``example.sh`` and make it executable by
the user.  The first line of a script tells what interpreter to use, and is
set off by a hash-bang:

  .. code:: sh

     #!/bin/bash

The script is interpreted, which is to say that it is executed line-by-line
rather than compiled.  The behavior of a script is similar to a series of
commands on the command-line.

Command-line arguments
----------------------

Scripts can take command-line arguments, which are designated by variables:
``$1`` is the first argument, ``$2`` is the second, etc. ``$#`` is the number
of arguments to the script. 

Functions
---------

Scripts can have functions, which take arguments.  Here is an example of a
function and how to call it:

  .. code:: sh

     die() {
       echo "$1"
       exit;
     }

     echo -n "Enter a number of kitties: "
     read num_kitties
     if [ $num_kitties -lt 1000000 ]
     then
       die "That's not enough!"
     fi

The ``die`` function will output a message (its first argument) to stdout and
exit the script, returning control flow back to the calling program.  In the
call, the function name is given, then the arguments follow,
whitespace-delimited. If arguments have whitespace, they should be enclosed in
double-quotes.
