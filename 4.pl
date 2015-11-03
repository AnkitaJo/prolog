%sublists of N elements
ch6(_,0,[]).
ch6(List, N , Result) :- 
	length(Result,N),
	append(_,[H|T],List),
	[H|TempRes] = Result,
	ch6(T,_,TempRes).
	
	
%perms

perms([],[]).
perms(List,[H|T]) :-
	append(F,[H|Rest],List),
	append(F,Rest,NewList),
	perms(NewList,T).