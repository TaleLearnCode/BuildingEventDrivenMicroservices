SET IDENTITY_INSERT PM.RoomTypeCategory ON
GO

MERGE PM.RoomTypeCategory AS TARGET
USING (VALUES (12, '34', 130, 1, 'Shared', 'Shared Suite'),
              (13, '35', 110, 1, 'Villa', 'Villa'),
              (14, '36', 120, 1, 'Cottage', 'Cottage'),
              (15, '37', 75, 1, '2 BR DX', 'Two Bedroom Deluxe'),
              (16, '38', 140, 1, 'Studio', 'Friendship Suite'),
              (17, '39', 5, 1, 'Studio', 'Studio Efficiency'),
              (19, '23', 30, 1, 'Studio DX', 'Studio Deluxe'),
              (20, '22', 10, 1, 'Studio', 'Studio'),
              (30, '9', 60, 1, '1 BR DX', 'One Bedroom Deluxe'),
              (32, '10', 50, 1, '1 BR', 'One Bedroom'),
              (37, '16', 20, 1, 'Alcove', 'Alcove'),
              (38, '17', 70, 1, '2 BR', 'Two Bedroom'))
AS SOURCE (RoomTypeCategoryId,
           ExternalId,
           SortOrder,
           RowStatusId,
           RoomTypeCategoryCode,
           RoomTypeCategoryName)
ON TARGET.RoomTypeCategoryId = SOURCE.RoomTypeCategoryId
WHEN MATCHED THEN UPDATE SET TARGET.ExternalId   = SOURCE.ExternalId,
                             TARGET.RoomTypeCategoryName = SOURCE.RoomTypeCategoryName,
                             TARGET.RoomTypeCategoryCode = SOURCE.RoomTypeCategoryCode,
                             TARGET.SortOrder    = SOURCE.SortOrder,
                             TARGET.RowStatusId  = SOURCE.RowStatusId
WHEN NOT MATCHED THEN INSERT (RoomTypeCategoryId,
                              ExternalId,
                              RoomTypeCategoryName,
                              RoomTypeCategoryCode,
                              SortOrder,
                              RowStatusId)
                      VALUES (SOURCE.RoomTypeCategoryId,
                              SOURCE.ExternalId,
                              SOURCE.RoomTypeCategoryName,
                              SOURCE.RoomTypeCategoryCode,
                              SOURCE.SortOrder,
                              SOURCE.RowStatusId);
GO

SET IDENTITY_INSERT PM.RoomTypeCategory OFF
GO