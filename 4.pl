%sublists of N elements
ch6(_,0,[]).
ch6(List, N , Result) :- 
	length(Result,N),
	append(_,[H|T],List),
	[H|TempRes] = Result,
	ch6(T,_,TempRes).