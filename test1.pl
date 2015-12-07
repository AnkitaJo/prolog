%Base case, stops when N columns are the same as desired grid size

%Draws the numbers for the columns at the bottom of the board
draw_board(N, N, _) :-
	nl,
	draw_col_num(N, -1),
	nl.
%Intitial case, draw the numbers for the columns
draw_board(N, -1, Route) :-
	draw_col_num(N, -1),
	draw_board(N, 0, Route).
%Recursive predicate that draws N rows and columns
%First time this is called N must be 0
draw_board(GridSize, X, Route) :-
	draw_row(GridSize, X, -1, Route),
	NextX is X + 1,
	draw_board(GridSize, NextX, Route).
	
	
%Draw row numbers to the right of the board less than 10
draw_row(Y, X, Y, _) :-
	NextX is Y - X,
	NextX =< 9,
	NextX > 0,
	write(' |  '), write(NextX), 
	nl.
%Draw row numbers to the right of the board greater than 9
draw_row(Y, X, Y, _) :-
	NextX is Y - X,
	NextX >= 10,
	write(' | '), write(NextX), 
	nl.
%Draw row numbers to the left of the board that are less than 10
draw_row(GridSize, X, -1, Route) :-
	NextX is GridSize - X,
	NextX =< 9,
	NextX > 0,
	write(NextX), write('  | '),
	draw_row(GridSize, X, 0, Route).
%Draw numbers numbers to the left of the board that are greater than 9
draw_row(GridSize, X, -1, Route) :-
	NextX is GridSize - X,
	NextX >= 10,
	write(NextX), write(' | '),
	draw_row(GridSize, X, 0, Route).
%Draw the non-visited and non-crevice spaces on the board
draw_row(GridSize, X, Y, Route) :-
	RealX is GridSize - X,
	RealX > 0,
	RealY is Y + 1,
	\+ boundary(RealX, RealY),
	\+ route_member([RealX, RealY], Route),
	NextY is Y + 1,
	NextY =< GridSize,
	write(' _ '),
	draw_row(GridSize, X, NextY, Route).
%Draw the crevices
draw_row(GridSize, X, Y, Route) :-
	RealX is GridSize - X,
	RealX > 0,
	RealY is Y + 1,
	\+ route_member([RealX, RealY], Route),
	boundary(RealX, RealY),
	NextY is Y + 1,
	NextY =< GridSize,
	write(' * '),
	draw_row(GridSize, X, NextY, Route).
%Draw the route
draw_row(GridSize, X, Y, Route) :-
	RealX is GridSize - X,
	RealX > 0,
	RealY is Y + 1,
	\+ boundary(RealX, RealY),
	route_member([RealX, RealY], Route),
	NextY is Y + 1,
	NextY =< GridSize,
	write(' X '),
	draw_row(GridSize, X, NextY, Route).

%Base case for the column number boundary drawer	
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