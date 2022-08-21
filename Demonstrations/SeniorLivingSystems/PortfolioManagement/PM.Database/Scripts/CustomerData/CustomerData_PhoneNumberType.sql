SET IDENTITY_INSERT PM.PhoneNumberType ON;

MERGE PM.PhoneNumberType AS TARGET
USING (VALUES 
(1, '1', 1, 'Primary'),
(2, '2', 1, 'Secondary'),
(3, '3', 1, 'FaxNumber'))
AS SOURCE (PhoneNumberTypeId,
           ExternalId,
           RowStatusId,
           PhoneNumberTypeName)
ON TARGET.PhoneNumberTypeId = SOURCE.PhoneNumberTypeId
WHEN MATCHED THEN UPDATE SET TARGET.PhoneNumberTypeName = SOURCE.PhoneNumberTypeName,
                             TARGET.ExternalId          = SOURCE.ExternalId,
                             TARGET.RowStatusId         = SOURCE.RowStatusId
WHEN NOT MATCHED THEN INSERT (PhoneNumberTypeId,
                              ExternalId,
                              PhoneNumberTypeName,
                              RowStatusId)
                      VALUES (SOURCE.PhoneNumberTypeId,
                              SOURCE.ExternalId,
                              SOURCE.PhoneNumberTypeName,
                              SOURCE.RowStatusId);

SET IDENTITY_INSERT PM.PhoneNumberType OFF;