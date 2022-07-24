MERGE PM.DigitalAssetType AS TARGET
USING (VALUES (1, 1, 1, 'image',    'Image'),
              (2, 2, 1, 'document', 'Document'),
              (3, 3, 1, 'video',    'Video'))
AS SOURCE (DigitalAssetTypeId,
           SortOrder,
           IsActive,
           Discriminator,
           DigitalAssetTypeName)
ON TARGET.DigitalAssetTypeId = SOURCE.DigitalAssetTypeId
WHEN MATCHED THEN UPDATE SET TARGET.DigitalAssetTypeName = SOURCE.DigitalAssetTypeName,
                             TARGET.Discriminator        = SOURCE.Discriminator,
                             TARGET.SortOrder            = SOURCE.SortOrder,
                             TARGET.IsActive             = SOURCE.IsActive
WHEN NOT MATCHED THEN INSERT (DigitalAssetTypeId,
                              DigitalAssetTypeName,
                              Discriminator,
                              SortOrder,
                              IsActive)
                      VALUES (SOURCE.DigitalAssetTypeId,
                              SOURCE.DigitalAssetTypeName,
                              SOURCE.Discriminator,
                              SOURCE.SortOrder,
                              SOURCE.IsActive);