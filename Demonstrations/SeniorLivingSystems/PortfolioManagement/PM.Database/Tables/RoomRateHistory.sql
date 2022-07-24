CREATE TABLE PM.RoomRateHistory
(
  RoomRateId         INT           NOT NULL,
  ExternalId         NVARCHAR(100)     NULL,
  RoomId             INT           NOT NULL,
  PayorTypeId        INT           NOT NULL,
  EffectiveStartDate DATETIME2     NOT NULL,
  EffectiveEndDate   DATETIME2     NOT NULL,
  BaseRate           SMALLMONEY    NOT NULL,
  DailyRate          SMALLMONEY        NULL,
  MinimumRate        SMALLMONEY    NOT NULL,
  MaximumRate        SMALLMONEY    NOT NULL,
  DiscountedRate     SMALLMONEY        NULL,
  AdministrativeFee  SMALLMONEY        NULL,
  MaxConcession      SMALLMONEY        NULL,
  RowStatusId        INT           NOT NULL,
  ValidFrom          DATETIME2     NOT NULL,
  ValidTo            DATETIME2     NOT NULL
)
GO

EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomRateHistory',                                    @value=N'Represents the rate information for a room for a specific set of dates..',            @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomRateHistory', @level2name=N'RoomRateId',         @value=N'Identifier of the room rate.',                                                        @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomRateHistory', @level2name=N'ExternalId',         @value=N'The tenant''s identifier for the room rate.',                                         @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomRateHistory', @level2name=N'RoomId',             @value=N'Identifier of the associated room.',                                                  @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomRateHistory', @level2name=N'PayorTypeId',        @value=N'Identifier of the associated payor type.',                                            @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomRateHistory', @level2name=N'EffectiveStartDate', @value=N'The date and time the rate information is effective.',                                @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomRateHistory', @level2name=N'EffectiveEndDate',   @value=N'The date and time the rate information is no longer effective.',                      @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomRateHistory', @level2name=N'BaseRate',           @value=N'The base (MSRP) rate for the room, room rate type, and payor type.',                  @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomRateHistory', @level2name=N'DailyRate',          @value=N'The daily rate for the room.',                                                        @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomRateHistory', @level2name=N'MinimumRate',        @value=N'The minimum amount accepted for the room.',                                           @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomRateHistory', @level2name=N'MaximumRate',        @value=N'The maximum amount accepted for the room.',                                           @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomRateHistory', @level2name=N'DiscountedRate',     @value=N'The discounted rate (starting at) for the room.',                                     @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomRateHistory', @level2name=N'AdministrativeFee',  @value=N'The standard administrative fee applied to the room.',                                @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomRateHistory', @level2name=N'MaxConcession',      @value=N'The max concession allowed for the room.',                                            @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomRateHistory', @level2name=N'ValidFrom',          @value=N'The start date and time for the valid period of the current record.',                 @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomRateHistory', @level2name=N'ValidTo',            @value=N'The end date and time for the valid period of the current record.',                   @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO