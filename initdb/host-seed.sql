CREATE DATABASE pandp;

\connect pandp;

CREATE SCHEMA users;

CREATE TYPE permissionsE AS ENUM ('USER', 'HOST', 'ADMIN');

CREATE TABLE users.credentials (
  id SERIAL PRIMARY KEY,
  login text,
  password text,
  permissions permissionsE
 );

 INSERT INTO users.credentials (id, login, password, permissions) VALUES
  (1, 'user@gmail.com', 'password', 'USER'),
  (2, 'host@gmail.com', 'password', 'HOST'),
  (3, 'admin@gmail.com', 'password', 'ADMIN');
