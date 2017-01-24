USE codeup_test_db;

-- Select:
  -- The name of all albums by Pink Floyd.
  SELECT 'Pink Floyd' AS 'Albums by: ';
  SELECT name
  FROM albums
  WHERE artist = "Pink Floyd";

  -- The year Sgt. Pepper's Lonely Hearts Club Band was released
  SELECT 'Sgt. Pepper''s Lonely Hearts Club Band was released' AS 'Year';
  SELECT release_date
  FROM albums
  WHERE name = "Sgt. Peppers Lonely Hearts Club Band";

  -- The genre for Nevermind
  SELECT 'of Nevermind' AS 'Genre';
  SELECT genre
  FROM albums
  WHERE name = "Nevermind";

  -- Which albums were released in the 1990s
  SELECT 'Released in the 90s' AS 'Albums';
  SELECT name
  FROM albums
  WHERE release_date BETWEEN 1990 and 1999;

  -- Which albums had less than 20 million certified sales
  SELECT 'with >$20 million in sales' AS 'Albums';
  SELECT name
  FROM albums
  WHERE sales_in_millions < 20;

  -- All the albums in the rock genre. Is this all the rock albums in the table?
  SELECT 'that are rock' AS 'Albums';
  SELECT name
  FROM albums
  WHERE genre LIKE "%rock%";