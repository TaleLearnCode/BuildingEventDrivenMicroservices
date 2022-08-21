CREATE TABLE RM.Room
(
	RoomId               INT                                                NOT NULL,
	CommunityId          INT                                                NOT NULL,
	RoomNumber           NVARCHAR(100)                                      NOT NULL,
	RoomName             NVARCHAR(100)                                          NULL,
	AssignedCareTypeId   INT                                                    NULL,
	SortOrder            INT                                                    NULL,
	RowStatusId          INT                                                NOT NULL,
	ValidFrom            DATETIME2     GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
	ValidTo              DATETIME2     GENERATED ALWAYS AS ROW END   HIDDEN NOT NULL,
	PERIOD FOR SYSTEM_TIME (ValidFrom, ValidTo),
	CONSTRAINT pkcRoom PRIMARY KEY CLUSTERED (RoomId),
	CONSTRAINT fkRoom_Community          FOREIGN KEY (CommunityId)          REFERENCES RM.Community (CommunityId),
	CONSTRAINT fkRoom_CareType           FOREIGN KEY (AssignedCareTypeId)   REFERENCES RM.CareType (CareTypeId)
) WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = RM.RoomHistory))
GO

EXEC sp_addextendedproperty @level0name=N'RM', @level1name=N'Room',                                           @value=N'Represents a room within a community.',                                                                                      @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'RM', @level1name=N'Room', @level2name=N'RoomId',                    @value=N'Identifier of the room record.',                                                                                             @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'RM', @level1name=N'Room', @level2name=N'CommunityId',               @value=N'Identifier of the associated community record.',                                                                             @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'RM', @level1name=N'Room', @level2name=N'RoomNumber',                @value=N'The number of the room.',                                                                                                    @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'RM', @level1name=N'Room', @level2name=N'RoomName',                  @value=N'The name of the room.',                                                                                                      @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'RM', @level1name=N'Room', @level2name=N'SortOrder',                 @value=N'The sorting order of the room among the other rooms.',                                                                       @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'RM', @level1name=N'Room', @level2name=N'ValidFrom',                 @value=N'The start date and time for the valid period of the current record.',                                                        @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'RM', @level1name=N'Room', @level2name=N'ValidTo',                   @value=N'The end date and time for the valid period of the current record.',                                                          @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO 
EXEC sp_addextendedproperty @level0name=N'RM', @level1name=N'Room', @level2name=N'pkcRoom',                   @value=N'Defines the primary key for the Room table using the RoomId column.',                                                        @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'RM', @level1name=N'Room', @level2name=N'fkRoom_Community',          @value=N'Defines the relationship between the Room and Community tables.',                                                            @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO