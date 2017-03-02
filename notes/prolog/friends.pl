
friend(alice,bob).
friend(bob,charlie).
friend(bob,eve).
friend(X,Z) :- enemy(X,Y), enemy(Y,Z).

enemy(alice,eve).
enemy(bob,eve).
enemy(eve,mallet).

friendoffriend(X,Z) :- friend(X,Y), friend(Y,Z).

frenemy(X,Y) :- friend(X,Y), enemy(X,Y).

