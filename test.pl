

draw_board(N, N, _) :-
	nl,
	draw_col_num(N, -1),
	nl.	
	
draw_col_num(N, N):-
	nl.
%Initializer for column number drawer
draw_col_num(N, -1) :-
	write('     '),
	draw_col_num(N, 0).
%Recursive column numberer for number less than 11
draw_col_num(N, Y) :-
	NextY is Y + 1,
	NextY =< 10,
	write(' '), write(NextY), write(' '),
	draw_col_num(N, NextY).
%Recursive column numberer for numbers greater than 10
draw_col_num(N, Y) :-
	NextY is Y + 1,
	NextY > 10,
	NextY =< N,
	write(NextY), write(' '),
	draw_col_num(N, NextY).