SET IDENTITY_INSERT PM.CareType ON
GO

MERGE PM.CareType AS TARGET
USING (VALUES (2, 'IL', 1, 1, 'IL', 'Independent Living', 'E65525', 'FEF2EF', 30),
              (3, 'AL', 3, 1, 'AL', 'Assisted Living',    '63CE87', NULL,     30),
              (4, 'LG', 4, 1, 'LG', 'Memory Care',        '63CE87', NULL,     30))
AS SOURCE (CareTypeId,
           ExternalId,
           SortOrder,
           RowStatusId,
           CareTypeCode,
           CareTypeName,
           ForegroundColor,
           BackgroundColor,
           PriceVarianceThreshold)
ON TARGET.CareTypeId = SOURCE.CareTypeId
WHEN MATCHED THEN UPDATE SET TARGET.ExternalId             = SOURCE.ExternalId,
                             TARGET.CareTypeName           = SOURCE.CareTypeName,
                             TARGET.CareTypeCode           = SOURCE.CareTypeCode,
                             TARGET.ForegroundColor        = SOURCE.ForegroundColor,
                             TARGET.BackgroundColor        = SOURCE.BackgroundColor,
                             TARGET.PriceVarianceThreshold = SOURCE.PriceVarianceThreshold,
                             TARGET.SortOrder              = SOURCE.SortOrder,
                             TARGET.RowStatusId            = SOURCE.RowStatusId
WHEN NOT MATCHED THEN INSERT (CareTypeId,
                              ExternalId,
                              CareTypeName,
                              CareTypeCode,
                              ForegroundColor,
                              BackgroundColor,
                              PriceVarianceThreshold,
                              SortOrder,
                              RowStatusId)
                      VALUES (SOURCE.CareTypeId,
                              SOURCE.ExternalId,
                              SOURCE.CareTypeName,
                              SOURCE.CareTypeCode,
                              SOURCE.ForegroundColor,
                              SOURCE.BackgroundColor,
                              SOURCE.PriceVarianceThreshold,
                              SOURCE.SortOrder,
                              SOURCE.RowStatusId);
GO

SET IDENTITY_INSERT PM.CareType OFF
GO