% Facts representing diseases and their symptoms
disease(flu, [fever, cough, sore_throat, body_ache]).
disease(cold, [runny_nose, sore_throat, cough]).
disease(pneumonia, [fever, cough, difficulty_breathing, chest_pain]).
disease(malaria, [fever, chills, sweating, headache]).
disease(gastroenteritis, [diarrhea, vomiting, stomach_pain]).

% Rules to diagnose the disease based on symptoms
diagnose(Disease) :-
    write('Please provide the symptoms (separate with commas, e.g., fever, cough): '), nl,
    read(Symptoms),  % Read input symptoms
    disease(Disease, DiseaseSymptoms),
    subset(Symptoms, DiseaseSymptoms),
    write('The patient might have: '), write(Disease), nl.

% Check if a list of symptoms is a subset of another list
subset([], _).
subset([H|T], List) :-
    member(H, List),
    subset(T, List).

% Example usage: diagnose the disease based on given symptoms
