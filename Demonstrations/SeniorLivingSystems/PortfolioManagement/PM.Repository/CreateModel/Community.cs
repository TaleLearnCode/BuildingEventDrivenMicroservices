namespace SLS.PM.Repository;

internal static partial class CreateModel
{

	internal static void Community(ModelBuilder modelBuilder)
	{
		modelBuilder.Entity<Community>(entity =>
		{
			entity.ToTable("Community", "PM");

			entity.HasComment("Represents a community run by the tenant.");

			entity.HasIndex(e => e.CommunityNumber, "idxCommunity_CommunityNumber");

			entity.HasIndex(e => e.CommunityNumber, "unqCommunity_CommunityNumber")
					.IsUnique();

			entity.Property(e => e.CommunityId).HasComment("The identifier of the community record.");

			entity.Property(e => e.CommunityName)
					.HasMaxLength(200)
					.HasComment("The name of the community.");

			entity.Property(e => e.CommunityNumber)
					.HasMaxLength(50)
					.HasComment("The tenant's number (identifier) for the community.");

			entity.Property(e => e.CountryCode)
					.HasMaxLength(2)
					.IsUnicode(false)
					.IsFixedLength()
					.HasComment("Identifier of the country the community is located in.");

			entity.Property(e => e.ExternalName)
					.HasMaxLength(200)
					.HasComment("The name of the community used externally.");

			entity.Property(e => e.IsFeatured).HasComment("Flag indicating whether the community is featured.");

			entity.Property(e => e.LanguageCultureCode)
					.HasMaxLength(15)
					.IsUnicode(false)
					.HasDefaultValueSql("('en-US')")
					.HasComment("The default language culture to be used for the community.");

			entity.Property(e => e.Latitude)
					.HasMaxLength(15)
					.IsUnicode(false)
					.HasComment("The latitude where the community is located.");

			entity.Property(e => e.Longitude)
					.HasMaxLength(15)
					.IsUnicode(false)
					.HasComment("The longitude where the community is located.");

			entity.Property(e => e.ProfileImageId).HasComment("Identifier of the digital asset that serves as the profile image for the community.");

			entity.Property(e => e.RoomMeasurement)
					.HasMaxLength(100)
					.HasDefaultValueSql("('sq ft')")
					.HasComment("The measurement type used for room area (i.e. square feet, square meters, etc.)");

			entity.Property(e => e.RowStatusId)
					.HasDefaultValueSql("((1))")
					.HasComment("Identifier of the community record status (i.e. enabled, disabled, etc).");

			entity.HasOne(d => d.CommunityStatus)
					.WithMany(p => p.Communities)
					.HasForeignKey(d => d.CommunityStatusId)
					.OnDelete(DeleteBehavior.ClientSetNull)
					.HasConstraintName("fkCommunity_CommunityStatus");

			entity.HasOne(d => d.CountryCodeNavigation)
					.WithMany(p => p.Communities)
					.HasForeignKey(d => d.CountryCode)
					.HasConstraintName("fkCommunity_Country");

			entity.HasOne(d => d.LanguageCultureCodeNavigation)
					.WithMany(p => p.Communities)
					.HasForeignKey(d => d.LanguageCultureCode)
					.OnDelete(DeleteBehavior.ClientSetNull)
					.HasConstraintName("fkCommunity_LanguageCultureCode");

			entity.HasOne(d => d.Overview)
					.WithMany(p => p.Communities)
					.HasForeignKey(d => d.OverviewId)
					.HasConstraintName("fkCommunity_Content");

			entity.HasOne(d => d.ProfileImage)
					.WithMany(p => p.Communities)
					.HasForeignKey(d => d.ProfileImageId)
					.HasConstraintName("fkCommunity_DigitalAsset");
		});
	}

}