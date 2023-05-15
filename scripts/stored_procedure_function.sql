CREATE OR REPLACE FUNCTION get_total_price(IN room_price NUMERIC, IN start_date DATE, IN end_date DATE)
RETURNS NUMERIC
LANGUAGE plpgsql
AS $$
DECLARE
  num_nights INTEGER;
  total_price NUMERIC;
BEGIN
  num_nights := end_date - start_date;
  total_price := room_price * num_nights;
  RETURN total_price;
END;
$$;

-- Test case 1: Calculate the total price for a 5-night stay in a room with a price of $100/night
SELECT get_total_price(100, '2023-06-01', '2023-06-06');
-- Expected output: 500.00

-- Test case 2: Calculate the total price for a 2-night stay in a room with a price of $150/night
SELECT get_total_price(150, '2023-07-01', '2023-07-03');
-- Expected output: 300.00







CREATE OR REPLACE PROCEDURE update_reservation_date(reservation_id INT, start_date DATE, end_date DATE)
LANGUAGE plpgsql
AS $$
BEGIN
  UPDATE reservations SET start_date = update_reservation_date.start_date, end_date = update_reservation_date.end_date
  WHERE reservations.reservation_id = update_reservation_date.reservation_id;
END;
$$;



CALL update_reservation_date(1, '2023-06-01', '2023-06-07');
-- This should update the start and end dates for reservation with ID 1.
