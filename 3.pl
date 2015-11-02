what(_,[],[]).
what(X,[Y|Z],[S|T]) :-
	what_next(X,Y,S),
	what(X,Z,T).
	
what_next(X,Y,[X|Y]).

ch1(_,0,[]).
ch1([_|T],N,Res) :-
	N>0,
	ch1(T,N,Res).
	
ch1([H|T],N,[H|Res]) :-
	N>0,
	M is N-1,
	ch1(T,M,Res).