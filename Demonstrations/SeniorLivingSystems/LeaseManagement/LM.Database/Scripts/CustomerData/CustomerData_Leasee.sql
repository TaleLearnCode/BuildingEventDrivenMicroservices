MERGE LM.Leasee AS TARGET
USING BEDM_ResidentManagement.RM.Resident AS SOURCE
ON TARGET.LeaseeId = SOURCE.ResidentId
WHEN MATCHED THEN UPDATE SET TARGET.CommunityId = SOURCE.CommunityId,
                             TARGET.CareTypeId  = SOURCE.CareTypeId
WHEN NOT MATCHED THEN INSERT (LeaseeId,
                              CommunityId,
                              CareTypeId)
                      VALUES (SOURCE.ResidentId,
                              SOURCE.CommunityId,
                              SOURCE.CareTypeId);
GO