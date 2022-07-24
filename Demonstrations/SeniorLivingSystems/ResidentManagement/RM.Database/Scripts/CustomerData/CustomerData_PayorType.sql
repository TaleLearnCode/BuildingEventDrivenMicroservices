MERGE RM.PayorType AS TARGET
USING BEDM_PortfolioManagement.PM.PayorType AS SOURCE
ON TARGET.PayorTypeId = SOURCE.PayorTypeId
WHEN MATCHED THEN UPDATE SET TARGET.PayorTypeName = SOURCE.PayorTypeName,
                             TARGET.SortOrder     = SOURCE.SortOrder,
                             TARGET.IsDefault     = SOURCE.IsDefault,
                             TARGET.RowStatusId   = SOURCE.RowStatusId
WHEN NOT MATCHED THEN INSERT (PayorTypeId,
                              PayorTypeName,
                              IsDefault,
                              SortOrder,
                              RowStatusId)
                      VALUES (SOURCE.PayorTypeId,
                              SOURCE.PayorTypeName,
                              SOURCE.IsDefault,
                              SOURCE.SortOrder,
                              SOURCE.RowStatusId);
GO