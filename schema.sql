CREATE DATABASE catalog;

CREATE TABLE genres(
    id serial PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE authors(
   id serial PRIMARY KEY,
   first_name VARCHAR(255) NOT NULL,
   last_name VARCHAR(255) NOT NULL
);

CREATE TABLE sources(
   id serial PRIMARY KEY,
   name VARCHAR(255) NOT NULL
);

CREATE TABLE labels(
    id serial PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    color VARCHAR(255) NOT NULL
);

CREATE TABLE books(
   id serial PRIMARY KEY,
   genre_id    INT references genres(id),
   author_id   INT references authors(id),
   source_id   INT references sources(id),
   label_id   INT references labels(id),
   publish_date DATE NOT NULL,
   archived BOOL NOT NULL,
   publisher VARCHAR(255) NOT NULL,
   cover_state VARCHAR(255) NOT NULL,
   CONSTRAINT fk_genre
      FOREIGN KEY(genre_id)
         REFERENCES genres(id)
         ON DELETE SET NULL,

   CONSTRAINT fk_author
      FOREIGN KEY(author_id)
         REFERENCES authors(id)
         ON DELETE SET NULL,

   CONSTRAINT fk_source
      FOREIGN KEY(source_id)
         REFERENCES sources(id)
         ON DELETE SET NULL,

   CONSTRAINT fk_label
      FOREIGN KEY(label_id)
         REFERENCES labels(id)
         ON DELETE SET NULL
);

CREATE TABLE games(
  id INT GENERATED ALWAYS AS IDENTITY,
  genre_id    INT references genres(id),
  author_id   INT references authors(id),
  source_id   INT references sources(id),
  label_id   INT references labels(id),
  publish_date         DATE,
  archive     boolean,
  multiplayer  VARCHAR(100),
  last_played_at    DATE,

  CONSTRAINT fk_genre
      FOREIGN KEY(genre_id) 
	  REFERENCES genres(id)
      ON DELETE SET NULL,

  CONSTRAINT fk_author
      FOREIGN KEY(author_id) 
	  REFERENCES authors(id)
      ON DELETE SET NULL,

  CONSTRAINT fk_source
      FOREIGN KEY(source_id) 
	  REFERENCES sources(id)
      ON DELETE SET NULL,

  CONSTRAINT fk_label
      FOREIGN KEY(label_id) 
	  REFERENCES labels(id)
      ON DELETE SET NULL,

  PRIMARY KEY(id)
);

CREATE TABLE music_albums(
  id            INT GENERATED ALWAYS AS IDENTITY,
  genre_id    INT references genres(id),
  author_id   INT references authors(id),
  source_id   INT references sources(id),
  label_id   INT references labels(id),
  publish_date         DATE,
  archive     boolean,
  on_spotify  BOOL,
  CONSTRAINT fk_genre
      FOREIGN KEY(genre_id)
          REFERENCES genres(id)
          ON DELETE SET NULL,

  CONSTRAINT fk_author
      FOREIGN KEY(author_id)
          REFERENCES authors(id)
          ON DELETE SET NULL,

  CONSTRAINT fk_source
      FOREIGN KEY(source_id)
          REFERENCES sources(id)
          ON DELETE SET NULL,

  CONSTRAINT fk_label
      FOREIGN KEY(label_id)
          REFERENCES labels(id)
          ON DELETE SET NULL,

  PRIMARY KEY(id)

);

