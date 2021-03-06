DROP TABLE IF EXISTS animes;
DROP TABLE IF EXISTS records;

CREATE TABLE animes(
  id              integer primary key,
  screen_name     text,
  title           text,
  official        text,
  img             text,
  created_at,
  updated_at
);

CREATE TABLE records(
  id              integer primary key,
  anime_id        integer,
  date            text,
  followers_count integer,
  created_at,
  updated_at
);
