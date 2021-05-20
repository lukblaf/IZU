% Pravidlo pre urcenie kladnej parity cisla 
isEven(NUM) :- NUM mod 2 =:= 0. 

getBiggerThanZero([], []).
% Pravidlo pre ponechanie cisiel vacsich ako 0 v zozname
getBiggerThanZero([X|Xs], Y) :-
    (	X < 1 -> Y = Ys ; Y = [X|Ys] ),
    getBiggerThanZero(Xs, Ys).

getOddNums([], []).
% pravidlo pre ponechanie neparnych poloziek v zozname
getOddNums([X|Xs], Y) :-
    (	isEven(X) -> Y = Ys ; Y = [X|Ys] ),
    getOddNums(Xs, Ys).

getLenght([], Lenght) :- Lenght is 0.
getLenght([_|Y], Lenght) :- 
    getLenght(Y,L),
    Lenght is L + 1.

% Pravdilo pre zistenie vyskytu prvku v zozname
isMember(X, [Y|T]) :- X = Y ; isMember(X, T).

% Pravidla pre implementaciu Set funkcie za ucelom vymazania duplicit v zozname
getSet(List, Set) :-
    getSetHelp(List, [], Set).
getSetHelp([], Acc, Acc).
getSetHelp([H|T], Acc, Set) :-
    isMember(H, Acc),
    getSetHelp(T, Acc, Set).
getSetHelp([H|T], Acc, Set) :-
    getSetHelp(T, [H|Acc], Set).

 %
 % Pravidlo na overenie toho, ci v zozname boli nejake duplicy.
 % POSTUP:
 % 1) Vymazanie duplicit a vlozenie do noveho zoznamu, 
 %    ktoreho velkost budeme porovnavat s povodne vlozenym zoznamom.
 % 
 % 2) Zistenie dlzky povodneho zoznamu a zoznamu na ktory bol aplikovany Set.
 % 3) Porovnanie dlzok jednotlivych zoznamov
 % 		- Ak v povodnom zozname boli aspon jeden krat dve rovnake cisla, tak plati: X > Y is true,
 % 		  respektive zoznam s duplicitnymi prvkami ma mensiu dlzku nez ten povodny
 %      - inak false.
 % 

isDuplicity(L) :-
    getSet(L, S),
    getLenght(L, X),
    getLenght(S, Y),
    X > Y.

% ak dostanem prazdny zoznam vysledok vysledok bude false.
uloha38([]) :- false.
uloha38(SEZNAM) :- 
   % ponecham cisla vacsie ako 0 v zozname
   getBiggerThanZero(SEZNAM,BIGGER),
   % ponecham si iba neparne cisla v zozname
   getOddNums(BIGGER, ODD),
   % skontrolujem, ci mam opakujuce sa neparne cisla v zozname
   isDuplicity(ODD).

