% Define the fruits and colors
fruit(apple).
fruit(banana).
fruit(cherry).
fruit(grape).

color(red).
color(yellow).
color(blue).
color(purple).

% Assign a color to a fruit
assign_color(Fruit, Color) :-
    fruit(Fruit),
    color(Color).

% The constraint: each fruit should have a unique color.
solve(FruitsColors) :-
    FruitsColors = [apple-Red, banana-Yellow, cherry-Blue, grape-Purple],
    assign_color(apple, Red),
    assign_color(banana, Yellow),
    assign_color(cherry, Blue),
    assign_color(grape, Purple).

% Example query
% ?- solve(Solution).
