------------------------------------------------------------
-- Create Database
------------------------------------------------------------
CREATE DATABASE ESB;
GO

USE ESB;
GO

------------------------------------------------------------
-- DEPARTMENT TABLE
------------------------------------------------------------
CREATE TABLE Department(
    DepartmentID INT IDENTITY(1,1) PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL,
    OfficeLocation VARCHAR(100) NOT NULL,
    ContactEmail VARCHAR(100) NOT NULL UNIQUE,
    HeadOfDepartmentID INT NULL
);
GO

------------------------------------------------------------
-- FACULTY TABLE
------------------------------------------------------------
CREATE TABLE Faculty(
    FacultyID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone VARCHAR(20) NOT NULL,
    Department INT NOT NULL FOREIGN KEY REFERENCES Department(DepartmentID),
    Title VARCHAR(50) NOT NULL,
    HireDate DATE NOT NULL
);
GO

-- Add FK for HeadOfDepartmentID referencing Faculty
ALTER TABLE Department
ADD CONSTRAINT FK_Department_Head
FOREIGN KEY (HeadOfDepartmentID) REFERENCES Faculty(FacultyID);
GO

------------------------------------------------------------
-- ACADEMIC PROGRAM TABLE
------------------------------------------------------------
CREATE TABLE academic_program(
    ProgramID INT IDENTITY(1,1) PRIMARY KEY,
    Programname VARCHAR(100) NOT NULL,
    Degreetype VARCHAR(50) NOT NULL,
    Department VARCHAR(100) NOT NULL,
    ProgramStartdate DATE NOT NULL,
    ProgramDuration VARCHAR(50) NOT NULL,
    TotalCreditRequired INT NOT NULL CHECK (TotalCreditRequired > 0)
);
GO

------------------------------------------------------------
-- STUDENT TABLE
------------------------------------------------------------
CREATE TABLE student(
    Student_id INT IDENTITY(1,1) PRIMARY KEY,
    Firstname VARCHAR(50) NOT NULL,
    Lastname VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone VARCHAR(20) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Enrollment VARCHAR(50) NOT NULL,
    ProgramID INT NOT NULL FOREIGN KEY REFERENCES academic_program(ProgramID),
    Status VARCHAR(50) NOT NULL
);
GO

------------------------------------------------------------
-- ALUMNI TABLE
------------------------------------------------------------
CREATE TABLE Alumni(
    AlumniID INT IDENTITY(1,1) PRIMARY KEY,
    StudenntID INT NOT NULL UNIQUE FOREIGN KEY REFERENCES student(Student_id),
    GraduationYear INT NOT NULL CHECK(GraduationYear > 1900),
    CurrentCity VARCHAR(100),
    CurrentPosition VARCHAR(100),
    CompanyName VARCHAR(100),
    EmployementStatus VARCHAR(50)
);
GO

------------------------------------------------------------
-- EMPLOYERS TABLE
------------------------------------------------------------
CREATE TABLE Employers(
    EmployerID INT IDENTITY(1,1) PRIMARY KEY,
    EmployerName VARCHAR(100) NOT NULL,
    Industry VARCHAR(100),
    City VARCHAR(100),
    State VARCHAR(50),
    Website VARCHAR(200)
);
GO

------------------------------------------------------------
-- ROLES TABLE (CAREER OPPORTUNITIES)
------------------------------------------------------------
CREATE TABLE Roles(
    RoleID INT IDENTITY(1,1) PRIMARY KEY,
    EmployerID INT NOT NULL FOREIGN KEY REFERENCES Employers(EmployerID),
    Title VARCHAR(100) NOT NULL,
    Type VARCHAR(50) NOT NULL,
    Description TEXT,
    Posteddate DATE NOT NULL,
    Location VARCHAR(100)
);
GO

