% Facts: Define known symptoms and diseases
has_symptom(john, fever).
has_symptom(john, cough).
has_symptom(mary, sore_throat).
has_symptom(mary, runny_nose).
has_symptom(susan, fever).
has_symptom(susan, chills).
has_symptom(susan, headache).

% Rules: Define how symptoms lead to diagnoses
disease(flu) :- has_symptom(_, fever), has_symptom(_, cough), has_symptom(_, sore_throat).
disease(cold) :- has_symptom(_, runny_nose), has_symptom(_, sore_throat).
disease(pneumonia) :- has_symptom(_, fever), has_symptom(_, cough), has_symptom(_, difficulty_breathing).
disease(malaria) :- has_symptom(_, fever), has_symptom(_, chills), has_symptom(_, headache).
disease(gastroenteritis) :- has_symptom(_, diarrhea), has_symptom(_, vomiting).

% Forward chaining to infer diseases
forward_chaining :-
    disease(Disease),
    write('Possible disease: '), write(Disease), nl,
    fail.

% Helper query to list all diseases inferred through forward chaining
possible_diseases :-
    forward_chaining.
