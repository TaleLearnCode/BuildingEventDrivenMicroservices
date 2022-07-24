SET IDENTITY_INSERT PM.PayorType ON
GO

MERGE PM.PayorType AS TARGET
USING (VALUES (2, '14', 100, 1, 1, 'Singular Private Pay'),
              (3, '12', 200, 1, 0, 'Semi-Private Pay'),
              (4, '11', 300, 1, 0, 'Second Person Fee'))
AS SOURCE (PayorTypeId,
           ExternalId,
           SortOrder,
           RowStatusId,
           IsDefault,
           PayorTypeName)
ON TARGET.PayorTypeId = SOURCE.PayorTypeId
WHEN MATCHED THEN UPDATE SET TARGET.ExternalId    = SOURCE.ExternalId,
                             TARGET.PayorTypeName = SOURCE.PayorTypeName,
                             TARGET.SortOrder     = SOURCE.SortOrder,
                             TARGET.IsDefault     = SOURCE.IsDefault,
                             TARGET.RowStatusId   = SOURCE.RowStatusId
WHEN NOT MATCHED THEN INSERT (PayorTypeId,
                              ExternalId,
                              PayorTypeName,
                              IsDefault,
                              SortOrder,
                              RowStatusId)
                      VALUES (SOURCE.PayorTypeId,
                              SOURCE.ExternalId,
                              SOURCE.PayorTypeName,
                              SOURCE.IsDefault,
                              SOURCE.SortOrder,
                              SOURCE.RowStatusId);
GO

SET IDENTITY_INSERT PM.PayorType OFF
GO