CREATE DATABASE HospitalDB;

USE HospitalDB;

--///////////////////////////////////////// Creating tables

create table Patients (

PatientID INT PRIMARY KEY IDENTITY,
FullName nvarchar(100) not null, 
DOB DATE,
Phone VARBINARY(MAX), ---Encrypted data needs to be stored in a column of type VARBINARY
Email nvarchar(100),
Gender nvarchar(10)

);


create table Doctors (
DoctorID INT PRIMARY KEY IDENTITY,
FullName nvarchar(100) not null,
Specialization nvarchar(100),
Phone VARBINARY(MAX), --Encrypted data needs to be stored in a column of type VARBINARY
Email nvarchar(100),
ExprienceYears INT,

);



create table Appointments (
    AppointmentsID INT PRIMARY KEY IDENTITY,
    PatientID INT FOREIGN KEY REFERENCES Patients(PatientID),
    DoctorID INT FOREIGN KEY REFERENCES Doctors(DoctorID),
    AppointmentDate DATETIME,
    AppointmentStatus NVARCHAR(50)
);

create table MedicalSupplies (
    SupplyID INT PRIMARY KEY IDENTITY,
    FullName NVARCHAR(100) not null,
    Stock INT not null,
    UnitPrice DECIMAL(10, 2) not null,
    LastUpdated DATETIME DEFAULT GETDATE()
);

create table Billing (
    BillID INT PRIMARY KEY IDENTITY,
    PatientID INT not null FOREIGN KEY REFERENCES Patients(PatientID),
    AppointmentsID INT not null FOREIGN KEY REFERENCES Appointments(AppointmentsID),
    Amount DECIMAL(10, 2) not null,
    PaymentStatus NVARCHAR(50),
    BillingDate DATETIME DEFAULT GETDATE()
);


CREATE TABLE UserRoles (
    RoleID INT PRIMARY KEY IDENTITY,
    RoleName NVARCHAR(50) not null,
    Description NVARCHAR(255)
);


CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY,
    Username NVARCHAR(50) not null,
    PasswordHash NVARCHAR(255) not null,
    RoleID INT not null FOREIGN KEY REFERENCES UserRoles(RoleID),
    CreatedAt DATETIME DEFAULT GETDATE()
);

--///////////////////////////////////////// Inserting sample data

INSERT INTO Patients (FullName, DOB, Email, Gender)
VALUES 
('Ahmed Al-Saud', '1990-03-15', 'ahmed.alsaud@gmail.com', 'Male'),
('Fatimah Al-Zahrani', '1985-08-22', 'fatimah.zahrani@hotmail.com', 'Female'),
('Saleh Al-Ghamdi', '1978-12-05',  'saleh.ghamdi@yahoo.com', 'Male'),
('Maha Al-Faisal', '1995-01-17', 'maha.faisal@outlook.com', 'Female');

INSERT INTO Doctors (FullName, Specialization, Email, ExprienceYears)
VALUES
('Dr. Khalid Al-Mutairi', 'Cardiology', 'dr.khalid.mutairi@hospital.sa', 12),
('Dr. Aisha Al-Otaibi', 'Pediatrics', 'dr.aisha.otaibi@hospital.sa', 8),
('Dr. Fahad Al-Qahtani', 'Orthopedics', 'dr.fahad.qahtani@hospital.sa', 10),
('Dr. Reem Al-Anazi', 'Dermatology', 'dr.reem.anazi@hospital.sa', 5);

INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, AppointmentStatus)
VALUES
(13, 5, '2024-01-05 10:00:00', 'Scheduled'),
(14, 6, '2024-01-06 14:30:00', 'Completed'),
(15, 7, '2024-01-07 09:00:00', 'Scheduled'),
(16, 8, '2024-01-08 16:00:00', 'Cancelled');

INSERT INTO MedicalSupplies (FullName, Stock, UnitPrice, LastUpdated)
VALUES
('Syringe', 200, 1.50, GETDATE()),
('Gloves', 500, 0.75, GETDATE()),
('Antiseptic Solution', 150, 10.00, GETDATE()),
('Bandages', 300, 2.00, GETDATE());

INSERT INTO Billing (PatientID, AppointmentsID, Amount, PaymentStatus, BillingDate)
VALUES
(13, 1, 250.00, 'Paid', GETDATE()),
(14, 2, 300.00, 'Pending', GETDATE()),
(15, 3, 150.00, 'Paid', GETDATE()),
(16, 4, 200.00, 'Pending', GETDATE());

INSERT INTO UserRoles (RoleName, Description)
VALUES
('Admin', 'Full access to the system'),
('Doctor', 'Access to patient data and appointments'),
('Nurse', 'Access to medical supplies and patient data'),
('Billing', 'Access to billing and payments');

INSERT INTO Users (Username, PasswordHash, RoleID, CreatedAt)
VALUES
('admin', 'hashedpassword123', 1, GETDATE()),
('khalid.mutairi', 'hashedpassword123', 2, GETDATE()),
('aisha.otaibi', 'hashedpassword123', 2, GETDATE()),
('billinguser', 'hashedpassword123', 4, GETDATE());

