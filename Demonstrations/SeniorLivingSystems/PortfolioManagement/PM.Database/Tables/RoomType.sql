CREATE TABLE PM.RoomType
(
	RoomTypeId          INT           NOT NULL IDENTITY(1,1),
	ExternalId          NVARCHAR(100)     NULL,
	RoomStyleId         INT           NOT NULL,
	RoomTypeCategoryId  INT               NULL,
	RoomTypeName        NVARCHAR(100) NOT NULL,
	RoomTypeCode        NVARCHAR(20)      NULL,
	SortOrder           INT           NOT NULL,
	RowStatusId         INT           NOT NULL CONSTRAINT dfRoomType_RowStatusId DEFAULT(1),
	CONSTRAINT pkcRoomType PRIMARY KEY CLUSTERED (RoomTypeId),
	CONSTRAINT fkRoomType_RoomStyle        FOREIGN KEY (RoomStyleId)        REFERENCES PM.RoomStyle(RoomStyleId),
	CONSTRAINT fkRoomType_RoomTypeCategory FOREIGN KEY (RoomTypeCategoryId) REFERENCES PM.RoomTypeCategory (RoomTypeCategoryId)
)
GO

CREATE UNIQUE NONCLUSTERED INDEX unqRoomType_ExternalId ON PM.RoomType (ExternalId) WHERE ExternalId IS NOT NULL
GO

EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomType',                                             @value=N'Represents a room type.',                                                                                        @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomType', @level2name=N'RoomTypeId',                  @value=N'Identifier of the room type record.',                                                                            @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomType', @level2name=N'RoomTypeName',                @value=N'Name of the room type.',                                                                                         @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomType', @level2name=N'ExternalId',                  @value=N'The tenant''s identifier for the room type.',                                                                    @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomType', @level2name=N'RoomStyleId',                 @value=N'Identifier of the associated room style.',                                                                       @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomType', @level2name=N'RoomTypeCode',                @value=N'A short code for the room type.',                                                                                @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomType', @level2name=N'RoomTypeCategoryId',          @value=N'Identifier of the category of room type.',                                                                       @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomType', @level2name=N'SortOrder',                   @value=N'The sorting order of the room type among the other room types.',                                                 @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomType', @level2name=N'RowStatusId',                 @value=N'Identifier of the room type record status (i.e. enabled, disabled, etc).',                                       @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomType', @level2name=N'pkcRoomType',                 @value=N'Defines the primary key for the RoomType table using the RoomTypeId column.',                                    @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomType', @level2name=N'fkRoomType_RoomStyle',        @value=N'Defines the relationship between the RoomType and RoomStyle tables using the RoomStyleId column.',               @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomType', @level2name=N'fkRoomType_RoomTypeCategory', @value=N'Defines the relationship between the RoomType and RoomTypeCategory tables using the RoomTypeCategoryId column.', @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'RoomType', @level2name=N'dfRoomType_RowStatusId',      @value=N'Defines the default value for the RowStatusId column as 1 (enabled).',                                           @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO