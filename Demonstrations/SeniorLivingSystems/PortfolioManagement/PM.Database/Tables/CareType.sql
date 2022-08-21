CREATE TABLE PM.CareType
(
  CareTypeId             INT           NOT NULL IDENTITY(1,1),
  ExternalId             NVARCHAR(100)     NULL,
  CareTypeName           NVARCHAR(100) NOT NULL,
  CareTypeCode           NVARCHAR(20)      NULL,
  ForegroundColor        CHAR(6)           NULL,
  BackgroundColor        CHAR(6)           NULL,
  PriceVarianceThreshold INT               NULL,
  SortOrder              INT           NOT NULL,
  RowStatusId            INT           NOT NULL CONSTRAINT dfCareType_RowStatusId DEFAULT(1)
  CONSTRAINT pkcCareType PRIMARY KEY CLUSTERED (CareTypeId)
)
GO

CREATE UNIQUE NONCLUSTERED INDEX unqCareType_ExternalId ON PM.CareType (ExternalId) WHERE ExternalId IS NOT NULL
GO

EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CareType',                                            @value=N'Represents a type of care provided by a community.',                                                 @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CareType', @level2name=N'CareTypeId',                 @value=N'Identifier for the care type record.',                                                               @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CareType', @level2name=N'ExternalId',                 @value=N'The tenant''s identifier for the care type.',                                                        @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CareType', @level2name=N'CareTypeName',               @value=N'The name of the care type.',                                                                         @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CareType', @level2name=N'CareTypeCode',               @value=N'The code assigned to the care type.',                                                                @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CareType', @level2name=N'ForegroundColor',            @value=N'The foreground color to use when displaying the care type within the Glennis suite of products.',    @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CareType', @level2name=N'BackgroundColor',            @value=N'The background color to use when displaying the care type within the Glennis suite of products.',    @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CareType', @level2name=N'PriceVarianceThreshold',     @value=N'The threshold of price variance before hiding pricing within the PPM listing services.',             @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CareType', @level2name=N'RowStatusId',                @value=N'Identifier of the care type record status (i.e. enabled, disabled, etc).',                           @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CareType', @level2name=N'pkcCareType',                @value=N'Defines the primary key for the CareType record using the CareTypeId column.',                       @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CareType', @level2name=N'dfCareType_RowStatusId',     @value=N'Defines the default value for the RowStatus column as 1 (enabled).',                                 @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO