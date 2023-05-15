-- Create a view of the reservations table with personal data fields hidden
CREATE VIEW reservations_view AS
SELECT reservation_id, user_id,
       CONCAT('****', SUBSTRING(card_id::text, 5, 8), '****') AS masked_card_no,
       room_id, start_date, end_date, price, price_with_discount
FROM reservations;

-- Create a view of the reviews table with technical fields hidden
CREATE VIEW reviews_view AS
SELECT review_id, reservation_id, rating, comment
FROM reviews;

-- Create a view of the reservations table joined with the users table, grouped by user ID
CREATE VIEW user_reservation_totals AS
SELECT u.user_id, u.name, u.surname, COUNT(*) AS reservation_count, SUM(r.price_with_discount) AS total_spent
FROM reservations r
JOIN users u ON r.user_id = u.user_id
GROUP BY u.user_id;


-- Create a view of the rooms table joined with the reservations table, grouped by availability date
CREATE VIEW room_availability AS
SELECT r.availability, COUNT(*) AS total_rooms, 
       COUNT(CASE WHEN res.reservation_id IS NOT NULL THEN 1 END) AS booked_rooms,
       COUNT(CASE WHEN res.reservation_id IS NULL THEN 1 END) AS available_rooms
FROM rooms r
LEFT JOIN reservations res ON r.room_id = res.room_id
GROUP BY r.availability;

-- Create a view of the loyalty_card table joined with the reservations table and users table, grouped by user ID
CREATE VIEW user_loyalty_card_usage AS
SELECT u.user_id, u.name, u.surname, COUNT(*) AS total_reservations, 
       COUNT(CASE WHEN lc.card_id IS NOT NULL THEN 1 END) AS loyalty_reservations,
       COUNT(CASE WHEN lc.card_id IS NULL THEN 1 END) AS non_loyalty_reservations
FROM reservations r
JOIN users u ON r.user_id = u.user_id
LEFT JOIN loyalty_card lc ON r.card_id = lc.card_id
GROUP BY u.user_id;

-- Create a view of the rooms table joined with the hosts table and reservations table, grouped by host ID
CREATE VIEW host_room_revenue AS
SELECT h.host_id, h.host_name, h.host_surname,
       SUM(res.price_with_discount) AS total_revenue
FROM rooms r
JOIN hosts h ON r.host_id = h.host_id
LEFT JOIN reservations res ON r.room_id = res.room_id
WHERE res.end_date < current_date OR res.end_date IS NULL
GROUP BY h.host_id;
