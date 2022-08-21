MERGE CM.Caree AS TARGET
USING BEDM_ResidentManagement.RM.Resident AS SOURCE
ON TARGET.CareeId = SOURCE.ResidentId
WHEN MATCHED THEN UPDATE SET TARGET.FirstName   = SOURCE.FirstName,
                             TARGET.MiddleName  = SOURCE.MiddleName,
                             TARGET.LastName    = SOURCE.LastName,
                             TARGET.CommunityId = SOURCE.CommunityId,
                             TARGET.CareTypeId  = SOURCE.CareTypeId
WHEN NOT MATCHED THEN INSERT (CareeId,
                              FirstName,
                              MiddleName,
                              LastName,
                              CommunityId,
                              CareTypeId)
                      VALUES (SOURCE.ResidentId,
                              SOURCE.FirstName,
                              SOURCE.MiddleName,
                              SOURCE.LastName,
                              SOURCE.CommunityId,
                              SOURCE.CareTypeId);
GO