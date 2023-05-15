-- Stored procedure 1: Get available rooms
-- This stored procedure takes in a start date and an end date as input parameters and returns
-- a list of available rooms during that time period.
CREATE OR REPLACE PROCEDURE get_available_rooms (IN start_date DATE, IN end_date DATE)
BEGIN
  SELECT r.room_id, r.room_type, r.price 
  FROM rooms r 
  WHERE r.room_id NOT IN (
    SELECT res.room_id 
    FROM reservations res 
    WHERE (start_date BETWEEN res.start_date AND res.end_date OR end_date BETWEEN res.start_date AND res.end_date)
    OR (start_date <= res.start_date AND end_date >= res.end_date)
  );
END;


-- Test case 1: Check if available rooms are returned for a given time period
CALL get_available_rooms('2023-06-01', '2023-06-05');
-- Expected output: A list of available rooms during the specified time period

-- Test case 2: Check if no available rooms are returned for a fully booked time period
CALL get_available_rooms('2023-07-01', '2023-07-07');
-- Expected output: An empty result set

-- Test case 3: Check if available rooms are returned for a partially booked time period
CALL get_available_rooms('2023-08-01', '2023-08-07');
-- Expected output: A list of available rooms during the specified time period

-- Function 1: Calculate reservation cost
-- This function takes in a room ID, a start date, an end date, and a loyalty card ID (which can be NULL) as input parameters
-- and returns the total cost of the reservation, taking into account any discounts from the loyalty card.
CREATE OR REPLACE FUNCTION calculate_reservation_cost (
  room_id INT, start_date DATE, end_date DATE, loyalty_card_id INT
) RETURNS DECIMAL(10,2)
BEGIN
  DECLARE room_price DECIMAL(10,2);
  DECLARE discount_amount DECIMAL(10,2);
  SELECT price INTO room_price FROM rooms WHERE room_id = room_id;
  IF loyalty_card_id IS NOT NULL THEN
    SELECT discount INTO discount_amount FROM loyalty_card WHERE card_id = loyalty_card_id;
  ELSE
    SET discount_amount = 0;
  END IF;
  RETURN room_price * DATEDIFF(end_date, start_date) * (1 - discount_amount);
END;


-- Test case 1: Check if reservation cost is correctly calculated without a loyalty card
SELECT calculate_reservation_cost(1, '2023-06-01', '2023-06-05', NULL);
-- Expected output: Total cost of the reservation for room 1 for 4 nights (room price * 4)

-- Test case 2: Check if reservation cost is correctly calculated with a loyalty card
SELECT calculate_reservation_cost(2, '2023-07-01', '2023-07-07', 123);
-- Expected output: Total cost of the reservation for room 2 for 6 nights with a 10% discount (room price * 6 * 0.9)

-- Test case 3: Check if reservation cost is correctly calculated with a different room and loyalty card
SELECT calculate_reservation_cost(3, '2023-08-01', '2023-08-07', 456);
-- Expected output: Total cost of the reservation for room 3 for 7 nights with a 15% discount (room price * 7 * 0.85)
