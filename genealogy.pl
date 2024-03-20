parent(adam, john).
parent(eve, john).
parent(eve, lisa).
parent(john, anne).
parent(john, pat).
parent(pat, jacob).
parent(jacob, carol).

male(adam).
male(john).
male(pat).
male(jacob).
male(carol).

female(eve).
female(lisa).
female(anne).

father(Father, Child) :- male(Father), parent(Father, Child).
mother(Mother, Child) :- female(Mother), parent(Mother, Child).

grandparent(Grandparent, Grandchild) :- parent(Grandparent, Parent), parent(Parent, Grandchild).

grandfather(Grandfather, Grandchild) :- male(Grandfather), grandparent(Grandfather, Grandchild).
grandmother(Grandmother, Grandchild) :- female(Grandmother), grandparent(Grandmother, Grandchild).

ancestor(X, Z) :- parent(X, Z).
ancestor(X, Z) :- parent(X, Y), ancestor(Y, Z).

head([Head | _], Head).
tail([_ | Tail], Tail).

isMember(X, [X | _]).                        
isMember(X, [_ | Tail]) :- isMember(X, Tail).

concatenate([], L, L).
concatenate([H|T], L, [H|ExtendedTail]) :- concatenate(T, L, ExtendedTail).

prepend(E, L, [E|L]).

addElement(E, [], [E]).
addElement(E, [Head|Tail], [Head|Result]) :-
    addElement(E, Tail, Result).

hasLength([], 0).
hasLength([_ | Tail], Length) :-
    hasLength(Tail, TailLength),
    Length is TailLength + 1.

remove(E, [E|Tail], Tail).
remove(E, [Head|Tail], [Head|Result]) :-
    remove(E, Tail, Result).