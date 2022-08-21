CREATE TABLE PM.CommunityStatus
(
	CommunityStatusId   INT           NOT NULL IDENTITY(1,1),
	ExternalId          NVARCHAR(100)     NULL,
	CommunityStatusName NVARCHAR(100) NOT NULL,
	SortOrder           INT               NULL,
	RowStatusId         INT           NOT NULL CONSTRAINT dfCommunityStatus_RowStatusId DEFAULT(1),
	CONSTRAINT pkcCommunityStatus PRIMARY KEY CLUSTERED (CommunityStatusId)
)
GO

CREATE UNIQUE NONCLUSTERED INDEX unqCommunityStatus_ExternalId ON PM.CommunityStatus (ExternalId) WHERE ExternalId IS NOT NULL
GO

EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CommunityStatus',                                                      @value=N'Represents the different statuses for a community.',                                                          @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CommunityStatus', @level2name=N'CommunityStatusId',                    @value=N'The identifier of the community status record.',                                                              @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CommunityStatus', @level2name=N'ExternalId',                           @value=N'The tenant''s identifier for the community status record.',                                                   @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CommunityStatus', @level2name=N'CommunityStatusName',                  @value=N'The name of the community status.',                                                                           @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CommunityStatus', @level2name=N'SortOrder',                            @value=N'The sorting order of the COmmunity Status among the other community statuses.',                               @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CommunityStatus', @level2name=N'RowStatusId',                          @value=N'Identifier of the Community Status record status (i.e. enabled, disabled, etc).',                             @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CommunityStatus', @level2name=N'pkcCommunityStatus',                   @value=N'Defines the primary key for the CommunityStatus table using the CommunityStatusId column.',                   @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO