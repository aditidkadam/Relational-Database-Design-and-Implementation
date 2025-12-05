------------------------------------------------------------
-- DEPARTMENT
------------------------------------------------------------
INSERT INTO Department (DepartmentName, OfficeLocation, ContactEmail, HeadOfDepartmentID)
VALUES
('Management', 'Weber Hall 201', 'mgmt@pacific.edu', NULL),
('Finance', 'Weber Hall 315', 'finance@pacific.edu', NULL);

------------------------------------------------------------
-- FACULTY
------------------------------------------------------------
INSERT INTO Faculty (FirstName, LastName, Email, Phone, Department, Title, HireDate)
VALUES
('Sarah', 'Johnson', 'sjohnson@pacific.edu', '2095551111', 1, 'Professor', '2015-08-21'),
('Michael', 'Turner', 'mturner@pacific.edu', '2095552222', 2, 'Associate Professor', '2017-01-10');

-- Update Department Heads
UPDATE Department SET HeadOfDepartmentID = 1 WHERE DepartmentID = 1;
UPDATE Department SET HeadOfDepartmentID = 2 WHERE DepartmentID = 2;

------------------------------------------------------------
-- ACADEMIC PROGRAM
------------------------------------------------------------
INSERT INTO academic_program (Programname, Degreetype, Department, ProgramStartdate, ProgramDuration, TotalCreditRequired)
VALUES
('Business Administration', 'BBA', 'Management', '2020-08-01', '48 Months', 120),
('Business Analytics', 'MSBA', 'Management', '2023-08-01', '18 Months', 30);

------------------------------------------------------------
-- STUDENT
------------------------------------------------------------
INSERT INTO student (Firstname, Lastname, Email, Phone, DateOfBirth, Enrollment, ProgramID, Status)
VALUES
('Aditi', 'Kadam', 'akadam@uop.edu', '2095556789', '2001-05-20', 'Fall 2023', 2, 'Current'),
('John', 'Doe', 'jdoe@uop.edu', '2095556890', '2000-07-11', 'Fall 2020', 1, 'Graduated'),
('Emily', 'Smith', 'esmith@uop.edu', '2095557000', '2002-01-15', 'Spring 2024', 2, 'Current');

------------------------------------------------------------
-- ALUMNI
------------------------------------------------------------
INSERT INTO Alumni (StudenntID, GraduationYear, CurrentCity, CurrentPosition, CompanyName, EmployementStatus)
VALUES
(2, 2024, 'San Francisco', 'Business Analyst', 'Deloitte', 'Employed');

------------------------------------------------------------
-- EMPLOYERS
------------------------------------------------------------
INSERT INTO Employers (EmployerName, Industry, City, State, Website)
VALUES
('Google', 'Technology', 'Mountain View', 'CA', 'https://google.com'),
('Wells Fargo', 'Banking', 'San Francisco', 'CA', 'https://wellsfargo.com');

------------------------------------------------------------
-- ROLES (CAREER OPPORTUNITIES)
------------------------------------------------------------
INSERT INTO Roles (EmployerID, Title, Type, Description, Posteddate, Location)
VALUES
(1, 'Data Analyst Intern', 'Internship', 'Work with Google data teams', '2024-02-01', 'Mountain View'),
(2, 'Business Analyst', 'Full-time', 'Analyze financial business operations', '2024-01-15', 'San Francisco');

------------------------------------------------------------
-- APPLICATIONS
------------------------------------------------------------
INSERT INTO Applications (StudentID, RoleID, ApplicationDate, Status)
VALUES
(1, 1, '2024-03-01', 'Interview'),
(2, 2, '2024-02-10', 'Hired');

------------------------------------------------------------
-- CLUBS
------------------------------------------------------------
INSERT INTO Clubs (ClubName, ClubType, Description, PresidentID, FacultyAdvisorID)
VALUES
('Analytics Club', 'Academic', 'Promotes data analytics skills', 1, 1),
('Entrepreneurship Club', 'Professional', 'Supports student startups', 3, 2);

------------------------------------------------------------
-- CAMPUS EVENTS
------------------------------------------------------------
INSERT INTO CampusEvents (EventName, EventType, EventDate, Location, OrganizedBy, ClubID)
VALUES
('Data Science Workshop', 'Academic', '2024-03-20', 'Weber 101', 'Analytics Club', 1),
('Startup Pitch Night', 'Professional', '2024-04-15', 'Weber 202', 'Entrepreneurship Club', 2);

------------------------------------------------------------
-- STUDENT PARTICIPATION
------------------------------------------------------------
INSERT INTO Studentparticipation (StudentID, EventID, CheckinTime, Feedback)
VALUES
(1, 1, '2024-03-20 10:05:00', 'Very informative'),
(3, 2, '2024-04-15 18:10:00', 'Great networking');

------------------------------------------------------------
-- STUDENT SUPPORT SERVICES
------------------------------------------------------------
INSERT INTO StudentSupportServices (ServiceName, Category, Description, Contactemail)
VALUES
('Career Advising', 'Career', '1-on-1 advising with career staff', 'career@pacific.edu'),
('Academic Tutoring', 'Academic', 'Tutoring for core subjects', 'tutoring@pacific.edu');

------------------------------------------------------------
-- STUDENT SUPPORT USAGE
------------------------------------------------------------
INSERT INTO StudentSupportUsage (StudentID, ServiceID, VisitDate, Notes)
VALUES
(1, 1, '2024-03-05', 'Resume review'),
(3, 2, '2024-02-28', 'Help with statistics coursework');

------------------------------------------------------------
-- COURSES
------------------------------------------------------------
INSERT INTO courses (CourseCode, Credits, ProgramID, FacultyID, SemsterOffered)
VALUES
('MSBA101', 3, 2, 1, 'Fall'),
('BBA201', 4, 1, 2, 'Spring'),
('MSBA202', 3, 2, 1, 'Spring');

------------------------------------------------------------
-- COURSE ENROLLMENT
------------------------------------------------------------
INSERT INTO CourseEnrollment (StudentID, CourseID, Semester)
VALUES
(1, 1, 'Fall 2023'),
(1, 3, 'Spring 2024'),
(3, 3, 'Spring 2024');

