CREATE TABLE PM.ContentCopy
(
	ContentId           INT           NOT NULL,
	LanguageCultureCode VARCHAR(15)   NOT NULL,
	CopyText            NVARCHAR(MAX) NOT NULL,
	CONSTRAINT pkcContentCopy PRIMARY KEY CLUSTERED (ContentId, LanguageCultureCode),
	CONSTRAINT fkContentCopy_Content         FOREIGN KEY (ContentId)           REFERENCES PM.Content (ContentId),
	CONSTRAINT fkContentCopy_LangaugeCulture FOREIGN KEY (LanguageCultureCode) REFERENCES PM.LanguageCulture (LanguageCultureCode)
)
GO

EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'ContentCopy',                                               @value=N'Represents content for an item managed by the system.',                                                @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'ContentCopy', @level2name=N'ContentId',                     @value=N'Identifier of the associated Content record.',                                                         @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'ContentCopy', @level2name=N'LanguageCultureCode',             @value=N'Identifier of the associated LanguageCulture record.',                                                 @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'ContentCopy', @level2name=N'CopyText',                      @value=N'The text of the content copy.',                                                                        @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'ContentCopy', @level2name=N'pkcContentCopy',                @value=N'Defines the primary key for the ContentCopy table using the ContentId and LangaugeCultureId columns.', @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'ContentCopy', @level2name=N'fkContentCopy_Content',         @value=N'Defines the relationship between the ContentCopy and Content tables using the ContentId column.',      @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'ContentCopy', @level2name=N'fkContentCopy_LangaugeCulture', @value=N'Defines the relationship between the ContentCopy and Content tables using the ContentId column.',      @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO