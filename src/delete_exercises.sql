-- SELECT:

-- Albums released after 1991
SELECT 'after 1991' AS 'Albums';
DELETE
FROM albums
WHERE release_date > 1991;

-- Albums with the genre "disco"
SELECT 'albums' AS 'Disco';
DELETE
FROM albums
WHERE genre LIKE '%disco%';

-- Albums by "Whitney Houston" (...or maybe an artist of your choice)
SELECT 'by Whitney Houston' AS 'Albums';
DELETE
FROM albums
WHERE artist LIKE '%Whitney Houston%';