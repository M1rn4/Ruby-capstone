CREATE DATABASE catalog;

CREATE TABLE books(
   id serial PRIMARY KEY,
   genre_id    INT references genre(id),
   author_id   INT references author(id),
   source_id   INT references source(id),
   label_id   INT references label(id),
   publish_date DATE NOT NULL,
   archived BOOL NOT NULL,
   publisher VARCHAR(255) NOT NULL,
   cover_state VARCHAR(255) NOT NULL,
   CONSTRAINT fk_genre
      FOREIGN KEY(genre_id)
         REFERENCES genre(id)
         ON DELETE SET NULL,

   CONSTRAINT fk_author
      FOREIGN KEY(author_id)
         REFERENCES author(id)
         ON DELETE SET NULL,

   CONSTRAINT fk_source
      FOREIGN KEY(source_id)
         REFERENCES source(id)
         ON DELETE SET NULL,

   CONSTRAINT fk_label
      FOREIGN KEY(label_id)
         REFERENCES label(id)
         ON DELETE SET NULL,
);

CREATE TABLE labels(
   id serial PRIMARY KEY,
   title VARCHAR(255) NOT NULL,
   color VARCHAR(255) NOT NULL,
   items TEXT []
);
CREATE TABLE games(
  id            INT GENERATED ALWAYS AS IDENTITY,
  genre_id    INT references genre(id),
  author_id   INT references author(id),
  source_id   INT references source(id),
  label_id   INT references label(id),
  publish_date         DATE,
  archive     boolean,
  multiplayer  VARCHAR(100),
  last_played_at    DATE,

  CONSTRAINT fk_genre
      FOREIGN KEY(genre_id) 
	  REFERENCES genre(id)
      ON DELETE SET NULL,

  CONSTRAINT fk_author
      FOREIGN KEY(author_id) 
	  REFERENCES author(id)
      ON DELETE SET NULL,

  CONSTRAINT fk_source
      FOREIGN KEY(source_id) 
	  REFERENCES source(id)
      ON DELETE SET NULL,

  CONSTRAINT fk_label
      FOREIGN KEY(label_id) 
	  REFERENCES label(id)
      ON DELETE SET NULL,

  PRIMARY KEY(id)

);


CREATE TABLE author(
  id            INT GENERATED ALWAYS AS IDENTITY,
  first_name    		VARCHAR(100),
  last_name    		VARCHAR(100),
  PRIMARY KEY(id)
);
