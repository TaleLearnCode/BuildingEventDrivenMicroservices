CREATE TABLE PM.Community
(
  CommunityId              INT           NOT NULL IDENTITY(1,1),
  CommunityNumber          NVARCHAR(50)  NOT NULL,
  CommunityName            NVARCHAR(200) NOT NULL,
  ExternalName             NVARCHAR(200)     NULL,
  LanguageCultureCode      VARCHAR(15)   NOT NULL CONSTRAINT dfCommunity_LanguageCultureCode  DEFAULT('en-US'),
  RoomMeasurement          NVARCHAR(100) NOT NULL CONSTRAINT dfCommunity_RoomMeasurement DEFAULT('sq ft'),
  OverviewId               INT               NULL,
  CountryCode              CHAR(2)           NULL,
  Longitude                VARCHAR(15)       NULL,
  Latitude                 VARCHAR(15)       NULL,
  ProfileImageId           INT               NULL,
  CommunityStatusId        INT           NOT NULL,
  IsFeatured               BIT           NOT NULL CONSTRAINT dfCommunity_IsFeatured DEFAULT(0),
  RowStatusId              INT           NOT NULL CONSTRAINT dfCommunity_RowStatus DEFAULT(1),
  CONSTRAINT pkcCommunity PRIMARY KEY CLUSTERED (CommunityId),
  CONSTRAINT fkCommunity_LanguageCultureCode FOREIGN KEY (LanguageCultureCode) REFERENCES PM.LanguageCulture (LanguageCultureCode),
  CONSTRAINT fkCommunity_Content           FOREIGN KEY (OverviewId)            REFERENCES PM.Content (ContentId),
  CONSTRAINT fkCommunity_Country           FOREIGN KEY (CountryCode)           REFERENCES PM.Country (CountryCode),
  CONSTRAINT fkCommunity_DigitalAsset      FOREIGN KEY (ProfileImageId)        REFERENCES PM.DigitalAsset (DigitalAssetId),
  CONSTRAINT fkCommunity_CommunityStatus   FOREIGN KEY (CommunityStatusId)     REFERENCES PM.CommunityStatus (CommunityStatusId),
  CONSTRAINT unqCommunity_CommunityNumber  UNIQUE(CommunityNumber)
)
GO

CREATE NONCLUSTERED INDEX idxCommunity_CommunityNumber
  ON PM.Community(CommunityNumber ASC);
GO

EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'Community',                                                      @value=N'Represents a community run by the tenant.',                                                                @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'Community', @level2name=N'CommunityId',                          @value=N'The identifier of the community record.',                                                                  @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'Community', @level2name=N'CommunityNumber',                      @value=N'The tenant''s number (identifier) for the community.',                                                     @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'Community', @level2name=N'CommunityName',                        @value=N'The name of the community.',                                                                               @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'Community', @level2name=N'ExternalName',                         @value=N'The name of the community used externally.',                                                               @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'Community', @level2name=N'LanguageCultureCode',                  @value=N'The default language culture to be used for the community.',                                               @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'Community', @level2name=N'RoomMeasurement',                      @value=N'The measurement type used for room area (i.e. square feet, square meters, etc.)',                          @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'Community', @level2name=N'CountryCode',                          @value=N'Identifier of the country the community is located in.',                                                   @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'Community', @level2name=N'Longitude',                            @value=N'The longitude where the community is located.',                                                            @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'Community', @level2name=N'Latitude',                             @value=N'The latitude where the community is located.',                                                             @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'Community', @level2name=N'ProfileImageId',                       @value=N'Identifier of the digital asset that serves as the profile image for the community.',                      @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'Community', @level2name=N'IsFeatured',                           @value=N'Flag indicating whether the community is featured.',                                                       @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'Community', @level2name=N'RowStatusId',                          @value=N'Identifier of the community record status (i.e. enabled, disabled, etc).',                                 @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'Community', @level2name=N'pkcCommunity',                         @value=N'Defines the primary key for the Community table using the CommunityId column.',                            @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'Community', @level2name=N'fkCommunity_LanguageCultureCode',      @value=N'Defines the relationship between the Community and LanuageCulture tables.',                                @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'Community', @level2name=N'dfCommunity_LanguageCultureCode',      @value=N'Defines the default value for the DefaultLanguageCultureCode column as ''en-US''.',                          @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'Community', @level2name=N'dfCommunity_RowStatus',                @value=N'Defines the default value for the RowStatus column as 1 (enabled).',                                       @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'Community', @level2name=N'dfCommunity_RoomMeasurement',          @value=N'Defines the default value for the RoomMeasurement column as ''sq-ft''.',                                   @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'Community', @level2name=N'idxCommunity_CommunityNumber',         @value=N'Defines an ascending index on the Community table using the CommunityNumber column.',                      @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'INDEX';
GO