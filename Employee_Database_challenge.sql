-- Create new table with retiree titles 
SELECT e.emp_no,
e.first_name,
e.last_name,
t.title,
t.from_date,
t.to_date

INTO retirement_titles
FROM employees AS e
JOIN titles AS t
ON (e.emp_no=t.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

SELECT * FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles;

-- Calculate the number of employees about to retire
SELECT title, COUNT (title) AS "retiree count"
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY "retiree count" DESC;

SELECT * FROM retiring_titles;


