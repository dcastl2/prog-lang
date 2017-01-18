Regular Expressions
-------------------

A **regular expression** is a string of characters which matches some text.
You may be familiar with regular expression syntax in Java, but the syntax is a
little different for the command-line programs that you might use it with.

Some characters generally mean the same thing across utilities:

  * ``^``: begninning of line
  * ``$``: end of line
  * ``*``: zero or more
  * ``+``: one or more
  * ``\b``: a boundary
  * ``\w``: whitespace

To match any of these characters literally, it is necessary to put a backslash
('\') before them. Also, it is possible to denote character and letter ranges,
such as:

  .. code:: sh

     ls [a-f]*[2-6]

This command will list any files or folders that begin with the lowercase
letters a through f, and that end with a number 2 through 6. 

grep, awk, sed
--------------

Some of the most powerful Linux utilities use pipes in conjunction with
detail-rich regular expressions.

grep
----

The command ``grep`` is used to find text in a file or set of lines. It picks
out lines which match. The following line:

  .. code:: sh
     
     cat secrets | grep "kittens"

would concatenate the contents of the file ``secrets`` to stdout, then show
only those lines containing the string of text ``kittens``.  More advanced
uses:

  .. code:: sh
     
     cat secrets | grep "^\*"

This will match any line that begins with an asterisk.

awk
---

The command ``awk`` is used to isolate columns from text. For example,
the following:

  .. code:: sh

     date | awk '{print $1}'

would print the day of the week. Likewise:

  .. code:: sh

     ls -l | awk '{print $8}'

would give the 8th column of the output of `ls -l`, whcih is the time of day
that the files in the currect directory were last modified.  This can be
combined with ``grep``:

  .. code:: sh

     ls -l | grep "kitties" | awk '{print $8}'

This will identify any row containing the string "kitties", which is likely
the filename (unless there exists a user or group named "kitties"); then for
such rows, it will isolate the 8th column, which is the time last modified. 

sed
---

The ``sed`` command stands for "stream editor", and its most powerful feature
is substitution.  It is like the find-and-replace function in a word processor,
except more flexible.  

Following is an example of the use of sed:

  .. code:: sh

     cat secrets | sed 's/kitties/cats/g'

This command will output the contents of the file secrets, but will change out
all instances of the string ``kitties`` with ``cats``.  The ``g`` flag at the
end indicates that if there is more than one match on a line, the substitution
shall be done multiple times (if it is omitted, it only performs at most one
substitution per line).

The above does not actually change the contents of the file, but rather pipes
the file through ``sed``, which will transform it before it finally outputs to
stdout. To actually change the file, a different syntax is used:

  .. code:: sh

     sed -i 's/kitties/cats/g' secrets

The ``-i`` flag means "in-place"; or modify the file in-place. The ``sed``
command can also capture certain inputs it matches, then use those captured
inputs in substitutions.  Take the example of a two-column text file called
``colors.txt``:

  ::
  
    one    red
    two    orange
    three  yellow
    four   green 
    five   blue  

Assume that there are tabs ('\t') separating each of the two columns. We may
interchange the columns of data using a ``sed`` substitution: 

  .. code:: sh

     sed -i 's/\(.*\)\t\(.*\)/\2\t\1/'

This command means: capture ( \( and \) ) everything (.*) preceding a tab (\t)
and also capture ( \( and \) ) everything (.*) after.  Place the second thing
matched first, followed by a tab, then place the first thing matched. This
effectively switches the columns.

``sed`` substitutions are supported in ``vim``; the syntax is identical. To
perform the above command, switch into command mode:

  .. code:: sh

     :s/\(.*\)\t\(.*\)/\2\t\1/
