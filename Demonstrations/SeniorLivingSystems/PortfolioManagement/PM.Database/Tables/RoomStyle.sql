CREATE TABLE PM.RoomStyle
(
	RoomStyleId   INT           NOT NULL IDENTITY(1,1),
	ExternalId    NVARCHAR(100)     NULL,
	RoomStyleName NVARCHAR(100) NOT NULL,
	RoomStyleCode NVARCHAR(20)      NULL,
	SortOrder     INT               NULL,
	RowStatusId   INT           NOT NULL CONSTRAINT dfRoomStyle_RowStatusId DEFAULT(1),
	CONSTRAINT pkcRoomStyle PRIMARY KEY CLUSTERED (RoomStyleId)
)
GO

CREATE UNIQUE NONCLUSTERED INDEX unqRoomStyle_ExternalId ON PM.RoomStyle (ExternalId) WHERE ExternalId IS NOT NULL
GO

EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomStyle',                                             @value=N'Represents a room style.',                                                                           @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomStyle', @level2name=N'RoomStyleId',                 @value=N'Identifier of the room style record.',                                                               @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomStyle', @level2name=N'ExternalId',                  @value=N'The tenant''s external identifier for the style.',                                                   @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomStyle', @level2name=N'RoomStyleName',               @value=N'Name of the room style.',                                                                            @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomStyle', @level2name=N'RoomStyleCode',               @value=N'The code assigned to the room style.',                                                               @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomStyle', @level2name=N'SortOrder',                   @value=N'The sort order of the room style within the full listing of room styles.',                           @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomStyle', @level2name=N'RowStatusId',                 @value=N'Identifier of the record row status (i.e. enabled, disabled, etc.).',                                @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomStyle', @level2name=N'pkcRoomStyle',                @value=N'Defines the primary key for the RoomStyle table using the RoomStyleId column.',                      @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO