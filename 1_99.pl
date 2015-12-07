%Find the last element of a list

last_element([],[]).
last_element([L],E) :-
		is_list(L),
		last_element(L,E).
		
last_element([E],E) :-
	\+ is_list(E).
	
last_element([_|T],Element) :-
	last_element(T,Element).
	
