-- create a master Key
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'MASTERKEY123';
-- //////////////////////////////////////////////////////// Patient
-- Create a Certificate for Patient Data Encryption
CREATE CERTIFICATE PatientCert
WITH SUBJECT = 'Patient Data Encryption';
GO

--  create a Symmetric Key for Patient Data
CREATE SYMMETRIC KEY PatientKey WITH ALGORITHM = AES_256 ENCRYPTION BY CERTIFICATE PatientCert;

--  encrypting and inserting Patient Phone Numbers
OPEN SYMMETRIC KEY PatientKey DECRYPTION BY CERTIFICATE PatientCert;
INSERT INTO Patients (FullName, DOB, Phone, Email, Gender)
VALUES 
('Ahmed Al-Saud', '1990-03-15', EncryptByKey(Key_GUID('PatientKey'), CONVERT(NVARCHAR(MAX), '0501234567')), 'ahmed.alsaud@gmail.com', 'Male'),
('Fatimah Al-Zahrani', '1985-08-22', EncryptByKey(Key_GUID('PatientKey'), CONVERT(NVARCHAR(MAX), '0539876543')), 'fatimah.zahrani@hotmail.com', 'Female'),
('Saleh Al-Ghamdi', '1978-12-05', EncryptByKey(Key_GUID('PatientKey'), CONVERT(NVARCHAR(MAX), '0565432198')), 'saleh.ghamdi@yahoo.com', 'Male'),
('Maha Al-Faisal', '1995-01-17', EncryptByKey(Key_GUID('PatientKey'), CONVERT(NVARCHAR(MAX), '0598765432')), 'maha.faisal@outlook.com', 'Female');
CLOSE SYMMETRIC KEY PatientKey;

-- //////////////////////////////////////////////////////// doing the same thing for Doctor table
CREATE CERTIFICATE DoctorCert
WITH SUBJECT = 'Doctor Data Encryption';

CREATE SYMMETRIC KEY DoctorKey 
WITH ALGORITHM = AES_256 
ENCRYPTION BY CERTIFICATE DoctorCert;

OPEN SYMMETRIC KEY DoctorKey DECRYPTION BY CERTIFICATE DoctorCert;
INSERT INTO Doctors (FullName, Specialization, Phone, Email, ExprienceYears)
VALUES
('Dr. Khalid Al-Mutairi', 'Cardiology', EncryptByKey(Key_GUID('DoctorKey'), CONVERT(NVARCHAR(MAX), '0542345678')), 'dr.khalid.mutairi@hospital.sa', 12),
('Dr. Aisha Al-Otaibi', 'Pediatrics', EncryptByKey(Key_GUID('DoctorKey'), CONVERT(NVARCHAR(MAX), '0587654321')), 'dr.aisha.otaibi@hospital.sa', 8),
('Dr. Fahad Al-Qahtani', 'Orthopedics', EncryptByKey(Key_GUID('DoctorKey'), CONVERT(NVARCHAR(MAX), '0556789123')), 'dr.fahad.qahtani@hospital.sa', 10),
('Dr. Reem Al-Anazi', 'Dermatology', EncryptByKey(Key_GUID('DoctorKey'), CONVERT(NVARCHAR(MAX), '0574321987')), 'dr.reem.anazi@hospital.sa', 5)
CLOSE SYMMETRIC KEY DoctorKey;