------------------------------------------------------------
-- APPLICATIONS TABLE
------------------------------------------------------------
CREATE TABLE Applications(
    ApplicationsID INT IDENTITY(1,1) PRIMARY KEY,
    StudentID INT NOT NULL FOREIGN KEY REFERENCES student(Student_id),
    RoleID INT NOT NULL FOREIGN KEY REFERENCES Roles(RoleID),
    ApplicationDate DATE NOT NULL,
    Status VARCHAR(50) NOT NULL
);
GO

------------------------------------------------------------
-- CLUBS TABLE
------------------------------------------------------------
CREATE TABLE Clubs(
    ClubID INT IDENTITY(1,1) PRIMARY KEY,
    ClubName VARCHAR(100) NOT NULL,
    ClubType VARCHAR(50) NOT NULL,
    Description TEXT,
    PresidentID INT NOT NULL FOREIGN KEY REFERENCES student(Student_id),
    FacultyAdvisorID INT NULL FOREIGN KEY REFERENCES Faculty(FacultyID)
);
GO

------------------------------------------------------------
-- CAMPUS EVENTS TABLE
------------------------------------------------------------
CREATE TABLE CampusEvents(
    EventID INT IDENTITY(1,1) PRIMARY KEY,
    EventName VARCHAR(100) NOT NULL,
    EventType VARCHAR(50) NOT NULL,
    EventDate DATE NOT NULL,
    Location VARCHAR(100) NOT NULL,
    OrganizedBy VARCHAR(100) NOT NULL,
    ClubID INT NULL FOREIGN KEY REFERENCES Clubs(ClubID)
);
GO

------------------------------------------------------------
-- STUDENT PARTICIPATION TABLE
------------------------------------------------------------
CREATE TABLE Studentparticipation(
    ParticipationID INT IDENTITY(1,1) PRIMARY KEY,
    StudentID INT NOT NULL FOREIGN KEY REFERENCES student(Student_id),
    EventID INT NOT NULL FOREIGN KEY REFERENCES CampusEvents(EventID),
    CheckinTime DATETIME NOT NULL,
    Feedback VARCHAR(500)
);
GO

------------------------------------------------------------
-- STUDENT SUPPORT SERVICES TABLE
------------------------------------------------------------
CREATE TABLE StudentSupportServices(
    ServiceID INT IDENTITY(1,1) PRIMARY KEY,
    ServiceName VARCHAR(100) NOT NULL,
    Category VARCHAR(50) NOT NULL,
    Description TEXT,
    Contactemail VARCHAR(100) NOT NULL
);
GO

------------------------------------------------------------
-- STUDENT SUPPORT USAGE TABLE
------------------------------------------------------------
CREATE TABLE StudentSupportUsage(
    UsageID INT IDENTITY(1,1) PRIMARY KEY,
    StudentID INT NOT NULL FOREIGN KEY REFERENCES student(Student_id),
    ServiceID INT NOT NULL FOREIGN KEY REFERENCES StudentSupportServices(ServiceID),
    VisitDate DATE NOT NULL,
    Notes TEXT
);
GO

------------------------------------------------------------
-- COURSES TABLE
------------------------------------------------------------
CREATE TABLE courses(
    CourseID INT IDENTITY(1,1) PRIMARY KEY,
    CourseCode VARCHAR(50) NOT NULL,
    Credits INT NOT NULL CHECK (Credits > 0),
    ProgramID INT NOT NULL FOREIGN KEY REFERENCES academic_program(ProgramID),
    FacultyID INT NULL FOREIGN KEY REFERENCES Faculty(FacultyID),
    SemsterOffered VARCHAR(50)
);
GO

------------------------------------------------------------
-- COURSE ENROLLMENT TABLE
------------------------------------------------------------
CREATE TABLE CourseEnrollment(
    StudentID INT NOT NULL FOREIGN KEY REFERENCES student(Student_id),
    CourseID INT NOT NULL FOREIGN KEY REFERENCES courses(CourseID),
    Semester VARCHAR(50) NOT NULL,
    PRIMARY KEY(StudentID, CourseID)
);
GO

------------------------------------------------------------
-- END OF SCRIPT
------------------------------------------------------------
