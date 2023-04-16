-- Create the hosts table
CREATE TABLE hosts (
host_id INT PRIMARY KEY,
host_name VARCHAR(50) NOT NULL,
host_surname VARCHAR(50) NOT NULL
);

-- Create the users table
CREATE TABLE users (
user_id INT PRIMARY KEY,
name VARCHAR(50) NOT NULL,
surname VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,
password VARCHAR(50) NOT NULL,
phone VARCHAR(20)
);

-- Create the loyalty_card table
CREATE TABLE loyalty_card (
card_id INT PRIMARY KEY,
user_id INT NOT NULL,
name VARCHAR(50) NOT NULL,
surname VARCHAR(50) NOT NULL,
discount INT NOT NULL,
expiration_date DATE NOT NULL,
FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Create the amenities table
CREATE TABLE amenities (
amenity_id INT PRIMARY KEY,
amenity_name VARCHAR(50) NOT NULL
);

-- Create the rooms table
CREATE TABLE rooms (
room_id INT PRIMARY KEY,
host_id INT NOT NULL,
amenity_id INT NOT NULL,
room_price DECIMAL(8,2) NOT NULL,
address VARCHAR(100) NOT NULL,
country VARCHAR(50) NOT NULL,
city VARCHAR(50) NOT NULL,
availability DATE NOT NULL,
room_type VARCHAR(50) NOT NULL,
FOREIGN KEY (host_id) REFERENCES hosts(host_id),
FOREIGN KEY (amenity_id) REFERENCES amenities(amenity_id)
);

-- Create the reservations table
CREATE TABLE reservations (
reservation_id INT PRIMARY KEY,
user_id INT NOT NULL,
card_id INT NOT NULL,
room_id INT NOT NULL,
start_date DATE NOT NULL,
end_date DATE NOT NULL,
price DECIMAL(8,2) NOT NULL,
price_with_discount DECIMAL(8,2) NOT NULL,
FOREIGN KEY (user_id) REFERENCES users(user_id),
FOREIGN KEY (card_id) REFERENCES loyalty_card(card_id),
FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);

-- Create the reviews table
CREATE TABLE reviews (
review_id INT PRIMARY KEY,
reservation_id INT NOT NULL,
rating INT NOT NULL,
comment TEXT,
date DATE NOT NULL,
FOREIGN KEY (reservation_id) REFERENCES reservations(reservation_id)
);