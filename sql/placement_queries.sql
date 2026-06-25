CREATE DATABASE Placement_analytics;
USE Placement_analytics;
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    gender VARCHAR(10),
    cgpa DECIMAL(3,2),
    internships INT,
    projects INT,
    aptitude_score INT,
    communication_skill INT,
    certifications INT,
    placement_training VARCHAR(5),
    placement_status VARCHAR(10)
);

SELECT COUNT(*) AS total_students
FROM students;

SELECT COUNT(*) AS placed_students
FROM students
WHERE placement_status = 'Yes';

SELECT ROUND(
    COUNT(CASE WHEN placement_status='Yes' THEN 1 END) * 100.0
    / COUNT(*), 2
) AS placement_rate
FROM students;

SELECT ROUND(AVG(cgpa),2) AS avg_cgpa
FROM students;

SELECT gender,
       COUNT(*) AS total_students
FROM students
GROUP BY gender;

SELECT gender,
       COUNT(*) AS total_students,
       SUM(CASE WHEN placement_status='Yes' THEN 1 ELSE 0 END) AS placed_students
FROM students
GROUP BY gender;

SELECT
    CASE
        WHEN cgpa < 6 THEN 'Below 6'
        WHEN cgpa BETWEEN 6 AND 7 THEN '6-7'
        WHEN cgpa BETWEEN 7 AND 8 THEN '7-8'
        ELSE 'Above 8'
    END AS cgpa_range,
    COUNT(*) AS total_students
FROM students
GROUP BY cgpa_range;

SELECT
    CASE
        WHEN cgpa < 6 THEN 'Below 6'
        WHEN cgpa BETWEEN 6 AND 7 THEN '6-7'
        WHEN cgpa BETWEEN 7 AND 8 THEN '7-8'
        ELSE 'Above 8'
    END AS cgpa_range,
    SUM(CASE WHEN placement_status='Yes' THEN 1 ELSE 0 END) AS placed_students
FROM students
GROUP BY cgpa_range;

SELECT internships,
       COUNT(*) AS total_students,
       SUM(CASE WHEN placement_status='Yes' THEN 1 ELSE 0 END) AS placed_students
FROM students
GROUP BY internships
ORDER BY internships;

SELECT projects,
       COUNT(*) AS total_students,
       SUM(CASE WHEN placement_status='Yes' THEN 1 ELSE 0 END) AS placed_students
FROM students
GROUP BY projects
ORDER BY projects;

SELECT
    CASE
        WHEN aptitude_score < 60 THEN 'Low'
        WHEN aptitude_score BETWEEN 60 AND 80 THEN 'Medium'
        ELSE 'High'
    END AS aptitude_level,
    COUNT(*) AS total_students,
    SUM(CASE WHEN placement_status='Yes' THEN 1 ELSE 0 END) AS placed_students
FROM students
GROUP BY aptitude_level;

SELECT communication_skill,
       COUNT(*) AS total_students,
       SUM(CASE WHEN placement_status='Yes' THEN 1 ELSE 0 END) AS placed_students
FROM students
GROUP BY communication_skill
ORDER BY communication_skill;

SELECT certifications,
       COUNT(*) AS total_students,
       SUM(CASE WHEN placement_status='Yes' THEN 1 ELSE 0 END) AS placed_students
FROM students
GROUP BY certifications
ORDER BY certifications;

SELECT placement_training,
       COUNT(*) AS total_students,
       SUM(CASE WHEN placement_status='Yes' THEN 1 ELSE 0 END) AS placed_students
FROM students
GROUP BY placement_training;

SELECT *
FROM students
ORDER BY cgpa DESC,
         aptitude_score DESC
LIMIT 10;

SELECT *
FROM students
WHERE cgpa >= 8
  AND internships >= 2
  AND communication_skill >= 7
ORDER BY cgpa DESC;

SELECT gender,
       ROUND(
         SUM(CASE WHEN placement_status='Yes' THEN 1 ELSE 0 END)
         *100.0/COUNT(*),2
       ) AS placement_percentage
FROM students
GROUP BY gender;
