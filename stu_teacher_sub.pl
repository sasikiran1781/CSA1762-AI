% Facts: student, teacher, and subject code
% student(StudentName, StudentID)
student('Alice', 101).
student('Bob', 102).
student('Charlie', 103).

% teacher(TeacherName, TeacherID)
teacher('Dr. Smith', 201).
teacher('Prof. Johnson', 202).
teacher('Mrs. Brown', 203).

% subject(SubjectName, SubjectCode)
subject('Mathematics', 'MATH101').
subject('Physics', 'PHYS102').
subject('Chemistry', 'CHEM103').

% enrollment(StudentID, TeacherID, SubjectCode)
enrollment(101, 201, 'MATH101').
enrollment(102, 202, 'PHYS102').
enrollment(103, 203, 'CHEM103').

% Query: Find the subject code and teacher of a student
student_subject_teacher(StudentName, SubjectCode, TeacherName) :-
    student(StudentName, StudentID),
    enrollment(StudentID, TeacherID, SubjectCode),
    subject(SubjectName, SubjectCode),
    teacher(TeacherName, TeacherID).
