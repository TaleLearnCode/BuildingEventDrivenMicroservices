namespace SLS.PM.Repository;

internal static partial class CreateModel
{

	internal static void CommunityPhoneNumber(ModelBuilder modelBuilder)
	{
		modelBuilder.Entity<CommunityPhoneNumber>(entity =>
		{
			entity.ToTable("CommunityPhoneNumber", "PM");

			entity.HasComment("Represents the linking of a community to an phone number.");

			entity.Property(e => e.CommunityId).HasComment("The identifier of the associated community record.");

			entity.Property(e => e.CountryCode)
					.HasMaxLength(10)
					.IsUnicode(false);

			entity.Property(e => e.ExternalId).HasMaxLength(100);

			entity.Property(e => e.PhoneNumber)
					.HasMaxLength(100)
					.IsUnicode(false);

			entity.HasOne(d => d.Community)
					.WithMany(p => p.CommunityPhoneNumbers)
					.HasForeignKey(d => d.CommunityId)
					.OnDelete(DeleteBehavior.ClientSetNull)
					.HasConstraintName("fkCommunityPhoneNumber_Community");

			entity.HasOne(d => d.PhoneNumberType)
					.WithMany(p => p.CommunityPhoneNumbers)
					.HasForeignKey(d => d.PhoneNumberTypeId)
					.OnDelete(DeleteBehavior.ClientSetNull)
					.HasConstraintName("fkCommunityPhoneNumber_PhoneNumberType");
		});
	}

}