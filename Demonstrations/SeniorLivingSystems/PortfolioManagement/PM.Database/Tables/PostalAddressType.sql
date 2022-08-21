CREATE TABLE PM.PostalAddressType
(
	PostalAddressTypeId   INT           NOT NULL IDENTITY (1,1),
	ExternalId            NVARCHAR(100)     NULL,
	PostalAddressTypeName VARCHAR(100)  NOT NULL,
	SortOrder             INT               NULL,
	IsDefault             BIT           NOT NULL CONSTRAINT dfPostalAddressType_IsDefault    DEFAULT (0),
	RowStatusId           INT           NOT NULL CONSTRAINT dfPostalAddressType_RowStatutsId DEFAULT (1),
	CONSTRAINT pkcPostalAddressType PRIMARY KEY CLUSTERED (PostalAddressTypeId ASC)
);
GO

CREATE UNIQUE NONCLUSTERED INDEX unqPostalAddressType_ExternalId ON PM.PostalAddressType (ExternalId) WHERE ExternalId IS NOT NULL
GO

CREATE TRIGGER PM.trPostalAddressType_iu
	ON PM.PostalAddressType
	AFTER INSERT, UPDATE
	AS
	BEGIN
		
		SET NOCOUNT ON

		DECLARE @DefaultCount INT;
		SELECT @DefaultCount = COUNT(*) FROM inserted WHERE IsDefault = 1;

		IF (@DefaultCount = 1)
			BEGIN
				UPDATE PM.PostalAddressType
						SET IsDefault = 0
					WHERE PostalAddressTypeId NOT IN (SELECT PostalAddressTypeId
						                                  FROM inserted
																					   WHERE IsDefault = 1
																						   AND PostalAddressTypeID IS NOT NULL)
			END

	END
GO

EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'PostalAddressType',                                                  @value=N'Lookup values representing phone number types used by Glennis.',               @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'PostalAddressType', @level2name=N'PostalAddressTypeId',              @value=N'Identifier of the phone number type.',                                          @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'PostalAddressType', @level2name=N'ExternalId',                       @value=N'The operator identifier for the phone number type.',                                          @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'PostalAddressType', @level2name=N'PostalAddressTypeName',            @value=N'Name of the phone number type.',                                          @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'PostalAddressType', @level2name=N'SortOrder',                        @value=N'The sorting order of the phone number type.',                                          @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'PostalAddressType', @level2name=N'IsDefault',                        @value=N'Flag indicating whether the phone number type is the default phone number type.',                                          @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'PostalAddressType', @level2name=N'RowStatusId',                      @value=N'Identifier of the status for the row (i.e. enabled, disabled, etc.).',                      @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'PostalAddressType', @level2name=N'pkcPostalAddressType',             @value=N'Defines the primary key for the PostalAddressType table using the PostalAddressTypeId column.',                    @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'PostalAddressType', @level2name=N'dfPostalAddressType_IsDefault',    @value=N'Defines the default value for the IsDefault to 0 (false).',                    @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'PostalAddressType', @level2name=N'dfPostalAddressType_RowStatutsId', @value=N'Defines the default value for the RowStatusId column as 1 (enabled).',                      @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'PostalAddressType', @level2name=N'trPostalAddressType_iu',           @value=N'Resets the IsDefault value is an inserted or updated PostalAddressType has IsDefault = 1.',                    @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'TRIGGER';
GO