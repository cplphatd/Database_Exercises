USE codeup_test_db;

-- select:

-- All albums in your table.
  UPDATE albums
  SET sales_in_millions = sales_in_millions * 10;

  SELECT 'Albums' AS 'All';
  SELECT * FROM albums\G

-- All albums released before 1980
  UPDATE albums
  SET release_date = 1901
  WHERE release_date < 1980;

  SELECT 'released before 1980' AS 'Albums';
  SELECT name
  FROM albums
  WHERE release_date < 1980;

-- All albums by Peter Jackson
  UPDATE albums
  SET artist = 'Peter Jackson'
  WHERE artist = 'Michael Jackson';

  SELECT 'by Peter Jackson' AS 'Albums';
  SELECT name
  FROM albums
  WHERE artist = 'Peter Jackson'