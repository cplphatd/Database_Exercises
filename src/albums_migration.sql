CREATE DATABASE IF NOT EXISTS codeup_test_db;

USE codeup_test_db;

DROP TABLE IF EXISTS albums;

CREATE TABLE albums (
  id                INT UNSIGNED NOT NULL AUTO_INCREMENT,
  artist            VARCHAR(300),
  name              VARCHAR(300),
  release_date      YEAR,
  sales_in_millions FLOAT,
  genre             VARCHAR(300),
  PRIMARY KEY (id)
);