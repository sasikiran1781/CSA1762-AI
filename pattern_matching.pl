% Define a pattern
match_pattern([a, b, c], [a, b, c]).  % Matches exactly the pattern

match_pattern([X, b, c], [X, b, c]).  % Matches with variable X

match_pattern([X, Y, Z], [a, b, c]).  % Will fail as the list doesn't match

% Query examples:
% ?- match_pattern([a, b, c], [a, b, c]).
% true.

% ?- match_pattern([X, b, c], [a, b, c]).
% X = a.
