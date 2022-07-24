SET IDENTITY_INSERT RM.ResidentStatus ON
GO

MERGE RM.ResidentStatus AS TARGET
USING (VALUES (1, '6',  1, 1, 'Moved In'),
              (2, '7',  2, 1, 'Moved Back'),
              (3, '8',  3, 1, 'Moved Out'),
              (4, '10', 4, 1, 'Deceased'),
              (5, '11', 5, 1, 'Transfer'),
              (6, '15', 6, 1, 'Closing'))
AS SOURCE (ResidentStatusId,
           ExternalId,
           SortOrder,
           RowStatusId,
           ResidentStatusName)
ON TARGET.ResidentStatusId = SOURCE.ResidentStatusId
WHEN MATCHED THEN UPDATE SET TARGET.ExternalId             = SOURCE.ExternalId,
                             TARGET.ResidentStatusName     = SOURCE.ResidentStatusName,
                             TARGET.SortOrder              = SOURCE.SortOrder,
                             TARGET.RowStatusId            = SOURCE.RowStatusId
WHEN NOT MATCHED THEN INSERT (ResidentStatusId,
                              ExternalId,
                              ResidentStatusName,
                              SortOrder,
                              RowStatusId)
                      VALUES (SOURCE.ResidentStatusId,
                              SOURCE.ExternalId,
                              SOURCE.ResidentStatusName,
                              SOURCE.SortOrder,
                              SOURCE.RowStatusId);
GO

SET IDENTITY_INSERT RM.ResidentStatus OFF
GO