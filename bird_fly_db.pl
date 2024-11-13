% Facts: bird(Name, CanFly)
bird('Sparrow', yes).
bird('Penguin', no).
bird('Eagle', yes).
bird('Ostrich', no).
bird('Parrot', yes).

% Rule: can_fly(Name) checks if a bird can fly
can_fly(Name) :-
    bird(Name, yes),
    write(Name), write(' can fly.'), nl.

can_fly(Name) :-
    bird(Name, no),
    write(Name), write(' cannot fly.'), nl.
