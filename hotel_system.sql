-- Create the database
CREATE DATABASE hotel;

-- Use the database
USE hotel;
-- Create the table for hotels
CREATE TABLE hotels (
  hotel_id INT AUTO_INCREMENT PRIMARY KEY,
  hotel_name VARCHAR(100) NOT NULL,
  hotel_address VARCHAR(200) NOT NULL,
  hotel_contact_number VARCHAR(20) NOT NULL,
  hotel_email VARCHAR(100) NOT NULL
);
-- Insert sample data into the hotels table
INSERT INTO hotels (hotel_name, hotel_address, hotel_contact_number, hotel_email)
VALUES ('Hotel A', '123 Main Street, City A', '+1 123-456-7890', 'hotelA@example.com'),
       ('Hotel B', '456 Elm Street, City B', '+1 987-654-3210', 'hotelB@example.com');
-- Create the table for events
CREATE TABLE events (
  event_id INT AUTO_INCREMENT PRIMARY KEY,
  hotel_id INT,
  event_name VARCHAR(100) NOT NULL,
  event_date DATE NOT NULL,
  event_time TIME NOT NULL,
  event_description TEXT,
  event_location VARCHAR(100),
  event_capacity INT,
  event_status ENUM('Scheduled', 'Cancelled', 'Completed') DEFAULT 'Scheduled',
  FOREIGN KEY (hotel_id) REFERENCES hotels(hotel_id)
);
-- Insert sample data into the events table
INSERT INTO events (hotel_id, event_name, event_date, event_time, event_description, event_location, event_capacity, event_status)
VALUES (1, 'Conference 1', '2023-09-01', '09:00:00', 'Conference Description 1', 'Conference Hall A', 100, 'Scheduled'),
       (2, 'Wedding Party', '2023-10-15', '18:00:00', 'Wedding Party Description', 'Banquet Hall B', 200, 'Scheduled');

-- Create the table for event attendees
CREATE TABLE attendees (
  attendee_id INT AUTO_INCREMENT PRIMARY KEY,
  event_id INT,
  attendee_name VARCHAR(100) NOT NULL,
  attendee_email VARCHAR(100) NOT NULL,
  attendee_phone VARCHAR(20),
  FOREIGN KEY (event_id) REFERENCES events(event_id)
);
-- Insert sample data into the attendees table
INSERT INTO attendees (event_id, attendee_name, attendee_email, attendee_phone)
VALUES (1, 'John Doe', 'johndoe@example.com', '+1 123-456-7890'),
       (1, 'Jane Smith', 'janesmith@example.com', '+1 987-654-3210');

-- Create the table for event organizers
CREATE TABLE organizers (
  organizer_id INT AUTO_INCREMENT PRIMARY KEY,
  event_id INT,
  organizer_name VARCHAR(100) NOT NULL,
  organizer_email VARCHAR(100) NOT NULL,
  organizer_phone VARCHAR(20),
  FOREIGN KEY (event_id) REFERENCES events(event_id)
);
-- Insert sample data into the organizers table
INSERT INTO organizers (event_id, organizer_name, organizer_email, organizer_phone)
VALUES (1, 'Organizer A', 'organizerA@example.com', '+1 111-222-3333');

-- Create the table for event services
CREATE TABLE services (
  service_id INT AUTO_INCREMENT PRIMARY KEY,
  event_id INT,
  service_name VARCHAR(100) NOT NULL,
  service_description TEXT,
  service_cost DECIMAL(10, 2),
  FOREIGN KEY (event_id) REFERENCES events(event_id)
);
-- Insert sample data into the services table
INSERT INTO services (event_id, service_name, service_description, service_cost)
VALUES (1, 'Catering', 'Conference Catering Service', 5000.00),
       (2, 'Decorations', 'Wedding Party Decorations', 2000.00);

-- Create the table for rooms
CREATE TABLE rooms (
  room_id INT AUTO_INCREMENT PRIMARY KEY,
  hotel_id INT,
  room_number VARCHAR(10) NOT NULL,
  room_type VARCHAR(50) NOT NULL,
  room_capacity INT,
  room_price DECIMAL(10, 2),
  FOREIGN KEY (hotel_id) REFERENCES hotels(hotel_id)
);
-- Insert sample data into the rooms table
INSERT INTO rooms (hotel_id, room_number, room_type, room_capacity, room_price)
VALUES (1, '101', 'Standard', 2, 100.00),
       (1, '102', 'Deluxe', 3, 150.00),
       (2, '201', 'Standard', 2, 120.00),
       (2, '202', 'Deluxe', 3, 180.00);

-- Create the table for bookings
CREATE TABLE bookings (
  booking_id INT AUTO_INCREMENT PRIMARY KEY,
  room_id INT,
  event_id INT,
  booking_date DATE NOT NULL,
  check_in_date DATE NOT NULL,
  check_out_date DATE NOT NULL,
  guest_name VARCHAR(100) NOT NULL,
  guest_email VARCHAR(100) NOT NULL,
  guest_phone VARCHAR(20),
  FOREIGN KEY (room_id) REFERENCES rooms(room_id),
  FOREIGN KEY (event_id) REFERENCES events(event_id)
);
-- Insert sample data into the bookings table
INSERT INTO bookings (room_id, event_id, booking_date, check_in_date, check_out_date, guest_name, guest_email, guest_phone)
VALUES (1, 1, '2023-08-27', '2023-08-30', '2023-09-02', 'John Doe', 'johndoe@example.com', '+1 123-456-7890'),
       (2, 2, '2023-08-27', '2023-10-13', '2023-10-16', 'Jane Smith', 'janesmith@example.com', '+1 987-654-3210');

-- Create the table for payments
CREATE TABLE payments (
  payment_id INT AUTO_INCREMENT PRIMARY KEY,
  booking_id INT,
  payment_date DATE NOT NULL,
  payment_amount DECIMAL(10, 2),
  payment_method VARCHAR(50),
  FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);
-- Insert sample data into the payments table
INSERT INTO payments (booking_id, payment_date, payment_amount, payment_method)
VALUES (1, '2023-08-27', 300.00, 'Credit Card'),
       (2, '2023-08-27', 750.00, 'Cash');
       
-- queries 
 -- retrieve data rom all tables 
 select * from hotels;
 select * from events;
 select * from attendees ;
 select * from organizers ;
select * from rooms;
select * from bookings ;
select * from payments;
-- apply more specific queries
-- Retrieve all attendees for a specific event:
SELECT * FROM attendees WHERE event_id  =1;
-- Retrieve all organizers for a specific event:
SELECT * FROM organizers WHERE event_id = 1;
-- Retrieve all bookings for a specific event:
SELECT * FROM bookings WHERE event_id = 1;
-- more complex queries 
-- Retrieve the total count of attendees for each event:
SELECT e.event_id, e.event_name, COUNT(*) AS attendee_count
FROM events e
JOIN attendees a ON e.event_id = a.event_id
GROUP BY e.event_id, e.event_name;
-- Retrieve the total revenue generated by each hotel:
SELECT h.hotel_id, h.hotel_name, SUM(p.payment_amount) AS total_revenue
FROM hotels h
JOIN bookings b ON h.hotel_id = h.hotel_id
JOIN payments p ON b.booking_id = p.booking_id
GROUP BY h.hotel_id, h.hotel_name;
-- Retrieve the list of events with their corresponding rooms and bookings
SELECT e.event_id, e.event_name, r.room_number, b.check_in_date, b.check_out_date
FROM events e
JOIN bookings b ON e.event_id = b.event_id
JOIN rooms r ON b.room_id = r.room_id;


