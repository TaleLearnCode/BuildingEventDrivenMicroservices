MERGE CM.Community AS TARGET
USING (SELECT Community.CommunityId,
              Community.CommunityNumber,
              Community.CommunityName,
              DigitalAsset.DigitalAssetUrl AS ProfileImageUrl,
              CASE Community.CommunityStatusId
                WHEN 2 THEN 1
                ELSE 0
              END AS IsActive
         FROM BEDM_PortfolioManagement.PM.Community
         LEFT JOIN BEDM_PortfolioManagement.PM.DigitalAsset ON DigitalAsset.DigitalAssetId = Community.ProfileImageId) AS SOURCE
ON TARGET.CommunityId = SOURCE.CommunityId
WHEN MATCHED THEN UPDATE SET TARGET.CommunityNumber     = SOURCE.CommunityNumber,
                             TARGET.CommunityName       = SOURCE.CommunityName,
                             TARGET.ProfileImageUrl     = SOURCE.ProfileImageUrl,
                             TARGET.IsActive            = SOURCE.IsActive
WHEN NOT MATCHED THEN INSERT (CommunityId,
                              CommunityNumber,
                              CommunityName,
                              ProfileImageUrl,
                              IsActive)
                      VALUES (SOURCE.CommunityId,
                              SOURCE.CommunityNumber,
                              SOURCE.CommunityName,
                              SOURCE.ProfileImageUrl,
                              SOURCE.IsActive);
GO