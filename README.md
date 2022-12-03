#Pewlett-Hackard-Analysis


### Overview

The purpose of the analysis is to future-proof Pewlett-Hackard to determining how many people will be retiring, of those employees, who is elegible for a retirement package, and who is elegible for mentorship with the upcoming positions that will be opening up as well with the so called "silver tsunami"

### Results

An Entity Relationship Diagram (ERD) has been created to understand the relationship between the tables, and columns can be mane, and the database can be built.  This schema is importand to desgn the database management system (DBMS) or relational dabatabse management systems (RDBMS).

![EmployeeDB](https://user-images.githubusercontent.com/111101012/205426280-9c278c8a-d7a0-4cc6-b66a-6fb4bdff114d.png)

Deliverable 1 required to retrieve the emp_no, first_name, and last_name columns from the Employees table. Retrieve the title, from_date, and to_date columns from the Titles table, and create the new table Retirement Titles. 

![Deliverable 1 1](https://user-images.githubusercontent.com/111101012/205426248-4f25221e-1961-4c07-be6e-7e518e23a7c5.png)

A File and Table was also created with the name Unique Titles  wheere the duplicate titles per employee had been removed as reflected in the table below:

![Deliverable 1 2](https://user-images.githubusercontent.com/111101012/205426260-00bfc094-7cd2-4091-b7a0-94f1a24824e7.png)

Deliverable 2 shows a table and a file where a Mentorship Eligibility table that holds the employees who are eligible to participate in a mentorship program.

![Deliverable 2](https://user-images.githubusercontent.com/111101012/205426263-e49d3c4f-d59d-4ef4-b12c-5a75cffee8d1.png)

### Code Summary 

--Deliverable 1 

-- 1.1 create retirement titles

SELECT e.emp_no,

    e.first_name,
    
e.last_name,

    t.title,
    
    t.from_date,
    
    t.to_date
    
INTO retirement_titles

FROM employees as e

INNER JOIN Titles as t

ON (e.emp_no =t.emp_no)

WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')

AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')


-- Use Dictinct with Orderby to remove duplicate rows from newly created file retirement titles, and create unique_titles

SELECT DISTINCT ON (rt.emp_no) 

    rt.emp_no,
    
    rt.first_name,
    
    rt.last_name,
    
    rt.title
    
INTO unique_title

FROM retirement_title AS rt

ORDER BY emp_no ASC, to_date DESC;


--Retrieve the number of employees by their most recent job title who are about to retire , and create retiring_titles


SELECT COUNT(ut.title), ut.title

INTO retiring_titles

FROM unique_titles as ut

GROUP BY ut.title

ORDER BY count DESC;


**Deliverable 2**

SELECT DISTINCT ON (e.emp_no)

    e.emp_no,
    
    e.first_name,
    
    e.last_name,
    
    e.birth_date,
    
    de.from_date,
    
    de.to_date,
    
    t.title
    
INTO mentorship_eligibility

FROM employees AS e

INNER JOIN dept_emp AS de

ON (e.emp_no = de.emp_no)

INNER JOIN titles AS t

ON (e.emp_no = t.emp_no)

WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')

AND (de.to_date = '9999-01-01')

ORDER BY emp_no;
