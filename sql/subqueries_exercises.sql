# Find all the employees with the same hire date as employee
# 101010 using a sub-query.
SELECT
  concat(first_name, ' ', last_name) AS 'Name',
  hire_date,
  emp_no
FROM employees
WHERE hire_date IN (
  SELECT hire_date
  FROM employees
  WHERE emp_no = '101010');

# Find all the titles held by all employees with the first name Aamod.
SELECT t.title AS 'Title'
FROM employees AS e
JOIN titles AS t
  ON e.emp_no = t.emp_no
WHERE e.first_name IN (
  SELECT first_name
  FROM employees
  WHERE first_name = 'Aamod')
GROUP BY Title;

# Find all the department managers that are female.
SELECT
  concat(e.first_name, ' ', e.last_name) AS 'Name'
FROM employees AS e
JOIN dept_manager AS dm
  ON e.emp_no = dm.emp_no
WHERE e.gender IN (
  SELECT gender
  FROM employees
  WHERE gender = 'f'
) AND dm.to_date LIKE '9999%';

# BONUS Find all the department names that have female managers.
SELECT d.dept_name AS 'Department'
FROM employees as e
JOIN dept_manager AS dm
  ON e.emp_no = dm.emp_no
JOIN departments AS d
  ON dm.dept_no = d.dept_no
WHERE gender IN (
  SELECT gender
  FROM employees
  WHERE gender = 'f'
) AND dm.to_date LIKE '9999%';