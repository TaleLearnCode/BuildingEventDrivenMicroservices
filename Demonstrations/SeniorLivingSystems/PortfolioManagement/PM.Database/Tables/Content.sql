CREATE TABLE PM.Content
(
	ContentId     INT           NOT NULL IDENTITY(1,1),
	ExternalId    NVARCHAR(100)     NULL,
	ContentName   NVARCHAR(100)     NULL,
	CONSTRAINT pkcContent PRIMARY KEY CLUSTERED (ContentId)
)
GO

EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'Content',                             @value=N'Represents content for an item managed by the system.',                                               @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'Content', @level2name=N'ContentId',   @value=N'Identifier of the Content record.',                                                                   @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'Content', @level2name=N'ExternalId',  @value=N'The Tenant''s identifier for the Content record.',                                                    @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'Content', @level2name=N'ContentName', @value=N'The name of the Content.',                                                                            @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'Content', @level2name=N'pkcContent',  @value=N'Defines the primary key for the Content table using the ContentId column.',                           @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO