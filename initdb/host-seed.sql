CREATE DATABASE pandp;

\connect pandp;

-- Users is the general schema. A customer, host and admin are users.
-- CREATE SCHEMA users;
-- CREATE SCHEMA hosts;
-- CREATE SCHEMA customer;
CREATE SCHEMA application;

CREATE TYPE permissionsE AS ENUM ('CUSTOMER', 'HOST', 'ADMIN');
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE credentials (
  userId INT,
  PRIMARY KEY(userId),
  email VARCHAR(50) NOT NULL,
  UNIQUE(email),
  password VARCHAR(155) NOT NULL,
  permissions permissionsE
 );

INSERT INTO credentials (userId, email, password, permissions) VALUES
  ( 1, 'customer1@gmail.com', 'password', 'CUSTOMER'),
  ( 2, 'customer2@gmail.com', 'password', 'CUSTOMER'),
  ( 3, 'customer3@gmail.com', 'password', 'CUSTOMER'),
  ( 4, 'customer4@gmail.com', 'password', 'CUSTOMER'),
  ( 5, 'host1@gmail.com', 'password', 'HOST'),
  ( 6, 'host2@gmail.com', 'password', 'HOST'),
  ( 7, 'host3@gmail.com', 'password', 'HOST'),
  ( 8, 'host4@gmail.com', 'password', 'HOST'),
  ( 9, 'admin1@gmail.com', 'password', 'ADMIN'),
  ( 10, 'admin2@gmail.com', 'password', 'ADMIN'),
  ( 11, 'admin3@gmail.com', 'password', 'ADMIN'),
  ( 12, 'admin4@gmail.com', 'password', 'ADMIN');

SELECT * FROM credentials;

CREATE TABLE profiles (
  profileId INT,
  UNIQUE(profileId),
  FOREIGN KEY (profileId) REFERENCES credentials(userId),
  firstName VARCHAR(55),
  lastName VARCHAR(55),
  mobileNumber VARCHAR(20),
  homeNumber VARCHAR(20),
  profileImage VARCHAR(255),
  description text
);

INSERT INTO profiles (
  profileId,
  firstName,
  lastName,
  mobileNumber,
  homeNumber,
  profileImage,
  description
) VALUES
  (1, 'Customer 1', 'Rolfe', '971-713-1358', '971-713-1359', 'https://via.placeholder.com/350x350', 'The boogy man'),
  (2, 'Customer 2', 'Rolfe', '971-713-1358', '971-713-1358', 'https://via.placeholder.com/350x350', 'The boogy man'),
  (3, 'Customer 3', 'Rolfe', '971-713-1358', '971-713-1358', 'https://via.placeholder.com/350x350', 'The boogy man'),
  (4, 'Customer 4', 'Rolfe', '971-713-1358', '971-713-1358', 'https://via.placeholder.com/350x350', 'The boogy man'),
  (5, 'Host 1', 'Rolfe', '971-713-1358', '971-713-1359', 'https://via.placeholder.com/350x350', 'The boogy man'),
  (6, 'Host 2', 'Rolfe', '971-713-1358', '971-713-1358', 'https://via.placeholder.com/350x350', 'The boogy man'),
  (7, 'Host 3', 'Rolfe', '971-713-1358', '971-713-1358', 'https://via.placeholder.com/350x350', 'The boogy man'),
  (8, 'Host 4', 'Rolfe', '971-713-1358', '971-713-1358', 'https://via.placeholder.com/350x350', 'The boogy man'),
  (9, 'Admin 1', 'Rolfe', '971-713-1358', '971-713-1359', 'https://via.placeholder.com/350x350', 'The boogy man'),
  (10, 'Admin 2', 'Rolfe', '971-713-1358', '971-713-1358', 'https://via.placeholder.com/350x350', 'The boogy man'),
  (11, 'Admin 3', 'Rolfe', '971-713-1358', '971-713-1358', 'https://via.placeholder.com/350x350', 'The boogy man'),
  (12, 'Admin 4', 'Rolfe', '971-713-1358', '971-713-1358', 'https://via.placeholder.com/350x350', 'The boogy man');

SELECT * FROM profiles;

CREATE TABLE properties (
  property_id INT,
  UNIQUE(property_id),
  profile_id INT,
  FOREIGN KEY (profile_id) REFERENCES profiles(profileId),
  property_rating INT Array,
  property_latitude DECIMAL,
  property_longitude DECIMAL,
  property_address Text,
  property_city Text,
  property_state Text,
  property_zip INT
);

INSERT INTO properties (
  profile_id,
  property_id,
  property_rating,
  property_latitude,
  property_longitude,
  property_address,
  property_city,
  property_state,
  property_zip
) VALUES
  (5, 1,  Array[2, 4, 5, 1 ], 45.512794, -122.679565, '1111 SW 7th', 'Portland', 'OR', 97124),
  (5, 2, Array[2, 4, 5, 1 ], 45.512794, -122.679565, '1111 SW 7th', 'Portland', 'OR', 97124),
  (6, 3, Array[2, 4, 5, 1 ], 45.512794, -122.679565, '1111 SW 7th', 'Portland', 'OR', 97124),
  (7, 4, Array[2, 4, 5, 1 ], 45.512794, -122.679565, '1111 SW 7th', 'Portland', 'OR', 97124),
  (8, 5, Array[2, 4, 5, 1 ], 45.512794, -122.679565, '1111 SW 7th', 'Portland', 'OR', 97124);

SELECT * FROM properties;

CREATE TABLE properties_schedule (
  property_id INT,
  FOREIGN KEY (property_id) REFERENCES properties(property_id),
  property_schedule_checkin DATE,
  property_schedule_checkout DATE
);

INSERT INTO properties_schedule (
  property_id,
  property_schedule_checkin,
  property_schedule_checkout
) VALUES
  (1, '9999-12-31 23:59:59', '9999-12-31 23:59:59'),
  (2, '9999-12-31 23:59:59', '9999-12-31 23:59:59'),
  (2, '9999-12-31 23:59:59', '9999-12-31 23:59:59'),
  (1, '9999-12-31 23:59:59', '9999-12-31 23:59:59'),
  (3, '9999-12-31 23:59:59', '9999-12-31 23:59:59'),
  (4, '9999-12-31 23:59:59', '9999-12-31 23:59:59');

SELECT * FROM properties_schedule;
-- CREATE TABLE customer.profile(
--   customer_profile_id INT,
--   UNIQUE(customer_profile_id),
--   PRIMARY KEY (customer_profile_id),
--   FOREIGN KEY (customer_profile_id) REFERENCES users.credentials(id)
-- );
--
-- INSERT INTO customer.profile (
--   id
-- ) VALUES (1);

