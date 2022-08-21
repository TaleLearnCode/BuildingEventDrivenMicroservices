CREATE TABLE RM.ResidentStatus
(
  ResidentStatusId   INT           NOT NULL IDENTITY(1,1),
  ExternalId         NVARCHAR(100)     NULL,
  ResidentStatusName NVARCHAR(100) NOT NULL,
  SortOrder          INT           NOT NULL,
  RowStatusId        INT           NOT NULL CONSTRAINT dfResidentStatus_RowStatusId DEFAULT(1),
  CONSTRAINT pkcResidentStatus PRIMARY KEY CLUSTERED (ResidentStatusId)
)
GO