SET IDENTITY_INSERT PM.CommunityStructureType ON
GO

MERGE PM.CommunityStructureType AS TARGET
USING (VALUES (1, 'Campus', 1, 1, 'Campus'),
              (2, 'Building', 2, 1, 'Building'),
              (3, 'Level', 3, 1, 'Level'))
AS SOURCE (CommunityStructureTypeId,
           ExternalId,
           SortOrder,
           RowStatusId,
           CommunityStructureTypeName)
ON TARGET.CommunityStructureTypeId = SOURCE.CommunityStructureTypeId
WHEN MATCHED THEN UPDATE SET TARGET.ExternalId   = SOURCE.ExternalId,
                             TARGET.CommunityStructureTypeName = SOURCE.CommunityStructureTypeName,
                             TARGET.SortOrder    = SOURCE.SortOrder,
                             TARGET.RowStatusId  = SOURCE.RowStatusId
WHEN NOT MATCHED THEN INSERT (CommunityStructureTypeId,
                              ExternalId,
                              CommunityStructureTypeName,
                              SortOrder,
                              RowStatusId)
                      VALUES (SOURCE.CommunityStructureTypeId,
                              SOURCE.ExternalId,
                              SOURCE.CommunityStructureTypeName,
                              SOURCE.SortOrder,
                              SOURCE.RowStatusId);
GO

SET IDENTITY_INSERT PM.CommunityStructureType OFF
GO