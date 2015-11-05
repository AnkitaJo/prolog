emp('John', 'vp',27500).
emp('Bob,'admin',14200).
emp('Bill','clerk',14200).
emp('B' ,'some',34567).	

test2 :-
	findall([X,Y],emp(X,_,Y),Pairs),
	write(Pairs),
	nl.
test3 :-
	bagof(X,S^emp(X,S,14200),List),
	write(List),
	nl.
test4 :-
	bagof(X,W^emp(X,W,S),List),
	write(List),
	write(' '),
	nl.