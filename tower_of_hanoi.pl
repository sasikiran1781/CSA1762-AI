% move(N, Source, Target, Auxiliary) is the rule that solves the Tower of Hanoi problem.
% N: the number of disks
% Source: the source peg
% Target: the destination peg
% Auxiliary: the auxiliary peg

move(1, Source, Target, _) :-
    write('Move disk from '), write(Source), write(' to '), write(Target), nl.

move(N, Source, Target, Auxiliary) :-
    N > 1,
    M is N - 1,
    move(M, Source, Auxiliary, Target),  % Move N-1 disks from Source to Auxiliary using Target
    move(1, Source, Target, _),          % Move the largest disk from Source to Target
    move(M, Auxiliary, Target, Source).  % Move N-1 disks from Auxiliary to Target using Source
