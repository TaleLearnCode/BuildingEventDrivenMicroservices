MERGE LM.CareType AS TARGET
USING BEDM_PortfolioManagement.PM.CareType AS SOURCE
ON TARGET.CareTypeId = SOURCE.CareTypeId
WHEN MATCHED THEN UPDATE SET TARGET.CareTypeName           = SOURCE.CareTypeName,
                             TARGET.CareTypeCode           = SOURCE.CareTypeCode,
                             TARGET.ForegroundColor        = SOURCE.ForegroundColor,
                             TARGET.BackgroundColor        = SOURCE.BackgroundColor
WHEN NOT MATCHED THEN INSERT (CareTypeId,
                              CareTypeName,
                              CareTypeCode,
                              ForegroundColor,
                              BackgroundColor)
                      VALUES (SOURCE.CareTypeId,
                              SOURCE.CareTypeName,
                              SOURCE.CareTypeCode,
                              SOURCE.ForegroundColor,
                              SOURCE.BackgroundColor);
GO