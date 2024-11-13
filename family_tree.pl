% Facts: parent(Parent, Child)
parent('John', 'Alice').
parent('John', 'Bob').
parent('Alice', 'Charlie').
parent('Bob', 'David').
parent('Bob', 'Eva').
parent('Charlie', 'Fiona').

% Rule to find if X is a parent of Y
is_parent(X, Y) :-
    parent(X, Y).

% Rule to find if X is a grandparent of Y
is_grandparent(X, Y) :-
    parent(X, Z),   % X is a parent of Z
    parent(Z, Y).   % Z is a parent of Y

% Rule to find if X and Y are siblings
are_siblings(X, Y) :-
    parent(Z, X),   % Z is a parent of X
    parent(Z, Y),   % Z is a parent of Y
    X \= Y.         % X and Y must be different people

% Rule to find if X is a cousin of Y
are_cousins(X, Y) :-
    parent(PX, X),  % PX is a parent of X
    parent(PY, Y),  % PY is a parent of Y
    are_siblings(PX, PY).  % PX and PY are siblings (X and Y are cousins)
