

-- Create an index on the host_id field of the hosts table
CREATE INDEX idx_hosts_host_id ON hosts (host_id);

/*
Creating an index on the host_id field of the hosts table can be useful 
when searching for a specific host by their ID. The index will make the 
search faster by creating a data structure that allows for quick lookups 
of host IDs.
*/



-- Create an index on the email field of the users table
CREATE INDEX idx_users_email ON users (email);

/*
Creating an index on the email field of the users table can be useful 
when searching for a user by their email address. The index will make 
the search faster by creating a data structure that allows for quick 
lookups of email addresses.
*/


-- Create an index on the user_id field of the loyalty_card table
CREATE INDEX idx_loyalty_card_user_id ON loyalty_card (user_id);

/*
Creating an index on the user_id field of the loyalty_card table can 
be useful when searching for loyalty cards associated with a specific 
user. The index will make the search faster by creating a data structure 
that allows for quick lookups of user IDs.
*/


-- No index is needed on the amenities table as it has a small number of rows.



-- Create an index on the host_id field of the rooms table
CREATE INDEX idx_rooms_host_id ON rooms (host_id);

-- Create an index on the amenity_id field of the rooms table
CREATE INDEX idx_rooms_amenity_id ON rooms (amenity_id);

/*
Creating an index on the host_id field of the rooms table can be useful 
when searching for rooms associated with a specific host. The index will 
make the search faster by creating a data structure that allows for quick 
lookups of host IDs.

Creating an index on the amenity_id field of the rooms table can be useful
when searching for rooms with a specific amenity. The index will make the 
search faster by creating a data structure that allows for quick lookups 
of amenity IDs.
*/



-- Create an index on the user_id field of the reservations table
CREATE INDEX idx_reservations_user_id ON reservations (user_id);

-- Create an index on the card_id field of the reservations table
CREATE INDEX idx_reservations_card_id ON reservations (card_id);

-- Create an index on the room_id field of the reservations table
CREATE INDEX idx_reservations_room_id ON reservations (room_id);

/*
Creating an index on the user_id field of the reservations table can be 
useful when searching for reservations made by a specific user. The index 
will make the search faster by creating a data structure that allows for 
quick lookups of user IDs.

Creating an index on the card_id field of the reservations table can be 
useful when searching for reservations made with a specific loyalty card. 
The index will make the search faster by creating a data structure that 
allows for quick lookups of card IDs.

Creating an index on the room_id field of the reservations table can be 
useful when searching for reservations made for a specific room. The index 
will make the search faster by creating a data structure that allows for 
quick lookups of room IDs.
*/



-- Create an index on the reservation_id field of the reviews table
CREATE INDEX idx_reviews_reservation_id ON reviews (reservation_id);

/*
Creating an index on the reservation_id field of the reviews table can 
be useful when searching for reviews associated with a specific reservation. 
The index will make the search faster by creating a data structure that 
allows for quick lookups of reservation IDs.
*/
