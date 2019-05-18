CREATE DATABASE pandp;

\connect pandp;

-- Users is the general schema. A customer, host and admin are users.
CREATE SCHEMA users;
CREATE SCHEMA hosts;
CREATE SCHEMA customer;

CREATE TYPE permissionsE AS ENUM ('CUSTOMER', 'HOST', 'ADMIN');
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE users.credentials (
  id uuid DEFAULT uuid_generate_v4 (),
  PRIMARY KEY(id),
  email_login VARCHAR(50) NOT NULL,
  UNIQUE(email_login),
  password VARCHAR(155) NOT NULL,
  permissions permissionsE
 );

INSERT INTO users.credentials (email_login, password, permissions) VALUES
  ( 'customer1@gmail.com', 'password', 'CUSTOMER'),
  ( 'customer2@gmail.com', 'password', 'CUSTOMER'),
  ( 'customer3@gmail.com', 'password', 'CUSTOMER'),
  ( 'customer4@gmail.com', 'password', 'CUSTOMER'),
  ( 'host1@gmail.com', 'password', 'HOST'),
  ( 'host2@gmail.com', 'password', 'HOST'),
  ( 'host3@gmail.com', 'password', 'HOST'),
  ( 'host4@gmail.com', 'password', 'HOST'),
  ( 'admin1@gmail.com', 'password', 'ADMIN'),
  ( 'admin2@gmail.com', 'password', 'ADMIN'),
  ( 'admin3@gmail.com', 'password', 'ADMIN'),
  ( 'admin4@gmail.com', 'password', 'ADMIN');

CREATE TABLE hosts.profile (
  profile_id uuid,
  UNIQUE(profile_id),
--   PRIMARY KEY (profile_id),
  FOREIGN KEY (profile_id) REFERENCES users.credentials(id),
  first_name VARCHAR(55),
  last_name VARCHAR(55),
  mobile_number VARCHAR(20),
  home_number VARCHAR(20),
  profile_image VARCHAR(255),
  description text
);

INSERT INTO hosts.profile (
  first_name,
  last_name,
  mobile_number,
  home_number,
  profile_image,
  description
) VALUES
  ('Danniel', 'Rolfe', '971-713-1358', '971-713-1359', 'https://via.placeholder.com/350x350', 'The boogy man'),
  ('Denise', 'Rolfe', '971-713-1358', '971-713-1358', 'https://via.placeholder.com/350x350', 'The boogy man'),
  ('Alex', 'Rolfe', '971-713-1358', '971-713-1358', 'https://via.placeholder.com/350x350', 'The boogy man'),
  ('Futuer', 'Rolfe', '971-713-1358', '971-713-1358', 'https://via.placeholder.com/350x350', 'The boogy man');

CREATE TABLE hosts.property (
  property_id uuid,
  UNIQUE(property_id),
  FOREIGN KEY (property_id) REFERENCES hosts.profile(profile_id),
  property_rating INT Array,
  property_latitude DECIMAL,
  property_longitude DECIMAL,
  property_address Text,
  property_city Text,
  property_state Text,
  property_zip INT
);

INSERT INTO hosts.property (
  property_rating,
  property_latitude,
  property_longitude,
  property_address,
  property_city,
  property_state,
  property_zip
) VALUES
  (Array[2, 4, 5, 1 ], 45.512794, -122.679565, '1111 SW 7th', 'Portland', 'OR', 97124),
  (Array[2, 4, 5, 1 ], 45.512794, -122.679565, '1111 SW 7th', 'Portland', 'OR', 97124),
  (Array[2, 4, 5, 1 ], 45.512794, -122.679565, '1111 SW 7th', 'Portland', 'OR', 97124);

CREATE TABLE hosts.schedule (
  property_schedule_id uuid,
  UNIQUE(property_schedule_id),
  FOREIGN KEY (property_schedule_id) REFERENCES hosts.property(property_id),
  property_schedule_checkin DATE,
  property_schedule_checkout DATE
);

INSERT INTO hosts.schedule (
  property_schedule_checkin,
  property_schedule_checkout
) VALUES
  ('9999-12-31 23:59:59', '9999-12-31 23:59:59'),
  ('9999-12-31 23:59:59', '9999-12-31 23:59:59'),
  ('9999-12-31 23:59:59', '9999-12-31 23:59:59');

CREATE TABLE customer.profile(
  customer_profile_id uuid,
  UNIQUE(customer_profile_id),
  PRIMARY KEY (customer_profile_id),
  FOREIGN KEY (customer_profile_id) REFERENCES users.credentials(id)
);

-- INSERT INTO customer.profile (
--   id
-- ) VALUES (1);

