CREATE TABLE PM.RoomAvailability
(
	RoomAvailabilityId   INT           NOT NULL IDENTITY(1,1),
	RoomAvailabilityName NVARCHAR(100) NOT NULL,
	ExternalId           NVARCHAR(100)     NULL,
	SortOrder            INT               NULL,
	ShowAsAvailable      BIT           NOT NULL CONSTRAINT dfRoomAvailability_ShowAsAvailable DEFAULT(0),
	ShowAsReserved       BIT           NOT NULL CONSTRAINT dfRoomAvailability_ShowAsReserved  DEFAULT(0),
	RowStatusId          INT           NOT NULL CONSTRAINT dfRoomAvailability_RowStatus       DEFAULT(1),
	CONSTRAINT pkcRoomAvailability PRIMARY KEY CLUSTERED (RoomAvailabilityId)
)
GO

CREATE UNIQUE NONCLUSTERED INDEX unqRoomAvailability_ExternalId ON PM.RoomAvailability (ExternalId) WHERE ExternalId IS NOT NULL
GO

EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomAvailability',                                                    @value=N'Represents the communities managed by the tenant provider.',                                       @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomAvailability', @level2name=N'RoomAvailabilityId',                 @value=N'Identifier of the room availability record.',                                                      @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomAvailability', @level2name=N'RoomAvailabilityName',               @value=N'The name of the room availability type.',                                                          @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomAvailability', @level2name=N'ExternalId',                         @value=N'The external (customer) identifier assigned to the room availability.',                            @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomAvailability', @level2name=N'SortOrder',                          @value=N'The sort order of the room availability type within the full listing of room availability types.', @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomAvailability', @level2name=N'ShowAsAvailable',                    @value=N'Flag indicating whether the room availability type is shown as available.',                        @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomAvailability', @level2name=N'ShowAsReserved',                     @value=N'Flag indicating whether the room availability type is shown as reserved.',                         @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomAvailaiblity', @level2name=N'pkcRoomAvailability',                @value=N'Defines the primary key for the RoomAvailability table using the RoomAvailabilityId column.',      @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomAvailaiblity', @level2name=N'dfRoomAvailability_ShowAsAvailable', @value=N'Defines the default value for the ShowAsAvailabile column as 0 (false).',                          @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomAvailaiblity', @level2name=N'dfRoomAvailability_RowStatus',        @value=N'Defines the default value for the IsActive column as 1 (true).',                                   @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO