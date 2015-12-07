print_sentiment(Value) :-
	Value > 0,
	write('positive').
print_sentiment(Value) :-
	Value < 0,
	write('negative').
print_sentiment(Value) :-
	Value = 0,
	write('neutral').

value_oftags(positive, 1).
value_oftags(negative, -1).
value_oftags(_, 0).

previousTagValue([],CurrentValue, CurrentValue).
previousTagValue([_, nothing], CurrentValue, CurrentValue).
previousTagValue([_, increase], CurrentValue, OutputValue) :-
	OutputValue is CurrentValue * 2.
previousTagValue([_, decrease], CurrentValue, OutputValue) :-
	OutputValue is CurrentValue / 2.
previousTagValue([_, negation], CurrentValue, OutputValue) :-
	OutputValue is CurrentValue * -1.

sentence_score([], _, _).
sentence_score([_, Tag], PrevToken, CurScore) :-
	value_oftags(Tag, ValueTag),	
	previousTagValue(PrevToken, ValueTag, CurScore).	
sentence_score([[Word, Tag]|Tail], PrevToken, TotalScore) :- 
	value_oftags(Tag, ValueTag),	
	previousTagValue(PrevToken, ValueTag, CurScore),
	CurToken = [Word, Tag],
	sentence_score(Tail, CurToken, TotalofRest),
	TotalScore is CurScore + TotalofRest.

tag_sentence([Word |Reststring], Reststring, [Word, Category]) :-
	dict(Word,Category).
tag_sentence([Word |Reststring], Reststring, [Word, nothing]) :-
	not(dict(Word,_)).
tag_sentence([],String, String).
tag_sentence(String, Reststring, [Subtree|Subtrees]) :-
	tag_sentence(String, String1, Subtree),
	tag_sentence(String1, Reststring, Subtrees).

sentiment(String) :-
        tag_sentence(String, [], TaggedResult),
		sentence_score(TaggedResult, [], Value),
		%totalScore(Value),
		write('The sentence is: '), print_sentiment(Value), nl.