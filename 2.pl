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
	
%my_flatten: flattens lists in a list too.

%base case is empty list
my_flatten([],[]).

my_flatten([H|T],[ H | Result]) :-
	\+ is_list(H),
	my_flatten(T , Result ).
	
my_flatten([H|T],Result) :-
	is_list(H),
	my_flatten(H, TResult1),
	my_flatten(T , TResult2 ),
	append(TResult1,TResult2,Result).
	
%is_a_list

is_a_list([]).
is_a_list([_|_]).

%sum of list

sum_list([],0).

sum_list([H|T],Result) :-
	\+ is_list(H),
	sum_list(T,TempResult),
	Result is TempResult + H.
	
sum_list([H|T],Result) :-
	is_list(H),
	sum_list(H, TResult),
	sum_list(T , TempResult),
	Result is TResult + TempResult.

%count number of occurences of given element in the list.

count_all(_,[],0).
count_all(E,[H|T],Result) :-
	\+ is_list(H),
	E == H,
	count_all(E,T,TResult),
	Result is TResult + 1.
	
count_all(E,[H|T],Result) :-
	\+ is_list(H),
	E \= H,
	count_all(E,T,Result).
		
count_all(E,[H|T],Result) :-
	is_list(H),
	count_all(E,H,TResult1),
	count_all(E,T,TResult2),
	Result is TResult1+TResult2.

%my_append: appends two lists.

my_append(List1,[],List1).
my_append([],List2,List2).

my_append([H|T],List2,[H|Result]) :-
	\+ member(H,List2),
	my_append(T, List2 , Result).
	
my_append([H|T],List2,Result) :-
	member(H,List2),
	my_append(T, List2 , Result).
	
%List length gives length of a list.

list_length([],0).

list_length([H|T],Result) :-
	\+ is_list(H),
	list_length(T,TResult),
	Result is TResult + 1.
	
list_length([H|T],Result) :-
	is_list(H),
	list_length(H,TResult1),
	list_length(T,TResult2),
	Result is TResult1 + TResult2.
	
%Union of two lists removing duplicates. : Exactly like my_append.

%Delete the last element from a list.

delete_last([],[]).
delete_last([_],[]).

delete_last([H|T],[H | Result]) :-
	delete_last(T,Result).

%delete all occurences of an element from a list
delete_all(_,[],[]).

delete_all(E,[H|T],[H|Result]):-
	\+is_list(H),
	E \= H,
	delete_all(E,T,Result).
	
delete_all(E,[H|T],Result):-
	\+is_list(H),
	E == H,
	delete_all(E,T,Result).
	
delete_all(E,[H|T],Result):-
	is_list(H),
	delete_all(E,H,TResult1),
	delete_all(E,T,TResult2),
	append(TResult1,TResult2,Result).

%reverse the list and all sublists too.
my_reverse([],[]).
my_reverse([H|T],Result) :-
	\+is_list(H),
	my_reverse(T,TResult),
	append(TResult,[H],Result).

my_reverse([H|T],Result) :-
	is_list(H),
	my_reverse(H,TResult1),
	my_reverse(T,TResult2),
	append(TResult2,TResult1,Result).

%delete_first: delete first element from the list.

delete_first(_,[],[]).

delete_first(E, [H|T] , T) :-
	\+ is_list(H),
	E == H.
	
delete_first(E, [H|T] , [H|Result]) :-
	\+ is_list(H),
	E \== H,
	delete_first(E,T,Result).

delete_first(E,[H|T],Result) :-
	is_list(H),
	delete_first(E,H,TResult1),
	delete_first(E,T,TResult2).
	append(TResult1,TResult2,Result).

	

	
	
	

	

	
	
