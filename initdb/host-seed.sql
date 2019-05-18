CREATE DATABASE pandp;

\connect pandp;

CREATE SCHEMA users;
CREATE SCHEMA hosts;

CREATE TYPE permissionsE AS ENUM ('USER', 'HOST', 'ADMIN');

CREATE TABLE users.credentials (
  id SERIAL PRIMARY KEY UNIQUE NOT NULL,
  login text NOT NULL,
  password text NOT NULL,
  permissions permissionsE
 );

INSERT INTO users.credentials (id, login, password, permissions) VALUES
  (1, 'user@gmail.com', 'password', 'USER'),
  (2, 'host1@gmail.com', 'password', 'HOST'),
  (3, 'host2@gmail.com', 'password', 'HOST'),
  (4, 'host3@gmail.com', 'password', 'HOST'),
  (5, 'host4@gmail.com', 'password', 'HOST'),
  (6, 'admin@gmail.com', 'password', 'ADMIN');

CREATE TABLE hosts.profile (
  id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (id) REFERENCES users.credentials(id)
);

INSERT INTO hosts.profile (id) VALUES
  (2),
  (3),
  (4);

CREATE TABLE hosts.property (
  id INT,
  FOREIGN KEY (id) REFERENCES hosts.profile(id) ON DELETE CASCADE,
  property_rating INT Array
);

INSERT INTO hosts.property (id, property_rating) VALUES
  (2, Array[2, 4, 5, 1 ]),
  (3, Array[5, 3, 5, 3]),
  (4, Array[1, 4, 2]);
