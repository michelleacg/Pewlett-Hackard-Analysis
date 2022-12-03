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
--WHERE _______
ORDER BY emp_no ASC, to_date DESC;

--Retrieve the number of employees by their most recent job title who are about to retire , and create retiring_titles

SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY count DESC;

--Deliverable 2
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