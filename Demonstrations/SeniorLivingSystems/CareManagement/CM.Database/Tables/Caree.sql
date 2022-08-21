CREATE TABLE CM.Caree
(
  CareeId     INT NOT NULL,
  FirstName   NVARCHAR(100) NOT NULL,
  MiddleName  NVARCHAR(100)     NULL,
  LastName    NVARCHAR(100) NOT NULL,
  CommunityId INT NOT NULL,
  CareTypeId  INT NOT NULL,
  CONSTRAINT pkcCaree PRIMARY KEY CLUSTERED (CareeId),
  CONSTRAINT fkCaree_Community FOREIGN KEY (CommunityId) REFERENCES CM.Community (CommunityId),
  CONSTRAINT fkCaree_CareType  FOREIGN KEY (CareTypeId)  REFERENCES CM.CareType  (CareTypeId)
)