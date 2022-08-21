CREATE TABLE PM.CommunityPostalAddress
(
  CommunityPostalAddressId INT           NOT NULL IDENTITY (1, 1),
  CommunityId              INT           NOT NULL,
  ExternalId               NVARCHAR(100)     NULL,
  StreetAddress1           NVARCHAR(100)     NULL,
  StreetAddress2           NVARCHAR(100)     NULL,
  City                     NVARCHAR(100) NOT NULL,
  CountryDivisionCode      CHAR(3)           NULL,
  CountryCode              CHAR(2)       NOT NULL,
  PostalCode               NVARCHAR(20)      NULL,
  PostalAddressTypeId      INT               NULL,
	IsListingAddress         BIT           NOT NULL CONSTRAINT dfCommunityPostalAddress_IsListingAddress DEFAULT (0),
  CONSTRAINT pkcCommunityPostalAddress PRIMARY KEY CLUSTERED (CommunityPostalAddressId ASC),
  CONSTRAINT fkCommunityPostalAddress_Community         FOREIGN KEY (CommunityId)                      REFERENCES PM.Community (CommunityId),
  CONSTRAINT fkCommunityPostalAddress_Country           FOREIGN KEY (CountryCode)                      REFERENCES PM.Country (CountryCode),
  CONSTRAINT fkCommunityPostalAddress_CountryDivision   FOREIGN KEY (CountryCode, CountryDivisionCode) REFERENCES PM.CountryDivision(CountryCode, CountryDivisionCode),
  CONSTRAINT fkCommunityPostalAddress_PostalAddressType FOREIGN KEY (PostalAddressTypeId)              REFERENCES PM.PostalAddressType(PostalAddressTypeId)
)
GO

CREATE TRIGGER PM.trCommunityPostalAddress_iu
	ON PM.CommunityPostalAddress
	AFTER INSERT, UPDATE
	AS
	BEGIN
		
		SET NOCOUNT ON

		DECLARE @ListingCount INT;
		SELECT @ListingCount = COUNT(*) FROM inserted WHERE IsListingAddress = 1;

		IF (@ListingCount = 1)
			BEGIN
				UPDATE PM.CommunityPostalAddress
						SET IsListingAddress = 0
					WHERE CommunityPostalAddressId NOT IN (SELECT CommunityPostalAddressId
					                                         FROM inserted
																									WHERE IsListingAddress = 1
																									  AND CommunityPostalAddressId IS NOT NULL)
			END

	END
GO

CREATE TRIGGER PM.trCommunityPostalAddress_d
	ON PM.CommunityPostalAddress
	AFTER DELETE
	AS
	BEGIN

		SET NOCOUNT ON

		DECLARE @ListingCount INT
		SELECT @ListingCount = COUNT(*) FROM deleted WHERE IsListingAddress = 1
		
		DECLARE @RecordCount INT
		SELECT @RecordCount = COUNT(*) FROM PM.CommunityPostalAddress WHERE CommunityId IN (SELECT CommunityId FROM deleted)

		IF (@ListingCount = 1 AND @RecordCount = 1)
			BEGIN
				UPDATE PM.CommunityPostalAddress
				   SET IsListingAddress = 1
				 WHERE CommunityId IN (SELECT CommunityId FROM deleted)
			END

	END

EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CommunityPostalAddress',                                                            @value=N'Represents the linking of a community to an address.',                                                            @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CommunityPostalAddress', @level2name=N'IsListingAddress',                           @value=N'Flag indicating whether the associated language is the default listing address for the community.',               @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'CommunityPostalAddress', @level2name=N'pkcCommunityPostalAddress',                  @value=N'Defines the primary key for the CommunityPostalAddress table using the CommunityId and PostalAddressId columns.', @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO