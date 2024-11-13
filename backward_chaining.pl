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

% Backward chaining to check if a disease can be diagnosed
check_disease(Disease) :-
    disease(Disease),
    write('Diagnosis for: '), write(Disease), nl.

% Helper predicate to check symptoms for a particular disease
check_symptoms_for_disease(Disease) :-
    write('Checking symptoms for disease: '), write(Disease), nl,
    disease(Disease),
    write('Symptoms: '), nl,
    display_symptoms(Disease).

% Display symptoms for a given disease (for user interaction)
display_symptoms(Disease) :-
    disease(Disease),
    (has_symptom(_, Symptom) -> write(Symptom), nl; true).
