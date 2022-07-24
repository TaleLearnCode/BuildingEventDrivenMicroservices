CREATE TABLE PM.DigitalAsset
(
  DigitalAssetId          INT           NOT NULL IDENTITY(1,1),
  ExternalId              NVARCHAR(100)     NULL,
  Discriminator           NVARCHAR(100)     NULL,
  DigitalAssetTypeId      INT           NOT NULL,
  DigitalAssetUrl         NVARCHAR(500)     NULL,
  ThumbnailUrl            NVARCHAR(500)     NULL,
  DigitalAssetName        NVARCHAR(100)     NULL,
  DigitalAssetDescription NVARCHAR(2000)    NULL,
  AltTextId               INT               NULL,
  CaptionId               INT               NULL,
  ContentId               INT               NULL,
  EffectiveStartDate      DATETIME2     NOT NULL CONSTRAINT dfDigitalAsset_EffectiveStartDate2 DEFAULT(GETUTCDATE()),
  EffectiveEndDate        DATETIME2     NOT NULL CONSTRAINT dfDigitalAsset_EffectiveEndDate2   DEFAULT('9999-12-31 23:59:59'),
  IsActive                BIT           NOT NULL CONSTRAINT dfDigitalAsset_IsActive2 DEFAULT(1),
  CONSTRAINT pkcDigitalAsset PRIMARY KEY CLUSTERED (DigitalAssetId),
  CONSTRAINT fkDigitalAsset_Content_AltText   FOREIGN KEY (AltTextId)          REFERENCES PM.Content (ContentId),
  CONSTRAINT fkDigitalAsset_Content_Caption   FOREIGN KEY (CaptionId)          REFERENCES PM.Content (ContentId),
  CONSTRAINT fkDigitalAsset_Content           FOREIGN KEY (ContentId)          REFERENCES PM.Content (ContentId),
  CONSTRAINT fkDigitalAsset_DigitalAssetType  FOREIGN KEY (DigitalAssetTypeId) REFERENCES PM.DigitalAssetType (DigitalAssetTypeId)
)
GO

EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'DigitalAsset',                                                 @value=N'Represents a digital asset maintained by the Digital Content Management System.',                                              @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'DigitalAsset', @level2name=N'DigitalAssetId',                  @value=N'Identifier of the DigitalAsset record.',                                                                                       @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'DigitalAsset', @level2name=N'ExternalId',                      @value=N'The tenant''s identifier for the Digital Asset.',                                                                              @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'DigitalAsset', @level2name=N'Discriminator',                   @value=N'Characteristic to distinguish digital assets within a group.',                                                      @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'DigitalAsset', @level2name=N'DigitalAssetTypeId',              @value=N'Identifier of the associated Digital Asset Type.',                                                                             @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'DigitalAsset', @level2name=N'DigitalAssetUrl',                 @value=N'The URL to the digital asset.',                                                                                                @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'DigitalAsset', @level2name=N'ThumbnailUrl',                    @value=N'The URL to the thumbnail for the digital asset.',                                                                              @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'DigitalAsset', @level2name=N'DigitalAssetName',                @value=N'The name of the Digital Asset.',                                                                                               @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'DigitalAsset', @level2name=N'DigitalAssetDescription',         @value=N'A description of the Digital Asset.',                                                                                          @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'DigitalAsset', @level2name=N'AltTextId',                       @value=N'Identifier of the Content used as the digital asset''s alternate text.',                                                       @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'DigitalAsset', @level2name=N'CaptionId',                       @value=N'Identifier of the Content used as the digital asset''s caption.',                                                              @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'DigitalAsset', @level2name=N'ContentId',                       @value=N'Identifier of an associated Content record.',                                                                                  @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'DigitalAsset', @level2name=N'EffectiveStartDate',              @value=N'The date and time the Digital Asset becomes effective.',                                                                       @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'DigitalAsset', @level2name=N'EffectiveEndDate',                @value=N'The date and time the Digital Asset is no longer effective.',                                                                  @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'DigitalAsset', @level2name=N'IsActive',                        @value=N'Flag indicating whether the DigitalAsset is active.',                                                                          @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'DigitalAsset', @level2name=N'pkcDigitalAsset',                 @value=N'Defines the primary key for the DigitalAsset table using the DigitalAssetId column.',                                          @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'DigitalAsset', @level2name=N'fkDigitalAsset_Content',          @value=N'Defines the relationship between the DigitalAsset and Content tables using the ContentId column.',                             @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'DigitalAsset', @level2name=N'fkDigitalAsset_DigitalAssetType', @value=N'Defines the relationship between the DigitalAsset and Content tables using the ContentId column.',                             @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'DigitalAsset', @level2name=N'fkDigitalAsset_Content_AltText',  @value=N'Defines the relationship between the DigitalAsset and Content tables for the alternate text copy using the AltTextId column.', @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'PM', @level1name=N'DigitalAsset', @level2name=N'fkDigitalAsset_Content_Caption',  @value=N'Defines the relationship between the DigitalAsset and Content tables for the caption copy using the AltTextId column.',        @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO