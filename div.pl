length([], Length, Length).
length([_Head|Tail], Buffer, Length):-
    NewBuffer is Buffer + 1,
    length(Tail, NewBuffer, Length).
div(List,Div):-
    length(List,0,LenList), 
    length(Div,0,LenDiv),
    LenListBuff is LenList/2-1,
    LenListBuff = LenDiv, 
    div2(List,Div).
div3(List,[]):-
    length(List,0,Length), 
    Length = 1.
div3([El1,_,El2|Torig],[H|Tdiv]):-
    Div1 is El1 - El2,
    Div1 = H, 
    div3([El2|Torig],Tdiv).
div2([_,El1,_,El2|Torig],[H|Tdiv]):-
    Div1 is El1 - El2,
    Div1 = H,
    div3([El2|Torig],Tdiv).
