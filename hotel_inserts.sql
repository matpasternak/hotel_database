--DODAWANIE PRZYKLADOWYCH DANYCH--


INSERT INTO customers(pesel,name,surname,city,street,home_number,apartment_number,zip_code,email) VALUES
('99032441426', 'Anna', 'Nowak', 'Wroclaw', 'Opolska', 32, 12,'65-127','annanow@gmail.com'),
('49022729485', 'Adam', 'Abacki', 'Opole', 'Krakowska', 43, 6,'45-123','adam321@gmail.com'),
('02260129381', 'Maciej', 'Rumak', 'Poznan', 'Koszalinska', 134, 3,'85-143','macpro@gmail.com'),
('69122473712', 'Magda', 'Kowalska', 'Krakow', 'Prosta', 9, 2, '42-128','madziak@gmail.com'),
('72042849532', 'Tomasz', 'Bak', 'Wroclaw', 'Zeromskiego', 87, 65,'65-143','tomkam@gmail.com'),
('55041729892', 'Anna', 'Lopka', 'Warszawa', 'Centralna', 43, 21,'97-456',NULL),
('48041431447', 'Dawid', 'Jedryszek', 'Zamosc', 'Krotka', 36, NULL,'73-903','jedyszekd@gmail.com'),
('55032661194', 'Mateusz', 'Mordalski', 'Gdansk', 'Warszawska', 53, 11,'83-582',NULL),
('93111213111', 'Jadwiga', 'Kowal', 'Wloclawek', 'Miejska', 32, 1,'91-127','jadziakow@gmail.com'),
('58012213727', 'Adam', 'Polanski', 'Rzeszow', 'Studencka', 41, 103,'56-111','polanadam@gmail.com'),
('03273128965', 'Marianna', 'Mala', 'Warszawa', 'Krakowska', 77, 65,'80-321','mariannam@gmail.com'),
('02270288416', 'Mateusz', 'Nowak', 'Ustrzyki Dolne', 'Glowna', 50,7,'33-222','matinowy@gmail.com'),
('89101181283', 'Jagoda', 'Jagodzinska', 'Sopot', 'Gdanska', 22, 22,'79-098','anna654@gmail.com'),
('73032214273', 'Marcin', 'Zaremba', 'Opole', 'Chabrow',77, 12,'45-127','martinii@gmail.com'),
('70080631898', 'Patryk', 'Nowarecki', 'Olsztyn', 'Miejska', 90, 2,'11-653','patinow@gmail.com'),
('05262245853', 'Patrycja', 'Tamarska', 'Zawadzkie', 'Opolska', 32, 12,'41-127','tamarskapati@gmail.com'),
('65041242611', 'Tadeusz', 'Nowak', 'Zielona Gora', 'Lateralna', 43, 43,'99-210','tadeknow@gmail.com'),
('99102132274', 'Amanda', 'Matula', 'Gorzow Wielkopolski', 'Tajska', 11, 3,'30-123','amada0987@gmail.com'),
('53040231141', 'Sylwester', 'Saski', 'Katowice', 'Poranna', 1, 1,'20-202',NULL),
('56031478952', 'Jan', 'Polski', 'Gdynia', 'Trojmiejska', 66, 43,'76-309','janek10937@gmail.com');


INSERT INTO rooms(room_number, people,beds,room_price) VALUES
(11, 1, 1, 150),
(12, 2, 2, 200),
(13, 2, 1, 180),
(21, 2, 2, 200),
(22, 3, 3, 250),
(23, 3, 3, 240),
(31, 2, 1, 170),
(32, 2, 2, 210),
(33, 2, 2, 360),
(41, 2, 2, 320),
(42, 2, 2, 280),
(43, 2, 2, 310),
(51, 2, 1, 120),
(52, 3, 3, 300),
(61, 2, 2, 220),
(62, 2, 1, 210),
(63, 1, 1, 200),
(71, 2, 2, 260);


INSERT INTO workers(id_worker, name_worker,surname_worker,birthdate,position) VALUES
(1111,'Anna','Morawiecka','1991-11-11','maid'),
(1212,'Adam','Malecki','1987-03-14','doorman'),
(1349,'Maja','Sawicka','1986-09-21','maid'),
(1450,'Matylda','Nowicka','1995-10-13','cleaner'),
(1752,'Anna','Tarska','1965-02-01','receptionist'),
(1772,'Monika','Tarska','1965-02-01','receptionist'),
(1731,'Roza','Rawska','1995-08-08','receptionist'),
(1842,'Magda','Miodulska','1978-08-07','receptionist'),
(1999,'Patryk','Pal','1980-10-01','director'),
(1324,'Antonina','Wielka','1998-12-13','maid'),
(1742,'Tatiana','Nawilska','1994-01-11','maid'),
(1654,'Maria','Kala','2000-08-30','maid'),
(1203,'Alojz','Krol','1963-07-13','doorman'),
(1302,'Karolina','Makowa','1979-04-01','receptionist'),
(1222,'Anna','Nowak','1999-12-25','maid');


INSERT INTO parking(parking_number) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20),
(21),
(22),
(23),
(24),
(25);


INSERT INTO reservations(id_customer,room_number,id_worker,start_date,end_date,if_parking,parking_number) VALUES (1,11,1752,'2021-10-01','2021-10-10',true,1);
INSERT INTO reservations(id_customer,room_number,id_worker,start_date,end_date,if_parking,parking_number) VALUES VALUES (2,12,1772,'2021-03-07','2021-03-12',true,2);
INSERT INTO reservations(id_customer,room_number,id_worker,start_date,end_date,if_parking,parking_number) VALUES (3,31,1752,'2020-09-16','2020-09-19',true,1);
INSERT INTO reservations(id_customer,room_number,id_worker,start_date,end_date,if_parking,parking_number) VALUES (4,61,1302,'2021-01-01','2021-01-02',true,3);
INSERT INTO reservations(id_customer,room_number,id_worker,start_date,end_date,if_parking,parking_number) VALUES (5,71,1302,'2020-11-13','2021-11-19',true,4);
INSERT INTO reservations(id_customer,room_number,id_worker,start_date,end_date,if_parking,parking_number) VALUES (6,51,1731,'2021-08-20','2021-08-20',true,7);
INSERT INTO reservations(id_customer,room_number,id_worker,start_date,end_date,if_parking,parking_number) VALUES (7,42,1731,'2021-08-20','2021-08-23',true,8);
INSERT INTO reservations(id_customer,room_number,id_worker,start_date,end_date,if_parking,parking_number) VALUES (8,33,1842,'2021-09-30','2021-10-03',true,9);
INSERT INTO reservations(id_customer,room_number,id_worker,start_date,end_date,if_parking,parking_number) VALUES (9,23,1772,'2020-12-11','2020-12-17',true,12);
INSERT INTO reservations(id_customer,room_number,id_worker,start_date,end_date,if_parking,parking_number) VALUES (10,22,1203,'2021-04-08','2021-04-12',true,11);
INSERT INTO reservations(id_customer,room_number,id_worker,start_date,end_date,if_parking,parking_number) VALUES (11,21,1222,'2021-08-14','2021-08-18',false,1);
INSERT INTO reservations(id_customer,room_number,id_worker,start_date,end_date,if_parking,parking_number) VALUES (12,32,1111,'2020-04-21','2021-04-23',true,21);
INSERT INTO reservations(id_customer,room_number,id_worker,start_date,end_date,if_parking,parking_number) VALUES (13,52,1450,'2021-06-23','2021-07-02',true,15);
INSERT INTO reservations(id_customer,room_number,id_worker,start_date,end_date,if_parking,parking_number) VALUES (14,63,1324,'2020-06-25','2021-07-01',false,1);
INSERT INTO reservations(id_customer,room_number,id_worker,start_date,end_date,if_parking,parking_number) VALUES (15,31,1654,'2021-09-05','2021-09-14',true,18);
INSERT INTO reservations(id_customer,room_number,id_worker,start_date,end_date,if_parking,parking_number) VALUES (16,13,1731,'2020-09-08','2021-09-10',true,13);
INSERT INTO reservations(id_customer,room_number,id_worker,start_date,end_date,if_parking,parking_number) VALUES (17,12,1349,'2021-02-07','2021-02-15',true,12);
INSERT INTO reservations(id_customer,room_number,id_worker,start_date,end_date,if_parking,parking_number) VALUES (18,33,1302,'2020-03-21','2021-03-27',true,11);
INSERT INTO reservations(id_customer,room_number,id_worker,start_date,end_date,if_parking,parking_number) VALUES (19,32,1742,'2021-09-14','2021-09-19',true,10);
INSERT INTO reservations(id_customer,room_number,id_worker,start_date,end_date,if_parking,parking_number) VALUES (20,62,1349,'2020-07-20','2021-07-29',true,25);


INSERT INTO payment(id_reservation,to_pay,method_of_payment) VALUES
(1,400,'cash'),
(1,500,'card'),
(2,1000,'voucher'),
(3,340,'voucher'),
(3,60,'blik'),
(4,360,'cash'),
(5,500,'cash'),
(6,300,'cash'),
(7,600,'card'),
(7,600,'cash'),
(8,1200,'cash'),
(9,1000,'card'),
(10,200,'blik'),
(10,400,'cash'),
(11,700,'card'),
(12,1200,'card'),
(13,1100,'cash'),
(14,720,'card'),
(15,300,'cash'),
(15,300,'czek'),
(16,800,'card'),
(16,50,'blik'),
(17,700,'voucher'),
(18,350,'cash'),
(19,1000,'bon'),
(20,740,'cash'),
(20,380,'card');


INSERT INTO discounts_information(code,amount_of_discount,description_of_discount) VALUES
(500,0.2,'Large family discount. Valid on presentation of appropriate document'),
(123,0.4,'Student discount. Valid for students and doctoral students under 26 years of age. Valid on presentation of appropriate document'),
(898,0.2,'Senior discount. On presentation of senior card'),
(444,0.1,'Discount for people with disabilities. On presentation of identity card or relevant document'),
(678,0.5,'Employee discount. Discount applicable only for hotel employees.'),
(100,0.1,'Discount for members of the uniformed services. Valid on presentation of the relevant document'),
(0,0,'Zero discount');



INSERT INTO discounts(code,id_payment) VALUES
(500,1),
(500,2),
(0,3),
(123,4),
(123,5),
(0,6),
(444,7),
(100,8),
(100,9),
(0,10),
(0,11),
(678,12),
(0,13),
(0,14),
(898,15),
(0,16),
(0,17),
(0,18),
(444,19),
(444,20),
(0,21),
(0,22),
(0,23),
(0,24),
(500,25),
(0,26),
(0,27);


INSERT INTO penalties_information(penalty_code,amount_of_penalty,description_of_penalty) VALUES
(444,1000,'Breaking a window.'),
(210,400,'Breakdown of domestic appliances'),
(567,1000,'TV breakdown'),
(100,100,'Toilet break-down'),
(654,100,'Stealing of bedding'),
(720,30,'Breaking a lamp'),
(0,0,'Brak kary');


INSERT INTO penalties(penalty_code,id_payment) VALUES
(0,1),
(0,2),
(0,3),
(100,4),
(100,5),
(0,6),
(0,7),
(567,8),
(0,9),
(0,10),
(0,11),
(720,12),
(0,13),
(0,14),
(0,15),
(0,16),
(0,17),
(0,18),
(0,19),
(0,20),
(100,21),
(100,22),
(0,23),
(0,24),
(210,25),
(0,26),
(0,27);


INSERT INTO reception_desk_duty_schedule(id_worker,date_duty,start_duty,end_duty) VALUES
(1752,'2021-02-07','08:00:00','21:00:00'),
(1772,'2021-02-08','11:00:00','21:00:00'),
(1731,'2021-02-09','08:00:00','21:00:00'),
(1302,'2021-02-10','08:00:00','14:00:00'),
(1842,'2021-02-10','14:00:00','23:00:00'),
(1752,'2021-02-11','08:00:00','21:00:00'),
(1772,'2021-02-12','09:00:00','21:00:00'),
(1731,'2021-02-13','08:00:00','21:00:00'),
(1302,'2021-08-12','08:00:00','14:00:00'),
(1842,'2021-10-15','14:00:00','23:00:00'),
(1752,'2021-12-07','08:00:00','21:00:00'),
(1772,'2021-12-08','07:00:00','21:00:00'),
(1731,'2021-12-09','08:00:00','21:00:00'),
(1302,'2021-07-15','08:00:00','14:00:00'),
(1842,'2021-07-13','14:00:00','23:00:00'),
(1752,'2021-08-07','08:00:00','21:00:00'),
(1772,'2021-03-08','08:00:00','21:00:00'),
(1731,'2021-04-29','10:00:00','21:00:00'),
(1302,'2021-05-19','08:00:00','14:00:00'),
(1842,'2021-05-19','14:00:00','23:00:00'),
(1752,'2021-02-20','08:00:00','21:00:00'),
(1772,'2021-11-30','09:00:00','21:00:00'),
(1731,'2021-02-27','08:00:00','21:00:00'),
(1302,'2021-10-10','08:00:00','13:00:00'),
(1842,'2021-10-10','13:00:00','23:00:00'),
(1752,'2021-07-07','08:00:00','21:00:00'),
(1772,'2021-06-08','09:00:00','21:00:00'),
(1731,'2021-06-17','08:00:00','21:00:00'),
(1302,'2021-07-24','09:00:00','17:00:00'),
(1842,'2021-07-24','17:00:00','23:00:00');


INSERT INTO room_cleaning_schedule(id_worker,room_number,cleaning_date,cleaning_hours) VALUES
(1111,11,'2021-08-11','08:00:00'),
(1349,12,'2021-08-13','09:00:00'),
(1450,13,'2021-06-17','12:00:00'),
(1324,21,'2021-11-21','13:00:00'),
(1742,22,'2021-08-21','08:40:00'),
(1654,23,'2021-07-21','09:00:00'),
(1222,31,'2021-10-11','10:00:00'),
(1450,32,'2021-12-11','13:00:00'),
(1324,33,'2021-12-15','09:00:00'),
(1111,41,'2021-07-12','09:00:00'),
(1349,42,'2021-09-19','10:00:00'),
(1349,43,'2021-10-11','08:00:00'),
(1450,51,'2021-08-11','07:00:00'),
(1450,52,'2021-03-11','08:00:00'),
(1111,61,'2021-11-17','12:00:00'),
(1222,62,'2021-08-11','08:00:00'),
(1222,63,'2021-01-12','10:00:00'),
(1654,71,'2021-01-13','09:00:00'),
(1324,11,'2021-02-21','15:00:00'),
(1450,11,'2021-12-21','16:00:00'),
(1222,11,'2021-09-19','08:00:00'),
(1349,12,'2021-09-23','09:00:00'),
(1654,13,'2021-06-19','12:00:00'),
(1111,21,'2021-11-27','08:30:00'),
(1742,22,'2021-08-06','08:45:00'),
(1324,23,'2021-04-13','09:30:00'),
(1450,31,'2021-04-04','10:00:00'),
(1450,32,'2021-05-05','16:00:00'),
(1222,33,'2021-12-31','11:00:00'),
(1654,41,'2021-06-12','15:00:00'),
(1654,42,'2021-01-27','12:00:00'),
(1349,43,'2021-10-01','08:00:00'),
(1324,51,'2021-03-19','08:00:00'),
(1222,52,'2021-03-18','12:00:00'),
(1111,61,'2021-08-19','12:00:00'),
(1222,62,'2021-07-11','08:00:00'),
(1324,63,'2021-07-19','10:00:00'),
(1654,71,'2021-01-27','09:00:00'),
(1324,11,'2021-07-23','15:00:00'),
(1450,11,'2021-12-12','16:00:00');


INSERT INTO additional_services(price,description) VALUES
(20,'breakfast (single)'),
(30,'dinner (single)'),
(20,'supper (single)'),
(60,'full board (1 day)'),
(30,'dry cleaning'),
(80,'massage'),
(50,'sauna (price per 15 minutes)'),
(30,'swimming pool (price per hour)'),
(40,'squash (room rental by the hour)'),
(40,'tennis (tennis court hire by the hour)');

INSERT INTO order_services(id_service,id_reservation,order_date,amount) VALUES
(4,1,'2021-10-01',10),
(8,1,'2021-10-02',1),
(4,2,'2021-03-07',5),
(7,2,'2021-03-08',1),
(6,2,'2021-03-09',1),
(4,3,'2020-09-16',4),
(5,4,'2021-01-01',1),
(4,5,'2020-11-13',6),
(7,5,'2020-11-15',2),
(4,7,'2021-08-20',3),
(4,8,'2021-09-30',5),
(6,8,'2021-10-02',1),
(4,9,'2020-12-11',6),
(4,10,'2021-04-08',4),
(10,10,'2021-04-09',1),
(10,10,'2021-04-11',2),
(1,11,'2021-08-14',4),
(2,12,'2020-04-21',3),
(9,12,'2020-04-22',1),
(3,13,'2021-06-23',9),
(4,15,'2021-09-05',4),
(6,15,'2021-09-09',1),
(1,16,'2020-09-08',3),
(4,17,'2021-02-07',8),
(9,17,'2021-02-11',2),
(2,18,'2020-03-21',6),
(4,20,'2020-07-20',9),
(8,20,'2020-07-22',2),
(9,20,'2020-07-23',1),
(6,20,'2020-07-28',2),
(7,20,'2020-07-25',1);