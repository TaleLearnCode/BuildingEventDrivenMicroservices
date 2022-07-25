CREATE TABLE LM.Leasee
(
  LeaseeId INT NOT NULL,
  CommunityId INT NOT NULL,
  CareTypeId  INT NOT NULL,
  CONSTRAINT pkcCaree PRIMARY KEY CLUSTERED (LeaseeId),
  CONSTRAINT fkCaree_Community FOREIGN KEY (CommunityId) REFERENCES LM.Community (CommunityId),
  CONSTRAINT fkCaree_CareType  FOREIGN KEY (CareTypeId)  REFERENCES LM.CareType  (CareTypeId)
)