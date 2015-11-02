%Tail recursion for reverse

fast_reverse(Original , Result) :-
	nonvar(Original),
	fast_reverse_aux(Original, [] , Result).
	
fast_reverse_aux([H|T] , Stack , Result) :-
	fast_reverse_aux(T,[H|Stack] , Result).
	
fast_reverse_aux([] , Result , Result).