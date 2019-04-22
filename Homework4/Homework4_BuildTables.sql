

CREATE TABLE BROKER (
  broker_id VARCHAR(25),
  broker_name VARCHAR(50),
  broker_license_date date,
constraint broker_pk primary key (broker_id)
  );
  
CREATE TABLE CUSTOMERS (
  customer_id VARCHAR(11),
  customer_name VARCHAR(50),
  customer_phone varchar(20),
  customer_type VARCHAR(15),
  broker_id VARCHAR(25),
constraint customers_pk primary key (customer_id),
constraint customers_fk foreign key (broker_id) REFERENCES BROKER (broker_id)
  );

CREATE TABLE LOAD (
  load_id int,
  pickup_date date,
  deliver_date date,
  pickup_city varchar(30),
  deliver_city varchar(30),
  pickup_state varchar(2),
  deliver_state varchar(2),
  number_of_pallets decimal(9, 2),
  pallet_weight decimal (6, 2),
  load_type  varchar(20),
  load_status varchar(15),
  load_price decimal(6, 2),
  customer_id VARCHAR(11),
  broker_id VARCHAR(25),
constraint load_pk primary key (load_id),
CONSTRAINT load_fk1 foreign key (customer_id) REFERENCES CUSTOMERS (customer_id),
CONSTRAINT load_fk2 foreign key (broker_id) REFERENCES BROKER (broker_id)
);

CREATE TABLE CARRIER (
  carrier_id   int, 
  carrier_name VARCHAR(40),
  carrier_phone varchar(20),
  carrier_license_date date,
  constraint carrier_pk primary key (carrier_id));
  
CREATE TABLE DRIVER(
  driver_id  int,
  driver_name varchar(40),
  hire_date DATE,
  DOB DATE,
  carrier_id  int,
constraint driver_pk primary key (driver_id),
constraint driver_fk foreign key (carrier_id) references CARRIER(carrier_id)
  );

 
CREATE TABLE ITINERARY (
  itinerary_id int,
  load_id int,
  carrier_id   int,
  price_per_pallet decimal(6, 2),
  price_per_pound decimal(6,2),
constraint itinerary_pk primary key (itinerary_id, load_id),
constraint itinerary_fk1 foreign key (load_id) references LOAD(load_id),
constraint itinerary_fk2 foreign key (carrier_id) references CARRIER(carrier_id)
);


insert into BROKER values('BR_473922A', 'Vilagreen', '10-DEC-2010');
insert into BROKER values('BR_4780303B', 'Techiflex', '05-SEP-2011');
insert into BROKER values('BR_3784883A', 'Trustcone', '01-JAN-1990');
insert into BROKER values('BR_3800188A', 'Ozerdom', '12-OCT-1995');
insert into BROKER values('BR_4977393C', 'Zimlane', '10-JAN-2006');
insert into BROKER values('BR_3425325124A', 'Voltfax', '20-MAR-2001');
insert into BROKER values('BR_9288100A', 'Lamdax', '25-APR-2010');
insert into BROKER values('BR19930300A', 'Codetechi', '17-MAY-2013');


insert into CUSTOMERS values('757033', 'Sankeycon', '2377203052', 'retail', 'BR_4977393C');
insert into CUSTOMERS values('2768198', 'Temptaxon', '6071164496', 'import', 'BR_3800188A');
insert into CUSTOMERS values('2644134', 'Kontrans', '3234596254', 'food', 'BR_4977393C');
insert into CUSTOMERS values('949876', 'Danhow', '2075682186', 'retail', 'BR_473922A');
insert into CUSTOMERS values('199287', 'Latechno', '8110891738', 'retail', 'BR_3425325124A');
insert into CUSTOMERS values('986228', 'Tranphase', '4875362268', 'import', 'BR_4977393C');
insert into CUSTOMERS values('692808', 'Contraxkix', '1695768506', 'import', 'BR_3784883A');
insert into CUSTOMERS values('1088679', 'Wareelectrics', '7582705142', 'import', 'BR_3800188A');
insert into CUSTOMERS values('835200', 'Kondox', '9550351555', 'food', 'BR_473922A');
insert into CUSTOMERS values('978736', 'Trusthex', '3726342313', 'food', 'BR_3800188A');
insert into CUSTOMERS values('2359489', 'Zundindom', '5983065303', 'retail', 'BR19930300A');
insert into CUSTOMERS values('1693166', 'Biocare', '8815095103', 'import', 'BR_4780303B');
insert into CUSTOMERS values('2691262', 'Ac Corp.', '5039548276', 'food', 'BR_9288100A');
insert into CUSTOMERS values('878658', 'Luctus Aliquet Corporation', '9299194027', 'retail', 'BR_3784883A');
insert into CUSTOMERS values('1995003', 'Sodales At Velit PC', '5388837665', 'retail', 'BR_9288100A');
insert into CUSTOMERS values('130435', 'In Nec Orci Company', '7643492334', 'import', 'BR_473922A');
insert into CUSTOMERS values('582773', 'Suscipit Est Ac Consulting', '9222329735', 'import', 'BR_4977393C');
insert into CUSTOMERS values('792182', 'Interdum Enim Non PC', '4828525113', 'import', 'BR_473922A');
insert into CUSTOMERS values('2303383', 'Suspendisse Aliquet Sem LLP', '1997011571', 'food', 'BR_4780303B');
insert into CUSTOMERS values('979612', 'Aenean Industries', '7140944883', 'food', 'BR_3425325124A');
insert into CUSTOMERS values('2689092', 'Fermentum Risus Industries', '9662829278', 'retail', 'BR_473922A');
insert into CUSTOMERS values('376304', 'Arcu LLP', '2621386709', 'import', 'BR_3425325124A');
insert into CUSTOMERS values('2337580', 'Dui Company', '5115200143', 'food', 'BR_9288100A');
insert into CUSTOMERS values('319681', 'Lacinia Mattis Associates', '9345828997', 'retail', 'BR_9288100A');
insert into CUSTOMERS values('3277632', 'Accumsan Neque Corp.', '6100634184', 'retail', 'BR19930300A');
insert into CUSTOMERS values('374715', 'Vulputate PC', '2660078673', 'import', 'BR19930300A');
insert into CUSTOMERS values('140293', 'Urna LLC', '3748788837', 'import', 'BR_3800188A');
insert into CUSTOMERS values('1602592', 'Gravida Sagittis Duis Incorporated', '8825276875', 'import', 'BR_3784883A');
insert into CUSTOMERS values('2899648', 'Zimcane', '1408860200', 'food', 'BR_3800188A');
insert into CUSTOMERS values('2310259', 'Dentotech', '7110674749', 'food', 'BR_9288100A');
insert into CUSTOMERS values('2017014', 'Jobdexon', '8785591943', 'retail', 'BR_3784883A');
insert into CUSTOMERS values('175492', 'Biotripcom', '8449910965', 'retail', 'BR19930300A');

insert into LOAD values('24175', '23-APR-2015', '10-MAY-2015', 'Omaha', 'Henderson', 'LA', 'VA', '6', '853', 'refrigerated', 'ready', '5099', '376304', 'BR_3425325124A');
insert into LOAD values('20719', '10-MAY-2015', '16-MAY-2015', 'Albuquerque', 'Austin', 'WV', 'CA', '25', '912', 'dry', 'ready', '1629', '140293', 'BR_3800188A');
insert into LOAD values('32544', '25-APR-2015', '6-MAY-2015', 'Huntington', 'Chesapeake', 'CA', 'CO', '17', '763', 'refrigerated', 'ready', '3296', '1602592', 'BR_3784883A');
insert into LOAD values('97913', '22-APR-2015', '6-MAY-2015', 'Baltimore', 'Boise', 'MN', 'VA', '10', '184', 'dry', 'ready', '3462', '878658', 'BR_3784883A');
insert into LOAD values('89351', '2-MAY-2015', '19-MAY-2015', 'Rochester', 'Huntington', 'MS', 'CA', '22', '143', 'refrigerated', 'ready', '5311', '949876', 'BR_473922A');
insert into LOAD values('75227', '25-APR-2015', '3-MAY-2015', 'Birmingham', 'Houston', 'LA', 'IN', '17', '708', 'refrigerated', 'ready', '5329', '1693166', 'BR_4780303B');
insert into LOAD values('76783', '11-MAY-2015', '14-MAY-2015', 'Boise', 'Pittsburgh', 'VA', 'CO', '8', '1084', 'dry', 'ready', '2161', '199287', 'BR_3425325124A');
insert into LOAD values('61642', '5-MAY-2015', '16-MAY-2015', 'Albuquerque', 'Jersey City', 'WV', 'CA', '7', '171', 'refrigerated', 'ready', '4502', '140293', 'BR_3800188A');
insert into LOAD values('64143', '14-MAY-2015', '20-MAY-2015', 'Baltimore', 'Jersey City', 'MN', 'CA', '14', '200', 'dry', 'ready', '2222', '1602592', 'BR_3784883A');
insert into LOAD values('77726', '8-MAY-2015', '25-MAY-2015', 'Huntington', 'Huntington', 'CA', 'CA', '6', '671', 'dry', 'ready', '4184', '199287', 'BR_3425325124A');
insert into LOAD values('82193', '17-MAY-2015', '21-MAY-2015', 'Newquay', 'Omaha', 'CO', 'LA', '7', '174', 'refrigerated', 'ready', '2077', '1995003', 'BR_9288100A');
insert into LOAD values('85914', '17-MAY-2015', '19-MAY-2015', 'Baltimore', 'Albuquerque', 'MN', 'WV', '24', '1146', 'refrigerated', 'ready', '3312', '2017014', 'BR_3784883A');
insert into LOAD values('8456', '13-MAY-2015', '16-MAY-2015', 'Albuquerque', 'Birmingham', 'WV', 'LA', '4', '473', 'dry', 'ready', '3634', '2337580', 'BR_9288100A');
insert into LOAD values('69519', '11-MAY-2015', '30-MAY-2015', 'Chesapeake', 'Omaha', 'CO', 'LA', '17', '887', 'dry', 'ready', '4434', '1088679', 'BR_3800188A');
insert into LOAD values('15158', '19-MAY-2015', '25-MAY-2015', 'Boston', 'Port Harcourt', 'IL', 'RI', '14', '1144', 'refrigerated', 'ready', '1887', '2644134', 'BR_4977393C');
insert into LOAD values('41386', '28-APR-2015', '22-MAY-2015', 'Fort Collins', 'Port Harcourt', 'CO', 'RI', '3', '444', 'refrigerated', 'ready', '4845', '2768198', 'BR_3800188A');
insert into LOAD values('34203', '25-APR-2015', '27-MAY-2015', 'Austin', 'Detroit', 'CA', 'MI', '4', '1126', 'dry', 'ready', '3499', '1602592', 'BR_3784883A');
insert into LOAD values('73170', '3-MAY-2015', '25-MAY-2015', 'Boise', 'Huntington', 'VA', 'CA', '13', '1264', 'refrigerated', 'ready', '4448', '140293', 'BR_3800188A');
insert into LOAD values('36121', '16-MAY-2015', '23-MAY-2015', 'Austin', 'Jersey City', 'CA', 'CA', '20', '361', 'dry', 'ready', '2427', '130435', 'BR_473922A');
insert into LOAD values('74373', '5-MAY-2015', '16-MAY-2015', 'Henderson', 'Pittsburgh', 'VA', 'CO', '10', '1377', 'dry', 'ready', '1347', '1693166', 'BR_4780303B');
insert into LOAD values('89906', '10-MAY-2015', '17-MAY-2015', 'Fort Collins', 'Jersey City', 'CO', 'CA', '10', '908', 'refrigerated', 'ready', '4179', '2899648', 'BR_3800188A');
insert into LOAD values('72967', '11-MAY-2015', '25-MAY-2015', 'Omaha', 'Modesto', 'LA', 'KS', '21', '1360', 'dry', 'ready', '3686', '582773', 'BR_4977393C');
insert into LOAD values('81199', '17-MAY-2015', '30-MAY-2015', 'Newquay', 'Boise', 'CO', 'VA', '16', '120', 'dry', 'ready', '4378', '376304', 'BR_3425325124A');
insert into LOAD values('55564', '5-MAY-2015', '30-MAY-2015', 'Huntington', 'Rochester', 'CA', 'MS', '15', '294', 'refrigerated', 'ready', '4253', '692808', 'BR_3784883A');
insert into LOAD values('48208', '17-MAY-2015', '27-MAY-2015', 'Rochester', 'Jersey City', 'MS', 'CA', '8', '1417', 'dry', 'ready', '1925', '199287', 'BR_3425325124A');
insert into LOAD values('14046', '19-MAY-2015', '20-MAY-2015', 'Warren', 'Boise', 'MI', 'VA', '5', '1452', 'dry', 'ready', '2537', '2899648', 'BR_3800188A');
insert into LOAD values('52500', '2-MAY-2015', '28-MAY-2015', 'Huntington', 'Albuquerque', 'CA', 'WV', '22', '1322', 'dry', 'ready', '2460', '2644134', 'BR_4977393C');
insert into LOAD values('90267', '10-MAY-2015', '14-MAY-2015', 'Henderson', 'Fort Collins', 'VA', 'CO', '3', '134', 'refrigerated', 'ready', '2993', '374715', 'BR19930300A');
insert into LOAD values('76807', '23-APR-2015', '14-MAY-2015', 'Chicago', 'Pittsburgh', 'IL', 'CO', '21', '849', 'refrigerated', 'ready', '5271', '2689092', 'BR_473922A');
insert into LOAD values('43446', '13-MAY-2015', '13-MAY-2015', 'Fort Collins', 'Fort Collins', 'CO', 'CO', '23', '956', 'refrigerated', 'ready', '4584', '199287', 'BR_3425325124A');
insert into LOAD values('5467', '19-MAY-2015', '26-MAY-2015', 'Port Harcourt', 'Newquay', 'RI', 'CO', '20', '698', 'dry', 'ready', '2684', '878658', 'BR_3784883A');
insert into LOAD values('56740', '19-MAY-2015', '29-MAY-2015', 'Chesapeake', 'Boston', 'CO', 'IL', '8', '1500', 'refrigerated', 'ready', '4069', '692808', 'BR_3784883A');
insert into LOAD values('83420', '2-MAY-2015', '8-MAY-2015', 'Baltimore', 'Port Harcourt', 'MN', 'RI', '24', '1431', 'refrigerated', 'ready', '2094', '582773', 'BR_4977393C');
insert into LOAD values('37195', '28-APR-2015', '14-MAY-2015', 'Austin', 'Albuquerque', 'CA', 'WV', '11', '750', 'dry', 'ready', '2267', '2310259', 'BR_9288100A');
insert into LOAD values('36412', '30-APR-2015', '20-MAY-2015', 'Chicago', 'Henderson', 'IL', 'VA', '21', '218', 'dry', 'ready', '1455', '319681', 'BR_9288100A');
insert into LOAD values('60616', '18-MAY-2015', '25-MAY-2015', 'Fort Collins', 'Baltimore', 'CO', 'MN', '5', '1472', 'dry', 'ready', '3997', '3277632', 'BR19930300A');
insert into LOAD values('50799', '26-APR-2015', '25-MAY-2015', 'Baltimore', 'Omaha', 'MN', 'LA', '17', '520', 'refrigerated', 'ready', '5040', '130435', 'BR_473922A');
insert into LOAD values('34194', '24-APR-2015', '24-MAY-2015', 'Chesapeake', 'Baltimore', 'CO', 'MN', '20', '1439', 'dry', 'ready', '2526', '978736', 'BR_3800188A');
insert into LOAD values('77234', '2-MAY-2015', '23-MAY-2015', 'Jersey City', 'Huntington', 'CA', 'CA', '13', '971', 'dry', 'ready', '1712', '1693166', 'BR_4780303B');
insert into LOAD values('7043', '7-MAY-2015', '7-MAY-2015', 'Port Harcourt', 'Baltimore', 'RI', 'MN', '4', '1396', 'dry', 'ready', '2685', '792182', 'BR_473922A');
insert into LOAD values('43491', '16-MAY-2015', '21-MAY-2015', 'Warren', 'Birmingham', 'MI', 'LA', '13', '794', 'refrigerated', 'ready', '5080', '319681', 'BR_9288100A');
insert into LOAD values('93286', '6-MAY-2015', '25-MAY-2015', 'Fort Collins', 'Detroit', 'CO', 'MI', '17', '440', 'dry', 'ready', '3521', '140293', 'BR_3800188A');
insert into LOAD values('18383', '8-MAY-2015', '21-MAY-2015', 'Albuquerque', 'Detroit', 'WV', 'MI', '18', '1145', 'dry', 'ready', '2779', '986228', 'BR_4977393C');
insert into LOAD values('24888', '28-APR-2015', '1-MAY-2015', 'Pittsburgh', 'Port Harcourt', 'CO', 'RI', '3', '221', 'dry', 'ready', '4671', '140293', 'BR_3800188A');
insert into LOAD values('31917', '10-MAY-2015', '22-MAY-2015', 'Pittsburgh', 'Chesapeake', 'CO', 'CO', '12', '616', 'dry', 'ready', '1895', '1088679', 'BR_3800188A');
insert into LOAD values('74256', '8-MAY-2015', '23-MAY-2015', 'Detroit', 'Chicago', 'MI', 'IL', '6', '822', 'refrigerated', 'ready', '4171', '2689092', 'BR_473922A');
insert into LOAD values('17939', '13-MAY-2015', '18-MAY-2015', 'Albuquerque', 'Omaha', 'WV', 'LA', '6', '1147', 'refrigerated', 'ready', '4655', '1602592', 'BR_3784883A');
insert into LOAD values('57911', '3-MAY-2015', '23-MAY-2015', 'Rochester', 'Jersey City', 'MS', 'CA', '11', '694', 'dry', 'ready', '2114', '1693166', 'BR_4780303B');
insert into LOAD values('28248', '7-MAY-2015', '18-MAY-2015', 'Boise', 'Chesapeake', 'VA', 'CO', '14', '359', 'refrigerated', 'ready', '1265', '1693166', 'BR_4780303B');
insert into LOAD values('52316', '27-APR-2015', '24-MAY-2015', 'Omaha', 'Albuquerque', 'LA', 'WV', '13', '695', 'dry', 'ready', '1616', '1995003', 'BR_9288100A');
insert into LOAD values('20673', '19-MAY-2015', '25-MAY-2015', 'Chicago', 'Chicago', 'IL', 'IL', '13', '556', 'dry', 'ready', '5422', '175492', 'BR19930300A');
insert into LOAD values('18201', '8-MAY-2015', '10-MAY-2015', 'Birmingham', 'Warren', 'LA', 'MI', '10', '1113', 'dry', 'ready', '3765', '692808', 'BR_3784883A');
insert into LOAD values('5573', '27-APR-2015', '2-MAY-2015', 'Henderson', 'Rochester', 'VA', 'MS', '10', '610', 'refrigerated', 'ready', '4826', '949876', 'BR_473922A');
insert into LOAD values('29919', '9-MAY-2015', '24-MAY-2015', 'Birmingham', 'Jersey City', 'LA', 'CA', '24', '1166', 'dry', 'ready', '2852', '199287', 'BR_3425325124A');
insert into LOAD values('31732', '26-APR-2015', '22-MAY-2015', 'Birmingham', 'Boise', 'LA', 'VA', '19', '590', 'dry', 'ready', '3570', '757033', 'BR_4977393C');
insert into LOAD values('87298', '28-APR-2015', '30-MAY-2015', 'Chesapeake', 'Chicago', 'CO', 'IL', '12', '885', 'dry', 'ready', '5459', '1693166', 'BR_4780303B');
insert into LOAD values('12765', '1-MAY-2015', '8-MAY-2015', 'Chesapeake', 'Huntington', 'CO', 'CA', '5', '541', 'refrigerated', 'ready', '3943', '582773', 'BR_4977393C');
insert into LOAD values('7025', '7-MAY-2015', '15-MAY-2015', 'Baltimore', 'Henderson', 'MN', 'VA', '13', '831', 'dry', 'ready', '3596', '2691262', 'BR_9288100A');
insert into LOAD values('47278', '25-APR-2015', '4-MAY-2015', 'Omaha', 'Boston', 'LA', 'IL', '16', '446', 'dry', 'ready', '2839', '2310259', 'BR_9288100A');
insert into LOAD values('11963', '4-MAY-2015', '14-MAY-2015', 'Jersey City', 'Albuquerque', 'CA', 'WV', '16', '235', 'dry', 'ready', '4244', '1693166', 'BR_4780303B');
insert into LOAD values('56468', '28-APR-2015', '22-MAY-2015', 'Huntington', 'Chesapeake', 'CA', 'CO', '14', '1399', 'dry', 'ready', '1587', '835200', 'BR_473922A');
insert into LOAD values('64087', '14-MAY-2015', '23-MAY-2015', 'Modesto', 'Port Harcourt', 'KS', 'RI', '17', '230', 'dry', 'ready', '4064', '140293', 'BR_3800188A');
insert into LOAD values('34549', '11-MAY-2015', '22-MAY-2015', 'Pittsburgh', 'Fort Collins', 'CO', 'CO', '21', '337', 'dry', 'ready', '5411', '792182', 'BR_473922A');
insert into LOAD values('2693', '24-APR-2015', '31-MAY-2015', 'Albuquerque', 'Boise', 'WV', 'VA', '3', '1358', 'dry', 'ready', '2367', '2689092', 'BR_473922A');
insert into LOAD values('18191', '7-MAY-2015', '23-MAY-2015', 'Chesapeake', 'Detroit', 'CO', 'MI', '17', '1355', 'dry', 'ready', '2508', '757033', 'BR_4977393C');
insert into LOAD values('50242', '1-MAY-2015', '25-MAY-2015', 'Pittsburgh', 'Detroit', 'CO', 'MI', '3', '758', 'refrigerated', 'ready', '3282', '692808', 'BR_3784883A');
insert into LOAD values('84062', '4-MAY-2015', '22-MAY-2015', 'Modesto', 'Newquay', 'KS', 'CO', '10', '882', 'dry', 'ready', '1858', '986228', 'BR_4977393C');
insert into LOAD values('33954', '17-MAY-2015', '19-MAY-2015', 'Fort Collins', 'Chicago', 'CO', 'IL', '7', '471', 'dry', 'ready', '2563', '1693166', 'BR_4780303B');
insert into LOAD values('75517', '17-MAY-2015', '22-MAY-2015', 'Henderson', 'Birmingham', 'VA', 'LA', '11', '487', 'refrigerated', 'ready', '4148', '2310259', 'BR_9288100A');
insert into LOAD values('81495', '29-APR-2015', '14-MAY-2015', 'Fort Collins', 'Birmingham', 'CO', 'LA', '3', '1376', 'refrigerated', 'ready', '1319', '2359489', 'BR19930300A');
insert into LOAD values('94357', '7-MAY-2015', '23-MAY-2015', 'Boston', 'Rochester', 'IL', 'MS', '12', '156', 'refrigerated', 'ready', '4750', '2644134', 'BR_4977393C');
insert into LOAD values('74525', '24-APR-2015', '14-MAY-2015', 'Boston', 'Baltimore', 'IL', 'MN', '3', '130', 'dry', 'ready', '2296', '1995003', 'BR_9288100A');
insert into LOAD values('18540', '1-MAY-2015', '21-MAY-2015', 'Boston', 'Rochester', 'IL', 'MS', '10', '827', 'dry', 'ready', '3739', '986228', 'BR_4977393C');
insert into LOAD values('4138', '26-APR-2015', '16-MAY-2015', 'Boston', 'Austin', 'IL', 'CA', '8', '520', 'dry', 'ready', '2805', '319681', 'BR_9288100A');
insert into LOAD values('82099', '23-APR-2015', '19-MAY-2015', 'Jersey City', 'Huntington', 'CA', 'CA', '11', '107', 'refrigerated', 'ready', '2375', '979612', 'BR_3425325124A');
insert into LOAD values('52187', '23-APR-2015', '12-MAY-2015', 'Port Harcourt', 'Chicago', 'RI', 'IL', '16', '124', 'dry', 'ready', '4228', '376304', 'BR_3425325124A');
insert into LOAD values('23862', '16-MAY-2015', '30-MAY-2015', 'Newquay', 'Huntington', 'CO', 'CA', '7', '1494', 'refrigerated', 'ready', '3889', '2017014', 'BR_3784883A');
insert into LOAD values('81210', '12-MAY-2015', '20-MAY-2015', 'Birmingham', 'Chicago', 'LA', 'IL', '6', '525', 'dry', 'ready', '4627', '2310259', 'BR_9288100A');
insert into LOAD values('5197', '14-MAY-2015', '18-MAY-2015', 'Newquay', 'Jersey City', 'CO', 'CA', '17', '882', 'refrigerated', 'ready', '2275', '3277632', 'BR19930300A');
insert into LOAD values('48363', '14-MAY-2015', '25-MAY-2015', 'Boston', 'Jersey City', 'IL', 'CA', '18', '345', 'refrigerated', 'ready', '2889', '2644134', 'BR_4977393C');
insert into LOAD values('29848', '8-MAY-2015', '28-MAY-2015', 'Henderson', 'Warren', 'VA', 'MI', '22', '932', 'refrigerated', 'ready', '3055', '2017014', 'BR_3784883A');
insert into LOAD values('74882', '13-MAY-2015', '26-MAY-2015', 'Albuquerque', 'Houston', 'WV', 'IN', '8', '522', 'refrigerated', 'ready', '3099', '2691262', 'BR_9288100A');
insert into LOAD values('55390', '29-APR-2015', '31-MAY-2015', 'Chesapeake', 'Boise', 'CO', 'VA', '23', '1307', 'dry', 'ready', '1432', '130435', 'BR_473922A');
insert into LOAD values('54362', '18-MAY-2015', '31-MAY-2015', 'Newquay', 'Baltimore', 'CO', 'MN', '4', '546', 'dry', 'ready', '4684', '130435', 'BR_473922A');
insert into LOAD values('26957', '9-MAY-2015', '21-MAY-2015', 'Omaha', 'Chicago', 'LA', 'IL', '12', '1375', 'dry', 'ready', '3444', '2017014', 'BR_3784883A');
insert into LOAD values('17293', '7-MAY-2015', '12-MAY-2015', 'Omaha', 'Port Harcourt', 'LA', 'RI', '19', '377', 'refrigerated', 'ready', '1428', '175492', 'BR19930300A');
insert into LOAD values('61655', '11-MAY-2015', '28-MAY-2015', 'Rochester', 'Detroit', 'MS', 'MI', '15', '816', 'dry', 'ready', '1588', '199287', 'BR_3425325124A');
insert into LOAD values('60038', '26-APR-2015', '20-MAY-2015', 'Huntington', 'Baltimore', 'CA', 'MN', '19', '588', 'refrigerated', 'ready', '4152', '3277632', 'BR19930300A');
insert into LOAD values('81754', '5-MAY-2015', '13-MAY-2015', 'Omaha', 'Chicago', 'LA', 'IL', '14', '835', 'refrigerated', 'ready', '4790', '140293', 'BR_3800188A');
insert into LOAD values('99393', '15-MAY-2015', '25-MAY-2015', 'Baltimore', 'Warren', 'MN', 'MI', '17', '1037', 'dry', 'ready', '2745', '319681', 'BR_9288100A');
insert into LOAD values('93046', '1-MAY-2015', '12-MAY-2015', 'Jersey City', 'Modesto', 'CA', 'KS', '19', '650', 'refrigerated', 'ready', '5194', '2689092', 'BR_473922A');
insert into LOAD values('93733', '25-APR-2015', '13-MAY-2015', 'Modesto', 'Boise', 'KS', 'VA', '12', '1424', 'dry', 'ready', '3501', '130435', 'BR_473922A');
insert into LOAD values('55850', '18-MAY-2015', '27-MAY-2015', 'Pittsburgh', 'Warren', 'CO', 'MI', '9', '129', 'refrigerated', 'ready', '2786', '2303383', 'BR_4780303B');
insert into LOAD values('72642', '13-MAY-2015', '26-MAY-2015', 'Boise', 'Jersey City', 'VA', 'CA', '18', '1469', 'refrigerated', 'ready', '3612', '2644134', 'BR_4977393C');
insert into LOAD values('10065', '8-MAY-2015', '28-MAY-2015', 'Chesapeake', 'Fort Collins', 'CO', 'CO', '11', '1468', 'dry', 'ready', '3499', '2310259', 'BR_9288100A');
insert into LOAD values('87920', '22-APR-2015', '16-MAY-2015', 'Jersey City', 'Jersey City', 'CA', 'CA', '3', '164', 'refrigerated', 'ready', '3430', '2337580', 'BR_9288100A');
insert into LOAD values('46249', '26-APR-2015', '14-MAY-2015', 'Jersey City', 'Boise', 'CA', 'VA', '21', '156', 'refrigerated', 'ready', '1566', '374715', 'BR19930300A');
insert into LOAD values('24562', '26-APR-2015', '15-MAY-2015', 'Houston', 'Boise', 'IN', 'VA', '24', '1041', 'dry', 'ready', '3525', '140293', 'BR_3800188A');
insert into LOAD values('51749', '29-APR-2015', '11-MAY-2015', 'Pittsburgh', 'Jersey City', 'CO', 'CA', '15', '182', 'refrigerated', 'ready', '3415', '757033', 'BR_4977393C');
insert into LOAD values('82400', '26-APR-2015', '27-MAY-2015', 'Warren', 'Detroit', 'MI', 'MI', '4', '1161', 'refrigerated', 'ready', '2625', '582773', 'BR_4977393C');


insert into CARRIER values('10010984', 'Suspendisse Dui Consulting', '8451652929', '10-OCT-2010');
insert into CARRIER values('1090604', 'Dictum Inc.', '2523035945', '05-NOV-2011');
insert into CARRIER values('8797064', 'Ut Foundation', '7710254562', '01-JAN-1990');
insert into CARRIER values('5901441', 'Lobortis Institute', '7089557198', '12-JUN-1995');
insert into CARRIER values('4158279', 'Aenean Eget LLP', '6385426412', '10-DEC-2006');
insert into CARRIER values('8740041', 'Vel Nisl Quisque LLC', '7738813504', '20-MAY-2001');
insert into CARRIER values('668653', 'Enim Etiam Ltd', '6999881953', '25-AUG-2010');
insert into CARRIER values('672797', 'Tempor Ltd', '9227334795', '17-JAN-2013');


insert into DRIVER values('904', 'Ann	Porter', '10-OCT-2015', '01-MAR-1971', '668653');
insert into DRIVER values('901', 'Carl Hunter', '05-NOV-2013', '24-JUN-1974', '8740041');
insert into DRIVER values('343', 'Essie Weaver', '01-JAN-1998', '10-DEC-1976', '5901441');
insert into DRIVER values('302', 'Glenda Fernandez', '12-JUN-1995', '20-MAY-1990', '672797');
insert into DRIVER values('616', 'Carolyn Hicks', '10-DEC-2006', '25-SEP-1970', '10010984');
insert into DRIVER values('909', 'Forrest Price', '20-MAY-2011', '01-JAN-1992', '5901441');
insert into DRIVER values('151', 'Meghan Roberts', '25-AUG-2015', '12-JUN-1982', '5901441');
insert into DRIVER values('217', 'Allen Arnold', '17-JAN-2013', '10-DEC-1982', '1090604');
insert into DRIVER values('877', 'Salvatore Crawford', '10-OCT-2010', '20-MAY-1985', '672797');
insert into DRIVER values('956', 'Kristine Townsend', '05-NOV-2011', '25-AUG-1960', '672797');
insert into DRIVER values('603', 'Aretha Howard', '01-JAN-1994', '01-JAN-1980', '4158279');
insert into DRIVER values('525', 'Rachel Lewis', '12-JUN-1995', '12-JUN-1963', '668653');
insert into DRIVER values('833', 'Benjamin Cook', '10-DEC-2006', '10-DEC-1982', '1090604');
insert into DRIVER values('497', 'Domingo Roberson', '20-MAY-2001', '20-MAY-1998', '8740041');
insert into DRIVER values('491', 'Monica Rios', '25-AUG-2014', '25-MAY-1976', '1090604');

insert into ITINERARY values('1206187', '55564', '668653', '962.66', '31.29');
insert into ITINERARY values('1206187', '51749', '668653', '904.01', '71.25');
insert into ITINERARY values('1354739', '64087', '8740041', '762.18', '10.75');
insert into ITINERARY values('1354739', '5197', '8740041', '773.8', '4.49');
insert into ITINERARY values('1493752', '76783', '5901441', '847.61', '14.07');
insert into ITINERARY values('1568651', '74525', '672797', '231.74', '51.7');
insert into ITINERARY values('1918989', '48363', '8797064', '742.69', '12.7');
insert into ITINERARY values('2092889', '34549', '668653', '894.16', '41.66');
insert into ITINERARY values('2092889', '52316', '668653', '246.33', '42.28');
insert into ITINERARY values('2092889', '89906', '668653', '326.15', '94.5');
insert into ITINERARY values('2269850', '51749', '8740041', '59.95', '11.98');
insert into ITINERARY values('2294495', '17939', '8797064', '913.95', '52.69');
insert into ITINERARY values('2512551', '17293', '5901441', '237.27', '57.81');
insert into ITINERARY values('2512551', '61655', '5901441', '202.43', '43.18');
insert into ITINERARY values('2512551', '34194', '5901441', '306.53', '54.41');
insert into ITINERARY values('2543797', '46249', '668653', '206.48', '26.01');
insert into ITINERARY values('2543797', '28248', '668653', '323.61', '63.49');
insert into ITINERARY values('2628542', '18191', '4158279', '141.61', '29.04');
insert into ITINERARY values('2628542', '82193', '4158279', '646.38', '57.35');
insert into ITINERARY values('3137345', '20673', '4158279', '276.25', '21.45');
insert into ITINERARY values('3921009', '43446', '8740041', '139.79', '19.87');
insert into ITINERARY values('3921009', '81754', '8740041', '553.85', '28.14');
insert into ITINERARY values('4055786', '61655', '8797064', '57.17', '23.07');
insert into ITINERARY values('4243022', '85914', '668653', '634.19', '92.15');
insert into ITINERARY values('4269867', '74882', '10010984', '904.42', '34.16');
insert into ITINERARY values('4269867', '74373', '10010984', '965.57', '25.41');
insert into ITINERARY values('4548799', '29919', '4158279', '311.4', '71.56');
insert into ITINERARY values('4548799', '34549', '4158279', '771.86', '30.85');
insert into ITINERARY values('4798396', '33954', '1090604', '512.53', '43.38');
insert into ITINERARY values('4798396', '15158', '1090604', '425.34', '35.03');
insert into ITINERARY values('5127976', '52316', '668653', '702.75', '63.91');
insert into ITINERARY values('5138217', '7043', '5901441', '337.21', '17.94');
insert into ITINERARY values('5138217', '5467', '5901441', '374.25', '23.66');
insert into ITINERARY values('5150666', '20719', '4158279', '251.51', '33.16');
insert into ITINERARY values('5150666', '61642', '4158279', '583.23', '26.89');
insert into ITINERARY values('5150666', '43446', '4158279', '756.3', '85.64');
insert into ITINERARY values('5150666', '56468', '4158279', '626.32', '34.17');
insert into ITINERARY values('5150666', '56740', '4158279', '115.87', '28.68');
insert into ITINERARY values('5150666', '73170', '4158279', '554.99', '26.5');
insert into ITINERARY values('5562324', '2693', '1090604', '978.75', '53.04');
insert into ITINERARY values('5562324', '28248', '1090604', '343.8', '93.05');
insert into ITINERARY values('5670985', '5197', '1090604', '884.68', '22.89');
insert into ITINERARY values('5768456', '72642', '8797064', '938.96', '30.72');
insert into ITINERARY values('5768456', '34549', '8797064', '115.52', '13.41');
insert into ITINERARY values('5768456', '8456', '8797064', '452.04', '72.62');
insert into ITINERARY values('5768456', '97913', '8797064', '985.13', '11.38');
insert into ITINERARY values('5771219', '82193', '672797', '349.09', '14.74');
insert into ITINERARY values('5882795', '2693', '8797064', '505.69', '27.66');
insert into ITINERARY values('5882795', '72967', '8797064', '762.26', '35.63');
insert into ITINERARY values('6025262', '54362', '4158279', '252.76', '54.11');
insert into ITINERARY values('6025262', '57911', '4158279', '819.44', '43.96');
insert into ITINERARY values('6025262', '87298', '4158279', '333.28', '28.01');
insert into ITINERARY values('6025262', '31917', '4158279', '338.11', '36.35');
insert into ITINERARY values('6259683', '18540', '672797', '700.76', '71.88');
insert into ITINERARY values('6259683', '34194', '672797', '194.79', '72.86');
insert into ITINERARY values('6259683', '56468', '672797', '603.03', '35');
insert into ITINERARY values('6259683', '12765', '672797', '795.16', '47.74');
insert into ITINERARY values('6314490', '18191', '8740041', '700.47', '25.12');
insert into ITINERARY values('6367728', '89906', '1090604', '679.21', '54.99');
insert into ITINERARY values('6367728', '97913', '1090604', '237.89', '72.01');
insert into ITINERARY values('6504089', '29848', '10010984', '763.8', '13.08');
insert into ITINERARY values('6573491', '23862', '10010984', '389.65', '26.63');
insert into ITINERARY values('7364212', '81754', '10010984', '63.6', '10.23');
insert into ITINERARY values('7364212', '36412', '10010984', '426.32', '40.67');
insert into ITINERARY values('7364212', '69519', '10010984', '483.83', '25.22');
insert into ITINERARY values('7364212', '50799', '10010984', '33.42', '83.4');
insert into ITINERARY values('7364212', '15158', '10010984', '37.46', '26.47');
insert into ITINERARY values('7364212', '31917', '10010984', '272.19', '35.93');
insert into ITINERARY values('7387373', '84062', '5901441', '204.82', '46.82');
insert into ITINERARY values('7387373', '14046', '5901441', '700.14', '36.4');
insert into ITINERARY values('7387373', '29919', '5901441', '347.05', '28.36');
insert into ITINERARY values('7387373', '34203', '5901441', '832.71', '25.95');
insert into ITINERARY values('7462511', '17939', '8797064', '866.48', '43.81');
