CREATE TABLE PM.CommunityRoomType
(
  CommunityRoomTypeId INT NOT NULL IDENTITY(1,1),
  CommunityId         INT NOT NULL,
  RoomTypeId          INT NOT NULL,
  CareTypeId          INT NOT NULL,
  FloorPlanId         INT     NULL,
  CONSTRAINT pkcCommunityRoomType PRIMARY KEY CLUSTERED (CommunityRoomTypeId),
  CONSTRAINT fkCommunityRoomType_Community    FOREIGN KEY (CommunityId) REFERENCES PM.Community (CommunityId),
  CONSTRAINT fkCommunityRoomType_CareType     FOREIGN KEY (CareTypeId)  REFERENCES PM.CareType (CareTypeId),
  CONSTRAINT fkCommunityRoomType_DigitalAsset FOREIGN KEY (FloorPlanId) REFERENCES PM.DigitalAsset (DigitalAssetId)
)
GO

EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CommunityRoomType',                                                  @value=N'Represents the relationship between the RoomType and Community tables.',                                        @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CommunityRoomType', @level2name=N'CommunityRoomTypeId',              @value=N'Identifier of the community room type record.',                                                                 @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CommunityRoomType', @level2name=N'CommunityId',                      @value=N'Identifier of the associated Community record.',                                                                @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CommunityRoomType', @level2name=N'RoomTypeId',                       @value=N'Identifier of the associated RoomType record.',                                                                 @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CommunityRoomType', @level2name=N'CareTypeId',                       @value=N'Identifier of the associated CareType record.',                                                                 @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CommunityRoomType', @level2name=N'FloorPlanId',                      @value=N'Identifier of the digital asset representing the floor plan for the room type within the community.',           @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CommunityRoomType', @level2name=N'pkcCommunityRoomType',             @value=N'Defines the primary key for the CommunityRoomType table using the CommunityRoomTypeId column.',                 @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CommunityRoomType', @level2name=N'fkCommunityRoomType_Community',    @value=N'Defines the relationship between the CommunityRoomType and Hub.Community tables using the CommunityId column.', @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CommunityRoomType', @level2name=N'fkCommunityRoomType_DigitalAsset', @value=N'Defines the relationship between the CommunityRoomType and DigitalAsset tables using the FloorPlanId column.',  @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO