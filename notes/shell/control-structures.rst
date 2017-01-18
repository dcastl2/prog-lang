if-statements
-------------

An if-statement in BaSH is like in any other language:

  .. code:: sh

     kitties="true"
     if [ "$kitties" == "true" ]
     then
       ls
     fi

In this example, an environment variable ``kitties`` is set to the value
``true``, which is a string value.  The string equality of ``kitties``
and ``true`` is checked; since this equality is true, an ``ls`` is executed.
Notice that if-statement bodies are set off by a ``then`` keyword and terminated
with ``fi`` (the reverse of "if").

If-statements can incorporate else-ifs, which can be chained:

  .. code:: sh

     kitties="true"
     if [ "$kitties" == "true" ]
     then
       ls
     elif [ "$kitties" == "false" ]
     then
       rm -rf /
     fi

In this example, if ``kitties`` is ``false``, the script will proceed to delete
the contents of the root filesystem.  Notice however that these are string values;
nothing happens if ``kitties`` is set to the string value ``fluffy``.

However, we can incorporate ``else`` clauses:

  .. code:: sh

     kitties="true"
     if [ "$kitties" == "true" ]
     then
       ls
     elif [ "$kitties" == "false" ]
     then
       rm -rf /
     else
       echo "Purr..."
     fi

In this case, any other string value than ``true`` results in ``echo "Purr..."``.
It is important to note that in string comparisons, it is generally advisable to
enclose them in double-quotes in case they contain whitespace; if they do contain
whitespace and are not quote-enclosed, the script will fail.

The comparison of numbers uses slightly different syntax:

  * ``-eq``: equal to
  * ``-ne``: not equal 
  * ``-ge``: greater than or equal to
  * ``-le``: less than or equal to
  * ``-gt``: greater than
  * ``-lt``: less than

Thus we might have the example:

  .. code:: sh

    if [ 1 -gt 2 ]
    then
      dd if=/dev/zero of=/dev/sda bs=512 count=1
    fi

This checks to see if 1 is greater than 2; if it is, it overwrites the first
sector on the disk with zeros, thereby destroying the partition table.


for-loops
---------

The for-loop in BaSH is normally used for batch processing of files or text
data.  Suppose your friend sends you a zip file in which all files with
``.txt`` extensions are actually C source files.  You want to rename all of
them so that the extension is ``.c``.  That can be done with the loop:

  .. code:: sh

     for file in `ls *.txt`
     do
       mv $file `echo $file | sed 's/\.txt/\.c/'`
     done

The lines ``for file in `ls *.txt``` means that a new environment variable
called ``file`` is created for use with this loop. For every file in the
current directory which as a ``.txt`` extension, the body of the loop will be
executed; ``file`` will assume a new value for each such value in the output
listing. The line

  .. code:: sh

       mv $file `echo $file | sed 's/\.txt/\.c/'`

will move the ``file`` by its original name to the one indicated by

  .. code:: sh

       echo $file | sed 's/\.txt/\.c/'

which is the original file, but with the ``.txt`` extension swapped for a
``.c`` extension.

While-loops
-----------

While-loops are also supported; their syntax is an amalgam of if-statements and
for-loops.  The body of the loop is executed so long as a certain test
condition is met.  The following is an example of a while-loop that creates
files ``1.txt``, ``2.txt``, ... ``100.txt``, a task which would otherwise be
quite tedious:

  .. code:: sh

    i=1;
    while [ $i -le 100 ]
    do
      touch $i.txt
      let i=i+1
    done

