%fibonacci by backtracking maybe

fib(0,0).
fib(N,F) :-
	fib2(N,_,F).
fib2(1,0,1).
fib2(N,_,F) :-
	N>1,
	N1 is N-1,
	fib2(N1,F2,F1),
	F is F1 + F2.