length([], Length, Length).
length([_Head|Tail], Buffer, Length):-NewBuffer is Buffer + 1, length(Tail, NewBuffer, Length).
div(List,[]):-length(List,0,Length), Length = 1.
div([El1,El2|Torig],[H|Tdiv]):-Div1 is El1 - El2, Div1 = H, div([El2|Torig],Tdiv).
