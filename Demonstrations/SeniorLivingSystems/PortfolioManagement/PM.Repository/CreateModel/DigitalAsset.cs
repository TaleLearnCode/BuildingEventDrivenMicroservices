namespace SLS.PM.Repository;

internal static partial class CreateModel
{

	internal static void DigitalAsset(ModelBuilder modelBuilder)
	{
		modelBuilder.Entity<DigitalAsset>(entity =>
		{
			entity.ToTable("DigitalAsset", "PM");

			entity.HasComment("Represents a digital asset maintained by the Digital Content Management System.");

			entity.Property(e => e.DigitalAssetId).HasComment("Identifier of the DigitalAsset record.");

			entity.Property(e => e.AltTextId).HasComment("Identifier of the Content used as the digital asset's alternate text.");

			entity.Property(e => e.CaptionId).HasComment("Identifier of the Content used as the digital asset's caption.");

			entity.Property(e => e.ContentId).HasComment("Identifier of an associated Content record.");

			entity.Property(e => e.DigitalAssetDescription)
					.HasMaxLength(2000)
					.HasComment("A description of the Digital Asset.");

			entity.Property(e => e.DigitalAssetName)
					.HasMaxLength(100)
					.HasComment("The name of the Digital Asset.");

			entity.Property(e => e.DigitalAssetTypeId).HasComment("Identifier of the associated Digital Asset Type.");

			entity.Property(e => e.DigitalAssetUrl)
					.HasMaxLength(500)
					.HasComment("The URL to the digital asset.");

			entity.Property(e => e.Discriminator)
					.HasMaxLength(100)
					.HasComment("Characteristic to distinguish digital assets within a group.");

			entity.Property(e => e.EffectiveEndDate)
					.HasDefaultValueSql("('9999-12-31 23:59:59')")
					.HasComment("The date and time the Digital Asset is no longer effective.");

			entity.Property(e => e.EffectiveStartDate)
					.HasDefaultValueSql("(getutcdate())")
					.HasComment("The date and time the Digital Asset becomes effective.");

			entity.Property(e => e.ExternalId)
					.HasMaxLength(100)
					.HasComment("The tenant's identifier for the Digital Asset.");

			entity.Property(e => e.IsActive)
					.IsRequired()
					.HasDefaultValueSql("((1))")
					.HasComment("Flag indicating whether the DigitalAsset is active.");

			entity.Property(e => e.ThumbnailUrl)
					.HasMaxLength(500)
					.HasComment("The URL to the thumbnail for the digital asset.");

			entity.HasOne(d => d.AltText)
					.WithMany(p => p.DigitalAssetAltTexts)
					.HasForeignKey(d => d.AltTextId)
					.HasConstraintName("fkDigitalAsset_Content_AltText");

			entity.HasOne(d => d.Caption)
					.WithMany(p => p.DigitalAssetCaptions)
					.HasForeignKey(d => d.CaptionId)
					.HasConstraintName("fkDigitalAsset_Content_Caption");

			entity.HasOne(d => d.Content)
					.WithMany(p => p.DigitalAssetContents)
					.HasForeignKey(d => d.ContentId)
					.HasConstraintName("fkDigitalAsset_Content");

			entity.HasOne(d => d.DigitalAssetType)
					.WithMany(p => p.DigitalAssets)
					.HasForeignKey(d => d.DigitalAssetTypeId)
					.OnDelete(DeleteBehavior.ClientSetNull)
					.HasConstraintName("fkDigitalAsset_DigitalAssetType");
		});
	}

}