-----CREATING HEALTHCARE DATABASE-----
CREATE DATABASE healthcare;

-----USING HEALTHCARE DATABASE-----
USE healthcare;

-------------------------------TABLE CREATION----------------------------

-----CREATING DOCTOR TABLE-----
CREATE TABLE Doctor(
Doctor_ID INT NOT NULL,
Doctor_SSN VARCHAR(10) NOT NULL,
Name varchar(30) NOT NULL,
Phone_Number BIGINT NOT NULL,
PRIMARY KEY(Doctor_ID),
CHECK (LEN(Phone_Number)=10)
);

-----CREATING PATIENT TABLE-----
CREATE TABLE Patient(
Patient_ID INT NOT NULL,
Patient_SSN VARCHAR(11) NOT NULL,
Doctor_ID INT NOT NULL,
Name varchar(30) NOT NULL,
Gender varchar(10) NOT NULL,
PRIMARY KEY(Patient_ID),
FOREIGN KEY(Doctor_ID) REFERENCES Doctor(Doctor_ID),
CHECK (Gender= 'Male' OR Gender='Female')
);

-----CREATING PAYCHECK TABLE-----
CREATE TABLE Paycheck(
Cheque_Number INT NOT NULL,
Doctor_ID INT NOT NULL,
Salary FLOAT,
Bonus FLOAT,
Pay_Date DATE,
PRIMARY KEY(Cheque_Number),
FOREIGN KEY(Doctor_ID) REFERENCES Doctor(Doctor_ID),
CHECK(Salary>=0 AND Bonus>=0)
);

-----CREATING INSURANCE TABLE-----
CREATE TABLE Insurance(
Company_ID INT NOT NULL,
Company_Name VARCHAR(20) NOT NULL,
Phone_Number BIGINT,
PRIMARY KEY(Company_ID),
CHECK (LEN(Phone_Number)=10)
);

------CREATING COVERREDBY ASSOCIATIVE ENTITY-----
CREATE TABLE CoveredBy(
Patient_ID INT NOT NULL,
Company_ID INT,
Insurance_Serial_Number VARCHAR(20),
Insurance_Expiry_Date DATE,
FOREIGN KEY(Patient_ID) REFERENCES Patient(Patient_ID),
FOREIGN KEY(Company_ID) REFERENCES Insurance(Company_ID)
);

-----CREATING DIAGNOSIS TABLE-----
CREATE TABLE Diagnosis(
Diagnosis_ID int NOT NULL,
Diagnosis_Category varchar(50) NOT NULL,
Base_Price FLOAT NOT NULL,
PRIMARY KEY(Diagnosis_ID),
CHECK(Base_Price>=0)
);

-----CREATING CPT TABLE-----
CREATE TABLE CPT(
CPT_ID INT NOT NULL,
CPT_Category VARCHAR(20),
CPT_Price FLOAT NOT NULL,
PRIMARY KEY(CPT_ID),
CHECK(CPT_Price>=0)
);

-----CREATING MEDICINE TABLE-----
CREATE TABLE Medicine(
Medicine_Inventory_ID INT NOT NULL,
Medicine_Name VARCHAR(20) NOT NULL,
Manufacturer VARCHAR(20) NOT NULL,
Quantity INT,
Price Float NOT NULL,
PRIMARY KEY(Medicine_Inventory_ID),
CHECK (Quantity >= 0 AND Price >= 0)
);

-----CREATING TABLE PRESCRIPTION-----
CREATE TABLE Prescription(
Prescription_ID INT NOT NULL,
Patient_ID INT NOT NULL,
Prescription_Date DATE,
PRIMARY KEY(Prescription_ID)
);

-----CREATING PRESCRIBE MEDICINE ASSOCIATIVE ENTITY-----
CREATE TABLE Prescribe_Medicine(
Prescription_ID INT NOT NULL,
Medicine_Inventory_ID INT NOT NULL,
Quantity INT,
PRIMARY KEY(Prescription_ID,Medicine_Inventory_ID),
FOREIGN KEY(Medicine_Inventory_ID) REFERENCES Medicine(Medicine_Inventory_ID),
FOREIGN KEY(Prescription_ID) REFERENCES Prescription(Prescription_ID),
CHECK(Quantity >= 0)
);

----CREATING TABLE INVOICE-----
CREATE TABLE Invoice(
Invoice_Number INT NOT NULL,
Patient_ID INT NOT NULL,
CPT_ID INT NOT NULL,
Diagnosis_ID INT NOT NULL,
Amount FLOAT NOT NULL,
Invoice_Date Date,
Prescription_ID INT NOT NULL,
PRIMARY KEY(Invoice_Number),
FOREIGN KEY(Patient_ID) REFERENCES Patient(Patient_ID),
FOREIGN KEY(CPT_ID) REFERENCES CPT(CPT_ID),
FOREIGN KEY(Diagnosis_ID) REFERENCES Diagnosis(DIagnosis_ID),
FOREIGN KEY(Prescription_ID) REFERENCES Prescription(Prescription_ID)
);

-----CREATING TABLE PAYMENT-----
CREATE TABLE Payment(
Transaction_Number BIGINT NOT NULL,
Invoice_Number INT NOT NULL,
Payment_Status VARCHAR(15),
Payment_Method VARCHAR(15),
Payment_Date Date,
PRIMARY KEY(Transaction_Number),
FOREIGN KEY(Invoice_Number) REFERENCES Invoice(Invoice_Number),
CHECK(Payment_Status ='FAILED' OR Payment_Status='PENDING' OR Payment_Status='SUCCESS'),
CHECK(Payment_Method = 'Online Banking' OR Payment_Method= 'Card' OR Payment_Method= 'Cash')
);

---------------------COMPUTED COLUMNS BASED ON USER DEFINED FUNCTIONS---------------------------------


------Function to calculate Inventory Product Values for Inventory_Value column of Medicine Table-----
GO
CREATE FUNCTION Inventory_Product_Value (@quantity INT, @price FLOAT)
RETURNS FLOAT
AS
BEGIN
	RETURN @quantity*@price
END
GO

ALTER TABLE Medicine ADD Inventory_Value AS dbo.Inventory_Product_Value(Quantity,Price);

-------------Function to calculate Total Amount Paid for Total_Pay column of Paycheck Table-----------
GO
CREATE FUNCTION Payout (@salary INT, @bonus FLOAT)
RETURNS FLOAT
AS
BEGIN
	RETURN @salary+@bonus
END
GO

ALTER TABLE Paycheck ADD Total_Pay AS dbo.Payout(Salary,Bonus);

---------------------------NON-CLUSTERED INDEXES-------------------------------------------------------

---------------Non-clustered Index for Medicine Table--------------------------------------------------

CREATE NONCLUSTERED INDEX IX_MedicineName_Manufacturer 
ON Medicine(Medicine_Name, Manufacturer)
INCLUDE (Quantity, Price);

---------------Non-clustered Index for Invoice Table----------------------------------------------------

CREATE NONCLUSTERED INDEX IX_InvoiceDate 
ON Invoice(Invoice_Date)
INCLUDE (Patient_ID, Amount);