----DELETION OF PRE-EXISTING VIEWS----

DROP VIEW payment_reservation  CASCADE;
DROP VIEW penalties_reservation CASCADE;
DROP VIEW parking_reservation CASCADE;
DROP VIEW ordered_services CASCADE;
DROP VIEW discount_allocation_2 CASCADE;
DROP VIEW payment_rooms CASCADE;
DROP VIEW payment_of_services CASCADE;
DROP VIEW discount_allocation CASCADE;
DROP VIEW charge_penalty CASCADE;


CREATE VIEW payment_reservation  AS(
SELECT id_reservation,to_pay,method_of_payment
FROM reservations INNER JOIN payment USING (id_reservation)
);


CREATE VIEW penalties_reservation AS(
SELECT id_reservation,amount_of_penalty,description_of_penalty
FROM ((reservations INNER JOIN payment USING (id_reservation))
INNER JOIN penalties USING (id_payment)) INNER JOIN penalties_information USING (penalty_code)
);


CREATE VIEW parking_reservation AS(
SELECT id_reservation,parking_number
FROM reservations
);


CREATE VIEW ordered_services AS(
SELECT id_reservation,id_service,price,description
FROM (reservations INNER JOIN order_services USING (id_reservation))
INNER JOIN additional_services USING (id_service)
);


CREATE VIEW discount_allocation AS(
SELECT id_reservation, code, amount_of_discount
FROM (payment JOIN discounts USING (id_payment))
JOIN discounts_information USING (code)
);


CREATE VIEW discount_allocation_2 AS(
SELECT id_reservation, code, amount_of_discount,description_of_discount
FROM ((reservations INNER JOIN payment USING (id_reservation))
INNER JOIN discounts USING (id_payment)) INNER JOIN discounts_information USING (code)
);


CREATE VIEW payment_rooms AS(
SELECT id_reservation, room_number,start_date,end_date,price
FROM (reservations JOIN rooms USING (room_number))
);


CREATE VIEW payment_of_services AS(
SELECT id_reservation,id_service,amount,price
FROM order_services JOIN additional_services USING (id_service)
);


CREATE VIEW charge_penalty AS(
SELECT id_reservation,penalty_code,amount_of_penalty
FROM (payment JOIN penalties USING(id_payment))
JOIN penalties_information USING(penalty_code)
);