# Update your query for 'Irena', 'Vidya', or 'Maya'. Use count(*)
# and GROUP BY to find the number of employees for each gender with those names.
SELECT
  gender,
  count(*) AS 'total'
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY gender;

# Update your queries for employees whose names start and end with 'E'. Use concat() to combine their first
# and last name together as a single column in your results.
SELECT concat(first_name, ' ', last_name)
  AS 'Employees with "e" at beginning and end of last name'
FROM employees
WHERE last_name LIKE 'e%'
      AND last_name LIKE '%e';

# For your query of employees born on Christmas and hired in the 90s,
# use datediff() to find how many days they have been working at the company (Hint: You will also need to use now() or curdate())
SELECT
  concat(first_name, ' ', last_name) AS 'Employee',
  datediff(curdate(), hire_date)     AS 'Days at company'
FROM employees
WHERE hire_date LIKE '199%'
      AND birth_date LIKE '%-12-25';

# Add a GROUP BY clause to your query for last names with 'q' and not 'qu'
# to find the distinct combination of first and last names.
# You will find there were some duplicate first and last name pairs in your previous results.
# Add a count() to your results and use ORDER BY to make it easier to find employees whose
# unusual name is shared with others.
SELECT
  concat(first_name, ' ', last_name) AS 'Full name',
  count(last_name) AS 'Total'
FROM employees
WHERE last_name LIKE '%q%'
      AND last_name NOT LIKE '%qu%'
GROUP BY `Full name`
ORDER BY Total DESC;