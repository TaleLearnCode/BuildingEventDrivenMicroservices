CREATE TABLE PM.RoomHistory
(
	RoomId               INT           NOT NULL,
	CommunityId          INT           NOT NULL,
	ExternalId           NVARCHAR(100)     NULL,
	CommunityStructureId INT           NOT NULL,
	RoomNumber           NVARCHAR(100) NOT NULL,
	RoomName             NVARCHAR(100)     NULL,
	IsFeatured           BIT           NOT NULL,
	RoomAvailabilityId   INT           NOT NULL,
	RoomTypeId           INT           NOT NULL,
	ContentId            INT               NULL,
	RoomArea             DECIMAL(7,2)      NULL,
	FloorPlanId          INT               NULL,
	AssignedCareTypeId   INT               NULL,
	SortOrder            INT               NULL,
	RowStatusId          INT           NOT NULL,
	ValidFrom            DATETIME2     NOT NULL,
	ValidTo              DATETIME2     NOT NULL
)
GO

EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomHistory',                                           @value=N'Represents a room within a community.',                                                                                      @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomHistory', @level2name=N'RoomId',                    @value=N'Identifier of the room record.',                                                                                             @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomHistory', @level2name=N'ExternalId',                @value=N'Identifier for the room from an external system.',                                                                           @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomHistory', @level2name=N'CommunityStructureId',      @value=N'Identifier of the associated community structure element (floor, building, etc.).',                                          @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomHistory', @level2name=N'CommunityId',               @value=N'Identifier of the associated community record.',                                                                             @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomHistory', @level2name=N'RoomNumber',                @value=N'The number of the room.',                                                                                                    @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomHistory', @level2name=N'RoomName',                  @value=N'The name of the room.',                                                                                                      @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomHistory', @level2name=N'IsFeatured',                @value=N'Flag indicating whether the room is considered as featured.',                                                                @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomHistory', @level2name=N'RoomAvailabilityId',        @value=N'Identifier of the associated room availability record.',                                                                     @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomHistory', @level2name=N'RoomTypeId',                @value=N'Identifier of the associated room type record.',                                                                             @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomHistory', @level2name=N'ContentId',                 @value=N'Identifier of the associated content record.',                                                                               @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomHistory', @level2name=N'RoomArea',                  @value=N'The size of the room. The measurement type is based off of Community.RoomMeasurement.',                                      @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomHistory', @level2name=N'FloorPlanId',               @value=N'Identifier of the digital asset representing the floor plan for the room when it differs from the room type''s floor plan.', @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomHistory', @level2name=N'SortOrder',                 @value=N'The sorting order of the room among the other rooms.',                                                                       @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomHistory', @level2name=N'ValidFrom',                 @value=N'The start date and time for the valid period of the current record.',                                                        @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomHistory', @level2name=N'ValidTo',                   @value=N'The end date and time for the valid period of the current record.',                                                          @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO