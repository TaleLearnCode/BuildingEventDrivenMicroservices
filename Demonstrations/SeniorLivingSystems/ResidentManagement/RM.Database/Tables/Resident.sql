CREATE TABLE RM.Resident
(
  ResidentId       INT           NOT NULL IDENTITY(1,1),
  ExternalId       NVARCHAR(100) NOT NULL,
  CommunityId      INT           NOT NULL,
  FirstName        NVARCHAR(100) NOT NULL,
  MiddleName       NVARCHAR(100)     NULL,
  LastName         NVARCHAR(100) NOT NULL,
  Birthdate        DATE          NOT NULL,
  CareTypeId       INT           NOT NULL,
  ResidentStatusId INT           NOT NULL,
  CONSTRAINT pkcResident PRIMARY KEY CLUSTERED (ResidentId),
  CONSTRAINT fkResident_Community      FOREIGN KEY (CommunityId)      REFERENCES RM.Community (CommunityId),
  CONSTRAINT fkResident_CareType       FOREIGN KEY (CareTypeId)       REFERENCES RM.CareType (CareTypeId),
  CONSTRAINT fkResident_ResidentStatus FOREIGN KEY (ResidentStatusId) REFERENCES RM.ResidentStatus (ResidentStatusId)
)
GO