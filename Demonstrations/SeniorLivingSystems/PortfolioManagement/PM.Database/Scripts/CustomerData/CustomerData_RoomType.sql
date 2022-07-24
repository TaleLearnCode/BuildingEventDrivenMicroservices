SET IDENTITY_INSERT PM.RoomType ON
GO

MERGE PM.RoomType AS TARGET
USING (VALUES (2, '48', 67, 1, 5, 14, '1 BR Cottage', 'One Bedroom Cottage'),
              (3, '47', 65, 1, 5, 30, '1 BR DX Patio', 'One Bedroom Deluxe with Patio'),
              (4, '46', 63, 1, 5, 30, '1 BR DX Balcony', 'One Bedroom Deluxe with Balcony'),
              (5, '45', 57, 1, 5, 32, '1 BR Patio', 'One Bedroom with Patio'),
              (6, '44', 53, 1, 5, 32, '1 BR Balcony', 'One Bedroom with Balcony'),
              (10, '39', 5, 1, 6, 17, 'Studio', 'Studio Efficiency'),
              (11, '37', 75, 1, 4, 15, '2 BR DX', 'Two Bedroom Deluxe'),
              (12, '34', 130, 1, 1, 12, 'Shared', 'Shared Suite'),
              (14, '23', 30, 1, 6, 19, 'Studio DX', 'Studio Deluxe'),
              (15, '22', 10, 1, 6, 20, 'Studio', 'Studio'),
              (16, '17', 70, 1, 4, 38, '2 BR', 'Two Bedroom'),
              (17, '16', 20, 1, 6, 37, 'Alcove', 'Alcove'),
              (18, '38', 140, 1, 6, 16, 'Studio', 'Friendship Suite'),
              (21, '52', 12, 1, 6, 20, 'Studio Balcony', 'Studio with Balcony'),
              (23, '68', 79, 1, 4, 13, '2 BR Villa', 'Two Bedroom Villa'),
              (24, '67', 78, 1, 4, 14, '2 BR Cottage', 'Two Bedroom Cottage'),
              (27, '64', 74, 1, 4, 38, '2 BR Patio', 'Two Bedroom with Patio'),
              (28, '63', 72, 1, 4, 38, '2 BR Balcony', 'Two Bedroom with Balcony'),
              (31, '60', 15, 1, 6, 37, 'Alcove DX', 'Alcove Deluxe'),
              (36, '55', 35, 1, 6, 19, 'Studio DX Patio', 'Studio Deluxe with Patio'),
              (37, '54', 32, 1, 6, 19, 'Studio DX Balcony', 'Studio Deluxe with Balcony'),
              (38, '53', 15, 1, 6, 20, 'Studio Patio', 'Studio with Patio'),
              (39, '10', 50, 1, 5, 32, '1 BR', 'One Bedroom'),
              (40, '9', 60, 1, 5, 30, '1 BR DX', 'One Bedroom Deluxe'))
AS SOURCE (RoomTypeId,
           ExternalId,
           SortOrder,
           RowStatusId,
           RoomStyleId,
           RoomTypeCategoryId,
           RoomTypeCode,
           RoomTypeName)
ON TARGET.RoomTypeId = SOURCE.RoomTypeId
WHEN MATCHED THEN UPDATE SET TARGET.ExternalId         = SOURCE.ExternalId,
                             TARGET.RoomStyleId        = SOURCE.RoomStyleId,
                             TARGET.RoomTypeCategoryId = SOURCE.RoomTypeCategoryId,
                             TARGET.RoomTypeName       = SOURCE.RoomTypeName,
                             TARGET.RoomTypeCode       = SOURCE.RoomTypeCode,
                             TARGET.SortOrder          = SOURCE.SortOrder,
                             TARGET.RowStatusId        = SOURCE.RowStatusId
WHEN NOT MATCHED THEN INSERT (RoomTypeId,
                              ExternalId,
                              RoomStyleId,
                              RoomTypeCategoryId,
                              RoomTypeName,
                              RoomTypeCode,
                              SortOrder,
                              RowStatusId)
                      VALUES (SOURCE.RoomTypeId,
                              SOURCE.ExternalId,
                              SOURCE.RoomStyleId,
                              SOURCE.RoomTypeCategoryId,
                              SOURCE.RoomTypeName,
                              SOURCE.RoomTypeCode,
                              SOURCE.SortOrder,
                              SOURCE.RowStatusId);
GO

SET IDENTITY_INSERT PM.RoomType OFF
GO