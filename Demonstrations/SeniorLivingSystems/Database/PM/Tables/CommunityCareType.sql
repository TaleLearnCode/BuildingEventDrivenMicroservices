CREATE TABLE PM.CommunityCareType
(
	CommunityCareTypeId INT NOT NULL IDENTITY(1,1),
	CommunityId         INT NOT NULL,
	CareTypeId          INT NOT NULL,
	CONSTRAINT pkcCommunityCareType PRIMARY KEY CLUSTERED (CommunityCareTypeId),
	CONSTRAINT fkCommunityCareType_Community      FOREIGN KEY (CommunityId) REFERENCES PM.Community (CommunityId),
	CONSTRAINT fkCommunityCareType_CareType       FOREIGN KEY (CareTypeId)  REFERENCES PM.CareType (CareTypeId)
)
GO

EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CommunityCareType',                                               @value=N'Represents the care types provided by a community.',                           @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CommunityCareType', @level2name=N'CommunityCareTypeId',           @value=N'Identifier for the community/care type association.',                          @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CommunityCareType', @level2name=N'CommunityId',                   @value=N'Identifier for the associated community.',                                     @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CommunityCareType', @level2name=N'CareTypeId',                    @value=N'Identifier for the associated care type.',                                     @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CommunityCareType', @level2name=N'fkCommunityCareType_CareType',  @value=N'Defines the relationship between the CommunityCareType and CareType tables.',  @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO																																																																																											
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CommunityCareType', @level2name=N'fkCommunityCareType_Community', @value=N'Defines the relationship between the CommunityCareType and Community tables.', @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO