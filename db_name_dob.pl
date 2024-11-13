% Facts: name and DOB of individuals
person('Alice', '1995-04-23').
person('Bob', '1992-11-15').
person('Charlie', '1988-08-30').

% Query to find a person's DOB by name
find_dob(Name, Dob) :-
    person(Name, Dob).
