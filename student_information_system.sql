CREATE DATABASE SIS;
USE SIS;

CREATE TABLE Instructor (
    InstructorID INT PRIMARY KEY,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Email VARCHAR(45),
    Department VARCHAR(45),
    Phone VARCHAR(45),
    Address VARCHAR(45),
    AcademicTitle VARCHAR(45),
    Gender VARCHAR(45)
);



CREATE TABLE Advisor (
    AdvisorID INT PRIMARY KEY,
    Title VARCHAR(45),
    bolum VARCHAR(45)
);


CREATE TABLE Semester (
    Semester_Term VARCHAR(45) PRIMARY KEY,
    Semester_GPA INT,
    Year_Credit INT
);


CREATE TABLE Transcript (
    NationalID INT PRIMARY KEY
);


CREATE TABLE Student (
    StudentNumber INT PRIMARY KEY,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Adres VARCHAR(45),
    Gender VARCHAR(45),
    Nationality VARCHAR(45),
    Email VARCHAR(45),
    PhoneNumber INT,
    BirthDate DATE,
    Transcript_NationalID INT,
    FOREIGN KEY (Transcript_NationalID) REFERENCES Transcript(NationalID)
);


CREATE TABLE CourseRegistration (
    CourseCode INT PRIMARY KEY,
    CourseInfo VARCHAR(45),
    ECTS INT,
    Credit INT,
    CourseContent VARCHAR(45),
    CourseOutcomes VARCHAR(45),
    Classroom VARCHAR(45),
    CourseTime VARCHAR(45),
    Instructor_InstructorID INT,
    Semester_Term VARCHAR(45),
    Student_StudentNumber INT,
    FOREIGN KEY (Instructor_InstructorID) REFERENCES Instructor(InstructorID),
    FOREIGN KEY (Semester_Term) REFERENCES Semester(Semester_Term),
    FOREIGN KEY (Student_StudentNumber) REFERENCES Student(StudentNumber)
);


CREATE TABLE CourseSchedule (
    CourseCode INT PRIMARY KEY,
    Classroom VARCHAR(45),
    CourseTime DATETIME,
    StudentNumber INT,
    donem VARCHAR(45),
    Instructor_InstructorID INT,
    FOREIGN KEY (Instructor_InstructorID) REFERENCES Instructor(InstructorID)
);


CREATE TABLE CourseSchedule_has_CourseRegistration (
    DersProgrami_Ders_Kodu INT,
    DersProgrami_ogrenciNum INT,
    DersProgrami_OgretimUyesi_idOgretimUyesi INT,
    DersKayit_Ders_Kodu INT,
    DersKayit_OgretimUyesi_idOgretimUyesi INT,
    DersKayit_Donem_Yariyil VARCHAR(45),
    DersKayit_ogrenci_ogrenciNumarasi INT,
    FOREIGN KEY (DersProgrami_Ders_Kodu) REFERENCES CourseSchedule(CourseCode),
    FOREIGN KEY (DersKayit_Ders_Kodu) REFERENCES CourseRegistration(CourseCode)
);


CREATE TABLE CourseSchedule_has_Instructor (
    DersProgrami_Ders_Kodu INT,
    DersProgrami_ogrenciNum INT,
    Instructor_InstructorID INT,
    FOREIGN KEY (DersProgrami_Ders_Kodu) REFERENCES CourseSchedule(CourseCode),
    FOREIGN KEY (Instructor_InstructorID) REFERENCES Instructor(InstructorID)
);


CREATE TABLE Student_has_Advisor (
    Student_StudentNumber INT,
    Student_Transcript_NationalID INT,
    Student_AdvisorID INT,
    FOREIGN KEY (Student_StudentNumber) REFERENCES Student(StudentNumber),
    FOREIGN KEY (Student_AdvisorID) REFERENCES Advisor(AdvisorID)
);


CREATE TABLE Student_has_Exam (
    Student_StudentNumber INT,
    Student_Transcript_NationalID INT,
    Student_AdvisorID INT,
    Exam_CourseCode VARCHAR(45),
    CourseGrades_CourseCode INT,
    CourseGrades_StudentNumber INT,
    CourseGrades_Semester VARCHAR(45),
    FOREIGN KEY (Student_StudentNumber) REFERENCES Student(StudentNumber)
);


CREATE TABLE Exam (
    dersKodu VARCHAR(45) PRIMARY KEY,
    Midterm INT,
    Final INT,
    Makeup INT,
    ExemptionExam INT
);


CREATE TABLE Exam_has_CourseGrades (
    Exam_CourseCode VARCHAR(45),
    CourseGrades_CourseCode INT,
    CourseGrades_CourseName VARCHAR(45),
    CourseGrades_ECTS INT,
    CourseGrades_Credit INT,
    CourseGrades_Grade VARCHAR(45),
    CourseGrades_StudentNumber INT,
    CourseGrades_Semester VARCHAR(45),
    CourseGrades_TranscriptID INT,
    FOREIGN KEY (Exam_CourseCode) REFERENCES Exam(dersKodu)
);


CREATE TABLE CourseGrades (
    CourseCode INT PRIMARY KEY,
    CourseName VARCHAR(45),
    ECTS INT,
    Credit INT,
    Grade VARCHAR(45),
    Student_StudentNumber INT,
    Semester_Term VARCHAR(45),
    Transcript_NationalID INT,
    FOREIGN KEY (Student_StudentNumber) REFERENCES Student(StudentNumber),
    FOREIGN KEY (Semester_Term) REFERENCES Semester(Semester_Term),
    FOREIGN KEY (Transcript_NationalID) REFERENCES Transcript(NationalID)
);
