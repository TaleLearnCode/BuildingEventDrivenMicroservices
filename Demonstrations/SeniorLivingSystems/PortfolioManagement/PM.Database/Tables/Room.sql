CREATE TABLE PM.Room
(
	RoomId               INT                                                NOT NULL IDENTITY(1,1),
	CommunityId          INT                                                NOT NULL,
	ExternalId           NVARCHAR(100)                                          NULL,
	CommunityStructureId INT                                                NOT NULL,
	RoomNumber           NVARCHAR(100)                                      NOT NULL,
	RoomName             NVARCHAR(100)                                          NULL,
	IsFeatured           BIT                                                NOT NULL CONSTRAINT dfRoom_IsFeatured DEFAULT(0),
	RoomAvailabilityId   INT                                                NOT NULL,
	RoomTypeId           INT                                                NOT NULL,
	ContentId            INT                                                    NULL,
	RoomArea             DECIMAL(7,2)                                           NULL,
	FloorPlanId          INT                                                    NULL,
	AssignedCareTypeId   INT                                                    NULL,
	SortOrder            INT                                                    NULL,
	RowStatusId          INT                                                NOT NULL CONSTRAINT dfRoom_RowStatusId DEFAULT(1),
	ValidFrom            DATETIME2     GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
	ValidTo              DATETIME2     GENERATED ALWAYS AS ROW END   HIDDEN NOT NULL,
	PERIOD FOR SYSTEM_TIME (ValidFrom, ValidTo),
	CONSTRAINT pkcRoom PRIMARY KEY CLUSTERED (RoomId),
	CONSTRAINT fkRoom_Community          FOREIGN KEY (CommunityId)          REFERENCES PM.Community (CommunityId),
	CONSTRAINT fkRoom_CommunityStructure FOREIGN KEY (CommunityStructureId) REFERENCES PM.CommunityStructure (CommunityStructureId),
	CONSTRAINT fkRoom_RoomAvailability   FOREIGN KEY (RoomAvailabilityId)   REFERENCES PM.RoomAvailability (RoomAvailabilityId),
	CONSTRAINT fkRoom_RoomType           FOREIGN KEY (RoomTypeId)           REFERENCES PM.RoomType (RoomTypeId),
	CONSTRAINT fkRoom_Content            FOREIGN KEY (ContentId)            REFERENCES PM.Content (ContentId),
	CONSTRAINT fkRoom_DigitalAsset       FOREIGN KEY (FloorPlanId)          REFERENCES PM.DigitalAsset (DigitalAssetId),
	CONSTRAINT fkRoom_CareType           FOREIGN KEY (AssignedCareTypeId)   REFERENCES PM.CareType (CareTypeId)
) WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = PM.RoomHistory))
GO

CREATE NONCLUSTERED INDEX idxRoom_CommunityId
ON PM.Room (CommunityId)
GO

CREATE UNIQUE NONCLUSTERED INDEX unqRoom_ExternalId ON PM.Room (ExternalId) WHERE ExternalId IS NOT NULL
GO

EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'Room',                                           @value=N'Represents a room within a community.',                                                                                      @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'Room', @level2name=N'RoomId',                    @value=N'Identifier of the room record.',                                                                                             @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'Room', @level2name=N'ExternalId',                @value=N'Identifier for the room from an external system.',                                                                           @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'Room', @level2name=N'CommunityStructureId',      @value=N'Identifier of the associated community structure element (floor, building, etc.).',                                          @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'Room', @level2name=N'CommunityId',               @value=N'Identifier of the associated community record.',                                                                             @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'Room', @level2name=N'RoomNumber',                @value=N'The number of the room.',                                                                                                    @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'Room', @level2name=N'RoomName',                  @value=N'The name of the room.',                                                                                                      @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'Room', @level2name=N'IsFeatured',                @value=N'Flag indicating whether the room is considered as featured.',                                                                @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'Room', @level2name=N'RoomAvailabilityId',        @value=N'Identifier of the associated room availability record.',                                                                     @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'Room', @level2name=N'RoomTypeId',                @value=N'Identifier of the associated room type record.',                                                                             @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'Room', @level2name=N'ContentId',                 @value=N'Identifier of the associated content record.',                                                                               @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'Room', @level2name=N'RoomArea',                  @value=N'The size of the room. The measurement type is based off of Community.RoomMeasurement.',                                      @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'Room', @level2name=N'FloorPlanId',               @value=N'Identifier of the digital asset representing the floor plan for the room when it differs from the room type''s floor plan.', @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'Room', @level2name=N'SortOrder',                 @value=N'The sorting order of the room among the other rooms.',                                                                       @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'Room', @level2name=N'ValidFrom',                 @value=N'The start date and time for the valid period of the current record.',                                                        @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'Room', @level2name=N'ValidTo',                   @value=N'The end date and time for the valid period of the current record.',                                                          @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO 
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'Room', @level2name=N'pkcRoom',                   @value=N'Defines the primary key for the Room table using the RoomId column.',                                                        @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'Room', @level2name=N'fkRoom_Community',          @value=N'Defines the relationship between the Room and Community tables.',                                                            @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'Room', @level2name=N'fkRoom_CommunityStructure', @value=N'Defines the relationship between the Room and CommunityStructure tables.',                                                   @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'Room', @level2name=N'fkRoom_RoomAvailability',   @value=N'Defines the relationship between the Room and RoomAvailability tables.',                                                     @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'Room', @level2name=N'fkRoom_RoomType',           @value=N'Defines the relationship between the Room and RoomType tables.',                                                             @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'Room', @level2name=N'fkRoom_Content',            @value=N'Defines the relationship between the Room and Content tables.',                                                              @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'Room', @level2name=N'fkRoom_DigitalAsset',       @value=N'Defines the relationship between the Room and DigitalAsset tables using the FloorPlanId.',                                   @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'Room', @level2name=N'dfRoom_IsFeatured',         @value=N'Defines the default value for the IsFeatured column as 0 (false)',                                                           @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO