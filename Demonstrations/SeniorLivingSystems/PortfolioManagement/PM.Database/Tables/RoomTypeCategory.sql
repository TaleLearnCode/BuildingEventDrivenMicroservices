CREATE TABLE PM.RoomTypeCategory
(
	RoomTypeCategoryId   INT           NOT NULL IDENTITY(1,1),
	ExternalId           NVARCHAR(100)     NULL,
	RoomTypeCategoryName NVARCHAR(100) NOT NULL,
	RoomTypeCategoryCode NVARCHAR(20)      NULL,
	SortOrder            INT               NULL,
	RowStatusId          INT           NOT NULL CONSTRAINT dfRoomTypeCategory_RowStatusId DEFAULT(1),
	CONSTRAINT pkcRoomTypeCategory PRIMARY KEY CLUSTERED (RoomTypeCategoryId)
)
GO

CREATE UNIQUE NONCLUSTERED INDEX unqRoomTypeCategory_ExternalId ON PM.RoomTypeCategory (ExternalId) WHERE ExternalId IS NOT NULL
GO

EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomTypeCategory',                                                    @value=N'Represents a room type category.',                                                                          @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomTypeCategory', @level2name=N'RoomTypeCategoryId',                 @value=N'Identifier of the room type category record.',                                                              @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomTypeCategory', @level2name=N'ExternalId',                         @value=N'The tenant''s identifier for the room type category.',                                                      @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomTypeCategory', @level2name=N'RoomTypeCategoryName',               @value=N'Name of the room type category.',                                                                           @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomTypeCategory', @level2name=N'RoomTypeCategoryCode',               @value=N'The code associated with the room type category.',                                                          @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomTypeCategory', @level2name=N'SortOrder',                          @value=N'The sort order of the room type category within the full listing of room type categories.',                 @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomTypeCategory', @level2name=N'RowStatusId',                        @value=N'Identifier of the status of the room type category record (i.e. enabled, disabled, etc).',                  @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomTypeCategory', @level2name=N'pkcRoomTypeCategory',                @value=N'Defines the primary key for the RoomTypeCategory table using the RoomTypeCategoryId column.',               @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO