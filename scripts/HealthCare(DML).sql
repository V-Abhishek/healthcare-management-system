USE healthcare;
------------------------INSERT DATA--------------------------------------
insert into Doctor values(101,'1266071613','Akshay',7407535102);
insert into Doctor values(102,'8083069438','Vishal',5775593029);
insert into Doctor values(103,'9017595693','Hua',1694362521);
insert into Doctor values(104,'9190841246','John',7630399848);
insert into Doctor values(105,'5083126610','Kate',2420072433);
insert into Doctor values(106,'7881793415','Donald',7478736086);
insert into Doctor values(107,'9364885804','Mathew',3851072550);
insert into Doctor values(108,'4931814876','Joe',2291855091);
insert into Doctor values(109,'6660443937','Elizabeth',8795129630);
insert into Doctor values(110,'9877557927','Arya',1443429264);

--select *  from Doctor;

insert into Patient values (1001, 8392206319, 109 ,'John','Male');
insert into Patient values (1002, 8473303738, 108 ,'Akash','Male');
insert into Patient values (1003, 7453409011, 109 ,'Irfan','Male');
insert into Patient values (1004, 5904533830, 110 ,'Monica','Female');
insert into Patient values (1005,8482778872 , 101 ,'Charlie','Male');
insert into Patient values (1006,5528263293 , 103 ,'Angelina','Female');
insert into Patient values (1007, 2482671444, 104 ,'Tony','Male');
insert into Patient values (1008, 1456958542, 107 ,'Vikram','Male');
insert into Patient values (1009, 5493466731, 110 ,'Rachel','Female');
insert into Patient values (1010, 7943069430, 101 ,'Selena','Female');
insert into Patient values (1011, 7825142258, 102 ,'Shuting','Female');
insert into Patient values (1012, 6546546525, 105 ,'Alan','Male');
insert into Patient values (1013, 3233698740, 106 ,'Zhao','Female');
insert into Patient values (1014, 4563636948, 102 ,'Siyu','Female');
insert into Patient values (1015, 4012894863, 104 ,'Nicolas','Male');
insert into Patient values (1016, 8521403658, 108 ,'Bruno','Male');
insert into Patient values (1017, 9865659235, 110 ,'Nikki','Female');

--select * from Patient;

insert into Paycheck values(101,101, 11934.43, 3188.33, '7/31/2020');
insert into Paycheck values(102,102, 7839.88, 4350.22, '8/31/2020');
insert into Paycheck values(103,110, 6180.097, 5497.75, '8/31/2020');
insert into Paycheck values(104,101, 8013.878, 3129.58, '6/30/2020');
insert into Paycheck values(105,103, 6443.145, 6164.45, '5/31/2020');
insert into Paycheck values(106,104, 7563.87, 5421.22, '7/31/2020');
insert into Paycheck values(107,105, 10216.875, 7544.225, '7/31/2020');
insert into Paycheck values(108,107, 7640.142, 5190.252, '6/30/2020');
insert into Paycheck values(109,109, 7736.25, 5753.002, '5/31/2020');
insert into Paycheck values(110,104, 8831.368, 6749.85, '9/30/2020');
insert into Paycheck values(111,106, 7495.05, 2643.035, '7/31/2020');
insert into Paycheck values(112,107, 7804.575, 3140.003, '5/31/2020');
insert into Paycheck values(113,108, 10421.271, 5305.0301, '06/30/2020');
insert into Paycheck values(114,110, 10114.757, 3457.552, '9/30/2020');
insert into Paycheck values(115,102, 7204.1, 4814.982, '9/30/2020');
insert into Paycheck values(116,104, 9142.002, 5572.45, '8/31/2020');
insert into Paycheck values(117,109, 9312.028, 3958.99, '7/31/2020');
insert into Paycheck values(118,101, 6244.0585, 3824.565, '8/31/2020');


--select * from Paycheck;

insert into Insurance values(100,'AARP',2024343525);
insert into Insurance values(101,'Aetna',8008723862);
insert into Insurance values(102,'Amerigroup',8006004441);
insert into Insurance values(103,'CareSource',8004880134);
insert into Insurance values(104,'Humana',8004574708);
insert into Insurance values(105,'Cigna',8009971654);
insert into Insurance values(106,'Health Net',8006756110);
insert into Insurance values(107,'Anthem',8003311476);
insert into Insurance values(108,'Centene Corporation',3147254477);
insert into Insurance values(109,'Kemper Corporation',8668609348);
insert into Insurance values(110,'EmblemHealth',8662740060);

--select * from Insurance;

insert into Diagnosis values (1, 'Nervous System',4000);
insert into Diagnosis values (2, 'Eye',2000);
insert into Diagnosis values (3, 'Respiratory System',5000);
insert into Diagnosis values (4, 'Digestive System',6000);
insert into Diagnosis values (5, 'Kidney and Urinary Tract',10000);
insert into Diagnosis values (6, 'Male Reproductive System',5000);
insert into Diagnosis values (7, 'Female Reproductive System',5500);
insert into Diagnosis values (8, 'Mental Diseases and Disorders',2150);
insert into Diagnosis values (9, 'Burns',2500);
insert into Diagnosis values (10, 'HIV Infection',15000);


--select * from Diagnosis;

insert into Medicine values(1,'Accuretic','Pfizer', 200,15.23);
insert into Medicine values(2,'Accupril','Pfizer', 500,20.443);
insert into Medicine values(3,'Benefix','Pfizer', 600,30.56);
insert into Medicine values(4,'Berodual','Boehringer Ingelheim', 200,12.67);
insert into Medicine values(5,'Aptivus','Boehringer Ingelheim', 500,58.33);
insert into Medicine values(6,'Microzide','Allergan', 200,74.098);
insert into Medicine values(7,'Namenda','Allergan', 100,95.905);
insert into Medicine values(8,'Skyrizi','Abbvie', 200,20.34);
insert into Medicine values(9,'Tricor','Abbvie', 500,15.45);
insert into Medicine values(10,'Galvus','Novartis', 600,23.43);


--select * from Medicine;

insert into Prescription values(1,1001, '7/22/2020');
insert into Prescription values(2,1002, '5/15/2020');
insert into Prescription values(3,1003, '6/2/2020');
insert into Prescription values(4,1004, '8/26/2020');
insert into Prescription values(5,1005, '9/9/2020');
insert into Prescription values(6,1006, '7/14/2020');
insert into Prescription values(7,1007, '11/4/2020');
insert into Prescription values(8,1008, '8/31/2020');
insert into Prescription values(9,1009, '10/10/2020');
insert into Prescription values(10,1010, '9/5/2020');
insert into Prescription values(11,1011, '7/22/2020');
insert into Prescription values(12,1012, '6/30/2020');
insert into Prescription values(13,1013, '8/21/2020');
insert into Prescription values(14,1014, '8/8/2020');
insert into Prescription values(15,1015, '9/9/2020');
insert into Prescription values(16,1016, '9/2/2020');
insert into Prescription values(17,1017, '10/22/2020');

--select * from Prescription;

insert into CPT values (1,'DAF',200);
insert into CPT values (2,'DAT',1000);
insert into CPT values (3,'DES',244);
insert into CPT values (4,'DEQ',500);
insert into CPT values (5,'DEQ',345);
insert into CPT values (6,'DES',455);
insert into CPT values (7,'DAT',1456.55);
insert into CPT values (8,'DDU',879.098);
insert into CPT values (9,'DDU',566.54);
insert into CPT values (10,'DAF',234.433);

--select * from CPT;


insert into Invoice values(101,1001,1,6,10255.87,'8/31/2020',1);
insert into Invoice values(102,1002,2,8,8547.369,'6/22/2020',2);
insert into Invoice values(103,1003,1,6,8633.21,'7/25/2020',3);
insert into Invoice values(104,1004,4,9,5600.55,'9/16/2020',4);
insert into Invoice values(105,1005,3,2,6007.223,'5/24/2020',5);
insert into Invoice values(106,1006,3,3,15005.635,'10/19/2020',6);
insert into Invoice values(107,1007,2,5,27586.782,'11/22/2020',7);
insert into Invoice values(108,1008,8,4,6790.23,'9/5/2020',8);
insert into Invoice values(109,1009,8,9,7008.65,'11/28/2020',9);
insert into Invoice values(110,1010,2,2,7852.33,'11/30/2020',10);
insert into Invoice values(111,1011,5,7,6952.55,'9/23/2020',11);
insert into Invoice values(112,1012,6,1,20545.36,'7/25/2020',12);
insert into Invoice values(113,1013,7,10,23584.96,'8/8/2020',13);
insert into Invoice values(114,1014,9,1,22563.225,'8/31/2020',14);
insert into Invoice values(115,1015,10,5,30054.57,'10/30/2020',15);
insert into Invoice values(116,1016,7,8,7258.45,'9/16/2020',16);
insert into Invoice values(117,1017,4,9,10458.66,'6/26/2020',17);

--select * from Invoice;

insert into Payment values(1001,101 ,'FAILED','Card','9/2/2020');
insert into Payment values(1002,102 ,'PENDING','Online Banking','6/25/2020');
insert into Payment values(1003,103 ,'PENDING','Card','7/25/2020');
insert into Payment values(1004,107 ,'SUCCESS','Cash','11/22/2020');
insert into Payment values(1005,108 ,'SUCCESS','Cash','7/15/2020');
insert into Payment values(1006,104 ,'SUCCESS','Card','9/17/2020');
insert into Payment values(1008,103 ,'FAILED','Card','7/26/2020');
insert into Payment values(1009,105 ,'PENDING','Online Banking','5/26/2020');
insert into Payment values(1010,110,'SUCCESS','Online Banking','11/28/2020');
insert into Payment values(1011,106,'SUCCESS','Card','10/25/2020');
insert into Payment values(1012,109,'FAILED','Online Banking','10/31/2020');
insert into Payment values(1013,111,'PENDING','Online Banking','9/13/2020');
insert into Payment values(1014,112,'PENDING','Card','8/31/2020');
insert into Payment values(1015,113,'FAILED','Card','7/19/2020');
insert into Payment values(1016,114,'PENDING','Cash','9/9/2020');
insert into Payment values(1017,115,'PENDING','Cash','11/20/2020');
insert into Payment values(1018,116,'PENDING','Online Banking','11/4/2020');
insert into Payment values(1019,117,'FAILED','Card','6/1/2020');
insert into Payment values(1020,115,'FAILED','Online Banking','8/15/2020');
insert into Payment values(1021,114,'SUCCESS','Cash','7/22/2020');
insert into Payment values(1022,109,'SUCCESS','Card','6/30/2020');
insert into Payment values(1023,113,'SUCCESS','Cash','10/22/2020');

--select * from Payment;

insert into CoveredBy values(1001 ,null,null,null);
insert into CoveredBy values(1002, 108,'SNQ657567', '6/12/2020');
insert into CoveredBy values(1003 ,null, null, null);
insert into CoveredBy values(1004 , 101, 'STS474766', '1/1/2020');
insert into CoveredBy values(1005 ,100 , 'SIS970766','12/12/2020');
insert into CoveredBy values(1006 ,null , null, null);
insert into CoveredBy values(1007 ,101 , 'SMS990766','12/31/2020');
insert into CoveredBy values(1008 ,105 , 'SOS940766','7/25/2020');
insert into CoveredBy values(1009 ,105 , 'NHI900766','5/5/2020');
insert into CoveredBy values(1010 ,null , null, null);
insert into CoveredBy values(1002 ,109 , 'GYU990766','5/25/2021');
insert into CoveredBy values(1008 ,101 , 'TYU988766','8/31/2021');
insert into CoveredBy values(1009 ,107 , 'TUM896766','6/6/2021');
insert into CoveredBy values(1004 ,105 , 'YIO981766','7/20/2021');
insert into CoveredBy values(1011 ,102 , 'TLM911766','12/31/2020');
insert into CoveredBy values(1012 ,103 , 'VHT980066','6/30/2021');
insert into CoveredBy values(1013 ,104 , 'MRT988755','4/30/2021');
insert into CoveredBy values(1014 ,106 , 'SPL987866','11/30/2020');
insert into CoveredBy values(1015 ,110 , 'RGI000234','7/31/2020');
insert into CoveredBy values(1016 ,102 , 'OIU985566','12/31/2020');
insert into CoveredBy values(1017 ,110 , 'MOG923766','7/31/2021');

--select * from CoveredBy;

insert into Prescribe_Medicine values(1,3 ,30 );
insert into Prescribe_Medicine values(2,10 ,40 );
insert into Prescribe_Medicine values(3,7 , 10);
insert into Prescribe_Medicine values(4,4, 30);
insert into Prescribe_Medicine values(5,3, 25);
insert into Prescribe_Medicine values(6,5, 20);
insert into Prescribe_Medicine values(7,2,35 );
insert into Prescribe_Medicine values(8,7, 15);
insert into Prescribe_Medicine values(9,5, 50);
insert into Prescribe_Medicine values(10,5, 65);
insert into Prescribe_Medicine values(11,1, 24);
insert into Prescribe_Medicine values(12,6, 56);
insert into Prescribe_Medicine values(13,7, 67);
insert into Prescribe_Medicine values(14,8, 16);
insert into Prescribe_Medicine values(15,9, 23);
insert into Prescribe_Medicine values(16,4, 56);
insert into Prescribe_Medicine values(17,5, 9);


--select * from Prescribe_Medicine;
