CREATE TABLE PM.RoomCareType
(
  RoomCareTypeId INT           NOT NULL IDENTITY(1,1),
  RoomId         INT           NOT NULL,
  CareTypeId     INT           NOT NULL,
  ExternalId     NVARCHAR(100)     NULL,
  CONSTRAINT pkcRoomCareType PRIMARY KEY CLUSTERED (RoomCareTypeId),
  CONSTRAINT fkRoomCareType_Room     FOREIGN KEY (RoomId)     REFERENCES PM.Room (RoomId),
  CONSTRAINT fkRoomCareType_CareType FOREIGN KEY (CareTypeId) REFERENCES PM.CareType (CareTypeId)
)
GO

EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomCareType',                                         @value=N'Defines the care types assigned to a particular room.',                                              @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomCareType', @level2name=N'RoomCareTypeId',          @value=N'Identifier for the room/care type association record.',                                              @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomCareType', @level2name=N'RoomId',                  @value=N'Identifier for the associated room record.',                                                         @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomCareType', @level2name=N'CareTypeId',              @value=N'Identifier for the associated care type record.',                                                    @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomCareType', @level2name=N'ExternalId',              @value=N'The operator''s identifier for the room/care type association.',                                     @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomCareType', @level2name=N'pkcRoomCareType',         @value=N'Defines the primary key for the RoomCareType record using the RoomId and CareTypeId columns.',       @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomCareType', @level2name=N'fkRoomCareType_Room',     @value=N'Defines the relationship between the RoomCareType and Room tables using the RoomId column.',         @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomCareType', @level2name=N'fkRoomCareType_CareType', @value=N'Defines the relationship between the RoomCareType and CareType tables using the CareTypeId column.', @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO