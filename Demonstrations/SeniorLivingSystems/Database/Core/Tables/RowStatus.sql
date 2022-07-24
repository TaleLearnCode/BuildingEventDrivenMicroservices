CREATE TABLE Core.RowStatus
(
  RowStatusId   INT          NOT NULL,
  RowStatusName VARCHAR(100) NOT NULL,
  IsActive      BIT          NOT NULL,
  CONSTRAINT pkcRowStatus PRIMARY KEY (RowStatusId)
)
GO

EXEC sp_addextendedproperty @level0name=N'Core', @level1name=N'RowStatus',                                      @value=N'Represents the system-level statuses for database rows.',                       @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'Core', @level1name=N'RowStatus', @level2name=N'RowStatusId',          @value=N'Identifier of the row status record.',                                          @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'Core', @level1name=N'RowStatus', @level2name=N'RowStatusName',        @value=N'The name of the row status.',                                                   @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'Core', @level1name=N'RowStatus', @level2name=N'IsActive',             @value=N'Flag indicating whether the row status is active or not.',                      @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'Core', @level1name=N'RowStatus', @level2name=N'pkcRowStatus',         @value=N'Defines the primary key for the RowStatus table using the RowStatusId column.', @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO