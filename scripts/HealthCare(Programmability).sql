USE healthcare;
--------------------------STORED PROCEDURES---------------------------------------------------------------------------------------------------

-----Store Procedure to find out Doctors associated with a patient (Doctors who treated the patient)------------------------------------------ 
--Takes @Patient_ID as an input parameter, and outputs that patient's ID, name and doctor infomation(include doctor's name and phone number)--
GO
CREATE PROCEDURE GetDoctorInfo @Patient_ID INT, @message varchar(100) output 
AS
BEGIN
 IF EXISTS(
  SELECT 1
  FROM Patient as p left join Doctor as d on p.Doctor_ID = d.Doctor_ID
  WHERE p.Patient_ID = @Patient_ID)
  BEGIN
   SELECT p.Patient_ID, p.Name, d.Name as Doctor_Name, d.Phone_Number as Doctor_Phone_Num
   FROM Patient as p left join Doctor as d on p.Doctor_ID = d.Doctor_ID
   WHERE p.Patient_ID = @Patient_ID
   set @message = 'Doctor information for Patient '+ cast(@Patient_ID as varchar) + ' is found.'
   print @message
  END;
 ELSE
  BEGIN
   set @message = 'Doctor information for Patient '+ cast(@Patient_ID as varchar) + ' is not found.'
   print @message
  END
END;
GO

DECLARE  @PatientID INT, @message varchar(100)
SET @PatientID = '1002'
EXEC GetDoctorInfo @PatientID, @message output

------------Stored Procedure to find out billing history associated with a patient------------------------------------------
--Give Patient ID as input Parameter and get Payment and Invoice details for that Particular Patient

GO 
CREATE PROCEDURE GetPaymentInfo @Patient_ID INT, @message varchar(100) output 
AS
BEGIN
 IF exists(
	 SELECT 1 FROM Patient p join Invoice i on p.Patient_ID = i.Patient_ID
		  join Payment pa on i.Invoice_Number = pa.Invoice_Number
	 WHERE p.Patient_ID = @Patient_ID)
	 BEGIN
		SELECT p.Patient_ID, p.Patient_SSN, p.Name, i.Invoice_Number,
		i.Prescription_ID, i.Amount, i.Invoice_Date, pa.Transaction_Number, pa.Payment_Method, 
		pa.Payment_Status, pa.Payment_Date
		FROM Patient p join Invoice i on p.Patient_ID = i.Patient_ID 
		join Payment pa on i.Invoice_Number = pa.Invoice_Number
		WHERE p.Patient_ID = @Patient_ID
		set @message = 'Payment information is found.'
		print @message
	 END;
 ELSE
	 BEGIN
		set @message = 'Payment information is not exist.'
		print @message
	 END
END;

DECLARE @Patient_ID INT, @message varchar(100)
set @Patient_ID = '1005'
EXEC GetPaymentInfo @Patient_ID, @message output

-------Stored procedure to calculate total amount received by a doctor between any given two pay dates--------------------
----------Takes in Doctor ID, From_Date, To_Date as input parameter and returns total amount paid-------------------------
GO
CREATE PROCEDURE TotalSalary
 @doctorID INT,
 @fromDate DATE,
 @toDate DATE,
 @totalAmount FLOAT OUTPUT
 AS
 BEGIN
 IF EXISTS ( SELECT 1 FROM Paycheck WHERE Doctor_ID = @doctorID
			 AND Pay_Date BETWEEN @fromDate AND @toDate)
	BEGIN
		SELECT @totalAmount = SUM(Total_Pay) FROM Paycheck 
		WHERE Doctor_ID = @doctorID AND Pay_Date BETWEEN @fromDate AND @toDate;
	END;
 ELSE
	BEGIN
		SET @totalAmount = 0
	END;
 END

DECLARE @TotalSalaryReceived FLOAT
EXEC TotalSalary 107,'2020-05-01','2020-07-31', @TotalSalaryReceived OUTPUT;
SELECT @TotalSalaryReceived AS Total_Salary_Received;

------------------Stored Procedure to display whether a patient is covered under an insurance----------------
--------------Check if a patient is covered by insurence(s)--------------------------------------------------
GO
CREATE PROCEDURE IfHaveInsurance AS
BEGIN
 select distinct c.Patient_ID, 
 case 
  WHEN Company_ID IS NULL THEN 'No'
  else 'Yes' end as IfHaveInsurance
 from CoveredBy as c
END;

exec IfHaveInsurance


----------------Stored Procedure to return a list of paychecks associated with a doctor---------------------
-----------------Takes Doctor ID as input returns paychecks associated with ID------------------------------
GO
CREATE PROCEDURE GetDoctorPayChecks 
@Doctor_ID INT
AS
BEGIN
 SELECT Doctor.Doctor_ID, Doctor.Name as Doctor_Name, Cheque_Number, Salary, Bonus, Pay_date 
 FROM Doctor 
	  INNER JOIN Paycheck
	  ON Doctor.Doctor_ID = Paycheck.Doctor_ID
	  WHERE Doctor.Doctor_ID = @Doctor_ID
	  ORDER BY Pay_Date
END;

EXEC GetDoctorPayChecks '101';

------------------------------------VIEWS-----------------------------------------------------------------
----------------------------View to display patients history----------------------------------------------
GO
CREATE VIEW PatientHistory
AS
SELECT PT.Patient_ID, PT.Name AS Patient_Name, PT.Gender, D.Diagnosis_Category, M.Medicine_Name
FROM Patient AS PT
	 INNER JOIN Invoice AS I
		ON PT.Patient_ID = I.Patient_ID
	 INNER JOIN Diagnosis AS D
		ON I.Diagnosis_ID = D.Diagnosis_ID
	 INNER JOIN Prescription AS P
		ON I.Prescription_ID = P.Prescription_ID
	 INNER JOIN Prescribe_Medicine AS PM
		ON P.Prescription_ID = PM.Prescription_ID
	 INNER JOIN Medicine AS M
		ON PM.Medicine_Inventory_ID = M.Medicine_Inventory_ID;
GO

Select * from PatientHistory;

------------------------View to display patients with insurance and its details------------------------------
GO
CREATE VIEW PatientsWithInsurance
AS
SELECT Patient.Patient_ID as Patient_ID, Name as Patient_Name, Patient_SSN,Insurance_Serial_Number, Insurance_Expiry_Date,Company_Name as Insurance_Company, Phone_Number as Company_Contact
FROM CoveredBy
	INNER JOIN Patient
	 ON CoveredBy.Patient_ID = Patient.Patient_ID
	INNER JOIN Insurance
	 ON CoveredBy.Company_ID = Insurance. Company_ID;
GO

Select * from PatientsWithInsurance;


-------------------------------TRIGGERS----------------------------------------------------------
---------------------Trigger to update quantity of a medicine in inventory once purchased-------- 
GO
CREATE TRIGGER UpdateQuantity ON Prescribe_Medicine AFTER INSERT
AS
BEGIN
SET NOCOUNT ON;
DECLARE @Quantity_i INT
DECLARE @Medicine_ID INT

SELECT @Medicine_ID= i.Medicine_Inventory_ID, @Quantity_i= i.Quantity FROM INSERTED i;
UPDATE Medicine SET Quantity = Quantity - @Quantity_i WHERE Medicine_Inventory_ID = @Medicine_ID;
END;

-----------------------ENCRYPTION-----------------------------------------------------------------------

CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'SSNEncryption';

CREATE CERTIFICATE Certificate_test WITH SUBJECT = 'Protect my data';

CREATE SYMMETRIC KEY SymKey_test WITH ALGORITHM = AES_256 ENCRYPTION BY CERTIFICATE Certificate_test;

ALTER TABLE Doctor
ADD SSN_encrypt varbinary(MAX);

OPEN SYMMETRIC KEY SymKey_test    DECRYPTION BY CERTIFICATE Certificate_test;

GO
UPDATE dbo.Doctor
SET SSN_encrypt = EncryptByKey (Key_GUID('SymKey_test'), Doctor_SSN)
FROM dbo.Doctor;
GO

CLOSE SYMMETRIC KEY SymKey_test;

select * from Doctor;

OPEN SYMMETRIC KEY SymKey_test
        DECRYPTION BY CERTIFICATE Certificate_test;

SELECT *, CONVERT(varchar, DecryptByKey(SSN_encrypt)) AS 'Decrypted SSN'  FROM dbo.Doctor; 
