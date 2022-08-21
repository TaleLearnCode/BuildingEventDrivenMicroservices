CREATE TABLE CM.Community
(
  CommunityId              INT           NOT NULL,
  CommunityNumber          NVARCHAR(50)  NOT NULL,
  CommunityName            NVARCHAR(200) NOT NULL,
  ProfileImageUrl          VARCHAR(500)      NULL,
  IsActive                 BIT           NOT NULL,
  CONSTRAINT pkcCommunity PRIMARY KEY CLUSTERED (CommunityId)
)
GO

CREATE NONCLUSTERED INDEX idxCommunity_CommunityNumber ON CM.Community(CommunityNumber ASC);
GO

EXEC sp_addextendedproperty @level0name=N'CM', @level1name=N'Community',                                              @value=N'Represents a community run by the tenant.',                                           @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'CM', @level1name=N'Community', @level2name=N'CommunityId',                  @value=N'The identifier of the community record.',                                             @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'CM', @level1name=N'Community', @level2name=N'CommunityNumber',              @value=N'The tenant''s number (identifier) for the community.',                                @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'CM', @level1name=N'Community', @level2name=N'CommunityName',                @value=N'The name of the community.',                                                          @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'CM', @level1name=N'Community', @level2name=N'ProfileImageUrl',              @value=N'URL of the profile image for the community.',                                         @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'CM', @level1name=N'Community', @level2name=N'IsActive',                     @value=N'Flag indicating whether the community is active or not.',                             @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'CM', @level1name=N'Community', @level2name=N'pkcCommunity',                 @value=N'Defines the primary key for the Community table using the CommunityId column.',       @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'CM', @level1name=N'Community', @level2name=N'idxCommunity_CommunityNumber', @value=N'Defines an ascending index on the Community table using the CommunityNumber column.', @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'INDEX';
GO