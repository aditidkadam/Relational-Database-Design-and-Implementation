# ESB to Industry: Tracking the Student Career Journey

## Overview
This project builds a relational database that models the academic and career journey of students. The system captures information about programs, courses, faculty, events, employers, job roles, support services, and alumni outcomes. The design demonstrates data modeling, ERD development, SQL schema creation, and sample data population.

## Objectives
- Build a normalized relational schema that represents academic, co-curricular, and career processes.  
- Create an ERD that clarifies relationships across all entities.  
- Implement SQL scripts that form the database, define constraints, and populate example data.  
- Enable queries that answer academic and career tracking questions.

## Entity-Relationship Design
The ERD connects core components of student life:
- Student identity and academic progress  
- Academic programs and departments  
- Faculty assignments  
- Courses and enrollment activity  
- Clubs and campus events  
- Employers, job roles, and application workflows  
- Alumni outcomes and support service usage  

The design uses foreign keys and junction tables to manage many-to-many relationships and preserve referential integrity.

## Database Schema
The repository includes SQL scripts that:
- Create tables with primary keys and foreign keys  
- Apply constraints for data accuracy  
- Insert sample data across all entities  

Main tables:
- **Student**, **Academic_Program**, **Department**, **Faculty**  
- **Courses**, **CourseEnrollment**  
- **Employers**, **Roles**, **Applications**  
- **Clubs**, **CampusEvents**, **StudentParticipation**  
- **StudentSupportServices**, **StudentSupportUsage**  
- **Alumni**

## Features
- Clean relational structure  
- Normalized table design  
- Consistent naming conventions  
- Sample dataset for testing and analysis  
- Realistic modeling of university workflows  

## How to Use
1. Run the `database_creation.sql` script.  
2. Execute the `sample_data.sql` file to populate the tables.  
3. Query the database to explore relationships and practice SQL.  
4. Extend the schema for dashboards, analytics, or applications.

## Files Included
- `database_creation.sql`  
- `sample_data.sql`  
- `ERD_diagram.pdf`   


## Potential Extensions
- Add stored procedures for automated reporting  
- Create views for academic performance and career insights  
- Build analytics dashboards  
- Extend the model to include internships or mentorships  

## Author
**Aditi Kadam**  
MSBA 230 – Database Management Systems  
University of the Pacific
