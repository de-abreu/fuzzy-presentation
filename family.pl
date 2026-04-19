% --- Facts (The Database) ---
% parent(Parent, Child)
parent(ion, andrei).
parent(elena, andrei).
parent(ion, maria).

parent(andrei, stefan).
parent(andrei, adina).
parent(georgeta, stefan).

% --- Rules (The Logic) ---
% A is a grandparent of B if A is a parent of C, and C is a parent of B.
grandparent(GP, GC) :-
    parent(GP, Parent),
    parent(Parent, GC).

:- initialization(main).

main :-
    format('~n--- Query 1: grandparent(X, stefan) ---~n'),
    grandparent(X, stefan),
    format('X = ~w~n', [X]),
    fail.
main :-
    format('~n--- Query 2: grandparent(ion, X) ---~n'),
    grandparent(ion, X),
    format('X = ~w~n', [X]),
    fail.
main :-
    format('~n--- Query 3: grandparent(GP, GC) ---~n'),
    grandparent(GP, GC),
    format('GP = ~w, GC = ~w~n', [GP, GC]),
    fail.
main :-
    halt.