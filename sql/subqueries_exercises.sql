# Sub-queries should be independent of the overall query.
# A simple test is to run the sub-query on its own.
# If it runs without an error, the sub-query is independent.

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

#alternative solution to titles held by Aamods (without use of JOIN)
SELECT title
FROM titles
WHERE emp_no IN (
  SELECT emp_no
  FROM employees
  WHERE first_name = 'Aamod')
GROUP BY title;

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

#alternative solution to female department managers (dependent subquery)
SELECT concat(first_name, ' ', last_name) AS 'Name'
FROM employees
WHERE emp_no IN (
  SELECT emp_no
  FROM dept_manager
  WHERE employees.gender = 'f'
  AND dept_manager.to_date LIKE '9999%');

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

#alternative solution to bonus
SELECT dept_name
FROM departments
WHERE dept_no IN (
  SELECT dept_no
  FROM dept_manager
  WHERE emp_no IN (
    SELECT emp_no
    FROM employees
    WHERE gender = 'f'
  )
);

#can use sub-queries as replacements for tables (must be aliased)
SELECT *
FROM (SELECT *
      FROM departments
      WHERE dept_name LIKE 'd%') AS Departments_starting_with_D;

#you can use sub-queries to get scalar values that you can use in
# the select clause (each sub-query should only have one column)
SELECT
  (SELECT count(*)
  FROM employees
  WHERE gender = 'F') AS women_count,
  (SELECT count(*)
  FROM employees
  WHERE gender = 'M') AS men_count;