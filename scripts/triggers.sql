CREATE OR REPLACE FUNCTION update_card_discount()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
  reservation_count INTEGER;
BEGIN
  -- Get the number of reservations made with the card being used in the new reservation
  SELECT COUNT(*) INTO reservation_count FROM reservations WHERE card_id = NEW.card_id;
  -- Update the discount on the card based on the number of reservations made with it
  UPDATE loyalty_card SET discount = CASE
    WHEN reservation_count >= 5 THEN 10
    WHEN reservation_count >= 3 THEN 5
    ELSE 0
  END WHERE card_id = NEW.card_id;
  RETURN NEW;
END;
$$;

-- Create the trigger to execute the update_card_discount function after every new reservation is made
CREATE TRIGGER update_card_discount
AFTER INSERT ON reservations
FOR EACH ROW
EXECUTE FUNCTION update_card_discount();

CREATE OR REPLACE FUNCTION update_room_availability()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
  -- Update the availability of the room based on the reservations made for that room
  UPDATE rooms SET availability = (
    SELECT COALESCE(MIN(end_date), availability) FROM reservations WHERE room_id = NEW.room_id AND end_date > NOW()
  ) WHERE room_id = NEW.room_id;
  RETURN NEW;
END;
$$;

-- Create the trigger to execute the update_room_availability function after every new or deleted reservation
CREATE TRIGGER update_room_availability
AFTER INSERT OR DELETE ON reservations
FOR EACH ROW
EXECUTE FUNCTION update_room_availability();
