-- Populating the hosts table
INSERT INTO hosts (host_id, host_name, host_surname) VALUES
(1, 'John', 'Doe'),
(2, 'Jane', 'Doe'),
(3, 'Bob', 'Smith'),
(4, 'Alice', 'Johnson'),
(5, 'David', 'Lee'),
(6, 'Emily', 'Chen'),
(7, 'George', 'Wang'),
(8, 'Sarah', 'Kim'),
(9, 'Michael', 'Garcia'),
(10, 'Olivia', 'Rodriguez');


-- Populating the users table
INSERT INTO users (user_id, name, surname, email, password, phone) VALUES
(1, 'Michael', 'Scott', 'michael_scott@example.com', 'password123', '555-1234'),
(2, 'Dwight', 'Schrute', 'dwight_schrute@example.com', 'password456', '555-2345'),
(3, 'Jim', 'Halpert', 'jim_halpert@example.com', 'password789', NULL),
(4, 'Pam', 'Beesly', 'pam_beesly@example.com', 'passwordabc', '555-4567'),
(5, 'Ryan', 'Howard', 'ryan_howard@example.com', 'passworddef', NULL),
(6, 'Kelly', 'Kapoor', 'kelly_kapoor@example.com', 'passwordegf', '555-6789'),
(7, 'Andy', 'Bernard', 'andy_bernard@example.com', 'passwordhij', '555-7890'),
(8, 'Angela', 'Martin', 'angela_martin@example.com', 'passwordklm', '555-8901'),
(9, 'Oscar', 'Martinez', 'oscar_martinez@example.com', 'passwordnop', NULL),
(10, 'Stanley', 'Hudson', 'stanley_hudson@example.com', 'passwordqrs', '555-0123');




-- Populating the amenities table
INSERT INTO amenities (amenity_id, amenity_name) VALUES
(1, 'Wi-Fi'),
(2, 'TV'),
(3, 'Air conditioning'),
(4, 'Mini bar'),
(5, 'Room service'),
(6, 'Swimming pool'),
(7, 'Gym'),
(8, 'Spa'),
(9, 'Free parking'),
(10, 'Shuttle service');


-- Populating the rooms table
INSERT INTO rooms (room_id, host_id, amenity_id, room_price, address, country, city, availability, room_type) VALUES
(1, 1, 2, 120.00, '123 Main St', 'USA', 'Scranton', '2023-06-01', 'Single'),
(2, 1, 3, 150.00, '123 Main St', 'USA', 'Scranton', '2023-06-01', 'Double'),
(3, 2, 1, 100.00, '456 Oak St', 'USA', 'Scranton', '2023-06-01', 'Single'),
(4, 3, 4, 200.00, '789 Pine St', 'USA', 'New York', '2023-06-01', 'Double'),
(5, 4, 5, 180.00, '321 Elm St', 'USA', 'New York', '2023-06-01', 'Single'),
(6, 5, 6, 300.00, '654 Maple St', 'USA', 'Los Angeles', '2023-06-01', 'Double'),
(7, 6, 7, 250.00, '987 Oak St', 'USA', 'Los Angeles', '2023-06-01', 'Single'),
(8, 7, 8, 400.00, '654 Pine St', 'USA', 'Chicago', '2023-06-01', 'Double'),
(9, 8, 9, 120.00, '321 Maple St', 'USA', 'Chicago', '2023-06-01', 'Single'),
(10, 9, 10, 200.00, '789 Elm St', 'USA', 'Houston', '2023-06-01', 'Double');



-- Populating the loyalty_card table
INSERT INTO loyalty_card (card_id, user_id, name, surname, discount, expiration_date) VALUES
(1, 1, 'Michael', 'Scott', 10, '2024-12-31'),
(2, 2, 'Dwight', 'Schrute', 15, '2025-06-30'),
(3, 3, 'Jim', 'Halpert', 20, '2026-03-31'),
(4, 4, 'Pam', 'Beesly', 10, '2024-09-30'),
(5, 5, 'Ryan', 'Howard', 5, '2024-12-31'),
(6, 6, 'Kelly', 'Kapoor', 10, '2024-12-31'),
(7, 7, 'Andy', 'Bernard', 15, '2025-06-30'),
(8, 8, 'Angela', 'Martin', 20, '2026-03-31'),
(9, 9, 'Oscar', 'Martinez', 10, '2024-09-30'),
(10, 10, 'Stanley', 'Hudson', 5, '2024-12-31');

-- Populating the reservations table
INSERT INTO reservations (reservation_id, user_id, card_id, room_id, start_date, end_date, price, price_with_discount) VALUES
(1, 1, 1, 1, '2023-06-10', '2023-06-12', 240.00, 216.00),
(2, 2, 2, 3, '2023-06-15', '2023-06-18', 300.00, 255.00),
(3, 3, 3, 5, '2023-06-20', '2023-06-22', 360.00, 288.00),
(4, 4, 4, 6, '2023-06-25', '2023-06-27', 400.00, 360.00),
(5, 5, 5, 8, '2023-07-01', '2023-07-04', 600.00, 480.00),
(6, 6, 6, 10, '2023-07-05', '2023-07-08', 600.00, 540.00),
(7, 7, 7, 2, '2023-07-10', '2023-07-12', 300.00, 255.00),
(8, 8, 8, 4, '2023-07-15', '2023-07-18', 600.00, 480.00),
(9, 9, 9, 7, '2023-07-20', '2023-07-22', 250.00, 225.00),
(10, 10, 10, 9, '2023-07-25', '2023-07-27', 400.00, 380.00);

-- Populating the reviews table
INSERT INTO reviews (review_id, reservation_id, rating, comment, date) VALUES
(1, 1, 4, 'Nice and clean room', '2023-06-12'),
(2, 3, 5, 'Great hotel, highly recommended', '2023-06-22'),
(3, 5, 3, 'Decent stay, but could be better', '2023-07-04'),
(4, 6, 4, 'Good value for money', '2023-07-08'),
(5, 8, 5, 'Excellent service and amenities', '2023-07-18'),
(6, 10, 2, 'Disappointing experience, would not recommend', '2023-07-27');



-- Additional insertions for the loyalty_card table
INSERT INTO loyalty_card (card_id, user_id, name, surname, discount, expiration_date) VALUES
(11, 11, 'Phyllis', 'Vance', 10, '2024-12-31'),
(12, 12, 'Kevin', 'Malone', 5, '2024-12-31'),
(13, 13, 'Creed', 'Bratton', 15, '2025-06-30'),
(14, 14, 'Holly', 'Flax', 20, '2026-03-31'),
(15, 15, 'Jan', 'Levinson', 10, '2024-09-30');

-- Additional insertions for the reservations table
INSERT INTO reservations (reservation_id, user_id, card_id, room_id, start_date, end_date, price, price_with_discount) VALUES
(11, 2, 2, 2, '2023-08-05', '2023-08-08', 450.00, 382.50),
(12, 4, 4, 4, '2023-08-10', '2023-08-12', 220.00, 198.00),
(13, 6, 6, 6, '2023-08-15', '2023-08-18', 570.00, 513.00),
(14, 8, 8, 8, '2023-08-20', '2023-08-22', 300.00, 240.00),
(15, 10, 10, 10, '2023-08-25', '2023-08-27', 400.00, 380.00);

-- Additional insertions for the reviews table
INSERT INTO reviews (review_id, reservation_id, rating, comment, date) VALUES
(7, 2, 4, 'Comfortable bed and pillows', '2023-06-18'),
(8, 4, 3, 'Average room, noisy neighbors', '2023-06-27'),
(9, 7, 5, 'Excellent breakfast and staff', '2023-07-12'),
(10, 9, 2, 'Dirty room and poor service', '2023-07-22'),
(11, 11, 4, 'Friendly staff and good location', '2023-08-08'),
(12, 12, 5, 'Exceptional service and amenities', '2023-08-12'),
(13, 14, 3, 'Small room and outdated decor', '2023-08-18'),
(14, 15, 4, 'Clean and spacious room', '2023-08-27'),
(15, 5, 5, 'Amazing view and comfortable bed', '2023-07-04');

