CREATE TABLE PM.PhoneNumberType
(
	PhoneNumberTypeId   INT           NOT NULL IDENTITY (1, 1),
	ExternalId          NVARCHAR(100)     NULL,
	PhoneNumberTypeName VARCHAR(100)  NOT NULL,
	SortOrder           INT               NULL,
	IsDefault           BIT           NOT NULL CONSTRAINT dfPhoneNumberType_IsDefault   DEFAULT (0),
	RowStatusId         INT           NOT NULL CONSTRAINT dfPhoneNumberType_RowStatusId DEFAULT (1),
	CONSTRAINT pkcPhoneNumberType PRIMARY KEY CLUSTERED (PhoneNumberTypeId)
);
GO

CREATE UNIQUE NONCLUSTERED INDEX unqPhoneNumberType_ExternalId ON PM.PhoneNumberType (ExternalId) WHERE ExternalId IS NOT NULL
GO

CREATE TRIGGER PM.trPhoneNumberType_iu
	ON PM.PhoneNumberType
	AFTER INSERT, UPDATE
	AS
	BEGIN
		
		SET NOCOUNT ON

		DECLARE @DefaultCount INT;
		SELECT @DefaultCount = COUNT(*) FROM inserted WHERE IsDefault = 1;

		IF (@DefaultCount = 1)
			BEGIN
				UPDATE PM.PhoneNumberType
						SET IsDefault = 0
					WHERE PhoneNumberTypeId NOT IN (SELECT PhoneNumberTypeId
						                                FROM inserted
																					 WHERE IsDefault = 1
																					   AND PhoneNumberTypeId IS NOT NULL)
			END

	END
GO

EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'PhoneNumberType',                                               @value=N'Lookup values representing phone number types used by Glennis.',                            @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'PhoneNumberType', @level2name=N'PhoneNumberTypeId',             @value=N'Identifier of the phone number type.',                                                      @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'PhoneNumberType', @level2name=N'ExternalId',                    @value=N'The operator identifier for the phone number type.',                                        @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'PhoneNumberType', @level2name=N'PhoneNumberTypeName',           @value=N'Name of the phone number type.',                                                            @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'PhoneNumberType', @level2name=N'SortOrder',                     @value=N'The sorting order of the phone number type.',                                               @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'PhoneNumberType', @level2name=N'IsDefault',                     @value=N'Flag indicating whether the phone number type is the default phone number type.',           @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'PhoneNumberType', @level2name=N'RowStatusId',                   @value=N'Identifier of the status for the row (i.e. enabled, disabled, etc.).',                      @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'PhoneNumberType', @level2name=N'pkcPhoneNumberType',            @value=N'Defines the primary key for the PhoneNumberType table using the PhoneNumberTypeId column.', @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'PhoneNumberType', @level2name=N'dfPhoneNumberType_IsDefault',   @value=N'Defines the default value for the IsDefault to 0 (false).',                                 @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'PhoneNumberType', @level2name=N'dfPhoneNumberType_RowStatusId', @value=N'Defines the default value for the RowStatusId column as 1 (enabled).',                      @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'PhoneNumberType', @level2name=N'trPhoneNumberType_iu',          @value=N'Resets the IsDefault value is an inserted or updated PhoneNumberType has IsDefault = 1.',   @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'TRIGGER';
GO