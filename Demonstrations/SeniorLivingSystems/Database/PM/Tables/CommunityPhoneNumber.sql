CREATE TABLE PM.CommunityPhoneNumber
(
	CommunityPhoneNumberId INT           NOT NULL IDENTITY (1,1),
	CommunityId            INT           NOT NULL,
	PhoneNumberTypeId      INT           NOT NULL,
	ExternalId             NVARCHAR(100)     NULL,
	CountryCode            VARCHAR(10)       NULL,
	PhoneNumber            VARCHAR(100)  NOT NULL,
	IsListingNumber        BIT           NOT NULL CONSTRAINT dfCommunityPhoneNumber_IsListingNumber DEFAULT(0),
	CONSTRAINT pkcCommunityPhoneNumber PRIMARY KEY (CommunityPhoneNumberId),
	CONSTRAINT fkCommunityPhoneNumber_Community      FOREIGN KEY (CommunityId)        REFERENCES PM.Community (CommunityId),
	CONSTRAINT fkCommunityPhoneNumber_PhoneNumberType FOREIGN KEY (PhoneNumberTypeId) REFERENCES PM.PhoneNumberType (PhoneNumberTypeId)
)
GO

CREATE TRIGGER PM.trCommunityPhoneNumber_iu
	ON PM.CommunityPhoneNumber
	AFTER INSERT, UPDATE
	AS
	BEGIN
		
		SET NOCOUNT ON

		DECLARE @ListingCount INT;
		SELECT @ListingCount = COUNT(*) FROM inserted WHERE IsListingNumber = 1;

		IF (@ListingCount = 1)
			BEGIN
				UPDATE PM.CommunityPhoneNumber
						SET IsListingNumber = 0
					WHERE CommunityPhoneNumberId NOT IN (SELECT CommunityPhoneNumberId
					                                       FROM inserted
																								WHERE IsListingNumber = 1
																								  AND CommunityPhoneNumberId IS NOT NULL)
			END

	END
GO

CREATE TRIGGER PM.trCommunityPhoneNumber_d
	ON PM.CommunityPostalAddress
	AFTER DELETE
	AS
	BEGIN

		SET NOCOUNT ON

		DECLARE @ListingCount INT
		SELECT @ListingCount = COUNT(*) FROM deleted WHERE IsListingAddress = 1
		
		DECLARE @RecordCount INT
		SELECT @RecordCount = COUNT(*) FROM PM.CommunityPhoneNumber WHERE CommunityId IN (SELECT CommunityId FROM deleted)

		IF (@ListingCount = 1 AND @RecordCount = 1)
			BEGIN
				UPDATE PM.CommunityPhoneNumber
				   SET IsListingNumber = 1
				 WHERE CommunityId IN (SELECT CommunityId FROM deleted)
			END

	END
GO

EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CommunityPostalAddress',                                                            @value=N'Represents the linking of a community to an address.',                                                            @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CommunityPhoneNumber',                                                        @value=N'Represents the linking of a community to an phone number.',                                                   @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CommunityPhoneNumber', @level2name=N'CommunityId',                            @value=N'The identifier of the associated community record.',                                                          @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CommunityPhoneNumber', @level2name=N'pkcCommunityPhoneNumber',                @value=N'Defines the primary key for the CommunityPhoneNumber table using the CommunityId and PhoneNumberId columns.', @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CommunityPhoneNumber', @level2name=N'fkCommunityPhoneNumber_Community',       @value=N'Defines the relationship between the CommunityPhoneNumber and Community tables.',                             @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO