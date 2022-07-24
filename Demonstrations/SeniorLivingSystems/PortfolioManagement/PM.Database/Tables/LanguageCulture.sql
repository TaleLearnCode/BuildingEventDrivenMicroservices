CREATE TABLE PM.LanguageCulture
(
	LanguageCultureCode VARCHAR(15)   NOT NULL,
	LanguageCode        CHAR(3)       NOT NULL,
	EnglishName         NVARCHAR(100) NOT NULL,
	NativeName          NVARCHAR(100) NOT NULL,
	IsActive            BIT           NOT NULL CONSTRAINT dfLanguageCulture_IsActive DEFAULT(1),
	CreatedDate         DATETIME2     NOT NULL CONSTRAINT dfLanguageCulture_CreatedDate DEFAULT(GETUTCDATE()),
	CreatedBy           NVARCHAR(100) NOT NULL,
	ModifiedDate        DATETIME2         NULL,
	ModifiedBy          NVARCHAR(100)     NULL,
	CONSTRAINT pkcLanguageCulture PRIMARY KEY CLUSTERED (LanguageCultureCode)
)
GO

EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'LanguageCulture',                                               @value=N'Represents a language with culture differences that is spoken/written.',             @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'LanguageCulture', @level2name=N'LanguageCultureCode',           @value=N'Identifier of the language culture record.',                                         @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'LanguageCulture', @level2name=N'LanguageCode',                  @value=N'Code for the associated language.',                                                  @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'LanguageCulture', @level2name=N'EnglishName',                   @value=N'The English name of the language culture.',                                          @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'LanguageCulture', @level2name=N'NativeName',                    @value=N'The native name of the language culture.',                                           @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'LanguageCulture', @level2name=N'IsActive',                      @value=N'Flag indicating whether the language culture is active.',                            @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'LanguageCulture', @level2name=N'CreatedBy',                     @value=N'Identifier of the user that created the language culture record.',                   @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'LanguageCulture', @level2name=N'CreatedDate',                   @value=N'The date and time the language culture record was created.',                         @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'LanguageCulture', @level2name=N'ModifiedBy',                    @value=N'Identifier of the user that created the language culture record.',                   @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'LanguageCulture', @level2name=N'ModifiedDate',                  @value=N'The date and time the language culture record was created.',                         @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'LanguageCulture', @level2name=N'pkcLanguageCulture',            @value=N'Defines the primary key for the Content table using the ContentId column.',          @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'LanguageCulture', @level2name=N'dfLanguageCulture_IsActive',    @value=N'Defines the default value for the IsActive column as 1 (true).',                     @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'LanguageCulture', @level2name=N'dfLanguageCulture_CreatedDate', @value=N'Defines the default value for the CreatedDate column as the current UTC date/time.', @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO