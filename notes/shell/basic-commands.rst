A More Detailed Outline of Basics Commands
==========================================


Commands for Navigation
-----------------------

* ``ls`` is used to list directory contents. On ANSI color-enabled terminals,
  folders will appear in blue, executables in green, device files in yellow,
  media files in magenta, links in cyan, and broken links in red; the full
  colors listing is defined in the LS_COLORS environment variable.

  + ``ls`` may accept directories as arguments. If they are supplied, the
    program will applied to those directories.

  + The ``-l`` flag gives the long listing, which produces more detailed
    output for the files. The first column gives the **permissions** of the
    files. 'r' means read, 'w' write, and 'x' execute. The first set of
    three letters gives permissions for the user, the second set is for the
    group, and the third is for all others.

    ::

      total 36
      -rw-r--r-- 1 mouse mouse 4685 Aug 24 16:51 calendar.rst
      -rw-r--r-- 1 mouse mouse 3310 Aug 24 13:57 commands.rst
      -rw-r--r-- 1 mouse mouse 1936 Aug 24 16:03 faq.rst
      -rw-r--r-- 1 mouse mouse 1107 Aug 24 13:57 git.rst
      -rw-r--r-- 1 mouse mouse 2810 Aug 24 16:03 grading.rst
      -rw-r--r-- 1 mouse mouse 2114 Aug 24 16:03 login.rst
      -rw-r--r-- 1 mouse mouse 1455 Aug 24 13:57 README.rst
      -rw-r--r-- 1 mouse mouse 3715 Aug 24 16:02 syllabus.rst

    The second column gives the number of hard links to the file. For
    directories, this is 2+number of subdirectories. The third column gives
    the user who owns the file, and the fourth gives the group who owns
    the file.  The fifth column tells the number of bytes of the file.
    The sixth, seventh and eighth columns show the time; finally the last
    gives the filename.

  + The ``-a`` flag includes hidden files in the output. In Unix/Linux
    systems, hidden files and directories begin with a dot (``.``).


* ``cd`` stands for "change directory"; its sole argument is the directory
  to change into.

* ``pwd`` stands for "present working directory"; it takes no arguments.
  It gives the current directory as output.  The environment variable ``PWD``
  also contains the current directory.  It is, in fact, possible to change 
  the current directory by re-assigning the ``PWD`` environment variable
  to something else.


Commands for Output
-------------------

* ``cat`` stands for "concatenate", and accepts a filename as an argument.
  It prints any file to the terminal screen.  If no argument is given, it
  will concatenate back whatever the user enters via stdin, until CTRL-D
  is hit.

  + Likewise the command ``tac`` will print a file *backwards* line-wise; 
    that is, it prints the last line first, the second-to-last line second,
    etc.

  + A similar command is ``head``, which by default prints the first 10
    lines of a file.  It accepts an ``-n`` flag to specify the exact number
    of lines.  Sometimes, you'll want to show only part of a file to avoid
    flooding the terminal.

  + Similar is ``tail``, which prints the last 10 lines of a file. It is
    identical to ``head`` in every other respect.

* ``echo`` will print to stdout whatever string is given as an argument.
  It also prints the contents of environment variables (rather than the
  names of variables themselves), which makes it useful for shell programming.

  + The command ``rev`` prints lines backwards character-wise.  It accepts
    a file as an argument (or if no argument is supplied, it operates on
    stdin).  


Commands for Manipulating Output
--------------------------------

* ``sort`` will sort lines of a file in lexicographic order. The ``-n`` flag
  allows it to sort numerically.

* ``uniq`` will identify unique lines in a file which is sorted a-la the
  ``sort`` command. 

* ``shuf`` will produce a random line-wise shuffling of a file.


Commands for Manipulating Files/Directories
-------------------------------------------

* ``touch`` is used for creating new plain-text files and manipulating 
  file timestamps on existing files.  It is possible to set last modified 
  times with it (to correct an issue, deceive another user).

* ``mkdir`` can be used to make a new directory.  Its argument list is the
  name of the directories to be made. 

* ``mv`` can be used to move a file from one location to another. It accepts
  two arguments; the first is the path to the file/directory, and the second
  is the path of a directory to move the file/directory into.
  
  + It can also be used to rename files. If the second argument is not an
    existing directory, the file will be moved and renamed to the name given
    by the second argument.

* ``rm`` can remove files.  Beware; the deletion is permanent and 
   irreversible.

   + To remove directories, use the ``-r`` flag (which stands for
     for "recursive").


Commands for Command Documentation
----------------------------------

* ``whatis`` accepts a command name as an argument, and gives a synopsis
  of that command.

* ``which`` accepts a command name as an argument, and gives the path
  of that command.  Some commands are in multiple directories within
  the PATH; typically the one that is used is in the first directory
  given in the PATH.

* ``man`` stands for "manual page"; it accepts a command name as an
  argument.  It will give a detailed reference on the command: what
  it does, what its options are, how to use it, who wrote it, etc.
  Not all commands have manual pages, particularly if they are simple
  (like ``cd``) or if they are externally well-documentated. Press
  'j', 'k' to scroll, and 'q' to quit viewing the manual page.

* ``apropos`` is a word that means "appropriate to the situation".
  It accepts a keyword as an argument, and lists all commands pertaining
  to that keyword.


Commands for Environment Variables
----------------------------------

* ``env`` will list the environment variables for this shell session
  (both names and values). It can be useful for determing what was in use
  up to this point. 

* ``let`` allows the setting or re-setting of environment variables
  using arithmetic expressions.  For example,

    .. code:: sh
    
    let i=2
    echo $i

  This simple script assigns an environment variable called ``i`` to
  the numeric value 2, then prints the contents of ``i`` to the screen.
