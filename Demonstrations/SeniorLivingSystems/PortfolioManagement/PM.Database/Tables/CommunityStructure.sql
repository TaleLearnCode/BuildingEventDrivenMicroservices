CREATE TABLE PM.CommunityStructure
(
  CommunityStructureId     INT                                                NOT NULL IDENTITY(1,1),
  ExternalId               NVARCHAR(100)                                          NULL,
  ParentId                 INT                                                    NULL,
  CommunityId              INT                                                NOT NULL,
  CommunityStructureTypeId INT                                                NOT NULL,
  CommunityStructureName   NVARCHAR(100)                                      NOT NULL,
  CommunityStructureCode   NVARCHAR(20)                                           NULL,
  SortOrder                INT                                                    NULL,
  RowStatusId              INT                                                NOT NULL CONSTRAINT dfCommunityStructure_RowStatusId DEFAULT(1),
  CONSTRAINT pkcCommunityStructure PRIMARY KEY CLUSTERED (CommunityStructureId),
  CONSTRAINT fkCommunityStructure_CommunityStructure     FOREIGN KEY (ParentId)                 REFERENCES PM.CommunityStructure (CommunityStructureId),
  CONSTRAINT fkCommunityStructure_Community              FOREIGN KEY (CommunityId)              REFERENCES PM.Community (CommunityId),
  CONSTRAINT fkCommunityStructure_CommunityStructureType FOREIGN KEY (CommunityStructureTypeId) REFERENCES PM.CommunityStructureType (CommunityStructureTypeId)
)
GO

CREATE UNIQUE NONCLUSTERED INDEX unqCommunityStructure_ExternalId ON PM.CommunityStructureType (ExternalId) WHERE ExternalId IS NOT NULL
GO

EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CommunityStructure',                                                             @value=N'Represents an element of the structure (floor, building, etc.) within a community.',                          @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CommunityStructure', @level2name=N'CommunityStructureId',                        @value=N'Identifier of the community structure record.',                                                               @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CommunityStructure', @level2name=N'ExternalId',                                  @value=N'The tenant''s identifier for the community structure.',                                                       @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CommunityStructure', @level2name=N'ParentId',                                    @value=N'Identifier of the community structure''s parent (example the building a floor is in).',                       @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CommunityStructure', @level2name=N'CommunityId',                                 @value=N'Identifier of the community the element is defining the structure of.',                                       @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CommunityStructure', @level2name=N'CommunityStructureTypeId',                    @value=N'Identifier of the community structure''s type.',                                                              @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CommunityStructure', @level2name=N'CommunityStructureName',                      @value=N'The name of the community structure.',                                                                        @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CommunityStructure', @level2name=N'CommunityStructureCode',                      @value=N'The code for the community structure.',                                                                       @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CommunityStructure', @level2name=N'RowStatusId',                                 @value=N'Identifier of the status of the community attribute type record (i.e. enabled, disabled, etc).',              @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CommunityStructure', @level2name=N'SortOrder',                                   @value=N'The sorting order of the community structure among the other community structures.',                          @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CommunityStructure', @level2name=N'pkcCommunityStructure',                       @value=N'Defines the primary key for the CommunityStructure table using the CommunityStructureId column.',             @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CommunityStructure', @level2name=N'fkCommunityStructure_CommunityStructure',     @value=N'Defines the relationship between the CommunityStructure and Tenant.User tables for the CreatedById column.',  @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CommunityStructure', @level2name=N'fkCommunityStructure_Community',              @value=N'Defines the relationship between the CommunityStructure and Hub.Community tables.',                           @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CommunityStructure', @level2name=N'fkCommunityStructure_CommunityStructureType', @value=N'Defines the relationship between the CommunityStructure and CommunityStructureType tables.',                  @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO