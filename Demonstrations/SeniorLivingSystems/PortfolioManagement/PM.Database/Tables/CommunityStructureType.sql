CREATE TABLE PM.CommunityStructureType
(
	CommunityStructureTypeId   INT           NOT NULL IDENTITY(1,1),
	ExternalId                 NVARCHAR(100),
	CommunityStructureTypeName NVARCHAR(100) NOT NULL,
	SortOrder                  INT               NULL,
	RowStatusId                INT           NOT NULL CONSTRAINT dfCommunityStructureType_RowStatusId DEFAULT(1),
	CONSTRAINT pkcCommunityStructureType PRIMARY KEY CLUSTERED (CommunityStructureTypeId)
)
GO

CREATE UNIQUE NONCLUSTERED INDEX unqCommunityStructureType_ExternalId ON PM.CommunityStructureType (ExternalId) WHERE ExternalId IS NOT NULL
GO

EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CommunityStructureType',                                                            @value=N'Represents the type of a community structure (floor, building, etc.).',                                           @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CommunityStructureType', @level2name=N'CommunityStructureTypeId',                   @value=N'Identifier of the community structure type record.',                                                              @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CommunityStructureType', @level2name=N'ExternalId',                                 @value=N'The tenant''s identifier for the community structure type.',                                                      @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CommunityStructureType', @level2name=N'CommunityStructureTypeName',                 @value=N'The name of the community structure type.',                                                                       @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CommunityStructureType', @level2name=N'SortOrder',                                  @value=N'The sorting order of the community structure type among the other community structure types.',                    @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CommunityStructureType', @level2name=N'RowStatusId',                                @value=N'Identifier of the community structure record status (i.e. enabled, disabled, etc).',                              @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CommunityStructureType', @level2name=N'pkcCommunityStructureType',                  @value=N'Defines the primary key for the CommunityStructureType table using the CommunityStructureTypeId column.',         @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CommunityStructureType', @level2name=N'dfCommunityStructureType_RowStatusId',       @value=N'Defines the default value for the RowStatusId column as 1 (enabled).',                                            @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO