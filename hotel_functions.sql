--FUNCTIONS--
--(1)available_rooms() - function, which check if there are available rooms for a given number of people, beds and date and show a price for a night. 

DROP FUNCTION available_rooms(TEXT, INT, DATE, DATE);
CREATE OR REPLACE FUNCTION available_rooms(av_people INTEGER,av_beds INTEGER, av_start_date DATE, av_end_date DATE) RETURNS TEXT AS $$
DECLARE

-- end_date
	p RECORD;
	s RECORD;
	txt TEXT;
BEGIN
 	txt='';
 	FOR p IN SELECT * FROM rooms WHERE (people=av_people AND beds=av_beds) LOOP --perform the following loop for p-tuples from the table of rooms that satisfy the given criteria
 		 SELECT * INTO s FROM reservations --assign to s the reservations from the reservations table connected to room p, the duration of which coincides with the requested period of stay
  		 WHERE (room_number = p.room_number) AND (
  		 (start_date >= av_start_date AND end_date<=av_end_date) OR
  		 (start_date <= av_start_date AND end_date>av_start_date) OR
  		 (start_date<av_end_date AND end_date >= av_end_date));
  	IF (NOT FOUND) THEN
		txt = txt || p.room_number || '  '; --from a new line --if a particular room p is not occupied at the time you are looking for we will list it
 	END IF;

 	END LOOP;
	IF (txt='') THEN
    		RETURN 'No rooms available for ' || av_people || ' people with the number of ' || av_beds || ' beds in this area of time.';
 	ELSE
    		RETURN txt;
    END IF;
END;
$$ LANGUAGE 'plpgsql';

--(2)available_parking()--function to check if parking spaces are available at a given time and which ones

DROP FUNCTION available_parking(DATE, DATE);
CREATE OR REPLACE FUNCTION available_parking(av_start_date DATE, av_end_date DATE) RETURNS TEXT AS $$
DECLARE
	p RECORD;
	s RECORD;
	txt TEXT;
BEGIN
 	txt='';
 	FOR p IN SELECT * FROM parking LOOP ---perform the following loop for p-tuples from the table of parking
 	 	SELECT * INTO s FROM reservations --assign to s reservations from the reservations table linked to a parking space p whose duration coincides with the search term
  		WHERE (parking_number=p.parking_number) AND (
  		(start_date >= av_start_date AND end_date <= av_end_date) OR
  		(start_date <= av_start_date AND end_date > av_start_date) OR
  		(start_date < av_end_date AND end_date >= av_end_date));
 	 IF (NOT FOUND) THEN 
		txt = txt || p.parking_number || '.  ';        --if a parking place is not booked on the requested date, we will list it
 	 END IF;
	 END LOOP;
 	 IF (txt='') THEN
    		RETURN 'No parking spaces available in this time.';
 	 ELSE
    		RETURN txt;
	END IF;		
END;
$$ LANGUAGE 'plpgsql';


--(3)create_payment() - function to add a tuple to the payment table for a given id_reservation

DROP FUNCTION create_payment(INTEGER,DECIMAL(8,2),VARCHAR(50));
CREATE OR REPLACE FUNCTION create_payment(cr_reservation INTEGER,cr_to_pay DECIMAL(8,2), cr_method_of_payment VARCHAR(50)) RETURNS VOID AS $$
BEGIN
	INSERT INTO payment(id_reservation,to_pay,method_of_payment) VALUES (cr_reservation,cr_to_pay,cr_method_of_payment);
	END;
$$ LANGUAGE 'plpgsql';


--(4)how much_to_pay()--function, which counts the total charge for the hotel stay

DROP FUNCTION how much_to_pay(INTEGER);
CREATE OR REPLACE FUNCTION how much_to_pay(reservation INTEGER) RETURNS DECIMAL(8,2) AS $$ 
DECLARE
	total_payment DECIMAL(8,2);
	r RECORD;
BEGIN
	total_payment:=0.00;
	SELECT * INTO r FROM payment WHERE id_reservation = reservation;
	IF (NOT FOUND) THEN
	RAISE EXCEPTION 'There is no such reservation id !';
	END IF;

	SELECT * INTO r FROM payment_rooms WHERE id_reservation=reservation;
	total_payment=(r.room_price * (r.end_date::date - r.start_date::date));

	SELECT * INTO r FROM reservations WHERE id_reservation=reservation;
	IF(r.if_parking = true)THEN
		total_payment=total_payment+(20 * (r.end_date - r.start_date));
	ELSE
		total_payment=total_payment;

	END IF;

	FOR r IN SELECT * FROM payment_of_services WHERE id_reservation = reservation LOOP
		total_payment = total_payment + (r.amount * r.price);
	END LOOP;

	FOR r IN SELECT * FROM charge_penalty WHERE id_reservation = reservation LOOP
		total_payment = total_payment + r.amount_of_penalty;
	END LOOP;

	FOR r IN SELECT * FROM discount_allocation WHERE id_reservation = reservation LOOP
		total_payment = total_payment*(1-r.amount_of_discount);
	END LOOP;
	
	FOR r IN SELECT * FROM payment WHERE id_reservation = reservation LOOP
		total_payment = total_payment - r.to_pay;
	END LOOP;

	IF(total_payment < 0 ) THEN
		RETURN 0;
	END IF;
    
	RETURN total_payment;
	
END;
$$ LANGUAGE 'plpgsql';


--(5)reservations_in_days() - is a function that displays all the numbers of
--reservations starting and ending in the specified time period

DROP FUNCTION reservations_in_days(DATE, DATE);
CREATE OR REPLACE FUNCTION reservations_in_days(r_start_date DATE, r_end_date DATE) RETURNS TEXT AS $$
DECLARE
	txt TEXT;
	r RECORD;
BEGIN
	txt = '';
	FOR r IN SELECT * FROM reservations WHERE (start_date>=r_start_date AND end_date<=r_end_date) ORDER BY start_date LOOP
 		txt = txt || r.id_reservation || ' ';
	END LOOP;
	
	IF (txt='') THEN
 		RETURN 'No reservations meeting these criteria.';
 	END IF;

	RETURN txt;
END;
$$ LANGUAGE 'plpgsql';



--TRIGGERS--
--(6)reservation_possibility() - this is a trigger attached to the reservations table,
--it activates when a new tuple is added to the reservations table and checks if
--it is possible to book the specified room at the specified time

DROP FUNCTION reservation_possibility();
CREATE OR REPLACE FUNCTION reservation_possibility() RETURNS TRIGGER AS $$
DECLARE
	r RECORD;
BEGIN
  	SELECT * INTO r FROM reservations --assign to r reservations from the table a reservations linked to a room of the same duration as the one in the NEW tuple, which has the same duration as the one in the NEW tuple
 	 WHERE (room_number=NEW.room_number) AND (
  	(start_date>=NEW.start_date AND end_date<=NEW.end_date) OR
  	(start_date<=NEW.start_date AND end_date>NEW.start_date) OR
  	(start_date<NEW.end_date AND end_date>=NEW.end_date));
  	
	IF (FOUND) THEN 
     		RAISE EXCEPTION ' It is not possible to book this room at this time ';
  	END IF;
 	RETURN NEW;
END;
$$ LANGUAGE 'plpgsql';

DROP TRIGGER reservation_possibility_trigger ON reservations CASCADE;
CREATE TRIGGER reservation_possibility_trigger BEFORE INSERT OR UPDATE ON reservations
FOR EACH ROW EXECUTE PROCEDURE reservation_possibility();



--(7)name_upper -  a trigger pinned to the customers table, it runs when a new tuple is added to the customers table
-- and corrects first and last names, starting with lower case letters, to upper case.

DROP FUNCTION name_upper();
CREATE OR REPLACE FUNCTION name_upper() RETURNS TRIGGER AS 
$$
BEGIN
	NEW.name = initcap(NEW.name);
	NEW.name = initcap(NEW.surname);
	RETURN NEW;
END;
$$ LANGUAGE 'plpgsql';

DROP TRIGGER name_upper_trigger ON customers CASCADE;
CREATE TRIGGER name_upper_trigger BEFORE INSERT OR UPDATE ON 
customers FOR EACH ROW EXECUTE PROCEDURE name_upper();


--(8)name_upper_workers()- This is a trigger pinned to the workers table, it runs when a new tuple is added to the workers table
-- and corrects first and last names, starting with lower case letters, to upper case.


DROP FUNCTION name_upper_workers();
CREATE OR REPLACE FUNCTION name_upper_workers() RETURNS TRIGGER AS 
$$
BEGIN
	NEW.name_worker = initcap(NEW.name_worker);
	NEW.surnname_worker = initcap(NEW.surnname_worker);
	RETURN NEW;
END;
$$ LANGUAGE 'plpgsql';

DROP TRIGGER name_upper_workers_trigger ON workers CASCADE;
CREATE TRIGGER name_upper_workers_trigger BEFORE INSERT OR UPDATE ON workers
FOR EACH ROW EXECUTE PROCEDURE name_upper_workers();