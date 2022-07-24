MERGE CM.Caree AS TARGET
USING BEDM_ResidentManagement.RM.Resident AS SOURCE
ON TARGET.CareeId = SOURCE.ResidentId
WHEN MATCHED THEN UPDATE SET TARGET.CommunityId = SOURCE.CommunityId,
                             TARGET.CareTypeId  = SOURCE.CareTypeId
WHEN NOT MATCHED THEN INSERT (CareeId,
                              CommunityId,
                              CareTypeId)
                      VALUES (SOURCE.ResidentId,
                              SOURCE.CommunityId,
                              SOURCE.CareTypeId);
GO