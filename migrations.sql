psql

CREATE DATABASE chirper;
\c chirper;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
)

CREATE TABLE chirps (
  id SERIAL PRIMARY KEY,
  message VARCHAR(255),
  user_id INTEGER
)
