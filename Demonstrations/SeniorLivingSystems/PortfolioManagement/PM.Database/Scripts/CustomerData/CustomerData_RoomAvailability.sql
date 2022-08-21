SET IDENTITY_INSERT PM.RoomAvailability ON
GO

MERGE PM.RoomAvailability AS TARGET
USING (VALUES (1, 40, 1, 0, 0, 'RoomOccupied',         'Room Occupied'),
              (2, 30, 1, 0, 0, 'RoomReserved',         'Room Reserved'),
              (3, 20, 1, 1, 0, 'RoomNotReady',         'Room Not Ready'),
              (4, 10, 1, 1, 0, 'RoomAvailable',        'Room Available'),
              (5, 50, 1, 0, 0, 'RoomOffline',          'RoomOffline'),
              (6, 60, 1, 1, 0, 'RoomVacancyScheduled', 'Room Vacancy Scheduled'))
AS SOURCE (RoomAvailabilityId,
           SortOrder,
           RowStatusId,
           ShowAsAvailable,
           ShowAsReserved,
           ExternalId,
           RoomAvailabilityName)
ON TARGET.RoomAvailabilityId = SOURCE.RoomAvailabilityId
WHEN MATCHED THEN UPDATE SET TARGET.ExternalId           = SOURCE.ExternalId,
                             TARGET.RoomAvailabilityName = SOURCE.RoomAvailabilityName,
                             TARGET.ShowAsAvailable      = SOURCE.ShowAsAvailable,
                             TARGET.ShowAsReserved       = SOURCE.ShowAsReserved,
                             TARGET.SortOrder            = SOURCE.SortOrder,
                             TARGET.RowStatusId          = SOURCE.RowStatusId
WHEN NOT MATCHED THEN INSERT (RoomAvailabilityId,
                              ExternalId,
                              RoomAvailabilityName,
                              ShowAsAvailable,
                              ShowAsReserved,
                              SortOrder,
                              RowStatusId)
                      VALUES (SOURCE.RoomAvailabilityId,
                              SOURCE.ExternalId,
                              SOURCE.RoomAvailabilityName,
                              SOURCE.ShowAsAvailable,
                              SOURCE.ShowAsReserved,
                              SOURCE.SortOrder,
                              SOURCE.RowStatusId);
GO

SET IDENTITY_INSERT PM.RoomAvailability OFF
GO