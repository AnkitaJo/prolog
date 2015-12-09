%Find the last element of a list

last_element([],[]).
last_element([L],E) :-
		is_list(L),
		last_element(L,E).
		
last_element([E],E) :-
	\+ is_list(E).
	
last_element([_|T],Element) :-
	last_element(T,Element).
	
%last one but element in a list.

last_butone([L,T],L) :- \+ is_list(T).

last_butone([_|T],Element) :-
	last_butone(T,Element).
	
last_butone([_,T],Element) :- 
	is_list(T),
	last_butone(T,Element).
	
%Find the kth element of a list.


k_element(L,K,Element) :- 
	k_element(L , 1 , K , Element ). 

k_element([H|_] ,Count, K , H) :-
	\+ is_list(H),
	Count =:= K.
	
k_element([H|_] ,Count, K , Element) :-
	is_list(H),
	length(H,Len),
	K =< Len,
	k_element(H, Count , K , Element).
	
k_element([H|T] ,Count, K , Element) :-
	is_list(H),
	length(H,Len),
	K > Len,
	NewK is K-Len,
	k_element(T, Count , NewK , Element).
	
k_element([_|T] , Count,  K , Element) :-
	Count \= K,
	NewK is K-1,
	k_element(T , Count , NewK , Element).

%Number of elements in a list.

numberE([],0).

numberE([H|T],N) :-
	\+ is_list(H),
	numberE(T,NewN),
	N is NewN + 1.
	
numberE([H|T],N) :-
	is_list(H),
	numberE(H,N1),
	numberE(T,N2),
	N is N1 + N2.

	
tnumberE(List , N) :- tnumberE_aux(List, 0 , N).

tnumberE_aux([] , N , N).

tnumberE_aux([H|T] , Temp , N) :-
	is_list(H),	
	tnumberE_aux(H , Temp , NewTemp ),	
	tnumberE_aux(T, NewTemp , N).
	
tnumberE_aux([H|T] , Temp , N) :-
	\+ is_list(H),
	NewTemp is Temp+1,
	tnumberE_aux(T, NewTemp , N).	
	

reverseList([],[]).
	
reverseList([H|T] , Result) :-
		\+ is_list(H),
		reverseList(T,Temp),
		append(Temp,[H],Result).
		
reverseList([H|T] , Result) :-
		is_list(H),
		reverseList(H,Temp1),
		reverseList(T,Temp2),
		append(Temp2,Temp1,Result).
		
treverseList(List , Result) :- treverseList(List, [] , Result).

treverseList([] , Result , Result).

treverseList([H|T] , Temp ,Result) :-
	\+ is_list(H),
	append([H],Temp, NewTemp),
	treverseList(T, NewTemp , Result).

treverseList([H|T] , Temp ,Result) :-
	is_list(H),
	treverseList(H,Temp,Temp1),
	treverseList(T, Temp1 , Result).
		
%Find out whether list is palindrome.

check_palindrome([]).
check_palindrome(List) :-
	reverseList(List,Result),
	List == Result.

	
% Run -length encoding of a list.

rl_encoder([],[]).
rl_encoder([H|T], Result) :-
	rl_encoder_aux(T,H,1,[],Result). -

rl_encoder_aux([H|T] ,H, Acc , M , Result) :-
	NewAcc is Acc + 1,
	rl_encoder_aux(T,H,NewAcc,M,Result).
	
rl_encoder_aux([H|T] , E , Acc , M, Result) :-
	H \== E,
	append(M,[Acc,E],NewM),
	rl_encoder_aux(T,H,1,NewM,Result).

rl_encoder_aux([],E,Acc,M,Result) :-
	append(M,[Acc,E],Result).
	
%Tail recursive code that scans a list of unique positive numbers and finds max.

my_max(List, Max) :-	my_max_aux(List, 0 , Max).

my_max_aux([],Max,Max). 

my_max_aux([H|T], Accumulator , Max) :-
	H >= Accumulator,
	!,
	my_max_aux(T,H,Max).

my_max_aux([H|T], Accumulator , Max) :-
	H < Accumulator,
	!,
	my_max_aux(T,Accumulator,Max).

% Putting an element in a sorted list.

insertE(Element,[],[Element]).
insertE(Element,[H|T],[H|Tresult]) :-
	Element > H,
	insertE(Element,T,Tresult).
insertE(Element,[H|T],[Element,H|T]) :-
	Element =< H.
	
%Sorting a list in descending order

de_insert([],[]).
de_insert(List,Result) :- de_insert_aux(List,[],Result).

de_insert_aux([H|T],Acc,Result) :-
	insertD(H , Acc , Temp),
	de_insert_aux(T , Temp , Result).
	
de_insert_aux([],Result,Result).

insertD(Element , [H|T] , [Element,H|T]) :-
	Element > H.
	
insertD(Element , [H|T] , [H|TResult]) :-
	Element < H,
	insertD(Element , T , TResult).
	
insertD(Element,[],[Element]).

%sort lists based on the length of the sublists

lsort([],[]).
lsort(List, Result) :-
	lsort_aux(List,[],Result).
lsort_aux([H|T],Accumulator,Result):-
	insertH(H,Accumulator,Temp),
	lsort_aux(T,Temp,Result).
lsort_aux([],Result,Result).

insertH(H,[],[H]).
insertH(H,[Head|Tail],[H,Head|Tail]):-
	length(H,N1),
	length(Head,N2),
	N1 >= N2.
insertH(H,[Head|Tail] , [Head|TailResult]):-
	length(H,N1),
	length(Head,N2),
	N1<N2,
	insertH(H,Tail,TailResult).
	
%creating  a list containing all elements within a given range.

range(N,N,[N]).
range(N1,N2,[N1|L]) :- 
	N1 < N2 ,
	NewN1 is N1+1,
	range(NewN1,N2,L).
	
%insert element at kth location of a list.

insert_at(E,List,1,[E|List]).
insert_at(E , [H|T] , N , [H|Result]) :-
	NewN is N-1,
	insert_at(E, T , NewN , Result).
	
%various forms of permutations.
%form1
perm_1(List1,List2) :-
	length(List1,N),
	length(List2,N),
	subset1(List1,List2).
	subset1([],_).
	subset1([H|T],List) :- 
		member(H,List),
		subset1(T,List).
	
%form2
perm2([],[]).
perm2(List,[H|T]) :-
	append(First,[H|Rest] ,List),
	append(First,Rest,NewList),
	perm2(NewList,T).
	
%chosing N elements from list

choose1(_,0,[]).
choose1(List,N,Result) :-
	length(Result,N),
	member(X,List),
	append(_,[X|Tail],List),
	[X|TempRes] = Result,
	choose1(Tail,_,TempRes).

%split a list into two parts. Length of the first part is given.

split(L,0,[],L).
split([H|T],N,[H|Result1],Result2) :- 
	N > 0,
	!,
	NewN is N-1,
	split(T,NewN,Result1,Result2).

	
	
	










	


	
