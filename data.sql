-- Insert into hosts table
INSERT INTO hosts (host_id, host_name, host_surname)
VALUES
(1, 'John', 'Smith'),
(2, 'Jane', 'Doe');

-- Insert into users table
INSERT INTO users (user_id, name, surname, email, password, phone)
VALUES
(1, 'Bob', 'Johnson', 'bob@example.com', 'password123', '555-1234'),
(2, 'Alice', 'Lee', 'alice@example.com', 'password456', '555-5678'),
(3, 'Charlie', 'Wu', 'charlie@example.com', 'password789', '555-9012');

-- Insert into loyalty_card table
INSERT INTO loyalty_card (card_id, user_id, name, surname, discount, expiration_date)
VALUES
(1, 1, 'Bob', 'Johnson', 5, '2023-12-31'),
(2, 2, 'Alice', 'Lee', 10, '2024-06-30');

-- Insert into amenities table
INSERT INTO amenities (amenity_id, amenity_name)
VALUES
(1, 'Wifi'),
(2, 'TV'),
(3, 'Mini-bar');

-- Insert into rooms table
INSERT INTO rooms (room_id, host_id, amenity_id, room_price, address, country, city, availability, room_type)
VALUES
(1, 1, 1, 100, '123 Main St', 'USA', 'New York', '2023-05-01', 'Single'),
(2, 1, 2, 150, '456 Elm St', 'USA', 'New York', '2023-05-01', 'Double'),
(3, 2, 3, 200, '789 Oak St', 'USA', 'San Francisco', '2023-05-01', 'Suite');

-- Insert into reservations table
INSERT INTO reservations (reservation_id, user_id, card_id, room_id, start_date, end_date, price, price_with_discount)
VALUES
(1, 1, 1, 1, '2023-05-01', '2023-05-07', 700, 665),
(2, 2, 2, 2, '2023-05-01', '2023-05-07', 1050, 945);

-- Insert into reviews table
INSERT INTO reviews (review_id, reservation_id, rating, comment, date)
VALUES
(1, 1, 4, 'Great room and location', '2023-05-08'),
(2, 2, 3, 'Room was nice, but noise from the street was bothersome', '2023-05-08');