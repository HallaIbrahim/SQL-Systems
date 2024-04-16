create database hospital

-- Create the Doctor table
CREATE TABLE Doctor (
    doctor_ID INT PRIMARY KEY,
    username VARCHAR(20),
    gender VARCHAR(10),
    Email VARCHAR(40),
    doctor_name VARCHAR(20),
    doctor_address VARCHAR(40),
    specialist VARCHAR(20),
    salary INT
);

-- Insert data into the Doctor table
INSERT INTO Doctor (doctor_ID, username, gender, Email, doctor_name ,doctor_address,specialist, salary ) VALUES 
    (370492, 'mo0374', 'male', 'mo.ahmed3704@gmail.com', 'Mohamed Ahmed', 'Miany Alexandria', 'Surgeon', 25600),
    (198625, 'AhmedAly21', 'male', 'ahmedaly232@gmail.com', 'Ahmed Aly',' sporting Alexandria', 'Dentist', 10500),
    (187565, 'OmarEssam', 'male', 'omar.essam87@gmail.com', 'Omar Essam', 'San Stefano Alexandria', 'Cardiologist', 20000),
    (659823, 'Menna56', 'female', 'mennaa59@gmail.com', 'Menna Adel', 'Gleem Alexandria', 'Dermatologists', 15800),
    (200356, 'mostafa12', 'male', 'mostafa_mohamed@gmail.com',  'Mostafa Mohamed',' San Stefano Alexandria', 'Ophthalmologist', 10000),
    (356782, 'emanomar', 'female', 'eman_omar521@gmail.com',  'Eman Omar', 'Stanly Alexandria', 'Neurologists', 17500),
    (453297, 'seleem85', 'male', 'seleem20@gmail.com',  'Seleem khaled', 'El-manshia Alexandria', 'Physiatrist', 8000),
    (263425, 'ahlamyoussef02', 'female', 'ahlamyoussef887@gmail.com',  'Ahlam Youssef' ,'Sidi Gaber Alexandria', 'Hematologist', 20000),
    (250730, 'carmenmahmoud', 'female', 'carmenmahmoud023@gmail.com',  'Carmen Mahmoud', 'Smouha Alexandria', 'Gastroenterologists', 15400),
    (302976, 'bassemmohamed80', 'male', 'bassemohamed75@gmail.com',  'Bassem Mohamed' ,'Sidi Beshc Alexandria', 'Gynaecologist', 18500);


-- Create table doctormobile
CREATE TABLE doctormobile (
    doctor_mobile INT,
    doctor_ID INT,
	PRIMARY KEY(doctor_mobile,doctor_ID),
    FOREIGN KEY (doctor_ID) REFERENCES Doctor (doctor_ID)
);


INSERT INTO doctormobile (doctor_mobile,doctor_ID) VALUES 
    (1062533, 370492),
    (1287269, 198625),
    (1598248, 187565),
    (1259752, 187565),
    (1058311, 659823),
    (2558628, 200356),
    (1553147, 356782),
    (1154782, 453297),
    (1297272, 453297),
    (1570578, 263425),
    (1160423, 250730),
    (1529932, 302976),
    (1156851, 302976);


CREATE TABLE patient (
    patient_ID INT PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    gender VARCHAR(10),
    Birthdate DATE,
    email VARCHAR(30)
);

-- Insert into patient
INSERT INTO patient (patient_ID, first_name, last_name, gender, Birthdate, email) VALUES
  (102, 'Omar', 'Hesham', 'male', '2002-11-11', 'omarhesham235@gmail.com'),
  (138, 'Essa', 'Mamdouh', 'male', '1986-09-08', 'essamamdouh@gmail.com'),
  (257, 'Dalia', 'Yasser', 'female', '1995-07-23', 'dalia125@gmail.com'),
  (831, 'Heba', 'Eman', 'female', '1996-01-05', 'emanhamed9845@gmail.com'),
  (301, 'Eman', 'Hamed', 'female', '2000-02-02', 'hebayasser954@gmail.com'),
  (254, 'Hazem', 'Alaa', 'male', '1999-05-30', 'hazemalaa@gmail.com'),
  (624, 'Amr', 'Adel', 'male', '2003-03-24', 'amrade12010@gmail.com'),
  (98, 'Ayamo', 'Mostafa', 'male', '1982-12-11', 'essamamdouh@gmail.com'),
  (456, 'Hassan', 'Hossam', 'male', '1995-09-03', 'hassanhoss964@gmail.com'),
  (67, 'Shimae', 'Adham', 'female', '1999-05-30', 'shimaaadhammm@gmail.com');


CREATE TABLE patientmobile (
    patient_mobile INT ,
    patient_ID INT,
	PRIMARY KEY(patient_mobile,patient_ID),
    FOREIGN KEY (patient_ID) REFERENCES patient (patient_ID)
);

INSERT INTO patientmobile VALUES
    (1288077731, 102),
    (1298117522, 102),
    (1123681475, 138),
    (1587598417, 257),
    (1102578247, 831),
    (1035882478, 301),
    (1277524785, 301),
    (1285247515, 254),
    (1548524721, 624),
    (1135862475, 98),
    (1255478182, 98),
    (1572472104, 456),
    (1250024747, 67);


CREATE TABLE appointment (
    doctor_name VARCHAR(20),
    appointment_date varchar(50),
    department_name VARCHAR(30),
    doctor_id INT,
    patient_id INT,
	primary key (appointment_date,doctor_name),
    FOREIGN KEY (doctor_id) REFERENCES Doctor (doctor_ID),
    FOREIGN KEY (patient_id) REFERENCES patient (patient_ID)
);

INSERT INTO appointment VALUES 
    ('Ahmed Aly', 'Sunday 12 pm', 'Dentist', 198625, 102),
    ('Bassem Mohamed', 'Monday 1 pm', 'Gynaecologist', 302976, 138),
    ('Carmen Mahmoud','Monday 4 pm ', 'Gastroenterologists', 250730, 257),
    ('Mostafa Mohamed', 'Saturday 9 pm ', 'Ophthalmologist', 200356, 831),
    ('Eman Omar', 'Saturday 1 pm', 'Neurologists', 356782, 301),
    ('Menna Adel', 'Sunday 7 pm', 'Dermatologists', 659823, 254),
    ('Mohamed Ahmed', 'Friday  2 pm ', 'Surgeon', 370492, 624),
    ('Ablam Youssef', 'Monday 10 am', 'Hematologist', 263425, 98),
    ('Saleem Khaled', 'Wednesday 4 pm ', 'Physiatrist', 453297, 456),
    ('Omar Essam', 'Tuesday 3 pm ', 'Cardiologist', 187565, 67);

CREATE TABLE examine (
    doctor_id INT,
    patient_id INT,
    PRIMARY KEY (doctor_id, patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor (doctor_ID),
    FOREIGN KEY (patient_id) REFERENCES patient (patient_ID)
);

INSERT INTO examine(doctor_id,patient_id) VALUES 
(198625, 102),
(302976, 138),
(250730, 257),
(200356, 831),
(356782, 301),
(659823, 254),
(370492, 624),
(263425, 98),
(453297, 456),
(187565, 67);

-- Create Nurse table
CREATE TABLE Nurse (
    nurse_id INT PRIMARY KEY,
    gender VARCHAR(10),
    username VARCHAR(20),
    nurse_name VARCHAR(20),
    duty_hour INT,
    salary INT,
    address VARCHAR(30),
    email VARCHAR(40)
);

-- Insert into Nurse
INSERT INTO Nurse VALUES
(1024, 'female', 'amiraa1212', 'Amira Adel', 10, 3500, 'Sidi Gaber Alexandria', 'amiraadel12@gmail.com'),
(4404, 'male', 'johnsmith', 'John Smith', 8, 3000, 'Example City', 'john.smith@example.com'),
(2530, 'male', 'jane_doe', 'Jane Doe', 12, 4500, 'Another City', 'jane.doe@example.com'),
(3628, 'female', 'user3', 'User Three', 8, 2500, 'Yet Another City', 'user.three@example.com'),
(9823, 'male', 'user4', 'User Four', 14, 5000, 'Last City', 'user.four@example.com'),
(1425, 'female', 'mariamessa65','Mariam Ahmed', 8, 3000, 'Miamy Alexandria', 'mariam.ahmed32@gmail.com'),
(9685, 'female', 'salmasaid14',  'Salma Said', 12, 4500, 'Sidi Gaber Alexandria', 'salmmaa21@gmail.com'),
(5769, 'female', 'habibahossam1',  'Habiba Hossam', 8, 3000, 'Sporting Alexandria', 'habibahoss1235@gmail.com'),
(4862, 'male', 'abdelrahman.hany5', 'Abdelrahman Hany', 10, 3500, 'Gleem Alexandria', 'hanyabdelrahmane12@gmail.com'),
(2597, 'male', 'ashraf.osama3', 'Ashraf Osama', 12, 4500, 'Sidi Gaber Alexandria', 'asharfx203@gmail.com'),
(7531, 'female', 'yasmeenmostafa10', 'Yasmmen Mostafa', 12, 4500, 'EL-Mandara Alexandria', 'yasmmenmos102@gmail.com'),
(6251, 'male', 'ahmedhashem03',  'Ahmed Hashem', 12, 4500, 'EL-Montaza Alexandria', 'ahmedhashemxx@gmail.com'),
(1300, 'female', 'amiraa1212', 'Amira Adel', 8, 2500, 'Sidi Gaber Alexandria', 'amiraade112@gmail.com'),
(5205, 'male', 'khalidamir10', 'Khaled Amir', 14, 5000, 'EL-SHATBY Alexandria', 'khalami34@gmail.com');

-- Create aucsemobile table
CREATE TABLE nursemobile (
    nurse_id INT,
    nurse_mobile INT,
    FOREIGN KEY (nurse_id) REFERENCES Nurse (nurse_id),
    PRIMARY KEY (nurse_id, nurse_mobile)
);

-- Insert into aucsemobile
INSERT INTO nursemobile VALUES
(1024, 01258746943),
(4404, 01298217531),
(2530, 01158746924),
(2530, 01298578111),
(9823, 01587455522),
(1425, 01025253644),
(9685, 01111121211),
(5769, 01259980699),
(5769, 01020201452),
(4862, 01198982872),
(2597, 01554875218);

-- Create Hospital table
CREATE TABLE Hospital (
    hospital_id INT PRIMARY KEY,
    hospital_name VARCHAR(20),
    hospital_place VARCHAR(30)
);

-- Insert into Hospital
INSERT INTO Hospital VALUES
(1300, 'Ultra Care House', 'Smouha Alexandria'),
(2025, 'Ultra Care House', 'EL-Mandaca Alexandria'),
(3781, 'Ultra Care House', 'Dokki Cairo'),
(4322, 'Ultra Care House', 'El-Zamalek Cairo'),
(5205, 'Ultra Care House', 'Sidi Gaber Alexandria'),
(2345, 'Ultra Care House', 'El-Remaya Square Giza'),
(9658, 'Ultra Care House', 'laadi Cairo'),
(1519, 'Ultra Care House', 'Heliopolis saice'),
(7531, 'Ultra Care House', 'Garden City Cairo'),
(6251, 'Ultra Care House', 'Agami Alexandria');


-- Create table Medicine
CREATE TABLE Medicine (
    medicine_id INT PRIMARY KEY,
    medicine_type VARCHAR(30),
    cost DECIMAL,
    medicine_name VARCHAR(50),
    medicine_dose VARCHAR(30),
    medicine_company VARCHAR(50),
    composition VARCHAR(150)
);

-- Insert into Medicine
INSERT INTO Medicine(medicine_id,medicine_type,cost, medicine_name, medicine_dose, medicine_company, composition ) VALUES 
(2305, 'asthma', 70, 'salbutamol', 'every 4 hours as needed',' Ventolin', 'salbutamol sulphate'),
(98627, 'diabetes', 250, 'aspirin', 'once daily', 'Ascriptin', 'acetylsalicylic acid with added corn starch and water'),
(30214, 'hypertension', 645, 'carvedilol', 'twice daily',' Coreg','racemic mixture where the S (-) enantiomer'),
(5674, 'depression', 430, 'citalopram', 'once daily','Celexa', 'bicyclic phthalans derivative designated dimethylaminopropyl) (4-fluorophenyl)'),
(785, 'neuropathic pain', 770, 'gabapentin', 'twice daily', 'Neurontin', 'C9H17N02'),
(805, 'diabetes', 320, 'insulin glargine', 'once a day at bedtime', 'Lantus', '21A-Gly-306e-L-Arg-306b-L-Arg-human insulin and has the empirical formule C267H404N7207856'),
(21573, 'chest pain and heart failure', 95, 'isosorbide mononitrate', 'once a day at bedtime',' Hanaket',' organic nitrate'),
(72301, 'rheumatoid arthritis', 50, 'naproxen', 'twice daily',' Aleve', 'sodium'),
(4520, 'GERD', 80, 'omeprazole', 'once daily',' Prilosec',' proton-pump inhibitor'),
(1254, 'high cholesterol', 400, 'simvastatin', 'once daily',' Zocor',' C25H3805');

-- Create table describe
CREATE TABLE describe (
    doctor_id INT,
    medicine_id INT,
    FOREIGN KEY (doctor_id) REFERENCES Doctor (doctor_ID),
    FOREIGN KEY (medicine_id) REFERENCES Medicine (medicine_id),
    PRIMARY KEY(doctor_id, medicine_id)
);

-- Insert into describe
INSERT INTO describe VALUES 
(370492, 2305),
(198625, 98627),
(187565, 30214),
(659823, 5674),
(200356, 785),
(356782, 805),
(453297, 21573),
(263425, 72301),
(250730, 4520),
(302976, 1254);

-- Create table Room
CREATE TABLE Room (
    room_num INT PRIMARY KEY
);

-- Insert into Room
INSERT INTO Room VALUES 
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10);

-- Create table department
CREATE TABLE department (
    department_name VARCHAR(20) PRIMARY KEY,
    patient_ID INT,
    doctor_id INT,
    nurse_id INT,
    FOREIGN KEY (patient_ID) REFERENCES patient (patient_ID),
    FOREIGN KEY (doctor_id) REFERENCES Doctor (doctor_ID),
    FOREIGN KEY (nurse_id) REFERENCES Nurse (nurse_id)
);

-- Insert into department
INSERT INTO department(department_name,patient_ID,doctor_id,nurse_id) VALUES 
('Dental', 456, 198625, 1425),
('Cardiology', 102, 187565,  1024),
('Surgery', 138, 370492, 4404),
('Gastroenterology', 301, 250730, 9823),
('Gynecology', 98, 302976, 5205),
('Dermatology', 301, 659823,  1300),
('Hematology', 831, 263425,  1425),
('Nervous System', 254, 356782,  5769),
('Physiotherapy', 257, 453297, 2597),
('Ophthalmology', 67, 200356,  9685);


-- Create table lab
CREATE TABLE lab (
    lab_num INT PRIMARY KEY
);

-- Insert into lab
INSERT INTO lab VALUES (1), (2), (3), (4);

-- Create table report
CREATE TABLE report (
    report_num INT PRIMARY KEY,
    lab_num INT,
    FOREIGN KEY (lab_num) REFERENCES lab (lab_num)
);

-- Insert into report
INSERT INTO report VALUES 
(5, 1),
(70, 3),
(85, 3),
(124, 2),
(215, 1),
(93, 4),
(56, 4),
(81, 2),
(324, 1),
(65, 3);

-- Create table inpatient
CREATE TABLE inpatient (
    patient_ID INT primary key,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    gender VARCHAR(10),
    Birthdate DATE,
    email VARCHAR(30),
    report_num INT,
    room_num INT,
    FOREIGN KEY (report_num) REFERENCES report(report_num),
    FOREIGN KEY (room_num) REFERENCES Room(room_num),
    FOREIGN KEY (patient_ID) REFERENCES patient (patient_ID)
);


-- Insert into inpatient
INSERT INTO inpatient VALUES
(102, 'Omar', 'Hesham', 'male', '2002-11-11', 'omerhesham235@gmail.com', 5, 5),
(138, 'Essam', 'Mamdouh', 'male', '1986-08-09', 'essamamdouh@gmail.com', 70, 1),
(257, 'Dalia', 'Yasser', 'female', '1995-07-23', 'dalia125@gmail.com', 124, 6),
(831, 'Heba', 'Ahmed', 'female', '2000-02-02', 'hebayasser954@gmail.com', 56, 4),
(301, 'Eman', 'Hamed', 'female', '1986-08-09', 'emanhamed9845@gmail.com', 65, 9);


-- Create table inpatientmobile
CREATE TABLE inpatientmobile (
    patient_mobile INT ,
    patient_ID INT,
	PRIMARY KEY (patient_mobile, patient_ID),
    FOREIGN KEY (patient_ID) REFERENCES inpatient (patient_ID)
);
-- Insert into inpatientmobile
INSERT INTO inpatientmobile VALUES
(1288077731, 102), 
(1298117522, 102),
(1123681475, 138),
(1587598417, 257),
(1102578247, 831),
(1035882478, 301),
(1277524785, 301);

-- Create table inpatientbill
CREATE TABLE inpatientbill (
    patient_ID INT,
    bill_num INT PRIMARY KEY,
    num_of_days INT,
    doctor_charge INT,
    operation_charge INT,
    medicine_charge INT,
    lab_charge INT,
    nursing_charge INT,
    room_charge INT,
    FOREIGN KEY (patient_ID) REFERENCES inpatient(patient_ID)
);

-- Insert into inpatientbill
INSERT INTO inpatientbill VALUES 
(102, 23, 5, 2200, 1800, 800, 300, 1000, 450),
(138, 55, 10, 4400, 5000, 1200, 450, 3000, 900),
(257, 201, 25, 7000, 20000, 4000, 540, 4000, 2250),
(831, 79, 3, 2000, NULL, 350, 1000, 150, 270),
(301, 65, 15, 4500, NULL, 1500, 450, 3580, 1350);


CREATE TABLE cares (
    nurse_id INT,
    patient_id INT,
    PRIMARY KEY (patient_id, nurse_id),
    FOREIGN KEY (nurse_id) REFERENCES Nurse (nurse_id),
    FOREIGN KEY (patient_id) REFERENCES inpatient (patient_id)
);

-- Insert into cares
INSERT INTO cares VALUES 
(1024, 102),
(4404, 138),
(2597, 257),
(1425, 831),
(9823, 301),
(1024, 301), 
(9823, 831),
(4404, 102),
(1425, 102),
(2597, 138);


-- Create table outpatient
CREATE TABLE outpatient (
    patient_id INT PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    gender VARCHAR(10),
    Birthdate DATE,
    email VARCHAR(30),
    report_num INT,
    FOREIGN KEY (report_num) REFERENCES report (report_num),
    FOREIGN KEY (patient_id) REFERENCES patient (patient_id)
);
-- Insert into outpatient
INSERT INTO outpatient VALUES
      (254, 'Hazem', 'Alaa', 'male', '1996-01-05', 'hazemalaa@gmail.com', 215),
      (624, 'Amr', 'Adel', 'male', '1982-11-12', 'essamamdouh@gmail.com', 81),
      (98, 'Ayamo', 'Mostafa', 'male', '1995-09-03', 'hassanhoss964@gmail.com', 324),
      (456, 'Hassan', 'Hossam', 'male', '2000-02-02', 'amradel2010@gmail.com', 93),
      (67, 'Shiman', 'Adhan', 'female', '1999-05-30', 'shimaaadhannn@gmail.com', 85);

-- Create table checks
CREATE TABLE checks (
    doctor_ID INT,
    report_num INT,
    PRIMARY KEY (doctor_ID, report_num),
    FOREIGN KEY (doctor_ID) REFERENCES Doctor(doctor_ID),
    FOREIGN KEY (report_num) REFERENCES report (report_num)
);
-- Insert into checks
INSERT INTO checks VALUES
(198625, 70), 
(370492, 5),
(187565, 85),
(659823, 124),
(200356, 215),
(356782, 93),
(453297, 56),
(263425, 81),
(250730, 324),
(302976, 65),
(370492, 65);

-- Create table outpatientmobile
CREATE TABLE outpatientmobile (
    patient_mobile INT,
    patient_ID INT,
    PRIMARY KEY (patient_mobile, patient_ID),
    FOREIGN KEY (patient_ID) REFERENCES outpatient (patient_ID)
);

-- Insert into outpatientmobile
INSERT INTO outpatientmobile VALUES
(1285247515, 254), 
(1548524721, 624),
(1135862475, 98),
(1255478182, 98),
(1572472104, 456),
(1250024747, 67);

-- Create table outpatientbill
CREATE TABLE outpatientbill (
    bill_ID INT Primary key,
    patient_id INT ,
    doctorname VARCHAR(20),
    patient_check_num INT,
    FOREIGN KEY (patient_id) REFERENCES outpatient (patient_ID)
);

-- Insert into outpatientbill
INSERT INTO outpatientbill VALUES
(1,254, 'Mohamed Ahmed', 1800),
(2,624, 'Carmen Mahmoud', 500),
(3,98, 'Menna Adel', 200),
(4,456, 'Ahmed Aly', 350),
(5,67, 'Eman Omar', 800);

-- More Queries 
--Get the names of patients and their corresponding doctors' names.

SELECT p.first_name AS Patient_FirstName, p.last_name AS Patient_LastName, d.doctor_name AS DoctorName
FROM patient AS p
JOIN examine AS e ON p.patient_ID = e.patient_id
JOIN Doctor AS d ON e.doctor_id = d.doctor_ID;

-- Count the number of patients in each department.

SELECT d.department_name, COUNT(*) AS Patient_Count
FROM department AS d
JOIN patient AS p ON d.patient_ID = p.patient_ID
GROUP BY d.department_name;


-- Find the top 3 doctors with the highest salary.
SELECT TOP 5 doctor_name AS DoctorName, salary AS Salary
FROM Doctor
ORDER BY salary DESC;

--counts the number of appointments each doctor
SELECT d.doctor_name AS DoctorName,
       COUNT(a.appointment_date) AS NumAppointments
FROM Doctor AS d
LEFT JOIN appointment AS a ON d.doctor_ID = a.doctor_id
GROUP BY d.doctor_name;

-- Retrieve the doctors who have prescribed 'insulin glargine'.
SELECT d.doctor_name
FROM Doctor AS d
JOIN describe AS ds ON d.doctor_ID = ds.doctor_id
JOIN Medicine AS m ON ds.medicine_id = m.medicine_id
WHERE m.medicine_name = 'insulin glargine';

--List the patients' IDs along with their mobile numbers who are outpatients.
SELECT o.patient_ID, om.patient_mobile
FROM outpatient AS o
JOIN outpatientmobile AS om ON o.patient_ID = om.patient_ID;

--List the nurses who are taking care of inpatients.
SELECT n.nurse_name AS NurseName, ip.first_name AS PatientFirstName, ip.last_name AS PatientLastName
FROM cares AS c
JOIN Nurse AS n ON c.nurse_id = n.nurse_id
JOIN inpatient AS ip ON c.patient_id = ip.patient_ID;



