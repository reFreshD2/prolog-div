length([], Length, Length).
length([_Head|Tail], Buffer, Length):-
    NewBuffer is Buffer + 1,
    length(Tail, NewBuffer, Length).
div(List,Div,Len,Min,Sort):-
    length(List,0,LenList), 
    length(Div,0,LenDiv),
    Len = LenDiv,
    LenListBuff is LenList/2-1,
    LenListBuff = LenDiv, 
    div2(List,Div),
    contains_all(Div,List),
    isMin(Min,Div),
    isASCSort(Sort,Div).
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
contains(El,[El|_]).
contains(El,[_|T]):-contains(El,T).
contains_all([],_Orig).
contains_all([Hdiv|Tdiv],Orig):-
    contains(Hdiv,Orig),
    contains_all(Tdiv,Orig).
isMin(_Min,[]).
isMin(Min,[H|T]):-
    Min=<H,
    isMin(Min,T).
isASCSort([H1,H2|T],Div):-
    contains(H1,Div),
    H1=<H2,
    isASCSort([H2|T],Div).
isASCSort(El,Div):-
    length(El,0,Length),
    Length = 1,
    contains_all(El,Div).

?-div([8,6,5,1,0,1],[5,0],2,0,[0,5])
