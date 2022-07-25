CREATE TABLE LM.Lease
(
  LeaseId       INT          NOT NULL IDENTITY(1,1),
  LeaseeId      INT          NOT NULL,
  CommunityId   INT          NOT NULL,
  EffectiveDate DATE         NOT NULL,
  PrimaryCost   DECIMAL(7,2) NOT NULL,
  CONSTRAINT pkcLease PRIMARY KEY CLUSTERED (LeaseId),
  CONSTRAINT fkLease_Leasee    FOREIGN KEY (LeaseeId)    REFERENCES LM.Leasee (LeaseeId),
  CONSTRAINT fkLease_Community FOREIGN KEY (CommunityId) REFERENCES LM.Community (CommunityId)
)