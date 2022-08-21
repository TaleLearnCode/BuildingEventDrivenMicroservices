MERGE RM.CareType AS TARGET
USING BEDM_PortfolioManagement.PM.CareType AS SOURCE
ON TARGET.CareTypeId = SOURCE.CareTypeId
WHEN MATCHED THEN UPDATE SET TARGET.CareTypeName           = SOURCE.CareTypeName,
                             TARGET.CareTypeCode           = SOURCE.CareTypeCode,
                             TARGET.ForegroundColor        = SOURCE.ForegroundColor,
                             TARGET.BackgroundColor        = SOURCE.BackgroundColor,
                             TARGET.SortOrder              = SOURCE.SortOrder,
                             TARGET.RowStatusId            = SOURCE.RowStatusId
WHEN NOT MATCHED THEN INSERT (CareTypeId,
                              CareTypeName,
                              CareTypeCode,
                              ForegroundColor,
                              BackgroundColor,
                              SortOrder,
                              RowStatusId)
                      VALUES (SOURCE.CareTypeId,
                              SOURCE.CareTypeName,
                              SOURCE.CareTypeCode,
                              SOURCE.ForegroundColor,
                              SOURCE.BackgroundColor,
                              SOURCE.SortOrder,
                              SOURCE.RowStatusId);
GO