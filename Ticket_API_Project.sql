CREATE TABLE Tickets (
    Id BIGINT PRIMARY KEY IDENTITY,
    Time DATETIME,
    PassengerName NVARCHAR(50),
    PassengerSSN BIGINT,
    [To] NVARCHAR(50),
    [From] NVARCHAR(50),
    Price INT,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    ConfidentialComment NVARCHAR(50) DEFAULT 'Normal'
);

select * from Tickets