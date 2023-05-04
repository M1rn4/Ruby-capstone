CREATE DATABASE catalog;

CREATE TABLE books(
   id serial PRIMARY KEY,
   genre VARCHAR(255) NOT NULL,
   author VARCHAR(255) NOT NULL,
   source VARCHAR(255) NOT NULL,
   label VARCHAR(255) NOT NULL,
   publish_date DATE NOT NULL,
   archived BOOL NOT NULL,
   publisher VARCHAR(255) NOT NULL,
   cover_state VARCHAR(255) NOT NULL
);

CREATE TABLE labels(
   id serial PRIMARY KEY,
   title VARCHAR(255) NOT NULL,
   color VARCHAR(255) NOT NULL,
   items TEXT []
);
