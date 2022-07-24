MERGE Core.RowStatus AS TARGET
USING (VALUES ( 1, 1, 'Enabled'),
              ( 2, 1, 'Disabled'))
AS SOURCE (RowStatusId,
           IsActive,
           RowStatusName)
ON TARGET.RowStatusId = SOURCE.RowStatusId
WHEN MATCHED THEN UPDATE SET TARGET.RowStatusName = SOURCE.RowStatusName,
                             TARGET.IsActive      = SOURCE.IsActive
WHEN NOT MATCHED THEN INSERT (RowStatusId,
                              RowStatusName,
                              IsActive)
                      VALUES (SOURCE.RowStatusId,
                              SOURCE.RowStatusName,
                              SOURCE.IsActive);
GO