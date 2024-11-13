sum_n(0, 0).

sum_n(N, Sum) :-
    N > 0,
    N1 is N - 1,
    sum_n(N1, Sum1),
    Sum is Sum1 + N.
