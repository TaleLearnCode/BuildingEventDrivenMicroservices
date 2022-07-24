SET IDENTITY_INSERT PM.PostalAddressType ON;

MERGE PM.PostalAddressType AS TARGET
USING (VALUES (1, '1', 1, 'Primary'),
              (2, '2', 1, 'Secondary'))
AS SOURCE (PostalAddressTypeId,
           ExternalId,
           RowStatusId,
           PostalAddressTypeName)
ON TARGET.PostalAddressTypeId = SOURCE.PostalAddressTypeId
WHEN MATCHED THEN UPDATE SET TARGET.PostalAddressTypeName = SOURCE.PostalAddressTypeName,
                             TARGET.ExternalId            = SOURCE.ExternalId,
                             TARGET.RowStatusId           = SOURCE.RowStatusId
WHEN NOT MATCHED THEN INSERT (PostalAddressTypeId,
                              ExternalId,
                              PostalAddressTypeName,
                              RowStatusId)
                      VALUES (SOURCE.PostalAddressTypeId,
                              SOURCE.ExternalId,
                              SOURCE.PostalAddressTypeName,
                              SOURCE.RowStatusId);

SET IDENTITY_INSERT PM.PostalAddressType OFF;