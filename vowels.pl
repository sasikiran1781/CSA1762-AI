% Base case: No vowels in an empty list
count_vowels([], 0).

% Recursive case: If the head of the list is a vowel, count it and continue with the tail
count_vowels([H|T], Count) :-
    is_vowel(H),                % Check if the head is a vowel
    count_vowels(T, TailCount), % Recursively count vowels in the tail
    Count is TailCount + 1.     % Add 1 to the tail count

% Recursive case: If the head of the list is not a vowel, continue with the tail
count_vowels([H|T], Count) :-
    \+ is_vowel(H),            % If the head is not a vowel
    count_vowels(T, Count).    % Continue counting vowels in the tail

% Define vowels
is_vowel(X) :- member(X, [a, e, i, o, u]).

% Query example:
% ?- count_vowels([a, b, e, i, o, u], Count).
% Count = 6.

% ?- count_vowels([b, c, d], Count).
% Count = 0.
