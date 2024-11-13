% Define the initial state
% monkey_position(ground).
% box_position(ground).
% monkey_on_box(false).
% banana_position(high).

% Facts for the problem:
monkey_position(ground).
box_position(ground).
banana_position(high).
monkey_on_box(false).

% Rules for actions:
% The monkey can move the box.
move_box :- box_position(ground), write('Moving box to under the banana'), nl, assert(box_position(under_banana)).

% The monkey can climb the box.
climb_box :- box_position(under_banana), write('Monkey climbs the box'), nl, assert(monkey_on_box(true)).

% The monkey can take the banana if it is on the box.
take_banana :- monkey_on_box(true), banana_position(high), write('Monkey takes the banana'), nl, retract(banana_position(high)).

% To solve the problem step-by-step:
solve :- 
    move_box,
    climb_box,
    take_banana.

