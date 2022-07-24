CREATE TABLE PM.RoomRate
(
  RoomRateId         INT                                                NOT NULL IDENTITY(1,1),
  ExternalId         NVARCHAR(100)                                          NULL,
  RoomId             INT                                                NOT NULL,
  PayorTypeId        INT                                                NOT NULL,
  EffectiveStartDate DATETIME2                                          NOT NULL CONSTRAINT dfRoomRate_EffectiveStartDate DEFAULT(GETUTCDATE()),
  EffectiveEndDate   DATETIME2                                          NOT NULL CONSTRAINT dfRoomRate_EffectiveEndDate DEFAULT('9999-12-31 23:59:59'),
  BaseRate           SMALLMONEY                                         NOT NULL,
  DailyRate          SMALLMONEY                                             NULL,
  MinimumRate        SMALLMONEY                                         NOT NULL,
  MaximumRate        SMALLMONEY                                         NOT NULL,
  DiscountedRate     SMALLMONEY                                             NULL,
  AdministrativeFee  SMALLMONEY                                             NULL,
  MaxConcession      SMALLMONEY                                             NULL,
  RowStatusId        INT                                                NOT NULL CONSTRAINT dfRoomRate_RowStatusId DEFAULT(1),
  ValidFrom          DATETIME2     GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
  ValidTo            DATETIME2     GENERATED ALWAYS AS ROW END   HIDDEN NOT NULL,
  PERIOD FOR SYSTEM_TIME (ValidFrom, ValidTo),
  CONSTRAINT pkcRoomRate PRIMARY KEY CLUSTERED (RoomRateId),
  CONSTRAINT fkRoomRate_Room         FOREIGN KEY (RoomId)         REFERENCES PM.Room(RoomId),
  CONSTRAINT fkRoomRate_PayorType    FOREIGN KEY (PayorTypeId)    REFERENCES PM.PayorType(PayorTypeId)
) WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = PM.RoomRateHistory))
GO

CREATE NONCLUSTERED INDEX ncixRoomRate_EffectiveDates
ON PM.RoomRate (PayorTypeId, RoomId, EffectiveStartDate, EffectiveEndDate)
GO

CREATE NONCLUSTERED INDEX INDEX_RoomRateID
ON PM.RoomRate (RoomId) INCLUDE([MinimumRate])
GO

EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomRate',                                               @value=N'Represents the rate information for a room for a specific set of dates..',            @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomRate', @level2name=N'RoomRateId',                    @value=N'Identifier of the room rate.',                                                        @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomRate', @level2name=N'ExternalId',                    @value=N'The tenant''s identifier for the room rate.',                                         @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomRate', @level2name=N'RoomId',                        @value=N'Identifier of the associated room.',                                                  @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomRate', @level2name=N'PayorTypeId',                   @value=N'Identifier of the associated payor type.',                                            @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomRate', @level2name=N'EffectiveStartDate',            @value=N'The date and time the rate information is effective.',                                @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomRate', @level2name=N'EffectiveEndDate',              @value=N'The date and time the rate information is no longer effective.',                      @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomRate', @level2name=N'BaseRate',                      @value=N'The base (MSRP) rate for the room, room rate type, and payor type.',                  @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomRate', @level2name=N'DailyRate',                     @value=N'The daily rate for the room.',                                                        @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomRate', @level2name=N'MinimumRate',                   @value=N'The minimum amount accepted for the room.',                                           @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomRate', @level2name=N'MaximumRate',                   @value=N'The maximum amount accepted for the room.',                                           @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomRate', @level2name=N'DiscountedRate',                @value=N'The discounted rate (starting at) for the room.',                                     @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomRate', @level2name=N'AdministrativeFee',             @value=N'The standard administrative fee applied to the room.',                                @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomRate', @level2name=N'MaxConcession',                 @value=N'The max concession allowed for the room.',                                            @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomRate', @level2name=N'ValidFrom',                     @value=N'The start date and time for the valid period of the current record.',                 @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomRate', @level2name=N'ValidTo',                       @value=N'The end date and time for the valid period of the current record.',                   @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomRate', @level2name=N'pkcRoomRate',                   @value=N'Defines the primary key for the RoomRateType table using the RoomRateTypeId column.', @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomRate', @level2name=N'fkRoomRate_Room',               @value=N'Defines the relationship between the RoomRate and Room records.',                     @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomRate', @level2name=N'fkRoomRate_PayorType',          @value=N'Defines the relationship between the RoomRate and PayerType records.',                @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomRate', @level2name=N'dfRoomRate_EffectiveStartDate', @value=N'Defines the default value for the EffectiveStartDate column as the current UTC date/time.',                      @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomRate', @level2name=N'dfRoomRate_EffectiveEndDate',   @value=N'Defines the default value for the EffectiveStartDate column as 9999-12-31 23:59:59.',                      @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO