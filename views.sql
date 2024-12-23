-- view to summarize the number of appointments each month
CREATE VIEW MonthlyAppointments AS
SELECT 
    YEAR(AppointmentDate) AS Year,
    MONTH(AppointmentDate) AS Month,
    COUNT(*) AS TotalAppointments
FROM Appointments
GROUP BY YEAR(AppointmentDate), MONTH(AppointmentDate);
GO

-- view to analyze doctor performance by counting their appointments
CREATE VIEW DoctorPerformance AS
SELECT 
    d.FullName AS DoctorName,
    d.Specialization,
    COUNT(a.AppointmentsID) AS TotalAppointments
FROM Doctors d
LEFT JOIN Appointments a ON d.DoctorID = a.DoctorID
GROUP BY d.FullName, d.Specialization;
GO
