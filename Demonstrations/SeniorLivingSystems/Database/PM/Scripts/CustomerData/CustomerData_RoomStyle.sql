SET IDENTITY_INSERT PM.RoomStyle ON
GO

MERGE PM.RoomStyle AS TARGET
USING (VALUES (1, '6', 60, 1, 'Shared', 'Shared Suite'),
              (2, '5', 50, 1, 'Other', 'Other'),
              (3, '4', 40, 1, '3 BR', 'Three Bedroom'),
              (4, '3', 30, 1, '2 BR', 'Two Bedroom'),
              (5, '2', 20, 1, '1 BR', 'One Bedroom'),
              (6, '1', 10, 1, 'Studio', 'Studio'))
AS SOURCE (RoomStyleId,
           ExternalId,
           SortOrder,
           RowStatusId,
           RoomStyleCode,
           RoomStyleName)
ON TARGET.RoomStyleId = SOURCE.RoomStyleId
WHEN MATCHED THEN UPDATE SET TARGET.ExternalId   = SOURCE.ExternalId,
                             TARGET.RoomStyleName = SOURCE.RoomStyleName,
                             TARGET.RoomStyleCode = SOURCE.RoomStyleCode,
                             TARGET.SortOrder    = SOURCE.SortOrder,
                             TARGET.RowStatusId  = SOURCE.RowStatusId
WHEN NOT MATCHED THEN INSERT (RoomStyleId,
                              ExternalId,
                              RoomStyleName,
                              RoomStyleCode,
                              SortOrder,
                              RowStatusId)
                      VALUES (SOURCE.RoomStyleId,
                              SOURCE.ExternalId,
                              SOURCE.RoomStyleName,
                              SOURCE.RoomStyleCode,
                              SOURCE.SortOrder,
                              SOURCE.RowStatusId);
GO

SET IDENTITY_INSERT PM.RoomStyle OFF
GO