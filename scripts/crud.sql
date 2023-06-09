-- Query 1: Retrieve information about users and their reservations for rooms in the city of Scranton, ordered by the start date of the reservation in descending order.
SELECT u.*, r.*
FROM users u
INNER JOIN reservations r ON u.user_id = r.user_id
INNER JOIN rooms rm ON r.room_id = rm.room_id
WHERE rm.city = 'Scranton'
ORDER BY r.start_date DESC;

-- Query 2: Calculate the total revenue generated by each room type for the month of June 2023.
SELECT rm.room_type, SUM(r.price_with_discount) AS total_revenue
FROM rooms rm
INNER JOIN reservations r ON rm.room_id = r.room_id
WHERE r.start_date BETWEEN '2023-06-01' AND '2023-06-30'
GROUP BY rm.room_type;

-- Query 3: Retrieve the names of all users who have made a reservation for a room with an amenity that includes the word "pool" in its name.
SELECT DISTINCT u.name
FROM users u
INNER JOIN reservations r ON u.user_id = r.user_id
INNER JOIN rooms rm ON r.room_id = rm.room_id
INNER JOIN amenities a ON rm.amenity_id = a.amenity_id
WHERE a.amenity_name LIKE '%pool%';

-- Query 4: Update the room price to 200 for all rooms located in Boston.
UPDATE rooms
SET room_price = 200
WHERE city = 'Boston';

-- Query 5: Increase the discount of all loyalty cards by 2%.
UPDATE loyalty_card
SET discount = discount * 1.02;

-- Query 6: Calculate the total revenue generated by each room type for the month of July 2023, order the results by total revenue in descending order, and return only the top 3 room types.
SELECT rm.room_type, SUM(r.price_with_discount) AS total_revenue
FROM rooms rm
INNER JOIN reservations r ON rm.room_id = r.room_id
WHERE r.start_date BETWEEN '2023-07-01' AND '2023-07-31'
GROUP BY rm.room_type
ORDER BY total_revenue DESC
LIMIT 3;

-- Query 7: Delete all reviews with a rating less than 3 and a comment that includes the word "dirty".
DELETE FROM reviews
WHERE rating < 3 AND comment LIKE '%dirty%';

-- Query 8: Update the availability date for all rooms located in New York to July 1, 2023.
UPDATE rooms
SET availability = '2023-07-01'
WHERE city = 'New York';

-- Query 9: Increase the room price by 10% for all rooms with a swimming pool amenity.
UPDATE rooms
SET room_price = room_price * 1.1
WHERE amenity_id = (SELECT amenity_id FROM amenities WHERE amenity_name = 'Swimming pool');

-- Query 10: Set the discount of the loyalty card for user ID 17 to 15.
UPDATE loyalty_card
SET discount = 15
WHERE user_id = 17;
