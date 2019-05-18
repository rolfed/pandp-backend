CREATE DATABASE pandp;

\connect pandp;

CREATE SCHEMA users;
CREATE SCHEMA hosts;

CREATE TYPE permissionsE AS ENUM ('CUSTOMER', 'HOST', 'ADMIN');

CREATE TABLE users.credentials (
  id SERIAL PRIMARY KEY UNIQUE NOT NULL,
  email_login VARCHAR(50) NOT NULL,
  UNIQUE(email_login),
  password text NOT NULL,
  permissions permissionsE
 );

INSERT INTO users.credentials (id, email_login, password, permissions) VALUES
  (1, 'user@gmail.com', 'password', 'CUSTOMER'),
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
  UNIQUE(id),
  FOREIGN KEY (id) REFERENCES hosts.profile(id) ON DELETE CASCADE,
  property_rating INT Array,
  property_latitude DECIMAL,
  property_longitude DECIMAL,
  property_address Text,
  property_city Text,
  property_state Text,
  property_zip INT
);

INSERT INTO hosts.property (
  id,
  property_rating,
  property_latitude,
  property_longitude,
  property_address,
  property_city,
  property_state,
  property_zip
) VALUES
  (2, Array[2, 4, 5, 1 ], 45.512794, -122.679565, '1111 SW 7th', 'Portland', 'OR', 97124),
  (3, Array[2, 4, 5, 1 ], 45.512794, -122.679565, '1111 SW 7th', 'Portland', 'OR', 97124),
  (4, Array[2, 4, 5, 1 ], 45.512794, -122.679565, '1111 SW 7th', 'Portland', 'OR', 97124);

CREATE TABLE hosts.schedule (
  id INT,
  FOREIGN KEY (id) REFERENCES hosts.property(id),
  property_schedule_checkin DATE,
  property_schedule_checkout DATE
);

INSERT INTO hosts.schedule (
  id,
  property_schedule_checkin,
  property_schedule_checkout
) VALUES
  (2, '9999-12-31 23:59:59', '9999-12-31 23:59:59'),
  (3, '9999-12-31 23:59:59', '9999-12-31 23:59:59'),
  (4, '9999-12-31 23:59:59', '9999-12-31 23:59:59');

