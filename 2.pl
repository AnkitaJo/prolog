%normal fibonacci

fibonacci(0,0).
fibonacci(1,0).
fibonacci(2,1).
fibonacci(N,R):-
	N>2,
	N1 is N-1,
	N2 is N-2,
	fibonacci(N1,F1),
	fibonacci(N2,F2),
	R is F1+F2.
	
%intersection of two list. remove duplicates

%base case 1
my_intersect([],_,[]).
%base case 2
my_intersect(_,[],[]).

my_intersect([H1|T1],List2,[TResult|Result]) :-
	is_list(H1),
	my_intersect(H1,List2,TResult),
	my_intersect(T1,List2,Result).

my_intersect([H1|T1],List2,[H1|Result]) :-
	\+ is_list(H1),
	member(H1,List2),
	my_intersect(T1,List2,Result).

my_intersect([H1|T1],List2,Result) :-
	\+ is_list(H1),
	\+member(H1,List2),
	my_intersect(T1,List2,Result).
	
