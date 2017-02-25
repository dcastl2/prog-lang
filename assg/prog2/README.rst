Homework 2
==========

Select 64 points worth or problems.  You can earn +N points of extra credit for
submitting the assignment N<=4 days in advance of the due date.

**Note**: You must supply a Makefile and a run.sh script with this assignment
so that they may be graded efficiently [-32].  Your Makefile should compile
your code; your run.sh script should run your codes.  Include a clean rule in
your Makefile.  Submit only your sources, Makefile, and run.sh.



1. ASCII art.
     [16] Use the System.Console.ANSI library to draw a frame-based color
     drawing [4]. It must be at least 8 rows by 16 columns [4] and have at
     least 2 frames [8], which should alternate infinitely.  Call this
     ``color-comic.hs``.


2. ASCII animations.
     [32] Use the System.Console.ANSI library to draw a colored animation in
     ASCII.  The animation should be 25 rows x 60 cols [8], have a framerate of
     30 Hz [4], last for no more than 10 seconds [4], use at least three colors
     [8], be such that no two consecutive frames in the animation are the same
     [8], and be unique [-32].  Call this ``asciimation.hs``.


3. A text-mode map.
     [16] Write a game component in the form of a command interpreter to move a
     character (represented by an asterisk) along a 16x8 grid [4].  Your
     interpreter should accept the commands ``north``, ``east``, ``west``,
     ``south`` [4].  Your map should re-print each time a command is accepted
     [4] 

     You must create a module file ``Map.hs``, and have all data and functions
     pertaining to the map in those modules [4].  Call the main code
     ``map.hs``.  


4. A text-mode role-playing game.
     [32] Write a game in the form of a command interpreter to have your main
     character battle a goblin to the death.  You will make use of the Haskell
     randomization.  Your character shall begin with 3d6+3 HP, while the goblin
     begins with 2d6+2.  You shall have a weapon that deals 2d4, and the goblin
     shall have a weapon which deals 1d4+1.  Your interpreter should accept the
     commands ``attack``, which attacks the goblin with your weapon, and
     ``item``, which uses an item (that you only have one of) which restores
     1d6+2 HP (and must not cause your current to exceed your maximum).  A dice
     roll determines your initiative with 50% probability.

     You must create module files ``Player.hs`` and ``Battle.hs``, and have all
     data and functions pertaining to players and the battle itself in those
     modules.  Call the main code ``battle.hs``.  

     a. Combining this with map functionality for a bi-modal game.
          [16] You may complete this role-playing game to have a battle mode
          and an overworld mode as per problem 1 (main).  Your overworld mode
          should lead to random encounters 10% of the time, and you should add
          another command ``search`` that enables you to gather healing
          potions which occupy 10% density on the map.  For bonus points, you
          can enable an experience system, color, and other bells and whistles.
          Call this ``game.hs``.


5. 2D animations.
     [16] Use the Gloss library to create a 2D animation, which should be of
     considerable complexity.  It should use at least three colors and should
     be in constant motion.  It should resemble a screensaver.  Call this
     ``screensaver.hs``. 

     a. More animations.
         [16] Having finished the above, do an animation of a bouncing ball
         subject to the force of gravity.  Its speed should dampen each time it
         collides with a wall, as if affected by friction.  Call this
         ``physics.hs``. 

