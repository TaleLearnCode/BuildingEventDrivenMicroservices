CREATE TABLE LM.CareType
(
  CareTypeId             INT           NOT NULL,
  ExternalId             NVARCHAR(100)     NULL,
  CareTypeName           NVARCHAR(100) NOT NULL,
  CareTypeCode           NVARCHAR(20)      NULL,
  ForegroundColor        CHAR(6)           NULL,
  BackgroundColor        CHAR(6)           NULL,
  CONSTRAINT pkcCareType PRIMARY KEY CLUSTERED (CareTypeId)
)
GO

EXEC sp_addextendedproperty @level0name=N'LM', @level1name=N'CareType',                                 @value=N'Represents a type of care provided by a community.',                                                 @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'LM', @level1name=N'CareType', @level2name=N'CareTypeId',      @value=N'Identifier for the care type record.',                                                               @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'LM', @level1name=N'CareType', @level2name=N'ExternalId',      @value=N'The tenant''s identifier for the care type.',                                                        @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'LM', @level1name=N'CareType', @level2name=N'CareTypeName',    @value=N'The name of the care type.',                                                                         @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'LM', @level1name=N'CareType', @level2name=N'CareTypeCode',    @value=N'The code assigned to the care type.',                                                                @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'LM', @level1name=N'CareType', @level2name=N'ForegroundColor', @value=N'The foreground color to use when displaying the care type within the Glennis suite of products.',    @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'LM', @level1name=N'CareType', @level2name=N'BackgroundColor', @value=N'The background color to use when displaying the care type within the Glennis suite of products.',    @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'LM', @level1name=N'CareType', @level2name=N'pkcCareType',     @value=N'Defines the primary key for the CareType record using the CareTypeId column.',                       @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO