MERGE RM.Room AS TARGET
USING BEDM_PortfolioManagement.PM.Room AS SOURCE
ON TARGET.RoomId = SOURCE.RoomId
WHEN MATCHED THEN UPDATE SET TARGET.CommunityId          = SOURCE.CommunityId,
                             TARGET.RoomNumber           = SOURCE.RoomNumber,
                             TARGET.RoomName             = SOURCE.RoomName,
                             TARGET.AssignedCareTypeId   = SOURCE.AssignedCareTypeId,
                             TARGET.SortOrder            = SOURCE.SortOrder,
                             TARGET.RowStatusId          = SOURCE.RowStatusId
WHEN NOT MATCHED THEN INSERT (RoomId,
                              CommunityId,
                              RoomNumber,
                              RoomName,
                              AssignedCareTypeId,
                              SortOrder,
                              RowStatusId)
                      VALUES (SOURCE.RoomId,
                              SOURCE.CommunityId,
                              SOURCE.RoomNumber,
                              SOURCE.RoomName,
                              SOURCE.AssignedCareTypeId,
                              SOURCE.SortOrder,
                              SOURCE.RowStatusId);
GO