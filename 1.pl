parent(pam,bob).
parent(tom,bob).
parent(tom,liz).
parent(bob,ann).
parent(bob,pat).
parent(pat,jim).

female(pam).
female(liz).
female(pat).
female(ann).
male(tom).
male(bob).
male(jim).

offspring(Y,X) :- 
	parent(X,Y).
	
mother(X,Y) :-
	parent(X,Y),
	female(X).
	
grandparent(X,Z):-
	parent(X,Y),
	parent(Y,Z).

sister(X,Y) :-
	parent(Z,X),
	parent(Z,Y),
	X  \= Y,
	female(X).
	
happy(X) :-
	parent(X,_).

hastwochildren(X) :-
	parent(X,Y),
	sister(Y,_).

grandchild(X,Y) :-
	grandparent(Y,Z).
		
aunt(X,Z) :-
	parent(Y,Z),
	sister(X,Y).
	
predecessor(X,Z) :-
	parent(X,Z).
	
predecessor(X,Z) :-
	parent(X,Y),
	pedecessor(Y,Z).