USE [HospitalDB]
GO

-- index to optimize searches on the 'FullName' column in the 'Patients' table.
CREATE NONCLUSTERED INDEX [IDX_PatientName] ON [dbo].[Patients]
(
    [FullName] ASC
)
WITH (
    PAD_INDEX = OFF, 
    STATISTICS_NORECOMPUTE = OFF, 
    SORT_IN_TEMPDB = OFF, 
    DROP_EXISTING = OFF, 
    ONLINE = OFF, 
    ALLOW_ROW_LOCKS = ON, 
    ALLOW_PAGE_LOCKS = ON, 
    OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
)
GO

-- index to optimize searches on the 'AppointmentDate' column in the 'Appointments' table.
CREATE NONCLUSTERED INDEX [IDX_AppointmentDate] ON [dbo].[Appointments]
(
    [AppointmentDate] ASC
)
WITH (
    PAD_INDEX = OFF, 
    STATISTICS_NORECOMPUTE = OFF, 
    SORT_IN_TEMPDB = OFF, 
    DROP_EXISTING = OFF, 
    ONLINE = OFF, 
    ALLOW_ROW_LOCKS = ON, 
    ALLOW_PAGE_LOCKS = ON, 
    OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
)
GO

-- index to optimize searches on the 'Specialization' column in the 'Doctors' table.
CREATE NONCLUSTERED INDEX [IDX_DoctorSpecialization] ON [dbo].[Doctors]
(
    [Specialization] ASC
)
WITH (
    PAD_INDEX = OFF, 
    STATISTICS_NORECOMPUTE = OFF, 
    SORT_IN_TEMPDB = OFF, 
    DROP_EXISTING = OFF, 
    ONLINE = OFF, 
    ALLOW_ROW_LOCKS = ON, 
    ALLOW_PAGE_LOCKS = ON, 
    OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
)
GO
