GRANT SELECT ON dbo.Patients TO DoctorRole;
GRANT SELECT, INSERT, UPDATE ON dbo.Appointments TO DoctorRole;

GRANT CONTROL ON DATABASE::HospitalDB TO AdminRole; --Grant Full Control of the Database to AdminRole

GRANT SELECT ON MedicalSupplies TO NurseRole;
GRANT SELECT ON Patients TO NurseRole;

GRANT SELECT, INSERT, UPDATE ON Billing TO BillingRole;

-- I created Logins for Users(AdminLogin,DoctorLogin,NurseLogin,BillingLogin), and I already created users by the GUI and maped it to the existing server-level login 

-- Admin User
EXEC sp_addrolemember 'AdminRole', 'AdminUser'; --assigning the users to our database roles

-- Doctor User
EXEC sp_addrolemember 'DoctorRole', 'DoctorUser';

-- Nurse User
EXEC sp_addrolemember 'NurseRole', 'NurseUser';

-- Billing User
EXEC sp_addrolemember 'BillingRole', 'BillingUser';

-- Verify Role Members
EXEC sp_helprolemember 'AdminRole';
EXEC sp_helprolemember 'DoctorRole';
EXEC sp_helprolemember 'NurseRole';
EXEC sp_helprolemember 'BillingRole';
